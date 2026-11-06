namespace SER
{
    public class ConfiguracionService_413BE
    {
        public static string RutaArchivo_413BE { get; set; } = Path.Combine(AppContext.BaseDirectory, "Configuracion_413BE.txt");

        public string LeerValor_413BE(string clave)
        {
            if (File.Exists(RutaArchivo_413BE))
            {
                foreach (string linea in File.ReadAllLines(RutaArchivo_413BE))
                {
                    int separador = linea.IndexOf('=');
                    if (separador <= 0) continue;
                    if (linea.Substring(0, separador).Trim().Equals(clave, StringComparison.OrdinalIgnoreCase))
                    {
                        return linea.Substring(separador + 1).Trim();
                    }
                }
            }
            throw new InvalidOperationException("Debe configurarse el umbral de repetición");
        }
    }
}
