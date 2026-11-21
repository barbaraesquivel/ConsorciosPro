namespace BE
{
    // Una combinación consorcio + categoría del Reporte Global (o la fila de totales).
    public class ReporteGlobalFila_413BE
    {
        public int IdConsorcio_413BE { get; set; }
        public string Consorcio_413BE { get; set; } = "";
        public int IdCategoria_413BE { get; set; }
        public string Categoria_413BE { get; set; } = "";
        public int CantidadReclamos_413BE { get; set; }
        public int CantidadCerrados_413BE { get; set; }
        public decimal PorcentajeResolucion_413BE { get; set; }
        public decimal CostoTotal_413BE { get; set; }
        // Costo promedio de los reclamos cerrados (los abiertos todavía no tienen costo imputado).
        public decimal CostoPromedio_413BE { get; set; }
        // Suma de DATEDIFF(DAY, FechaAlta, FechaCierre) de los cerrados; permite calcular el promedio ponderado del total.
        public int SumaDiasCierre_413BE { get; set; }
        // Null cuando la combinación no tiene reclamos cerrados.
        public decimal? DiasPromedioCierre_413BE { get; set; }
        public string? ProveedorPrincipal_413BE { get; set; }
        public int AtendidosProveedorPrincipal_413BE { get; set; }
        // Indicadores respecto del total general.
        public bool ResolucionBaja_413BE { get; set; }
        public bool DemoraAlta_413BE { get; set; }
        public bool Critica_413BE => ResolucionBaja_413BE || DemoraAlta_413BE;
        public bool EsTotal_413BE { get; set; }
    }
}
