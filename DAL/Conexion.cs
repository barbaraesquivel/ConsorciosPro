using System.Data.SqlClient;
using SER;

namespace DAL
{
    internal static class Conexion
    {
        public const string NombreBD = "AppBaseDB";

        public static SqlConnection AbrirConexion(string baseDeDatos = NombreBD)
        {
            SqlConnection con = new SqlConnection($@"Data Source=BARBARA\SQLEXPRESS;Initial Catalog={baseDeDatos};Integrated Security=True;");
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
    }
}
