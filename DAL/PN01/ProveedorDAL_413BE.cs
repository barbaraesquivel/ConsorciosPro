using System.Data;
using System.Data.SqlClient;
using BE;

namespace DAL
{
    public class ProveedorDAL_413BE
    {
        private static SqlParameter P(string nombre, object? valor)
        {
            return AccesoDatos_413BE.Parametro_413BE(nombre, valor);
        }

        private static List<Proveedor_413BE> MapearProveedores_413BE(DataTable tabla)
        {
            List<Proveedor_413BE> lista = new List<Proveedor_413BE>();
            foreach (DataRow fila in tabla.Rows)
            {
                Proveedor_413BE p = new Proveedor_413BE();
                p.IdProveedor_413BE = Convert.ToInt32(fila["IdProveedor_413BE"]);
                p.Nombre_413BE = fila["Nombre_413BE"].ToString() ?? "";
                p.Cuit_413BE = fila["Cuit_413BE"].ToString() ?? "";
                p.Email_413BE = fila["Email_413BE"].ToString() ?? "";
                p.Habilitado_413BE = Convert.ToBoolean(fila["Habilitado_413BE"]);
                p.Dvh_413BE = Convert.ToInt32(fila["Dvh_413BE"]);
                DataTable categorias = AccesoDatos_413BE.Consultar_413BE(
                    "SELECT IdCategoria_413BE FROM PROVEEDOR_CATEGORIA WHERE IdProveedor_413BE=@id ORDER BY IdCategoria_413BE", P("@id", p.IdProveedor_413BE));
                foreach (DataRow c in categorias.Rows)
                {
                    p.IdsCategorias_413BE.Add(Convert.ToInt32(c["IdCategoria_413BE"]));
                }
                lista.Add(p);
            }
            return lista;
        }

        public List<Proveedor_413BE> ObtenerTodos_413BE()
        {
            return MapearProveedores_413BE(AccesoDatos_413BE.Consultar_413BE(
                "SELECT IdProveedor_413BE, Nombre_413BE, Cuit_413BE, Email_413BE, Habilitado_413BE, Dvh_413BE FROM PROVEEDOR ORDER BY Nombre_413BE"));
        }

        public List<Proveedor_413BE> ObtenerHabilitadosPorCategoria_413BE(int idCategoria)
        {
            return MapearProveedores_413BE(AccesoDatos_413BE.Consultar_413BE(
                "SELECT p.IdProveedor_413BE, p.Nombre_413BE, p.Cuit_413BE, p.Email_413BE, p.Habilitado_413BE, p.Dvh_413BE FROM PROVEEDOR p " +
                "INNER JOIN PROVEEDOR_CATEGORIA pc ON pc.IdProveedor_413BE=p.IdProveedor_413BE " +
                "WHERE p.Habilitado_413BE=1 AND pc.IdCategoria_413BE=@cat ORDER BY p.Nombre_413BE", P("@cat", idCategoria)));
        }

        public void ActualizarDvh_413BE(int idProveedor, int dvh)
        {
            AccesoDatos_413BE.EjecutarNoQuery_413BE("UPDATE PROVEEDOR SET Dvh_413BE=@dvh WHERE IdProveedor_413BE=@id",
                P("@dvh", dvh), P("@id", idProveedor));
        }

        private const string Agregado =
            "SELECT p.IdProveedor_413BE, p.Nombre_413BE AS NombreProveedor, ca.IdCategoria_413BE, ca.Nombre_413BE AS NombreCategoria, " +
            "ISNULL(AVG(x.CostoImputado_413BE), 0) AS Precio, " +
            "ISNULL(AVG(CAST(DATEDIFF(SECOND, x.FechaDerivacion_413BE, x.FechaCierre_413BE) AS FLOAT) / 86400.0), 0) AS Dias, " +
            "ISNULL(100.0 * SUM(x.Reincidido) " +
            "/ NULLIF(COUNT(x.IdReclamo_413BE), 0), 0) AS Tasa, " +
            "COUNT(x.IdReclamo_413BE) AS Cantidad ";

