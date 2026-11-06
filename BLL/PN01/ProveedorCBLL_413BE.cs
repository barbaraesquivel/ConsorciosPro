using BE;
using DAL;
using SER;

namespace BLL
{
    public class ProveedorCBLL_413BE
    {
        private readonly ProveedorCDAL_413BE _proveedorCDAL = new ProveedorCDAL_413BE();
        private readonly ProveedorBLL_413BE _proveedorBLL = new ProveedorBLL_413BE();

        public List<ProveedorC_413BE> ObtenerHistorial_413BE(int? codigo, string? nombre)
        {
            return _proveedorCDAL.ObtenerPorFiltro_413BE(codigo, nombre);
        }

        public void AplicarVersion_413BE(int idProveedorC)
        {
            ProveedorC_413BE version = _proveedorCDAL.ObtenerPorId_413BE(idProveedorC);
            if (version.Act_413BE)
            {
                throw new InvalidOperationException(TraduccionAyuda_413BE.Obtener_413BE("ex_versionYaVigente", "La versión seleccionada ya es la vigente"));
            }
            Proveedor_413BE proveedor = new Proveedor_413BE();
            proveedor.IdProveedor_413BE = version.IdProveedor_413BE;
            proveedor.Nombre_413BE = version.Nombre_413BE;
            proveedor.Cuit_413BE = version.Cuit_413BE;
            proveedor.Email_413BE = version.Email_413BE;
            proveedor.Habilitado_413BE = version.Habilitado_413BE;
            _proveedorBLL.RestaurarVersion_413BE(proveedor);
        }
    }
}
