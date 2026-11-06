using System.Data;
using System.Data.SqlClient;
using BE;

namespace DAL
{
    public class OrdenDelDiaDAL_413BE
    {
        private const string Columnas = "IdOrdenDia_413BE, IdPropuesta_413BE, FechaAsamblea_413BE, FechaRegistro_413BE, Dvh_413BE";

        private static SqlParameter P(string nombre, object? valor)
        {
            return AccesoDatos_413BE.Parametro_413BE(nombre, valor);
        }

        private static OrdenDelDia_413BE Mapear_413BE(DataRow fila)
        {
            OrdenDelDia_413BE o = new OrdenDelDia_413BE();
            o.IdOrdenDia_413BE = Convert.ToInt32(fila["IdOrdenDia_413BE"]);
            o.IdPropuesta_413BE = Convert.ToInt32(fila["IdPropuesta_413BE"]);
            o.FechaAsamblea_413BE = Convert.ToDateTime(fila["FechaAsamblea_413BE"]);
            o.FechaRegistro_413BE = Convert.ToDateTime(fila["FechaRegistro_413BE"]);
            o.Dvh_413BE = Convert.ToInt32(fila["Dvh_413BE"]);
            return o;
        }

        public int Insertar_413BE(OrdenDelDia_413BE orden)
        {
            int id = AccesoDatos_413BE.Insertar_413BE(
                "INSERT INTO ORDEN_DIA (IdPropuesta_413BE, FechaAsamblea_413BE, FechaRegistro_413BE) VALUES (@prop, @asamblea, @registro)",
                P("@prop", orden.IdPropuesta_413BE), P("@asamblea", orden.FechaAsamblea_413BE), P("@registro", orden.FechaRegistro_413BE));
            orden.IdOrdenDia_413BE = id;
            return id;
        }

        public List<OrdenDelDia_413BE> ObtenerTodos_413BE()
        {
            List<OrdenDelDia_413BE> lista = new List<OrdenDelDia_413BE>();
            DataTable tabla = AccesoDatos_413BE.Consultar_413BE("SELECT " + Columnas + " FROM ORDEN_DIA ORDER BY IdOrdenDia_413BE");
            foreach (DataRow fila in tabla.Rows) lista.Add(Mapear_413BE(fila));
            return lista;
        }

        public OrdenDelDia_413BE? ObtenerPorPropuesta_413BE(int idPropuesta)
        {
            DataTable tabla = AccesoDatos_413BE.Consultar_413BE("SELECT " + Columnas + " FROM ORDEN_DIA WHERE IdPropuesta_413BE=@prop",
                P("@prop", idPropuesta));
            return tabla.Rows.Count == 0 ? null : Mapear_413BE(tabla.Rows[0]);
        }

        public void ActualizarDvh_413BE(int idOrdenDia, int dvh)
        {
            AccesoDatos_413BE.EjecutarNoQuery_413BE("UPDATE ORDEN_DIA SET Dvh_413BE=@dvh WHERE IdOrdenDia_413BE=@id",
                P("@dvh", dvh), P("@id", idOrdenDia));
        }
    }
}
