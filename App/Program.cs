using System.Windows.Forms;
using SER;

namespace AppBase
{
    internal static class Program
    {
        [STAThread]
        static void Main()
        {
            ApplicationConfiguration.Initialize();

            Application.SetUnhandledExceptionMode(UnhandledExceptionMode.CatchException);
            Application.ThreadException += (s, e) => MostrarError(e.Exception);

            try
            {
                Application.Run(new frmMdiPrincipal());
            }
            catch (Exception ex)
            {
                MostrarError(ex);
            }
        }

        private static void MostrarError(Exception ex)
        {
            if (ExcepcionConexionBD.EsErrorDeConexion(ex))
            {
                MessageBox.Show(ExcepcionConexionBD.MensajeUsuario, "Error de conexión",
                    MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            else
            {
                MessageBox.Show("Ocurrió un error inesperado: " + ex.Message, "Error",
                    MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
    }
}
