using System.Data;
using System.Data.SqlClient;
using BE;

namespace DAL
{
    public class TemaPropuestoDAL_413BE
    {
        private const string Columnas = "IdTema_413BE, IdPropuesta_413BE, IdCategoria_413BE, IdUnidadFuncional_413BE, AreaComun_413BE, CantidadReclamos_413BE, " +
            "CostoAcumulado_413BE, TiempoPromedioAbiertoDias_413BE, CostoSolucion_413BE, IdOrdenDia_413BE, OrdenEnOrdenDia_413BE, Dvh_413BE";

        private static SqlParameter P(string nombre, object? valor)
        {
            return AccesoDatos_413BE.Parametro_413BE(nombre, valor);
        }

        private static TemaPropuesto_413BE Mapear_413BE(DataRow fila)
        {
            TemaPropuesto_413BE t = new TemaPropuesto_413BE();
            t.IdTema_413BE = Convert.ToInt32(fila["IdTema_413BE"]);
            t.IdPropuesta_413BE = Convert.ToInt32(fila["IdPropuesta_413BE"]);
            t.IdCategoria_413BE = Convert.ToInt32(fila["IdCategoria_413BE"]);
            t.IdUnidadFuncional_413BE = fila["IdUnidadFuncional_413BE"] == DBNull.Value ? (int?)null : Convert.ToInt32(fila["IdUnidadFuncional_413BE"]);
            t.AreaComun_413BE = fila["AreaComun_413BE"] == DBNull.Value ? null : fila["AreaComun_413BE"].ToString();
            t.CantidadReclamos_413BE = Convert.ToInt32(fila["CantidadReclamos_413BE"]);
            t.CostoAcumulado_413BE = Convert.ToDecimal(fila["CostoAcumulado_413BE"]);
            t.TiempoPromedioAbiertoDias_413BE = Convert.ToDouble(fila["TiempoPromedioAbiertoDias_413BE"]);
            t.CostoSolucion_413BE = Convert.ToDecimal(fila["CostoSolucion_413BE"]);
            t.IdOrdenDia_413BE = fila["IdOrdenDia_413BE"] == DBNull.Value ? (int?)null : Convert.ToInt32(fila["IdOrdenDia_413BE"]);
            t.OrdenEnOrdenDia_413BE = fila["OrdenEnOrdenDia_413BE"] == DBNull.Value ? (int?)null : Convert.ToInt32(fila["OrdenEnOrdenDia_413BE"]);
            t.Dvh_413BE = Convert.ToInt32(fila["Dvh_413BE"]);
            return t;
        }

        private static List<TemaPropuesto_413BE> MapearLista_413BE(DataTable tabla)
        {
            List<TemaPropuesto_413BE> lista = new List<TemaPropuesto_413BE>();
            foreach (DataRow fila in tabla.Rows) lista.Add(Mapear_413BE(fila));
            return lista;
        }

        public int Insertar_413BE(TemaPropuesto_413BE tema)
        {
            int id = AccesoDatos_413BE.Insertar_413BE(
                "INSERT INTO TEMA_PROPUESTO (IdPropuesta_413BE, IdCategoria_413BE, IdUnidadFuncional_413BE, AreaComun_413BE, CantidadReclamos_413BE, " +
                "CostoAcumulado_413BE, TiempoPromedioAbiertoDias_413BE, CostoSolucion_413BE, IdOrdenDia_413BE, OrdenEnOrdenDia_413BE) " +
                "VALUES (@prop, @cat, @uf, @area, @cant, @acum, @tiempo, @sol, @od, @orden)",
                P("@prop", tema.IdPropuesta_413BE), P("@cat", tema.IdCategoria_413BE), P("@uf", tema.IdUnidadFuncional_413BE),
                P("@area", tema.AreaComun_413BE), P("@cant", tema.CantidadReclamos_413BE), P("@acum", tema.CostoAcumulado_413BE),
                P("@tiempo", tema.TiempoPromedioAbiertoDias_413BE), P("@sol", tema.CostoSolucion_413BE),
                P("@od", tema.IdOrdenDia_413BE), P("@orden", tema.OrdenEnOrdenDia_413BE));
            tema.IdTema_413BE = id;
            return id;
        }

        public List<TemaPropuesto_413BE> ObtenerTodos_413BE()
        {
            return MapearLista_413BE(AccesoDatos_413BE.Consultar_413BE("SELECT " + Columnas + " FROM TEMA_PROPUESTO ORDER BY IdTema_413BE"));
        }

        public List<TemaPropuesto_413BE> ObtenerPorPropuesta_413BE(int idPropuesta)
        {
            return MapearLista_413BE(AccesoDatos_413BE.Consultar_413BE(
                "SELECT " + Columnas + " FROM TEMA_PROPUESTO WHERE IdPropuesta_413BE=@prop ORDER BY IdTema_413BE", P("@prop", idPropuesta)));
        }

        public void Actualizar_413BE(TemaPropuesto_413BE tema)
        {
            AccesoDatos_413BE.EjecutarNoQuery_413BE(
                "UPDATE TEMA_PROPUESTO SET IdPropuesta_413BE=@prop, IdCategoria_413BE=@cat, IdUnidadFuncional_413BE=@uf, AreaComun_413BE=@area, " +
                "CantidadReclamos_413BE=@cant, CostoAcumulado_413BE=@acum, TiempoPromedioAbiertoDias_413BE=@tiempo, CostoSolucion_413BE=@sol, " +
                "IdOrdenDia_413BE=@od, OrdenEnOrdenDia_413BE=@orden WHERE IdTema_413BE=@id",
                P("@prop", tema.IdPropuesta_413BE), P("@cat", tema.IdCategoria_413BE), P("@uf", tema.IdUnidadFuncional_413BE),
                P("@area", tema.AreaComun_413BE), P("@cant", tema.CantidadReclamos_413BE), P("@acum", tema.CostoAcumulado_413BE),
                P("@tiempo", tema.TiempoPromedioAbiertoDias_413BE), P("@sol", tema.CostoSolucion_413BE),
                P("@od", tema.IdOrdenDia_413BE), P("@orden", tema.OrdenEnOrdenDia_413BE), P("@id", tema.IdTema_413BE));
        }

        public void ActualizarDvh_413BE(int idTema, int dvh)
        {
            AccesoDatos_413BE.EjecutarNoQuery_413BE("UPDATE TEMA_PROPUESTO SET Dvh_413BE=@dvh WHERE IdTema_413BE=@id",
                P("@dvh", dvh), P("@id", idTema));
        }
    }
}
