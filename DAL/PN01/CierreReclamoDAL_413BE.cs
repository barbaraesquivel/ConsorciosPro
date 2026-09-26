using System.Data;
using BE;

namespace DAL
{
    public class CierreReclamoDAL_413BE
    {
        private const string Columnas = "IdCierre_413BE, IdReclamo_413BE, FechaCierre_413BE, InformeResolucion_413BE, NumeroFactura_413BE, CuentaImputada_413BE, CostoImputado_413BE, Dvh_413BE";

        private static CierreReclamo_413BE Mapear_413BE(DataRow fila)
        {
            CierreReclamo_413BE c = new CierreReclamo_413BE();
            c.IdCierre_413BE = Convert.ToInt32(fila["IdCierre_413BE"]);
            c.IdReclamo_413BE = Convert.ToInt32(fila["IdReclamo_413BE"]);
            c.FechaCierre_413BE = Convert.ToDateTime(fila["FechaCierre_413BE"]);
            c.InformeResolucion_413BE = fila["InformeResolucion_413BE"].ToString() ?? "";
            c.NumeroFactura_413BE = fila["NumeroFactura_413BE"].ToString() ?? "";
            c.CuentaImputada_413BE = fila["CuentaImputada_413BE"].ToString() ?? "";
            c.CostoImputado_413BE = Convert.ToDecimal(fila["CostoImputado_413BE"]);
            c.Dvh_413BE = Convert.ToInt32(fila["Dvh_413BE"]);
            return c;
        }

        public int Insertar_413BE(CierreReclamo_413BE cierre)
        {
            return AccesoDatos_413BE.Insertar_413BE(
                "INSERT INTO CIERRE_RECLAMO (IdReclamo_413BE, FechaCierre_413BE, InformeResolucion_413BE, NumeroFactura_413BE, CuentaImputada_413BE, CostoImputado_413BE) " +
                "VALUES (@rec, @fecha, @informe, @factura, @cuenta, @costo)",
                AccesoDatos_413BE.Parametro_413BE("@rec", cierre.IdReclamo_413BE),
                AccesoDatos_413BE.Parametro_413BE("@fecha", cierre.FechaCierre_413BE),
                AccesoDatos_413BE.Parametro_413BE("@informe", cierre.InformeResolucion_413BE),
                AccesoDatos_413BE.Parametro_413BE("@factura", cierre.NumeroFactura_413BE ?? ""),
                AccesoDatos_413BE.Parametro_413BE("@cuenta", cierre.CuentaImputada_413BE),
                AccesoDatos_413BE.Parametro_413BE("@costo", cierre.CostoImputado_413BE));
        }

        public List<CierreReclamo_413BE> ObtenerTodos_413BE()
        {
            List<CierreReclamo_413BE> lista = new List<CierreReclamo_413BE>();
            DataTable tabla = AccesoDatos_413BE.Consultar_413BE("SELECT " + Columnas + " FROM CIERRE_RECLAMO ORDER BY IdCierre_413BE");
            foreach (DataRow fila in tabla.Rows) lista.Add(Mapear_413BE(fila));
            return lista;
        }

        public CierreReclamo_413BE? ObtenerPorReclamo_413BE(int idReclamo)
        {
            DataTable tabla = AccesoDatos_413BE.Consultar_413BE("SELECT " + Columnas + " FROM CIERRE_RECLAMO WHERE IdReclamo_413BE=@id",
                AccesoDatos_413BE.Parametro_413BE("@id", idReclamo));
            return tabla.Rows.Count == 0 ? null : Mapear_413BE(tabla.Rows[0]);
        }

        public void ActualizarDvh_413BE(int idCierre, int dvh)
        {
            AccesoDatos_413BE.EjecutarNoQuery_413BE("UPDATE CIERRE_RECLAMO SET Dvh_413BE=@dvh WHERE IdCierre_413BE=@id",
                AccesoDatos_413BE.Parametro_413BE("@dvh", dvh), AccesoDatos_413BE.Parametro_413BE("@id", idCierre));
        }
    }
}
