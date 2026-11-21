using System.ComponentModel;
using System.Data.SqlClient;
using System.ServiceProcess;
using System.Text;
using System.Text.RegularExpressions;

namespace DbInstaller
{
    // Cliente SQL embebido en el instalador de Consorcios Pro: no depende de sqlcmd ni de SSMS.
    //
    // Uso:  DbInstaller.exe <comando> <argumentos...> <log.txt>
    //   test     <servidor> <log>               prueba la conexion
    //   service  <servicioWindows> <log>        comprueba el servicio y, si esta detenido, intenta iniciarlo
    //   perms    <servidor> <base> <log>        verifica permisos para crear (o actualizar) la base
    //   estado   <servidor> <base> <log>        10 = no existe | 11 = existe sin tablas | 12 = existe con tablas
    //   backup   <servidor> <base> <log>        backup previo (carpeta de backups de la instancia)
    //   script   <servidor> <script.sql> <log>  ejecuta el script por bloques (separador GO)
    //   verify   <servidor> <base> <log>        verifica tablas clave y datos iniciales
    //   drop     <servidor> <base> <log>        borra la base (solo para deshacer una instalacion fallida)
    //
    // Cada ejecucion agrega al <log> y deja en "<log>.out" un mensaje corto para mostrar en pantalla.
    // Codigos de salida: 0 = OK | 1 = uso incorrecto | 2 = no se pudo conectar / error |
    //                    3 = permisos insuficientes o la operacion fallo | 4 = no existe (servicio o base)
    internal static class Program
    {
        private static readonly StringBuilder Log = new StringBuilder();
        private static readonly StringBuilder Salida = new StringBuilder();

        private static void Registrar(string mensaje)
        {
            Log.AppendLine("[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "] " + mensaje);
        }

        private static void Informar(string mensaje)
        {
            Salida.AppendLine(mensaje);
        }

        private static int Main(string[] args)
        {
            if (args.Length < 2)
            {
                Console.Error.WriteLine("Uso: DbInstaller.exe <comando> <argumentos> <log.txt>");
                return 1;
            }

            string logPath = args[args.Length - 1];
            int resultado;
            try
            {
                switch (args[0])
                {
                    case "test" when args.Length == 3:
                        resultado = Probar(args[1]);
                        break;
                    case "service" when args.Length == 3:
                        resultado = Servicio(args[1]);
                        break;
                    case "perms" when args.Length == 4:
                        resultado = Permisos(args[1], args[2]);
                        break;
                    case "estado" when args.Length == 4:
                        resultado = Estado(args[1], args[2]);
                        break;
                    case "backup" when args.Length == 4:
                        resultado = Respaldar(args[1], args[2]);
                        break;
                    case "script" when args.Length == 4:
                        resultado = EjecutarScript(args[1], args[2]);
                        break;
                    case "verify" when args.Length == 4:
                        resultado = Verificar(args[1], args[2]);
                        break;
                    case "drop" when args.Length == 4:
                        resultado = Borrar(args[1], args[2]);
                        break;
                    default:
                        Console.Error.WriteLine("Comando o cantidad de argumentos incorrectos.");
                        return 1;
                }
            }
            catch (Exception ex)
            {
                Registrar("ERROR inesperado: " + ex);
                Informar("Error inesperado: " + ex.Message);
                resultado = 2;
            }

            try
            {
                File.AppendAllText(logPath, Log.ToString(), Encoding.UTF8);
            }
            catch (Exception)
            {
                // Si no se puede escribir el log, el codigo de salida igual informa el resultado.
            }
            try
            {
                File.WriteAllText(logPath + ".out", Salida.ToString(), new UTF8Encoding(false));
            }
            catch (Exception)
            {
            }
            return resultado;
        }

        private static string Cadena(string servidor, string baseDatos = "master")
        {
            // LocalDB puede tardar en arrancar la primera vez: se da mas tiempo.
            int espera = servidor.StartsWith("(localdb)", StringComparison.OrdinalIgnoreCase) ? 60 : 20;
            return "Data Source=" + servidor + ";Initial Catalog=" + baseDatos +
                   ";Integrated Security=True;Connect Timeout=" + espera + ";";
        }

