using BE;
using DAL;
using SER;
using System;
using System.Linq;

namespace BLL
{
    public class ResolucionIntegridadBLL
    {
        VerificadorBLL _verificador;
        BackupBLL _backup;
        BitacoraBLL _bitacora;
        UsuarioBLL _usuarioBLL;

        public ResolucionIntegridadBLL()
        {
            _verificador = new VerificadorBLL();
            _backup = new BackupBLL();
            _bitacora = new BitacoraBLL();
            _usuarioBLL = new UsuarioBLL();
        }

        public ResultadoIntegridad Verificar()
        {
            ExigirAdministradorGlobal();
            return _verificador.VerificarIntegridadSistema();
        }

        public ResultadoIntegridad Restaurar(string rutaBackup, ResultadoIntegridad problemas)
        {
            Usuario admin = ExigirAdministradorGlobal();
            string tablas = string.Join(", ", problemas.TablasAfectadas);
            try
            {
                _backup.Restaurar(rutaBackup);
            }
            catch (Exception ex)
            {
                _bitacora.Registrar(admin.Id, "Integridad: restauracion desde backup fallida", "", "Tablas: " + tablas + ". " + ex.Message);
                throw;
            }
            ResultadoIntegridad resultado = _verificador.VerificarIntegridadSistema();
            string detalle = "Tablas: " + tablas + ". Backup: " + rutaBackup + ". Resultado: " + (resultado.EsValido ? "integridad OK" : resultado.Detalle);
            if (new UsuarioDAL().GetAll().Any(u => u.Id == admin.Id))
            {
                _bitacora.Registrar(admin.Id, "Integridad: restauracion desde backup", "", detalle);
            }
            else
            {
                _bitacora.Registrar(null, "Integridad: restauracion desde backup", "", "Administrador: " + admin.Email + ". " + detalle);
                SessionManager.Logout();
            }
            return resultado;
        }

        public ResultadoIntegridad Recalcular(ResultadoIntegridad problemas)
        {
            Usuario admin = ExigirAdministradorGlobal();
            _verificador.RecalcularDigitosVerificadores();
            ResultadoIntegridad resultado = _verificador.VerificarIntegridadSistema();
            _bitacora.Registrar(admin.Id, "Integridad: recalculo de digitos verificadores", "",
                "Tablas: " + string.Join(", ", problemas.TablasAfectadas) + ". Discrepancias aceptadas: " + problemas.Detalle + ". Resultado: " + (resultado.EsValido ? "integridad OK" : resultado.Detalle));
            return resultado;
        }

        public void Cancelar(ResultadoIntegridad problemas)
        {
            Usuario admin = ExigirAdministradorGlobal();
            _bitacora.Registrar(admin.Id, "Integridad: cancelar resolucion", "", "Tablas: " + string.Join(", ", problemas.TablasAfectadas) + ". " + problemas.Detalle);
            _usuarioBLL.Logout();
        }

        private Usuario ExigirAdministradorGlobal()
        {
            Usuario? admin = SessionManager.EstaLogueado() ? _usuarioBLL.CargarUsuario() : null;
            if (admin == null || !_usuarioBLL.EsAdministradorGlobal(admin))
                throw new UnauthorizedAccessException("Solo un Administrador global puede resolver una falla de integridad");
            return admin;
        }
    }
}
