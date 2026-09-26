using System;
using System.Data.SqlClient;

namespace DAL
{
    public class BackupDAL
    {
        public void HacerBackup(string rutaDestino)
        {
            try
            {
                string baseDeDatos = Conexion.NombreBD;
                using (SqlConnection con = Conexion.AbrirConexion("master"))
                {
                    string comando = $"BACKUP DATABASE [{baseDeDatos}] TO DISK = @ruta WITH INIT, STATS = 10";
                    using (SqlCommand cmd = new SqlCommand(comando, con))
                    {
                        cmd.CommandTimeout = 0;
                        cmd.Parameters.AddWithValue("@ruta", rutaDestino);
                        cmd.ExecuteNonQuery();
                    }
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        public void Restaurar(string rutaOrigen)
        {
            try
            {
                string baseDeDatos = Conexion.NombreBD;
                using (SqlConnection con = Conexion.AbrirConexion("master"))
                {
                    string comandoSingleUser = $"ALTER DATABASE [{baseDeDatos}] SET SINGLE_USER WITH ROLLBACK IMMEDIATE";
                    using (SqlCommand cmd = new SqlCommand(comandoSingleUser, con))
                    {
                        cmd.CommandTimeout = 0;
                        cmd.ExecuteNonQuery();
                    }

                    try
                    {
                        string comandoRestore = $"RESTORE DATABASE [{baseDeDatos}] FROM DISK = @ruta WITH REPLACE, STATS = 10";
                        using (SqlCommand cmd = new SqlCommand(comandoRestore, con))
                        {
                            cmd.CommandTimeout = 0;
                            cmd.Parameters.AddWithValue("@ruta", rutaOrigen);
                            cmd.ExecuteNonQuery();
                        }
                    }
                    finally
                    {
                        string comandoMultiUser = $"ALTER DATABASE [{baseDeDatos}] SET MULTI_USER";
                        using (SqlCommand cmd = new SqlCommand(comandoMultiUser, con))
                        {
                            cmd.CommandTimeout = 0;
                            cmd.ExecuteNonQuery();
                        }
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
