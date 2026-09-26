using System.Data;
using BE;

namespace DAL
{
    public class ProveedorCategoriaDAL_413BE
    {
        public List<ProveedorCategoria_413BE> ObtenerTodos_413BE()
        {
            List<ProveedorCategoria_413BE> lista = new List<ProveedorCategoria_413BE>();
            DataTable tabla = AccesoDatos_413BE.Consultar_413BE(
                "SELECT IdProveedor_413BE, IdCategoria_413BE, Dvh_413BE FROM PROVEEDOR_CATEGORIA ORDER BY IdProveedor_413BE, IdCategoria_413BE");
            foreach (DataRow fila in tabla.Rows)
            {
                ProveedorCategoria_413BE pc = new ProveedorCategoria_413BE();
                pc.IdProveedor_413BE = Convert.ToInt32(fila["IdProveedor_413BE"]);
                pc.IdCategoria_413BE = Convert.ToInt32(fila["IdCategoria_413BE"]);
                pc.Dvh_413BE = Convert.ToInt32(fila["Dvh_413BE"]);
                lista.Add(pc);
            }
            return lista;
        }

        public void ActualizarDvh_413BE(int idProveedor, int idCategoria, int dvh)
        {
            AccesoDatos_413BE.EjecutarNoQuery_413BE(
                "UPDATE PROVEEDOR_CATEGORIA SET Dvh_413BE=@dvh WHERE IdProveedor_413BE=@prov AND IdCategoria_413BE=@cat",
                AccesoDatos_413BE.Parametro_413BE("@dvh", dvh), AccesoDatos_413BE.Parametro_413BE("@prov", idProveedor),
                AccesoDatos_413BE.Parametro_413BE("@cat", idCategoria));
        }
    }
}
