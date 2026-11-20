using System.Globalization;
using BE;
using INT;
using SER;

namespace BLL
{
    // Ayuda en línea (D02): arma el árbol de temas y sus textos según el idioma de la sesión.
    // Si falta una clave de traducción, el texto cae al español (igual que TraduccionAyuda_413BE).
    public partial class AyudaBLL_413BE
    {
        public const string TemaInicio_413BE = "pri_recorrido";
        private const string ClaveSoporte_413BE = "sop_soporte";

        public List<TemaAyuda_413BE> ObtenerArbol_413BE()
        {
            IDictionary<string, ITraduccion> traducciones = ObtenerTraducciones_413BE();
            List<TemaAyuda_413BE> grupos = new List<TemaAyuda_413BE>();
            foreach (var g in _grupos_413BE)
            {
                TemaAyuda_413BE grupo = new TemaAyuda_413BE();
                grupo.Clave_413BE = g.Clave_413BE;
                grupo.Titulo_413BE = Traducir_413BE(traducciones, "ayu_grp_" + g.Clave_413BE, g.Titulo_413BE);
                foreach (var t in _temas_413BE.Where(x => x.Grupo_413BE == g.Clave_413BE))
                {
                    grupo.Hijos_413BE.Add(CrearTema_413BE(traducciones, t.Clave_413BE, t.Titulo_413BE, t.Lineas_413BE));
                }
                grupos.Add(grupo);
            }
            return grupos;
        }

        // Devuelve el árbol filtrado: temas cuyo título o texto contiene el texto buscado
        // (sin distinguir mayúsculas ni acentos). Si coincide el título de un grupo, se incluye completo.
        public List<TemaAyuda_413BE> Buscar_413BE(string texto)
        {
            List<TemaAyuda_413BE> arbol = ObtenerArbol_413BE();
            string buscado = (texto ?? "").Trim();
            if (buscado.Length == 0) return arbol;

            List<TemaAyuda_413BE> resultado = new List<TemaAyuda_413BE>();
            foreach (TemaAyuda_413BE grupo in arbol)
            {
                if (Contiene_413BE(grupo.Titulo_413BE, buscado))
                {
                    resultado.Add(grupo);
                    continue;
                }
                List<TemaAyuda_413BE> coincidentes = grupo.Hijos_413BE
                    .Where(t => Contiene_413BE(t.Titulo_413BE, buscado) || Contiene_413BE(t.Texto_413BE, buscado))
                    .ToList();
                if (coincidentes.Count > 0)
                {
                    grupo.Hijos_413BE = coincidentes;
                    resultado.Add(grupo);
                }
            }
            return resultado;
        }

        public bool ExisteTema_413BE(string clave)
        {
            return _temas_413BE.Any(t => t.Clave_413BE == clave);
        }

        // Tooltips traducidos de un formulario: nombre del control -> texto.
        public Dictionary<string, string> ObtenerTooltips_413BE(string nombreFormulario)
        {
            Dictionary<string, string> resultado = new Dictionary<string, string>();
            var definiciones = _tooltips_413BE.Where(t => t.Formulario_413BE == nombreFormulario).ToList();
            if (definiciones.Count == 0) return resultado;
            IDictionary<string, ITraduccion> traducciones = ObtenerTraducciones_413BE();
            foreach (var d in definiciones)
            {
                resultado[d.Control_413BE] = Traducir_413BE(traducciones, d.Clave_413BE, d.Texto_413BE);
            }
            return resultado;
        }

        public string ObtenerTexto_413BE(string clave, string valorPorDefectoEspanol)
        {
            return Traducir_413BE(ObtenerTraducciones_413BE(), clave, valorPorDefectoEspanol);
        }

        private TemaAyuda_413BE CrearTema_413BE(IDictionary<string, ITraduccion> traducciones, string clave, string titulo, string[] lineas)
        {
            TemaAyuda_413BE tema = new TemaAyuda_413BE();
            tema.Clave_413BE = clave;
            tema.Titulo_413BE = Traducir_413BE(traducciones, "ayu_" + clave + "_tit", titulo);
            for (int i = 0; i < lineas.Length; i++)
            {
                tema.Lineas_413BE.Add(Traducir_413BE(traducciones, "ayu_" + clave + "_" + (i + 1), lineas[i]));
            }
            if (clave == ClaveSoporte_413BE)
            {
                tema.Lineas_413BE.Add(LineaContactoSoporte_413BE(traducciones));
            }
            return tema;
        }

        // El contacto sale de la clave opcional Soporte= de Configuracion_413BE.txt; no hay valor por defecto.
        private static string LineaContactoSoporte_413BE(IDictionary<string, ITraduccion> traducciones)
        {
            string contacto = "";
            try
            {
                contacto = new ConfiguracionService_413BE().LeerValor_413BE("Soporte");
            }
            catch (Exception)
            {
                contacto = "";
            }
            if (string.IsNullOrWhiteSpace(contacto))
            {
                return Traducir_413BE(traducciones, "ayu_sop_sinContacto", "Consulte con el administrador del sistema.");
            }
            string formato = Traducir_413BE(traducciones, "ayu_sop_contacto", "Contacto de soporte: {0}");
            return formato.Contains("{0}") ? string.Format(formato, contacto) : formato + " " + contacto;
        }

        // Una sola consulta de traducciones por operación (TraduccionAyuda_413BE consulta la base en cada clave).
        private static IDictionary<string, ITraduccion> ObtenerTraducciones_413BE()
        {
            try
            {
                return new TraductorBLL().ObtenerTraduccion(SessionManager.Idioma);
            }
            catch (Exception)
            {
                return new Dictionary<string, ITraduccion>();
            }
        }

        private static string Traducir_413BE(IDictionary<string, ITraduccion> traducciones, string clave, string valorPorDefectoEspanol)
        {
            if (traducciones.TryGetValue(clave, out ITraduccion? t) && !string.IsNullOrWhiteSpace(t?.Texto)) return t.Texto;
            return valorPorDefectoEspanol;
        }

        private static bool Contiene_413BE(string texto, string buscado)
        {
            return CultureInfo.InvariantCulture.CompareInfo.IndexOf(texto ?? "", buscado,
                CompareOptions.IgnoreCase | CompareOptions.IgnoreNonSpace) >= 0;
        }
    }
}