        private static object? Escalar(string servidor, string baseDatos, string sql)
        {
            using (SqlConnection conexion = new SqlConnection(Cadena(servidor, baseDatos)))
            using (SqlCommand cmd = new SqlCommand(sql, conexion))
            {
                conexion.Open();
                return cmd.ExecuteScalar();
            }
        }

        private static int Probar(string servidor)
        {
            Registrar("Probando conexion a '" + servidor + "'...");
            try
            {
                object? version = Escalar(servidor, "master", "SELECT CAST(SERVERPROPERTY('ProductVersion') AS nvarchar(50))");
                Registrar("Conexion OK. Version del motor: " + version);
                return 0;
            }
            catch (Exception ex)
            {
                Registrar("No se pudo conectar: " + ex.Message);
                Informar(ex.Message);
                return 2;
            }
        }

        private static int Servicio(string nombre)
        {
            Registrar("Comprobando el servicio de Windows '" + nombre + "'...");
            try
            {
                using (ServiceController servicio = new ServiceController(nombre))
                {
                    ServiceControllerStatus estado = servicio.Status;
                    Registrar("Estado del servicio: " + estado);
                    if (estado == ServiceControllerStatus.Running)
                    {
                        return 0;
                    }
                    if (estado == ServiceControllerStatus.StartPending)
                    {
                        servicio.WaitForStatus(ServiceControllerStatus.Running, TimeSpan.FromSeconds(30));
                        return 0;
                    }
                    Registrar("El servicio esta detenido: se intenta iniciarlo...");
                    servicio.Start();
                    servicio.WaitForStatus(ServiceControllerStatus.Running, TimeSpan.FromSeconds(40));
                    Registrar("Servicio iniciado.");
                    Informar("El servicio '" + nombre + "' estaba detenido y se inicio automaticamente.");
                    return 0;
                }
            }
            catch (InvalidOperationException ex)
            {
                Win32Exception? win32 = ex.InnerException as Win32Exception;
                if (win32 != null && win32.NativeErrorCode == 5)
                {
                    Registrar("Sin permiso para iniciar el servicio: " + ex.Message);
                    Informar("El servicio '" + nombre + "' esta detenido y este usuario no tiene permiso para iniciarlo.");
                    return 3;
                }
                Registrar("El servicio '" + nombre + "' no existe o no se pudo consultar: " + ex.Message);
                return 4;
            }
            catch (System.ServiceProcess.TimeoutException)
            {
                Registrar("El servicio no llego a iniciarse a tiempo.");
                Informar("El servicio '" + nombre + "' no termino de iniciarse a tiempo.");
                return 3;
            }
        }

