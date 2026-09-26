using System.Data;
using System.Data.SqlClient;
using System.Text;
using BE;

namespace DAL
{
    public class ReclamoDAL_413BE
    {
        private const string Columnas = "r.IdReclamo_413BE, r.IdConsorcio_413BE, r.IdConsorcista_413BE, r.IdCategoria_413BE, r.IdUnidadFuncional_413BE, " +
            "r.AreaComun_413BE, r.IdReclamoOriginal_413BE, r.Descripcion_413BE, r.FechaAlta_413BE, r.Estado_413BE, r.Prioridad_413BE, " +
            "r.TipoImputacion_413BE, r.Reincidente_413BE, r.Dvh_413BE";

        private static SqlParameter P(string nombre, object? valor)
        {
            return AccesoDatos_413BE.Parametro_413BE(nombre, valor);
        }

        private static Reclamo_413BE Mapear_413BE(DataRow fila)
        {
            Reclamo_413BE r = new Reclamo_413BE();
            r.IdReclamo_413BE = Convert.ToInt32(fila["IdReclamo_413BE"]);
            r.IdConsorcio_413BE = Convert.ToInt32(fila["IdConsorcio_413BE"]);
            r.IdConsorcista_413BE = Convert.ToInt32(fila["IdConsorcista_413BE"]);
            r.IdCategoria_413BE = Convert.ToInt32(fila["IdCategoria_413BE"]);
            r.IdUnidadFuncional_413BE = fila["IdUnidadFuncional_413BE"] == DBNull.Value ? (int?)null : Convert.ToInt32(fila["IdUnidadFuncional_413BE"]);
            r.AreaComun_413BE = fila["AreaComun_413BE"] == DBNull.Value ? null : fila["AreaComun_413BE"].ToString();
            r.IdReclamoOriginal_413BE = fila["IdReclamoOriginal_413BE"] == DBNull.Value ? (int?)null : Convert.ToInt32(fila["IdReclamoOriginal_413BE"]);
            r.Descripcion_413BE = fila["Descripcion_413BE"].ToString() ?? "";
            r.FechaAlta_413BE = Convert.ToDateTime(fila["FechaAlta_413BE"]);
            r.Estado_413BE = Enum.Parse<EstadoReclamo_413BE>(fila["Estado_413BE"].ToString()!);
            r.Prioridad_413BE = fila["Prioridad_413BE"] == DBNull.Value ? (PrioridadReclamo_413BE?)null : Enum.Parse<PrioridadReclamo_413BE>(fila["Prioridad_413BE"].ToString()!);
            r.TipoImputacion_413BE = fila["TipoImputacion_413BE"] == DBNull.Value ? (TipoImputacion_413BE?)null : Enum.Parse<TipoImputacion_413BE>(fila["TipoImputacion_413BE"].ToString()!);
            r.Reincidente_413BE = Convert.ToBoolean(fila["Reincidente_413BE"]);
            r.Dvh_413BE = Convert.ToInt32(fila["Dvh_413BE"]);
            return r;
        }

        private static List<Reclamo_413BE> MapearLista_413BE(DataTable tabla)
        {
            List<Reclamo_413BE> lista = new List<Reclamo_413BE>();
            foreach (DataRow fila in tabla.Rows)
            {
                lista.Add(Mapear_413BE(fila));
            }
            return lista;
        }

        public int Insertar_413BE(Reclamo_413BE reclamo)
        {
            return AccesoDatos_413BE.Insertar_413BE(
                "INSERT INTO RECLAMO (IdConsorcio_413BE, IdConsorcista_413BE, IdCategoria_413BE, IdUnidadFuncional_413BE, AreaComun_413BE, " +
                "IdReclamoOriginal_413BE, Descripcion_413BE, FechaAlta_413BE, Estado_413BE, Prioridad_413BE, TipoImputacion_413BE, Reincidente_413BE) " +
                "VALUES (@con, @cta, @cat, @uf, @area, @orig, @desc, @fecha, @estado, @prio, @tipo, @reinc)",
                P("@con", reclamo.IdConsorcio_413BE), P("@cta", reclamo.IdConsorcista_413BE), P("@cat", reclamo.IdCategoria_413BE),
                P("@uf", reclamo.IdUnidadFuncional_413BE), P("@area", reclamo.AreaComun_413BE), P("@orig", reclamo.IdReclamoOriginal_413BE),
                P("@desc", reclamo.Descripcion_413BE), P("@fecha", reclamo.FechaAlta_413BE), P("@estado", reclamo.Estado_413BE.ToString()),
                P("@prio", reclamo.Prioridad_413BE?.ToString()), P("@tipo", reclamo.TipoImputacion_413BE?.ToString()), P("@reinc", reclamo.Reincidente_413BE));
        }

