using System.Data;
using BE;

namespace DAL
{
    public class DerivacionDAL_413BE
    {
        private const string Columnas = "IdDerivacion_413BE, IdReclamo_413BE, IdProveedor_413BE, FechaDerivacion_413BE, PlazoSlaDias_413BE, Dvh_413BE";

        private static Derivacion_413BE Mapear_413BE(DataRow fila)
        {
            Derivacion_413BE d = new Derivacion_413BE();
            d.IdDerivacion_413BE = Convert.ToInt32(fila["IdDerivacion_413BE"]);
            d.IdReclamo_413BE = Convert.ToInt32(fila["IdReclamo_413BE"]);
            d.IdProveedor_413BE = Convert.ToInt32(fila["IdProveedor_413BE"]);
            d.FechaDerivacion_413BE = Convert.ToDateTime(fila["FechaDerivacion_413BE"]);
            d.PlazoSlaDias_413BE = Convert.ToInt32(fila["PlazoSlaDias_413BE"]);
            d.Dvh_413BE = Convert.ToInt32(fila["Dvh_413BE"]);
            return d;
        }

        public int Insertar_413BE(Derivacion_413BE derivacion)
        {
            return AccesoDatos_413BE.Insertar_413BE(
                "INSERT INTO DERIVACION (IdReclamo_413BE, IdProveedor_413BE, FechaDerivacion_413BE, PlazoSlaDias_413BE) VALUES (@rec, @prov, @fecha, @sla)",
                AccesoDatos_413BE.Parametro_413BE("@rec", derivacion.IdReclamo_413BE),
                AccesoDatos_413BE.Parametro_413BE("@prov", derivacion.IdProveedor_413BE),
                AccesoDatos_413BE.Parametro_413BE("@fecha", derivacion.FechaDerivacion_413BE),
                AccesoDatos_413BE.Parametro_413BE("@sla", derivacion.PlazoSlaDias_413BE));
        }

        public List<Derivacion_413BE> ObtenerTodos_413BE()
        {
            List<Derivacion_413BE> lista = new List<Derivacion_413BE>();
            DataTable tabla = AccesoDatos_413BE.Consultar_413BE("SELECT " + Columnas + " FROM DERIVACION ORDER BY IdDerivacion_413BE");
            foreach (DataRow fila in tabla.Rows) lista.Add(Mapear_413BE(fila));
            return lista;
        }

        public Derivacion_413BE? ObtenerPorReclamo_413BE(int idReclamo)
        {
            DataTable tabla = AccesoDatos_413BE.Consultar_413BE("SELECT " + Columnas + " FROM DERIVACION WHERE IdReclamo_413BE=@id",
                AccesoDatos_413BE.Parametro_413BE("@id", idReclamo));
            return tabla.Rows.Count == 0 ? null : Mapear_413BE(tabla.Rows[0]);
        }

        public void ActualizarDvh_413BE(int idDerivacion, int dvh)
        {
            AccesoDatos_413BE.EjecutarNoQuery_413BE("UPDATE DERIVACION SET Dvh_413BE=@dvh WHERE IdDerivacion_413BE=@id",
                AccesoDatos_413BE.Parametro_413BE("@dvh", dvh), AccesoDatos_413BE.Parametro_413BE("@id", idDerivacion));
        }
    }
}
