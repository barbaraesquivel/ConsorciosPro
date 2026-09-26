 using System;

namespace SER
{
    public class ExcepcionConexionBD : Exception
    {
        public const string MensajeUsuario = "No se pudo establecer conexión con la base de datos. Por favor, solucione el problema e intente nuevamente.";

        public ExcepcionConexionBD(Exception inner) : base(MensajeUsuario, inner)
        {
        }

        public static bool EsErrorDeConexion(Exception ex)
        {
            while (ex != null)
            {
                if (ex is ExcepcionConexionBD) return true;
                ex = ex.InnerException;
            }
            return false;
        }
    }
}
