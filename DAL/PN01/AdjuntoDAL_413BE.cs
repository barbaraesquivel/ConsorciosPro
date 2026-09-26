using System.Data;
using BE;

namespace DAL
{
    public class AdjuntoDAL_413BE
    {
        private const string Columnas = "IdAdjunto_413BE, IdReclamo_413BE, NombreArchivo_413BE, Tipo_413BE, Dvh_413BE";

        private static Adjunto_413BE Mapear_413BE(DataRow fila)
        {
            Adjunto_413BE a = new Adjunto_413BE();
            a.IdAdjunto_413BE = Convert.ToInt32(fila["IdAdjunto_413BE"]);
            a.IdReclamo_413BE = Convert.ToInt32(fila["IdReclamo_413BE"]);
            a.NombreArchivo_413BE = fila["NombreArchivo_413BE"].ToString() ?? "";
            a.Tipo_413BE = fila["Tipo_413BE"].ToString() ?? "";
            a.Dvh_413BE = Convert.ToInt32(fila["Dvh_413BE"]);
            return a;
        }

        public int Insertar_413BE(Adjunto_413BE adjunto)
        {
            return AccesoDatos_413BE.Insertar_413BE(
                "INSERT INTO ADJUNTO (IdReclamo_413BE, NombreArchivo_413BE, Tipo_413BE) VALUES (@rec, @nombre, @tipo)",
                AccesoDatos_413BE.Parametro_413BE("@rec", adjunto.IdReclamo_413BE),
                AccesoDatos_413BE.Parametro_413BE("@nombre", adjunto.NombreArchivo_413BE),
                AccesoDatos_413BE.Parametro_413BE("@tipo", adjunto.Tipo_413BE));
        }

        public List<Adjunto_413BE> ObtenerTodos_413BE()
        {
            List<Adjunto_413BE> lista = new List<Adjunto_413BE>();
            DataTable tabla = AccesoDatos_413BE.Consultar_413BE("SELECT " + Columnas + " FROM ADJUNTO ORDER BY IdAdjunto_413BE");
            foreach (DataRow fila in tabla.Rows) lista.Add(Mapear_413BE(fila));
            return lista;
        }

        public List<Adjunto_413BE> ObtenerPorReclamo_413BE(int idReclamo)
        {
            List<Adjunto_413BE> lista = new List<Adjunto_413BE>();
            DataTable tabla = AccesoDatos_413BE.Consultar_413BE("SELECT " + Columnas + " FROM ADJUNTO WHERE IdReclamo_413BE=@id ORDER BY IdAdjunto_413BE",
                AccesoDatos_413BE.Parametro_413BE("@id", idReclamo));
            foreach (DataRow fila in tabla.Rows) lista.Add(Mapear_413BE(fila));
            return lista;
        }

        public void ActualizarDvh_413BE(int idAdjunto, int dvh)
        {
            AccesoDatos_413BE.EjecutarNoQuery_413BE("UPDATE ADJUNTO SET Dvh_413BE=@dvh WHERE IdAdjunto_413BE=@id",
                AccesoDatos_413BE.Parametro_413BE("@dvh", dvh), AccesoDatos_413BE.Parametro_413BE("@id", idAdjunto));
        }
    }
}