        private static int Permisos(string servidor, string baseDatos)
        {
            Registrar("Comprobando permisos en '" + servidor + "' para '" + baseDatos + "'...");
            bool sysadmin;
            bool crearBases;
            bool existe;
            string login;
            try
            {
                using (SqlConnection conexion = new SqlConnection(Cadena(servidor)))
                using (SqlCommand cmd = new SqlCommand(
                    "SELECT ISNULL(IS_SRVROLEMEMBER('sysadmin'), 0), " +
                    "ISNULL(HAS_PERMS_BY_NAME(NULL, NULL, 'CREATE ANY DATABASE'), 0), " +
                    "CASE WHEN DB_ID(@bd) IS NULL THEN 0 ELSE 1 END, SUSER_SNAME()", conexion))
                {
                    cmd.Parameters.AddWithValue("@bd", baseDatos);
                    conexion.Open();
                    using (SqlDataReader lector = cmd.ExecuteReader())
                    {
                        lector.Read();
                        sysadmin = Convert.ToInt32(lector.GetValue(0)) == 1;
                        crearBases = Convert.ToInt32(lector.GetValue(1)) == 1;
                        existe = Convert.ToInt32(lector.GetValue(2)) == 1;
                        login = lector.IsDBNull(3) ? "?" : lector.GetString(3);
                    }
                }
            }
            catch (Exception ex)
            {
                Registrar("No se pudo conectar: " + ex.Message);
                Informar(ex.Message);
                return 2;
            }

            Registrar("Login: " + login + " | sysadmin: " + sysadmin + " | CREATE ANY DATABASE: " + crearBases + " | la base existe: " + existe);
            if (sysadmin)
            {
                return 0;
            }
            if (!existe)
            {
                if (crearBases)
                {
                    return 0;
                }
                Informar("El usuario de Windows '" + login + "' no puede crear bases de datos en '" + servidor + "'. " +
                         "Pida al encargado que cree una base vacia llamada " + baseDatos + " y le de permiso de propietario (db_owner).");
                return 3;
            }

            bool dbOwner = false;
            try
            {
                using (SqlConnection conexion = new SqlConnection(Cadena(servidor, baseDatos)))
                using (SqlCommand cmd = new SqlCommand("SELECT ISNULL(IS_ROLEMEMBER('db_owner'), 0)", conexion))
                {
                    conexion.Open();
                    dbOwner = Convert.ToInt32(cmd.ExecuteScalar()) == 1;
                }
            }
            catch (Exception ex)
            {
                Registrar("No se pudo entrar a la base existente: " + ex.Message);
            }
            if (dbOwner)
            {
                return 0;
            }
            Informar("La base " + baseDatos + " ya existe y el usuario '" + login + "' no es su propietario (db_owner): no podria cargarle las tablas.");
            return 3;
        }

        private static int Estado(string servidor, string baseDatos)
        {
            try
            {
                if (Escalar(servidor, "master", "SELECT DB_ID(N'" + baseDatos.Replace("'", "''") + "')") is DBNull)
                {
                    Registrar("La base '" + baseDatos + "' no existe.");
                    return 10;
                }
                object? tablas = Escalar(servidor, baseDatos, "SELECT COUNT(*) FROM sys.tables");
                int cantidad = Convert.ToInt32(tablas);
                Registrar("La base '" + baseDatos + "' existe con " + cantidad + " tablas.");
                return cantidad == 0 ? 11 : 12;
            }
            catch (Exception ex)
            {
                Registrar("No se pudo consultar el estado de la base: " + ex.Message);
                Informar(ex.Message);
                return 2;
            }
        }

        private static int Respaldar(string servidor, string baseDatos)
        {
            string archivo = baseDatos + "_pre_instalacion_" + DateTime.Now.ToString("yyyyMMddHHmmss") + ".bak";
            Registrar("Respaldando '" + baseDatos + "' (" + archivo + ")...");
            try
            {
                using (SqlConnection conexion = new SqlConnection(Cadena(servidor)))
                {
                    conexion.Open();
                    string carpeta;
                    using (SqlCommand cmd = new SqlCommand("SELECT CAST(SERVERPROPERTY('InstanceDefaultBackupPath') AS nvarchar(260))", conexion))
                    {
                        object? valor = cmd.ExecuteScalar();
                        carpeta = valor == null || valor is DBNull ? string.Empty : Convert.ToString(valor) ?? string.Empty;
                    }
                    string destino = carpeta.Length == 0 ? archivo : carpeta.TrimEnd('\\') + "\\" + archivo;
                    using (SqlCommand cmd = new SqlCommand(
                        "BACKUP DATABASE [" + baseDatos.Replace("]", "]]") + "] TO DISK = @ruta WITH COPY_ONLY, INIT", conexion))
                    {
                        cmd.CommandTimeout = 300;
                        cmd.Parameters.AddWithValue("@ruta", destino);
                        cmd.ExecuteNonQuery();
                    }
                    Registrar("Backup generado: " + destino);
                    Informar(destino);
                }
                return 0;
            }
            catch (Exception ex)
            {
                Registrar("No se pudo generar el backup: " + ex.Message);
                Informar(ex.Message);
                return 3;
            }
        }

        private static string[] DividirEnBloques(string script)
        {
            return Regex.Split(script, @"^[ \t]*GO[ \t]*\r?$", RegexOptions.Multiline | RegexOptions.IgnoreCase);
        }

