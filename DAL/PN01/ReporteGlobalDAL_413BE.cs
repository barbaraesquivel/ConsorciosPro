using System.Data;
using BE;

namespace DAL
{
    public class ReporteGlobalDAL_413BE
    {
        // RECLAMO, CONSORCIO y CATEGORIA van con INNER JOIN (todo reclamo los tiene).
        // DERIVACION, PROVEEDOR y CIERRE_RECLAMO van con LEFT JOIN: con INNER JOIN solo quedarían los reclamos
        // cerrados y el porcentaje de resolución daría siempre 100 %.
        private const string Sql_413BE = @"
WITH Base AS (
    SELECT r.IdReclamo_413BE, r.IdConsorcio_413BE, co.Nombre_413BE AS Consorcio, r.IdCategoria_413BE, ca.Nombre_413BE AS Categoria,
           r.FechaAlta_413BE, p.IdProveedor_413BE, p.Nombre_413BE AS Proveedor, ci.FechaCierre_413BE, ci.CostoImputado_413BE
    FROM RECLAMO r
    INNER JOIN CONSORCIO co ON co.IdConsorcio_413BE = r.IdConsorcio_413BE
    INNER JOIN CATEGORIA ca ON ca.IdCategoria_413BE = r.IdCategoria_413BE
    LEFT JOIN DERIVACION d ON d.IdReclamo_413BE = r.IdReclamo_413BE
    LEFT JOIN PROVEEDOR p ON p.IdProveedor_413BE = d.IdProveedor_413BE
    LEFT JOIN CIERRE_RECLAMO ci ON ci.IdReclamo_413BE = r.IdReclamo_413BE
    WHERE r.FechaAlta_413BE >= @desde AND r.FechaAlta_413BE < @hastaMasUno
      AND (@idConsorcio IS NULL OR r.IdConsorcio_413BE = @idConsorcio)
),
Proveedores AS (
    SELECT IdConsorcio_413BE, IdCategoria_413BE, Proveedor, COUNT(*) AS Atendidos,
           ROW_NUMBER() OVER (PARTITION BY IdConsorcio_413BE, IdCategoria_413BE ORDER BY COUNT(*) DESC, Proveedor) AS Puesto
    FROM Base
    WHERE IdProveedor_413BE IS NOT NULL
    GROUP BY IdConsorcio_413BE, IdCategoria_413BE, IdProveedor_413BE, Proveedor
)
SELECT b.IdConsorcio_413BE, b.Consorcio, b.IdCategoria_413BE, b.Categoria,
       COUNT(*) AS CantidadReclamos,
       COUNT(b.FechaCierre_413BE) AS CantidadCerrados,
       CAST(COUNT(b.FechaCierre_413BE) * 100.0 / COUNT(*) AS DECIMAL(5, 2)) AS PorcentajeResolucion,
       ISNULL(SUM(b.CostoImputado_413BE), 0) AS CostoTotal,
       CAST(ISNULL(AVG(b.CostoImputado_413BE), 0) AS DECIMAL(18, 2)) AS CostoPromedio,
       ISNULL(SUM(DATEDIFF(DAY, b.FechaAlta_413BE, b.FechaCierre_413BE)), 0) AS SumaDiasCierre,
       CAST(AVG(CAST(DATEDIFF(DAY, b.FechaAlta_413BE, b.FechaCierre_413BE) AS DECIMAL(18, 2))) AS DECIMAL(18, 2)) AS DiasPromedioCierre,
       pr.Proveedor AS ProveedorPrincipal,
       ISNULL(pr.Atendidos, 0) AS AtendidosProveedorPrincipal
FROM Base b
LEFT JOIN Proveedores pr ON pr.IdConsorcio_413BE = b.IdConsorcio_413BE AND pr.IdCategoria_413BE = b.IdCategoria_413BE AND pr.Puesto = 1
GROUP BY b.IdConsorcio_413BE, b.Consorcio, b.IdCategoria_413BE, b.Categoria, pr.Proveedor, pr.Atendidos
ORDER BY b.Consorcio, b.Categoria";

        public List<ReporteGlobalFila_413BE> Consultar_413BE(DateTime desde, DateTime hasta, int? idConsorcio)
        {
            DataTable tabla = AccesoDatos_413BE.Consultar_413BE(Sql_413BE,
                AccesoDatos_413BE.Parametro_413BE("@desde", desde.Date),
                AccesoDatos_413BE.Parametro_413BE("@hastaMasUno", hasta.Date.AddDays(1)),
                AccesoDatos_413BE.Parametro_413BE("@idConsorcio", idConsorcio));
            List<ReporteGlobalFila_413BE> lista = new List<ReporteGlobalFila_413BE>();
            foreach (DataRow fila in tabla.Rows) lista.Add(Mapear_413BE(fila));
            return lista;
        }

        private static ReporteGlobalFila_413BE Mapear_413BE(DataRow fila)
        {
            ReporteGlobalFila_413BE f = new ReporteGlobalFila_413BE();
            f.IdConsorcio_413BE = Convert.ToInt32(fila["IdConsorcio_413BE"]);
            f.Consorcio_413BE = fila["Consorcio"].ToString() ?? "";
            f.IdCategoria_413BE = Convert.ToInt32(fila["IdCategoria_413BE"]);
            f.Categoria_413BE = fila["Categoria"].ToString() ?? "";
            f.CantidadReclamos_413BE = Convert.ToInt32(fila["CantidadReclamos"]);
            f.CantidadCerrados_413BE = Convert.ToInt32(fila["CantidadCerrados"]);
            f.PorcentajeResolucion_413BE = Convert.ToDecimal(fila["PorcentajeResolucion"]);
            f.CostoTotal_413BE = Convert.ToDecimal(fila["CostoTotal"]);
            f.CostoPromedio_413BE = Convert.ToDecimal(fila["CostoPromedio"]);
            f.SumaDiasCierre_413BE = Convert.ToInt32(fila["SumaDiasCierre"]);
            f.DiasPromedioCierre_413BE = fila["DiasPromedioCierre"] == DBNull.Value ? null : Convert.ToDecimal(fila["DiasPromedioCierre"]);
            f.ProveedorPrincipal_413BE = fila["ProveedorPrincipal"] == DBNull.Value ? null : fila["ProveedorPrincipal"].ToString();
            f.AtendidosProveedorPrincipal_413BE = Convert.ToInt32(fila["AtendidosProveedorPrincipal"]);
            return f;
        }
    }
}
