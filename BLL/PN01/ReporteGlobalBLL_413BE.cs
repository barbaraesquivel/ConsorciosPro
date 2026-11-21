using BE;
using DAL;
using SER;

namespace BLL
{
    // Reporte Global: análisis de reclamos por consorcio y categoría.
    public class ReporteGlobalBLL_413BE
    {
        public const string NombreReporte_413BE = "Reporte Global";

        private readonly ReporteGlobalDAL_413BE _reporteDAL_413BE = new ReporteGlobalDAL_413BE();
        private readonly ReporteGlobalPdfService_413BE _exportador_413BE = new ReporteGlobalPdfService_413BE();
        private readonly BitacoraBLL _bitacora_413BE = new BitacoraBLL();

        public ReporteGlobal_413BE Generar_413BE(DateTime desde, DateTime hasta, int? idConsorcio, string nombreConsorcio)
        {
            if (desde.Date > hasta.Date)
            {
                throw new ArgumentException(TraduccionAyuda_413BE.Obtener_413BE("ex_fechasInvertidas", "La fecha desde no puede ser posterior a la fecha hasta"));
            }

            ReporteGlobal_413BE reporte = new ReporteGlobal_413BE();
            reporte.Desde_413BE = desde.Date;
            reporte.Hasta_413BE = hasta.Date;
            reporte.IdConsorcio_413BE = idConsorcio;
            reporte.NombreConsorcio_413BE = nombreConsorcio;
            reporte.FechaGeneracion_413BE = DateTime.Now;
            reporte.Filas_413BE = _reporteDAL_413BE.Consultar_413BE(desde, hasta, idConsorcio);
            reporte.Total_413BE = CalcularTotal_413BE(reporte.Filas_413BE);
            MarcarIndicadores_413BE(reporte.Filas_413BE, reporte.Total_413BE);
            reporte.CostoPorCategoria_413BE = reporte.Filas_413BE
                .GroupBy(f => f.Categoria_413BE)
                .Select(g => new ReporteGlobalCategoria_413BE { Categoria_413BE = g.Key, CostoTotal_413BE = g.Sum(f => f.CostoTotal_413BE) })
                .OrderByDescending(c => c.CostoTotal_413BE)
                .ThenBy(c => c.Categoria_413BE)
                .ToList();

            _bitacora_413BE.RegistrarDeUsuarioActual(NombreReporte_413BE + " - Generación", idConsorcio?.ToString() ?? "",
                DescribirFiltros_413BE(reporte) + "; combinaciones: " + reporte.Filas_413BE.Count + "; reclamos: " + reporte.Total_413BE.CantidadReclamos_413BE);
            return reporte;
        }

        // Exporta a PDF con los textos que se le pasan ya traducidos (encabezados de columna, título, leyenda).
        public void Exportar_413BE(ReporteGlobal_413BE reporte, string ruta, string titulo, string subtitulo, string leyenda,
            List<string> encabezados, List<List<string>> filas, string tituloGrafico)
        {
            HashSet<int> resaltadas = new HashSet<int>();
            for (int i = 0; i < reporte.Filas_413BE.Count; i++)
            {
                if (reporte.Filas_413BE[i].Critica_413BE) resaltadas.Add(i);
            }
            List<double> anchos = new List<double> { 1.8, 1.1, 0.8, 0.8, 1.1, 1.3, 1.3, 1.1, 2.1, 2.5 };
            List<(string, decimal)> barras = reporte.CostoPorCategoria_413BE.Select(c => (c.Categoria_413BE, c.CostoTotal_413BE)).ToList();
            _exportador_413BE.Exportar_413BE(titulo, subtitulo, leyenda, encabezados, anchos, filas, resaltadas, true, tituloGrafico, barras, ruta);

            _bitacora_413BE.RegistrarDeUsuarioActual(NombreReporte_413BE + " - Exportación a PDF", reporte.IdConsorcio_413BE?.ToString() ?? "",
                DescribirFiltros_413BE(reporte) + "; archivo: " + Path.GetFileName(ruta));
        }

        private static ReporteGlobalFila_413BE CalcularTotal_413BE(List<ReporteGlobalFila_413BE> filas)
        {
            ReporteGlobalFila_413BE total = new ReporteGlobalFila_413BE { EsTotal_413BE = true };
            total.CantidadReclamos_413BE = filas.Sum(f => f.CantidadReclamos_413BE);
            total.CantidadCerrados_413BE = filas.Sum(f => f.CantidadCerrados_413BE);
            total.CostoTotal_413BE = filas.Sum(f => f.CostoTotal_413BE);
            total.SumaDiasCierre_413BE = filas.Sum(f => f.SumaDiasCierre_413BE);
            total.PorcentajeResolucion_413BE = total.CantidadReclamos_413BE == 0 ? 0
                : Math.Round(total.CantidadCerrados_413BE * 100m / total.CantidadReclamos_413BE, 2);
            total.CostoPromedio_413BE = total.CantidadCerrados_413BE == 0 ? 0
                : Math.Round(total.CostoTotal_413BE / total.CantidadCerrados_413BE, 2);
            total.DiasPromedioCierre_413BE = total.CantidadCerrados_413BE == 0 ? null
                : Math.Round((decimal)total.SumaDiasCierre_413BE / total.CantidadCerrados_413BE, 2);
            return total;
        }

        // En rojo: % de resolución menor que el general, o días promedio de cierre mayores que el general.
        private static void MarcarIndicadores_413BE(List<ReporteGlobalFila_413BE> filas, ReporteGlobalFila_413BE total)
        {
            foreach (ReporteGlobalFila_413BE f in filas)
            {
                f.ResolucionBaja_413BE = f.PorcentajeResolucion_413BE < total.PorcentajeResolucion_413BE;
                f.DemoraAlta_413BE = f.DiasPromedioCierre_413BE != null && total.DiasPromedioCierre_413BE != null
                    && f.DiasPromedioCierre_413BE.Value > total.DiasPromedioCierre_413BE.Value;
            }
        }

        private static string DescribirFiltros_413BE(ReporteGlobal_413BE reporte)
        {
            return "Desde " + reporte.Desde_413BE.ToString("dd/MM/yyyy") + " hasta " + reporte.Hasta_413BE.ToString("dd/MM/yyyy")
                + "; consorcio: " + reporte.NombreConsorcio_413BE;
        }
    }
}
