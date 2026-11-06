using BE;
using DAL;
using INT;

namespace BLL
{
    public class OrdenDelDiaBLL_413BE
    {
        private readonly OrdenDelDiaDAL_413BE _ordenDAL = new OrdenDelDiaDAL_413BE();
        private readonly VerificadorBLL _verificador = new VerificadorBLL();

        public int GuardarOrdenDelDia_413BE(int idPropuesta, DateTime fechaAsamblea)
        {
            OrdenDelDia_413BE orden = new OrdenDelDia_413BE();
            orden.IdPropuesta_413BE = idPropuesta;
            orden.FechaAsamblea_413BE = fechaAsamblea.Date;
            orden.FechaRegistro_413BE = DateTime.Now;
            int id = _ordenDAL.Insertar_413BE(orden);
            RecalcularOrdenDelDia_413BE(orden);
            return id;
        }

        public OrdenDelDia_413BE? ObtenerOrdenDelDia_413BE(int idPropuesta)
        {
            return _ordenDAL.ObtenerPorPropuesta_413BE(idPropuesta);
        }

        private void RecalcularOrdenDelDia_413BE(OrdenDelDia_413BE orden)
        {
            OrdenDelDia_413BE persistida = _ordenDAL.ObtenerPorPropuesta_413BE(orden.IdPropuesta_413BE)!;
            orden.Dvh_413BE = _verificador.CalcularDVH(persistida);
            _ordenDAL.ActualizarDvh_413BE(orden.IdOrdenDia_413BE, orden.Dvh_413BE);
            _verificador.ActualizarDVV("ORDEN_DIA", _ordenDAL.ObtenerTodos_413BE().Cast<IVerificable>().ToList());
        }
    }
}
