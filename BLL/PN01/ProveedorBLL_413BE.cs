using BE;
using DAL;
using SER;

namespace BLL
{
    public class ProveedorBLL_413BE
    {
        private readonly ProveedorDAL_413BE _proveedorDAL = new ProveedorDAL_413BE();
        private readonly ExportadorPdfService_413BE _exportador = new ExportadorPdfService_413BE();

        public List<Proveedor_413BE> ObtenerTodos_413BE()
        {
            return _proveedorDAL.ObtenerTodos_413BE();
        }

        public DesempenoProveedor_413BE CalcularDesempeno_413BE(int idProveedor, int idCategoria)
        {
            return _proveedorDAL.ObtenerDesempeno_413BE(idProveedor, idCategoria);
        }

        public List<DesempenoProveedor_413BE> BuscarProveedores_413BE(int idCategoria, CriterioOrden_413BE criterio)
        {
            List<Proveedor_413BE> habilitados = _proveedorDAL.ObtenerHabilitadosPorCategoria_413BE(idCategoria);
            List<DesempenoProveedor_413BE> desempenos = new List<DesempenoProveedor_413BE>();
            foreach (Proveedor_413BE proveedor in habilitados)
            {
                desempenos.Add(CalcularDesempeno_413BE(proveedor.IdProveedor_413BE, idCategoria));
            }
            CalcularPuntajes_413BE(desempenos);

            IEnumerable<DesempenoProveedor_413BE> conHistorial = desempenos.Where(d => d.CantidadResueltos_413BE > 0);
            IOrderedEnumerable<DesempenoProveedor_413BE> ordenados;
            switch (criterio)
            {
                case CriterioOrden_413BE.MEJOR_PRECIO_413BE:
                    ordenados = conHistorial.OrderBy(d => d.PrecioPromedio_413BE); break;
                case CriterioOrden_413BE.MAS_RAPIDO_413BE:
                    ordenados = conHistorial.OrderBy(d => d.TiempoPromedioDias_413BE); break;
                case CriterioOrden_413BE.MAS_EFICIENTE_413BE:
                    ordenados = conHistorial.OrderBy(d => d.TasaReincidencia_413BE); break;
                default:
                    ordenados = conHistorial.OrderByDescending(d => d.Puntaje_413BE); break;
            }
            List<DesempenoProveedor_413BE> resultado = ordenados.ThenBy(d => d.NombreProveedor_413BE).ToList();
            resultado.AddRange(desempenos.Where(d => d.CantidadResueltos_413BE == 0).OrderBy(d => d.NombreProveedor_413BE));
            return resultado;
        }

        private static void CalcularPuntajes_413BE(List<DesempenoProveedor_413BE> desempenos)
        {
            List<DesempenoProveedor_413BE> conHistorial = desempenos.Where(d => d.CantidadResueltos_413BE > 0).ToList();
            foreach (DesempenoProveedor_413BE d in desempenos)
            {
                d.Puntaje_413BE = 0;
            }
            if (conHistorial.Count == 0) return;
            double precioMin = (double)conHistorial.Min(d => d.PrecioPromedio_413BE);
            double precioMax = (double)conHistorial.Max(d => d.PrecioPromedio_413BE);
            double tiempoMin = conHistorial.Min(d => d.TiempoPromedioDias_413BE);
            double tiempoMax = conHistorial.Max(d => d.TiempoPromedioDias_413BE);
            double tasaMin = conHistorial.Min(d => d.TasaReincidencia_413BE);
            double tasaMax = conHistorial.Max(d => d.TasaReincidencia_413BE);
            foreach (DesempenoProveedor_413BE d in conHistorial)
            {
                double precio = Normalizar_413BE((double)d.PrecioPromedio_413BE, precioMin, precioMax);
                double tiempo = Normalizar_413BE(d.TiempoPromedioDias_413BE, tiempoMin, tiempoMax);
                double tasa = Normalizar_413BE(d.TasaReincidencia_413BE, tasaMin, tasaMax);
                d.Puntaje_413BE = 100 * (0.4 * precio + 0.3 * tiempo + 0.3 * tasa);
            }
        }

        private static double Normalizar_413BE(double valor, double minimo, double maximo)
        {
            if (maximo == minimo) return 1;
            return (maximo - valor) / (maximo - minimo);
        }

        public List<DesempenoProveedor_413BE> ObtenerDesempenoHistorico_413BE(int idProveedor)
        {
            return _proveedorDAL.ObtenerDesempenoHistorico_413BE(idProveedor);
        }

        public void ExportarDesempeno_413BE(List<DesempenoProveedor_413BE> desempeno, string ruta)
        {
            List<string> encabezados = new List<string> { "Proveedor", "Categoría", "Precio promedio", "Tiempo promedio (días)", "Tasa de reincidencia (%)", "Reclamos resueltos" };
            List<List<string>> filas = new List<List<string>>();
            foreach (DesempenoProveedor_413BE d in desempeno)
            {
                filas.Add(new List<string>
                {
                    d.NombreProveedor_413BE,
                    d.NombreCategoria_413BE,
                    d.PrecioPromedio_413BE.ToString("N2"),
                    d.TiempoPromedioDias_413BE.ToString("N1"),
                    d.TasaReincidencia_413BE.ToString("N1"),
                    d.CantidadResueltos_413BE.ToString()
                });
            }
            _exportador.ExportarTabla_413BE("Desempeño de proveedores", encabezados, filas, ruta);
        }
    }
}
