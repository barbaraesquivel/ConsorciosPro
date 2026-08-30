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
        public UsuarioBLL()
        {
            _crud = new UsuarioDAL();
        }
        public void Logout()
        {
            SessionManager.Logout();
        }
        public TipoResultadoLogin Login(string email, string password)
        {
            try
            {
                var user = _crud.GetAll().Where(x => x.Email == email).FirstOrDefault();
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
                            SessionManager.Login(user);
                            _contador = 0;
                            return TipoResultadoLogin.UsuarioValido;
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
        private void Bloquear()
        {
            _usuario.Bloq = true;
            _crud.Save(_usuario);
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