        private static int EjecutarScript(string servidor, string rutaScript)
        {
            if (!File.Exists(rutaScript))
            {
                Registrar("ERROR: no se encontro el script '" + rutaScript + "'.");
                Informar("No se encontro el script de la base de datos.");
                return 2;
            }

            string[] bloques = DividirEnBloques(File.ReadAllText(rutaScript, Encoding.UTF8));
            Registrar("Conectando a '" + servidor + "'...");
            using (SqlConnection conexion = new SqlConnection(Cadena(servidor)))
            {
                conexion.InfoMessage += (sender, e) =>
                {
                    foreach (SqlError mensaje in e.Errors)
                    {
                        Registrar("SQL: " + mensaje.Message);
                    }
                };
                conexion.Open();
                Registrar("Ejecutando el script (" + bloques.Length + " bloques)...");
                for (int i = 0; i < bloques.Length; i++)
                {
                    string bloque = bloques[i].Trim();
                    if (bloque.Length == 0)
                    {
                        continue;
                    }
                    using (SqlCommand cmd = new SqlCommand(bloque, conexion))
                    {
                        cmd.CommandTimeout = 120;
                        try
                        {
                            cmd.ExecuteNonQuery();
                        }
                        catch (SqlException ex)
                        {
                            Registrar("ERROR en el bloque " + (i + 1) + " de " + bloques.Length + ": " + ex.Message);
                            Registrar("--- Contenido del bloque que fallo ---");
                            Registrar(bloque.Length > 1500 ? bloque.Substring(0, 1500) + "..." : bloque);
                            Informar("Fallo el bloque " + (i + 1) + " del script: " + ex.Message);
                            if (ex.Class == 14)
                            {
                                Informar("Parece un problema de permisos del usuario de Windows en este servidor.");
                            }
                            return 3;
                        }
                    }
                }
            }
            Registrar("Script ejecutado correctamente.");
            return 0;
        }

        private static int Verificar(string servidor, string baseDatos)
        {
            string[] tablas = { "Usuario", "PROPUESTA_ASAMBLEA", "PROVEEDOR", "PROVEEDOR_C", "Permiso", "Idioma" };
            try
            {
                foreach (string tabla in tablas)
                {
                    object? id = Escalar(servidor, baseDatos, "SELECT OBJECT_ID(N'dbo." + tabla + "', N'U')");
                    if (id == null || id is DBNull)
                    {
                        Registrar("Falta la tabla " + tabla + ".");
                        Informar("Falta la tabla " + tabla + " en la base " + baseDatos + " (base desactualizada o incompleta).");
                        return 3;
                    }
                }
                int usuarios = Convert.ToInt32(Escalar(servidor, baseDatos, "SELECT COUNT(*) FROM dbo.Usuario"));
                if (usuarios == 0)
                {
                    Registrar("La tabla Usuario esta vacia.");
                    Informar("No hay usuarios iniciales cargados en la base.");
                    return 3;
                }
                Registrar("Verificacion OK: tablas clave presentes y " + usuarios + " usuarios.");
                return 0;
            }
            catch (Exception ex)
            {
                Registrar("No se pudo verificar la base: " + ex.Message);
                Informar(ex.Message);
                return 2;
            }
        }

        private static int Borrar(string servidor, string baseDatos)
        {
            Registrar("Borrando la base '" + baseDatos + "' (instalacion fallida)...");
            try
            {
                string nombre = baseDatos.Replace("]", "]]");
                using (SqlConnection conexion = new SqlConnection(Cadena(servidor)))
                using (SqlCommand cmd = new SqlCommand(
                    "IF DB_ID(@bd) IS NOT NULL BEGIN ALTER DATABASE [" + nombre + "] SET SINGLE_USER WITH ROLLBACK IMMEDIATE; DROP DATABASE [" + nombre + "]; END", conexion))
                {
                    cmd.Parameters.AddWithValue("@bd", baseDatos);
                    conexion.Open();
                    cmd.ExecuteNonQuery();
                }
                return 0;
            }
            catch (Exception ex)
            {
                Registrar("No se pudo borrar la base: " + ex.Message);
                return 3;
            }
        }
    }
}
