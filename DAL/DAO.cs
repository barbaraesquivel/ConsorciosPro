using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using static System.Runtime.InteropServices.JavaScript.JSType;

namespace DAL
{
    public class DAO
    {
        public int EjecutarQuery(string comando)
        {
            try
            {
                using (SqlConnection miCon = new SqlConnection(ConfigurationManager.ConnectionStrings["Conexion"].ConnectionString))
                {
                    miCon.Open();
                    using (SqlCommand miComando = new SqlCommand(comando, miCon))
                    {
                        return miComando.ExecuteNonQuery();
                    }
                }
            }
            catch (Exception e)
            {

                throw new Exception(comando);
            }
        }
        public int EjecutarQuery_SP(SqlCommand comando)
        {
            try
            {
                using (SqlConnection miCon = new SqlConnection(ConfigurationManager.ConnectionStrings["Conexion"].ConnectionString))
                {
                    miCon.Open();
                    using (comando.Connection =  miCon)
                    {
                        return comando.ExecuteNonQuery();
                    }
                }
            }
            catch (Exception e)
            {

                throw new Exception(comando.Transaction.ToString());
            }
        }
        public DataSet ObtenerDatos(string comando)
        {
            try
            {                
                using (SqlConnection miCon = new SqlConnection(ConfigurationManager.ConnectionStrings["Conexion"].ConnectionString))
                {
                    using (SqlDataAdapter miAdaptador = new SqlDataAdapter(comando, miCon))
                    {
                        DataSet ds = new DataSet();
                        miAdaptador.Fill(ds);
                        return ds;
                    }
                }
            }
            catch (Exception e)
            {                
                throw new Exception(comando);
            }
        }
        public int UltimoID(string tabla)
        {
            try
            {
                using (SqlConnection miCon = new SqlConnection(ConfigurationManager.ConnectionStrings["Conexion"].ConnectionString))
                {
                    miCon.Open();
                    string comando = "SELECT ISNULL(MAX(" + tabla + "_ID),0) FROM" + tabla;
                    using (SqlCommand miComando = new SqlCommand(comando, miCon))
                    {
                        int resultado = 666;
                        if (miComando.ExecuteScalar().ToString() != null) resultado = Int32.Parse(miComando.ExecuteScalar().ToString());
                        return resultado;
                    }
                }
            }
            catch (Exception)
            {

                throw;
            }
        }        

    }
}
