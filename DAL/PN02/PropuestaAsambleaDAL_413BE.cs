using System.Data;
using System.Data.SqlClient;
using System.Text;
using BE;

namespace DAL
{
    public class PropuestaAsambleaDAL_413BE
    {
        private const string Columnas = "IdPropuesta_413BE, IdConsorcio_413BE, FechaGeneracion_413BE, PeriodoDesde_413BE, PeriodoHasta_413BE, " +
            "UmbralRepeticion_413BE, Estado_413BE, Dvh_413BE";

        private static SqlParameter P(string nombre, object? valor)
        {
            return AccesoDatos_413BE.Parametro_413BE(nombre, valor);
        }

        private static PropuestaAsamblea_413BE Mapear_413BE(DataRow fila)
        {
            PropuestaAsamblea_413BE p = new PropuestaAsamblea_413BE();
            p.IdPropuesta_413BE = Convert.ToInt32(fila["IdPropuesta_413BE"]);
            p.IdConsorcio_413BE = Convert.ToInt32(fila["IdConsorcio_413BE"]);
            p.FechaGeneracion_413BE = Convert.ToDateTime(fila["FechaGeneracion_413BE"]);
            p.PeriodoDesde_413BE = Convert.ToDateTime(fila["PeriodoDesde_413BE"]);
            p.PeriodoHasta_413BE = Convert.ToDateTime(fila["PeriodoHasta_413BE"]);
            p.UmbralRepeticion_413BE = Convert.ToInt32(fila["UmbralRepeticion_413BE"]);
            p.Estado_413BE = Enum.Parse<EstadoPropuesta_413BE>(fila["Estado_413BE"].ToString()!);
            p.Dvh_413BE = Convert.ToInt32(fila["Dvh_413BE"]);
            return p;
        }

        public int Insertar_413BE(PropuestaAsamblea_413BE propuesta)
        {
            int id = AccesoDatos_413BE.Insertar_413BE(
                "INSERT INTO PROPUESTA_ASAMBLEA (IdConsorcio_413BE, FechaGeneracion_413BE, PeriodoDesde_413BE, PeriodoHasta_413BE, UmbralRepeticion_413BE, Estado_413BE) " +
                "VALUES (@con, @fecha, @desde, @hasta, @umbral, @estado)",
                P("@con", propuesta.IdConsorcio_413BE), P("@fecha", propuesta.FechaGeneracion_413BE),
                P("@desde", propuesta.PeriodoDesde_413BE), P("@hasta", propuesta.PeriodoHasta_413BE),
                P("@umbral", propuesta.UmbralRepeticion_413BE), P("@estado", propuesta.Estado_413BE.ToString()));
            propuesta.IdPropuesta_413BE = id;
            return id;
        }

        public List<PropuestaAsamblea_413BE> ObtenerTodos_413BE()
        {
            List<PropuestaAsamblea_413BE> lista = new List<PropuestaAsamblea_413BE>();
            DataTable tabla = AccesoDatos_413BE.Consultar_413BE("SELECT " + Columnas + " FROM PROPUESTA_ASAMBLEA ORDER BY IdPropuesta_413BE");
            foreach (DataRow fila in tabla.Rows) lista.Add(Mapear_413BE(fila));
            return lista;
        }

        public PropuestaAsamblea_413BE ObtenerPorId_413BE(int idPropuesta)
        {
            DataTable tabla = AccesoDatos_413BE.Consultar_413BE("SELECT " + Columnas + " FROM PROPUESTA_ASAMBLEA WHERE IdPropuesta_413BE=@id",
                P("@id", idPropuesta));
            if (tabla.Rows.Count == 0) throw new InvalidOperationException("No existe la propuesta indicada");
            return Mapear_413BE(tabla.Rows[0]);
        }

        public List<PropuestaAsamblea_413BE> ObtenerPorEstado_413BE(EstadoPropuesta_413BE estado)
        {
            List<PropuestaAsamblea_413BE> lista = new List<PropuestaAsamblea_413BE>();
            DataTable tabla = AccesoDatos_413BE.Consultar_413BE(
                "SELECT " + Columnas + " FROM PROPUESTA_ASAMBLEA WHERE Estado_413BE=@estado ORDER BY FechaGeneracion_413BE DESC",
                P("@estado", estado.ToString()));
            foreach (DataRow fila in tabla.Rows) lista.Add(Mapear_413BE(fila));
            return lista;
        }

        public void Actualizar_413BE(PropuestaAsamblea_413BE propuesta)
        {
            AccesoDatos_413BE.EjecutarNoQuery_413BE(
                "UPDATE PROPUESTA_ASAMBLEA SET IdConsorcio_413BE=@con, FechaGeneracion_413BE=@fecha, PeriodoDesde_413BE=@desde, " +
                "PeriodoHasta_413BE=@hasta, UmbralRepeticion_413BE=@umbral, Estado_413BE=@estado WHERE IdPropuesta_413BE=@id",
                P("@con", propuesta.IdConsorcio_413BE), P("@fecha", propuesta.FechaGeneracion_413BE),
                P("@desde", propuesta.PeriodoDesde_413BE), P("@hasta", propuesta.PeriodoHasta_413BE),
                P("@umbral", propuesta.UmbralRepeticion_413BE), P("@estado", propuesta.Estado_413BE.ToString()),
                P("@id", propuesta.IdPropuesta_413BE));
        }

        public List<PropuestaAsamblea_413BE> ObtenerPorFiltro_413BE(int? idConsorcio, EstadoPropuesta_413BE? estado, DateTime? desde, DateTime? hasta)
        {
            StringBuilder sql = new StringBuilder("SELECT " + Columnas + " FROM PROPUESTA_ASAMBLEA WHERE 1=1");
            List<SqlParameter> parametros = new List<SqlParameter>();
            if (idConsorcio != null) { sql.Append(" AND IdConsorcio_413BE=@c"); parametros.Add(P("@c", idConsorcio)); }
            if (estado != null) { sql.Append(" AND Estado_413BE=@e"); parametros.Add(P("@e", estado.Value.ToString())); }
            if (desde != null) { sql.Append(" AND FechaGeneracion_413BE>=@desde"); parametros.Add(P("@desde", desde.Value.Date)); }
            if (hasta != null) { sql.Append(" AND FechaGeneracion_413BE<@hastaMasUno"); parametros.Add(P("@hastaMasUno", hasta.Value.Date.AddDays(1))); }
            sql.Append(" ORDER BY FechaGeneracion_413BE DESC");
            List<PropuestaAsamblea_413BE> lista = new List<PropuestaAsamblea_413BE>();
            DataTable tabla = AccesoDatos_413BE.Consultar_413BE(sql.ToString(), parametros.ToArray());
            foreach (DataRow fila in tabla.Rows) lista.Add(Mapear_413BE(fila));
            return lista;
        }

        public void ActualizarDvh_413BE(int idPropuesta, int dvh)
        {
            AccesoDatos_413BE.EjecutarNoQuery_413BE("UPDATE PROPUESTA_ASAMBLEA SET Dvh_413BE=@dvh WHERE IdPropuesta_413BE=@id",
                P("@dvh", dvh), P("@id", idPropuesta));
        }
    }
}
