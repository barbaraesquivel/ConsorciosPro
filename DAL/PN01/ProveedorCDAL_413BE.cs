using System.Data;
using System.Data.SqlClient;
using System.Text;
using BE;

namespace DAL
{
    public class ProveedorCDAL_413BE
    {
        private const string Columnas_413BE =
            "SELECT IdProveedorC_413BE, IdProveedor_413BE, Nombre_413BE, Cuit_413BE, Email_413BE, Habilitado_413BE, Fecha_413BE, Hora_413BE, Act_413BE FROM PROVEEDOR_C ";

        private static ProveedorC_413BE Mapear_413BE(DataRow fila)
        {
            ProveedorC_413BE v = new ProveedorC_413BE();
            v.IdProveedorC_413BE = Convert.ToInt32(fila["IdProveedorC_413BE"]);
            v.IdProveedor_413BE = Convert.ToInt32(fila["IdProveedor_413BE"]);
            v.Nombre_413BE = fila["Nombre_413BE"].ToString() ?? "";
            v.Cuit_413BE = fila["Cuit_413BE"].ToString() ?? "";
            v.Email_413BE = fila["Email_413BE"].ToString() ?? "";
            v.Habilitado_413BE = Convert.ToBoolean(fila["Habilitado_413BE"]);
            v.Fecha_413BE = Convert.ToDateTime(fila["Fecha_413BE"]);
            v.Hora_413BE = (TimeSpan)fila["Hora_413BE"];
            v.Act_413BE = Convert.ToBoolean(fila["Act_413BE"]);
            return v;
        }

        public List<ProveedorC_413BE> ObtenerPorFiltro_413BE(int? codigo, string? nombre)
        {
            StringBuilder sql = new StringBuilder(Columnas_413BE + "WHERE 1=1");
            List<SqlParameter> parametros = new List<SqlParameter>();
            if (codigo.HasValue)
            {
                sql.Append(" AND IdProveedor_413BE = @c");
                parametros.Add(AccesoDatos_413BE.Parametro_413BE("@c", codigo.Value));
            }
            if (!string.IsNullOrEmpty(nombre))
            {
                sql.Append(" AND Nombre_413BE = @n");
                parametros.Add(AccesoDatos_413BE.Parametro_413BE("@n", nombre));
            }
            sql.Append(" ORDER BY IdProveedor_413BE, Fecha_413BE, Hora_413BE, IdProveedorC_413BE");
            DataTable tabla = AccesoDatos_413BE.Consultar_413BE(sql.ToString(), parametros.ToArray());
            List<ProveedorC_413BE> lista = new List<ProveedorC_413BE>();
            foreach (DataRow fila in tabla.Rows)
            {
                lista.Add(Mapear_413BE(fila));
            }
            return lista;
        }

        public ProveedorC_413BE ObtenerPorId_413BE(int idProveedorC)
        {
            DataTable tabla = AccesoDatos_413BE.Consultar_413BE(Columnas_413BE + "WHERE IdProveedorC_413BE = @id",
                AccesoDatos_413BE.Parametro_413BE("@id", idProveedorC));
            if (tabla.Rows.Count == 0) throw new InvalidOperationException("No existe la versión indicada");
            return Mapear_413BE(tabla.Rows[0]);
        }
    }
}
