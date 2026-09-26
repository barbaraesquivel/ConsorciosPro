namespace SER
{
    public class AlmacenAdjuntosService_413BE
    {
        public static string CarpetaAdjuntos_413BE { get; set; } = Path.Combine(AppContext.BaseDirectory, "Adjuntos");

        public string Guardar_413BE(string rutaOrigen)
        {
            Directory.CreateDirectory(CarpetaAdjuntos_413BE);
            string nombre = Guid.NewGuid().ToString("N") + Path.GetExtension(rutaOrigen);
            File.Copy(rutaOrigen, Path.Combine(CarpetaAdjuntos_413BE, nombre));
            return nombre;
        }
    }
}
