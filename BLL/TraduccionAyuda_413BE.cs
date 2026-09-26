using INT;
using SER;

namespace BLL
{
    public static class TraduccionAyuda_413BE
    {
        public static string Obtener_413BE(string clave, string valorPorDefectoEspanol)
        {
            try
            {
                IDictionary<string, ITraduccion> traducciones = new TraductorBLL().ObtenerTraduccion(SessionManager.Idioma);
                if (traducciones.TryGetValue(clave, out ITraduccion? t)) return t.Texto;
            }
            catch (Exception)
            {
            }
            return valorPorDefectoEspanol;
        }
    }
}
