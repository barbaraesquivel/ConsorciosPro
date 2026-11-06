using System.Data.SqlClient;
using SER;

namespace DAL
{
    internal static class Conexion
    {
        public const string NombreBD = "AppBaseDB";

        public static SqlConnection AbrirConexion(string baseDeDatos = NombreBD)
        {
            SqlConnection con = new SqlConnection($@"Data Source={ObtenerServidor_413BE()};Initial Catalog={baseDeDatos};Integrated Security=True;");
            try
            {
                con.Open();
            }
            catch (SqlException ex)
            {
                con.Dispose();
                throw new ExcepcionConexionBD(ex);
            }
            return con;
        }

        private static string ObtenerServidor_413BE()
        {
            string servidor;
            try
            {
                servidor = new ConfiguracionService_413BE().LeerValor_413BE("Servidor");
            }
            catch (InvalidOperationException)
            {
                return @"BARBARA\SQLEXPRESS";
            }
            if (string.IsNullOrWhiteSpace(servidor))
            {
                return @"BARBARA\SQLEXPRESS";
            }
            return servidor;
        }
    }
}
