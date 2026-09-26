using System.Data;
using System.Data.SqlClient;

namespace DAL
{
    internal static class AccesoDatos_413BE
    {
        public static SqlParameter Parametro_413BE(string nombre, object? valor)
        {
            return new SqlParameter(nombre, valor ?? DBNull.Value);
        }

        public static int EjecutarNoQuery_413BE(string sql, params SqlParameter[] parametros)
        {
            using (SqlConnection con = Conexion.AbrirConexion())
            using (SqlCommand cmd = new SqlCommand(sql, con))
            {
                cmd.Parameters.AddRange(parametros);
                return cmd.ExecuteNonQuery();
            }
        }

        public static object? Escalar_413BE(string sql, params SqlParameter[] parametros)
        {
            using (SqlConnection con = Conexion.AbrirConexion())
            using (SqlCommand cmd = new SqlCommand(sql, con))
            {
                cmd.Parameters.AddRange(parametros);
                object? r = cmd.ExecuteScalar();
                return r == DBNull.Value ? null : r;
            }
        }

        public static int Insertar_413BE(string sql, params SqlParameter[] parametros)
        {
            return Convert.ToInt32(Escalar_413BE(sql + "; SELECT CAST(SCOPE_IDENTITY() AS INT);", parametros));
        }

        public static DataTable Consultar_413BE(string sql, params SqlParameter[] parametros)
        {
            using (SqlConnection con = Conexion.AbrirConexion())
            using (SqlCommand cmd = new SqlCommand(sql, con))
            {
                cmd.Parameters.AddRange(parametros);
                DataTable tabla = new DataTable();
                using (SqlDataAdapter adaptador = new SqlDataAdapter(cmd))
                {
                    adaptador.Fill(tabla);
                }
                return tabla;
            }
        }
    }
}