        public void Actualizar_413BE(Reclamo_413BE reclamo)
        {
            AccesoDatos_413BE.EjecutarNoQuery_413BE(
                "UPDATE RECLAMO SET IdConsorcio_413BE=@con, IdConsorcista_413BE=@cta, IdCategoria_413BE=@cat, IdUnidadFuncional_413BE=@uf, " +
                "AreaComun_413BE=@area, IdReclamoOriginal_413BE=@orig, Descripcion_413BE=@desc, FechaAlta_413BE=@fecha, Estado_413BE=@estado, " +
                "Prioridad_413BE=@prio, TipoImputacion_413BE=@tipo, Reincidente_413BE=@reinc WHERE IdReclamo_413BE=@id",
                P("@con", reclamo.IdConsorcio_413BE), P("@cta", reclamo.IdConsorcista_413BE), P("@cat", reclamo.IdCategoria_413BE),
                P("@uf", reclamo.IdUnidadFuncional_413BE), P("@area", reclamo.AreaComun_413BE), P("@orig", reclamo.IdReclamoOriginal_413BE),
                P("@desc", reclamo.Descripcion_413BE), P("@fecha", reclamo.FechaAlta_413BE), P("@estado", reclamo.Estado_413BE.ToString()),
                P("@prio", reclamo.Prioridad_413BE?.ToString()), P("@tipo", reclamo.TipoImputacion_413BE?.ToString()), P("@reinc", reclamo.Reincidente_413BE),
                P("@id", reclamo.IdReclamo_413BE));
        }

        public List<Reclamo_413BE> ObtenerTodos_413BE()
        {
            return MapearLista_413BE(AccesoDatos_413BE.Consultar_413BE("SELECT " + Columnas + " FROM RECLAMO r ORDER BY r.IdReclamo_413BE"));
        }

        public void ActualizarDvh_413BE(int idReclamo, int dvh)
        {
            AccesoDatos_413BE.EjecutarNoQuery_413BE("UPDATE RECLAMO SET Dvh_413BE=@dvh WHERE IdReclamo_413BE=@id",
                P("@dvh", dvh), P("@id", idReclamo));
        }

        public Reclamo_413BE ObtenerPorId_413BE(int idReclamo)
        {
            DataTable tabla = AccesoDatos_413BE.Consultar_413BE("SELECT " + Columnas + " FROM RECLAMO r WHERE r.IdReclamo_413BE=@id", P("@id", idReclamo));
            if (tabla.Rows.Count == 0) throw new InvalidOperationException("No existe el reclamo " + idReclamo);
            return Mapear_413BE(tabla.Rows[0]);
        }

        public List<Reclamo_413BE> ObtenerPorEstado_413BE(EstadoReclamo_413BE estado)
        {
            return MapearLista_413BE(AccesoDatos_413BE.Consultar_413BE(
                "SELECT " + Columnas + " FROM RECLAMO r WHERE r.Estado_413BE=@estado ORDER BY r.FechaAlta_413BE DESC",
                P("@estado", estado.ToString())));
        }

        public List<Reclamo_413BE> ObtenerCerradosRecientes_413BE(Reclamo_413BE reclamo, DateTime desde)
        {
            string ubicacion = reclamo.IdUnidadFuncional_413BE != null ? "r.IdUnidadFuncional_413BE=@uf" : "r.AreaComun_413BE=@area";
            return MapearLista_413BE(AccesoDatos_413BE.Consultar_413BE(
                "SELECT " + Columnas + " FROM RECLAMO r INNER JOIN CIERRE_RECLAMO c ON c.IdReclamo_413BE=r.IdReclamo_413BE " +
                "WHERE r.Estado_413BE=@estado AND c.FechaCierre_413BE>=@desde AND r.IdConsorcio_413BE=@con AND r.IdCategoria_413BE=@cat AND " + ubicacion +
                " ORDER BY c.FechaCierre_413BE DESC",
                P("@estado", EstadoReclamo_413BE.CERRADO_413BE.ToString()), P("@desde", desde), P("@con", reclamo.IdConsorcio_413BE),
                P("@cat", reclamo.IdCategoria_413BE), P("@uf", reclamo.IdUnidadFuncional_413BE), P("@area", reclamo.AreaComun_413BE)));
        }

        public List<Reclamo_413BE> ObtenerPorFiltro_413BE(int? idConsorcio, int? idProveedor, int? idCategoria, EstadoReclamo_413BE? estado, DateTime? desde, DateTime? hasta)
        {
            StringBuilder sql = new StringBuilder("SELECT " + Columnas + " FROM RECLAMO r WHERE 1=1");
            List<SqlParameter> parametros = new List<SqlParameter>();
            if (idConsorcio != null) { sql.Append(" AND r.IdConsorcio_413BE=@con"); parametros.Add(P("@con", idConsorcio)); }
            if (idProveedor != null)
            {
                sql.Append(" AND EXISTS (SELECT 1 FROM DERIVACION d WHERE d.IdReclamo_413BE=r.IdReclamo_413BE AND d.IdProveedor_413BE=@prov)");
                parametros.Add(P("@prov", idProveedor));
            }
            if (idCategoria != null) { sql.Append(" AND r.IdCategoria_413BE=@cat"); parametros.Add(P("@cat", idCategoria)); }
            if (estado != null) { sql.Append(" AND r.Estado_413BE=@estado"); parametros.Add(P("@estado", estado.ToString())); }
            if (desde != null) { sql.Append(" AND r.FechaAlta_413BE>=@desde"); parametros.Add(P("@desde", desde.Value.Date)); }
            if (hasta != null) { sql.Append(" AND r.FechaAlta_413BE<@hasta"); parametros.Add(P("@hasta", hasta.Value.Date.AddDays(1))); }
            sql.Append(" ORDER BY r.FechaAlta_413BE DESC");
            return MapearLista_413BE(AccesoDatos_413BE.Consultar_413BE(sql.ToString(), parametros.ToArray()));
        }
    }
}
