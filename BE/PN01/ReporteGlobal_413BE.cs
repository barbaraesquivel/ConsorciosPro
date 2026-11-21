namespace BE
{
    // Resultado completo del Reporte Global: filtros usados, filas, totales y datos del gráfico.
    public class ReporteGlobal_413BE
    {
        public DateTime Desde_413BE { get; set; }
        public DateTime Hasta_413BE { get; set; }
        public int? IdConsorcio_413BE { get; set; }
        public string NombreConsorcio_413BE { get; set; } = "";
        public DateTime FechaGeneracion_413BE { get; set; }
        public List<ReporteGlobalFila_413BE> Filas_413BE { get; set; } = new List<ReporteGlobalFila_413BE>();
        public ReporteGlobalFila_413BE Total_413BE { get; set; } = new ReporteGlobalFila_413BE { EsTotal_413BE = true };
        public List<ReporteGlobalCategoria_413BE> CostoPorCategoria_413BE { get; set; } = new List<ReporteGlobalCategoria_413BE>();
    }

    // Barra del gráfico: costo total imputado de una categoría.
    public class ReporteGlobalCategoria_413BE
    {
        public string Categoria_413BE { get; set; } = "";
        public decimal CostoTotal_413BE { get; set; }
    }
}