        private const string Resueltos =
            "(SELECT r.IdReclamo_413BE, r.IdCategoria_413BE, d.IdProveedor_413BE, d.FechaDerivacion_413BE, c.FechaCierre_413BE, c.CostoImputado_413BE, " +
            "CASE WHEN EXISTS (SELECT 1 FROM RECLAMO o WHERE o.IdReclamoOriginal_413BE = r.IdReclamo_413BE) THEN 1 ELSE 0 END AS Reincidido " +
            "FROM RECLAMO r INNER JOIN DERIVACION d ON d.IdReclamo_413BE=r.IdReclamo_413BE " +
            "INNER JOIN CIERRE_RECLAMO c ON c.IdReclamo_413BE=r.IdReclamo_413BE WHERE r.Estado_413BE='CERRADO_413BE')";

        private static DesempenoProveedor_413BE MapearDesempeno_413BE(DataRow fila)
        {
            DesempenoProveedor_413BE d = new DesempenoProveedor_413BE();
            d.IdProveedor_413BE = Convert.ToInt32(fila["IdProveedor_413BE"]);
            d.NombreProveedor_413BE = fila["NombreProveedor"].ToString() ?? "";
            d.IdCategoria_413BE = Convert.ToInt32(fila["IdCategoria_413BE"]);
            d.NombreCategoria_413BE = fila["NombreCategoria"].ToString() ?? "";
            d.PrecioPromedio_413BE = Convert.ToDecimal(fila["Precio"]);
            d.TiempoPromedioDias_413BE = Convert.ToDouble(fila["Dias"]);
            d.TasaReincidencia_413BE = Convert.ToDouble(fila["Tasa"]);
            d.CantidadResueltos_413BE = Convert.ToInt32(fila["Cantidad"]);
            d.Puntaje_413BE = 0;
            return d;
        }

        public DesempenoProveedor_413BE ObtenerDesempeno_413BE(int idProveedor, int idCategoria)
        {
            DataTable tabla = AccesoDatos_413BE.Consultar_413BE(
                Agregado + "FROM PROVEEDOR p CROSS JOIN CATEGORIA ca LEFT JOIN " + Resueltos + " x " +
                "ON x.IdProveedor_413BE=p.IdProveedor_413BE AND x.IdCategoria_413BE=ca.IdCategoria_413BE " +
                "WHERE p.IdProveedor_413BE=@prov AND ca.IdCategoria_413BE=@cat " +
                "GROUP BY p.IdProveedor_413BE, p.Nombre_413BE, ca.IdCategoria_413BE, ca.Nombre_413BE",
                P("@prov", idProveedor), P("@cat", idCategoria));
            if (tabla.Rows.Count == 0) throw new InvalidOperationException("No existe el proveedor o la categoría indicados");
            return MapearDesempeno_413BE(tabla.Rows[0]);
        }

        public List<DesempenoProveedor_413BE> ObtenerDesempenoHistorico_413BE(int idProveedor)
        {
            DataTable tabla = AccesoDatos_413BE.Consultar_413BE(
                Agregado + "FROM PROVEEDOR p INNER JOIN " + Resueltos + " x ON x.IdProveedor_413BE=p.IdProveedor_413BE " +
                "INNER JOIN CATEGORIA ca ON ca.IdCategoria_413BE=x.IdCategoria_413BE " +
                "WHERE p.IdProveedor_413BE=@prov " +
                "GROUP BY p.IdProveedor_413BE, p.Nombre_413BE, ca.IdCategoria_413BE, ca.Nombre_413BE ORDER BY ca.Nombre_413BE",
                P("@prov", idProveedor));
            List<DesempenoProveedor_413BE> lista = new List<DesempenoProveedor_413BE>();
            foreach (DataRow fila in tabla.Rows)
            {
                lista.Add(MapearDesempeno_413BE(fila));
            }
            return lista;
        }
    }
}
