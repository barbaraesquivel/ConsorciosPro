using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BE;
using DAL;
using INT;
using SER;
using SER.Composite;

namespace BLL
{
    public class UsuarioBLL : AbstractBLL<Usuario>
    {
        static int _contador = 0;
        Usuario _usuario;
        VerificadorBLL _verificador;
        BitacoraBLL _bitacora;
        public UsuarioBLL()
        {
            _crud = new UsuarioDAL();
            _verificador = new VerificadorBLL();
            _bitacora = new BitacoraBLL();
        }
        public override void Save(Usuario entity)
        {
            bool esNuevo = entity.Estado == TipoEstado.Agregado;
            bool esBaja = entity.Baja;
            _verificador.ActualizarDVH(entity);
            base.Save(entity);
            _verificador.ActualizarDVV(entity.NombreTabla, _crud.GetAll().Cast<IVerificable>().ToList());
            string actividad = esNuevo ? "Alta Usuario" : (esBaja ? "Baja Usuario" : "Modificacion Usuario");
            _bitacora.RegistrarDeUsuarioActual(actividad, entity.Id.ToString(), entity.Email);
        }
        public void Logout()
        {
            Guid? usuarioId = SessionManager.EstaLogueado() ? SessionManager.Instancia.Usuario.Id : (Guid?)null;
            SessionManager.Logout();
            _bitacora.Registrar(usuarioId, "Cierre de sesion", usuarioId?.ToString() ?? "");
        }
        public TipoResultadoLogin Login(string email, string password)
        {
            try
            {
                var user = _crud.GetAll().Where(x => string.Equals(x.Email, email, StringComparison.OrdinalIgnoreCase)).FirstOrDefault();
                if (user == null) throw new ExcepcionesLogin(TipoResultadoLogin.UsuarioInvalido);
                else
                {
                    if (_contador < 4 && !user.Bloq)
                    {
                        if (Encriptador.Hash(password) != user.Password)
                        {
                            _contador++;
                            throw new ExcepcionesLogin(TipoResultadoLogin.PasswordInvalido);
                        }
                        else
                        {
                            _contador = 0;
                            return CompletarLogin(user);
                        }
                    }
                    else
                    {
                        _usuario = user;
                        Bloquear();
                        throw new ExcepcionesLogin(TipoResultadoLogin.UsuarioBloqueado);
                    }
                }
            }
            catch (Exception)
            {
                throw;
            }
        }
        private TipoResultadoLogin CompletarLogin(Usuario user)
        {
            ResultadoIntegridad integridad = _verificador.VerificarIntegridadSistema();
            if (integridad.EsValido)
            {
                if (user.Baja) throw new ExcepcionesLogin(TipoResultadoLogin.UsuarioBaja);
                IniciarSesion(user);
                return TipoResultadoLogin.UsuarioValido;
            }
            if (EsAdministradorGlobal(user))
            {
                IniciarSesion(user);
                _bitacora.Registrar(user.Id, "Falla de integridad detectada al iniciar sesion", "", integridad.Detalle);
                return TipoResultadoLogin.IntegridadRequiereResolucion;
            }
            _bitacora.Registrar(user.Id, "Acceso rechazado por falla de integridad", user.Id.ToString(), integridad.Detalle);
            return TipoResultadoLogin.SistemaNoDisponible;
        }
        private void IniciarSesion(Usuario user)
        {
            SessionManager.Login(user);
            _bitacora.Registrar(user.Id, "Inicio de sesion", user.Id.ToString());
        }
        public bool EsAdministradorGlobal(Usuario u)
        {
            new PermisoBLL().CompletarPermisosDeUsuario(u);
            return TienePatente(u.Permisos, TipoPatente.GestUsuarios)
                && TienePatente(u.Permisos, TipoPatente.GestPermisos)
                && TienePatente(u.Permisos, TipoPatente.GestBackup);
        }
        private static bool TienePatente(IEnumerable<IPermiso> permisos, TipoPatente patente)
        {
            foreach (IPermiso p in permisos)
            {
                if (p is PermisoCompuesto pc && pc.Permiso == patente) return true;
                if (TienePatente(p.ObtenerHijos, patente)) return true;
            }
            return false;
        }
        private void Bloquear()
        {
            _usuario.Bloq = true;
            this.Save(_usuario);
        }
        public Usuario CargarUsuario()
        {
            Usuario u = new Usuario();
            if (SessionManager.EstaLogueado())
            {
                u = _crud.GetAll().Where(x => x.Email == SessionManager.Instancia.Usuario.Email).FirstOrDefault();
                new PermisoBLL().CompletarPermisosDeUsuario(u);
            }
            return u;
        }
        public void AgregarPermiso(Usuario u, PermisoCompuesto p)
        {
            _usuario = u;
            bool tiene = false;
            string nombre = "";
            if (p is Familia)
            {
                try
                {
                    foreach (PermisoCompuesto permiso in p.ObtenerHijos)
                    {
                        foreach (PermisoCompuesto perm in u.Permisos)
                        {
                            if (p.Id == perm.Id || permiso.Id == perm.Id)
                                tiene = true;
                            if (perm is Familia)
                            {
                                foreach (PermisoCompuesto pat in perm.ObtenerHijos)
                                {
                                    if (p.Id == pat.Id || pat.Id == permiso.Id)
                                        tiene = true;
                                }
                            }
                        }
                    }
                    if (!tiene)
                        u.Permisos.Add(p);
                    else throw new Exception("Ya tiene una patente de esta familia, eliminelo para poder agregar la familia");
                }
                catch (Exception)
                {
                    throw;
                }
            }
            else
            {
                try
                {
                    foreach (PermisoCompuesto perm in u.Permisos)
                    {
                        if (p.Id == perm.Id)
                            tiene = true;
                        if (perm is Familia)
                        {
                            foreach (PermisoCompuesto pat in perm.ObtenerHijos)
                            {
                                if (p.Id == pat.Id)
                                    tiene = true;
                            }
                        }
                    }
                    if (!tiene)
                        u.Permisos.Add(p);
                    else throw new Exception("Ya tiene este permiso");
                }
                catch (Exception)
                {
                    throw;
                }
            }
        }
        public void QuitarPermiso(Usuario u, PermisoCompuesto p)
        {
            try
            {
                bool tiene = false;
                foreach (PermisoCompuesto per in u.Permisos)
                {
                    if (per.Id == p.Id)
                        tiene = true;
                }
                if (tiene)
                    u.Permisos.Remove(p);
                else
                    throw new Exception("No cuenta con esta petente o familia");
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}
