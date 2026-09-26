using BE;
using BLL;

namespace AppBase
{
    internal class CatalogosPN01_413BE
    {
        private readonly Dictionary<int, Consorcio_413BE> _consorcios = new Dictionary<int, Consorcio_413BE>();
        private readonly Dictionary<int, Categoria_413BE> _categorias = new Dictionary<int, Categoria_413BE>();
        private readonly Dictionary<int, UnidadFuncional_413BE> _unidades = new Dictionary<int, UnidadFuncional_413BE>();
        private readonly Dictionary<int, Consorcista_413BE> _consorcistas = new Dictionary<int, Consorcista_413BE>();

        public CatalogosPN01_413BE()
        {
            foreach (Consorcio_413BE c in new ConsorcioBLL_413BE().ObtenerTodos_413BE())
            {
                _consorcios[c.IdConsorcio_413BE] = c;
                foreach (UnidadFuncional_413BE u in new UnidadFuncionalBLL_413BE().ObtenerPorConsorcio_413BE(c.IdConsorcio_413BE))
                {
                    _unidades[u.IdUnidadFuncional_413BE] = u;
                }
                foreach (Consorcista_413BE s in new ConsorcistaBLL_413BE().ObtenerPorConsorcio_413BE(c.IdConsorcio_413BE))
                {
                    _consorcistas[s.IdConsorcista_413BE] = s;
                }
            }
            foreach (Categoria_413BE c in new CategoriaBLL_413BE().ObtenerTodos_413BE())
            {
                _categorias[c.IdCategoria_413BE] = c;
            }
        }

        public List<Consorcio_413BE> ObtenerConsorcios_413BE()
        {
            return _consorcios.Values.ToList();
        }

        public List<Categoria_413BE> ObtenerCategorias_413BE()
        {
            return _categorias.Values.OrderBy(c => c.Nombre_413BE).ToList();
        }

        public string NombreConsorcio_413BE(int idConsorcio)
        {
            return _consorcios.TryGetValue(idConsorcio, out Consorcio_413BE? c) ? c.Nombre_413BE : "";
        }

        public string NombreCategoria_413BE(int idCategoria)
        {
            return _categorias.TryGetValue(idCategoria, out Categoria_413BE? c) ? c.Nombre_413BE : "";
        }

        public string NombreConsorcista_413BE(int idConsorcista)
        {
            return _consorcistas.TryGetValue(idConsorcista, out Consorcista_413BE? c) ? c.Nombre_413BE : "";
        }

        public string Ubicacion_413BE(Reclamo_413BE reclamo)
        {
            if (reclamo.IdUnidadFuncional_413BE != null)
            {
                return _unidades.TryGetValue(reclamo.IdUnidadFuncional_413BE.Value, out UnidadFuncional_413BE? u)
                    ? "Unidad funcional " + u.Identificador_413BE : "";
            }
            return reclamo.AreaComun_413BE ?? "";
        }

        public static string Estado_413BE(EstadoReclamo_413BE estado)
        {
            switch (estado)
            {
                case EstadoReclamo_413BE.PENDIENTE_CLASIFICACION_413BE: return "Pendiente de clasificación";
                case EstadoReclamo_413BE.CLASIFICADO_413BE: return "Clasificado";
                case EstadoReclamo_413BE.DERIVADO_413BE: return "Derivado";
                default: return "Cerrado";
            }
        }

        public static string Prioridad_413BE(PrioridadReclamo_413BE? prioridad)
        {
            switch (prioridad)
            {
                case PrioridadReclamo_413BE.URGENTE_413BE: return "Urgente";
                case PrioridadReclamo_413BE.MEDIA_413BE: return "Media";
                case PrioridadReclamo_413BE.BAJA_413BE: return "Baja";
                default: return "";
            }
        }

        public static string Tipo_413BE(TipoImputacion_413BE? tipo)
        {
            switch (tipo)
            {
                case TipoImputacion_413BE.COMUN_413BE: return "Común";
                case TipoImputacion_413BE.PARTICULAR_413BE: return "Particular";
                default: return "";
            }
        }

        public string DatosReclamo_413BE(Reclamo_413BE r)
        {
            return "Reclamo N.º " + r.IdReclamo_413BE + Environment.NewLine
                + "Fecha de alta: " + r.FechaAlta_413BE.ToString("dd/MM/yyyy") + Environment.NewLine
                + "Consorcio: " + NombreConsorcio_413BE(r.IdConsorcio_413BE) + Environment.NewLine
                + "Ubicación: " + Ubicacion_413BE(r) + Environment.NewLine
                + "Consorcista: " + NombreConsorcista_413BE(r.IdConsorcista_413BE) + Environment.NewLine
                + "Categoría: " + NombreCategoria_413BE(r.IdCategoria_413BE) + Environment.NewLine
                + "Estado: " + Estado_413BE(r.Estado_413BE) + Environment.NewLine
                + "Descripción: " + r.Descripcion_413BE;
        }
    }
}
