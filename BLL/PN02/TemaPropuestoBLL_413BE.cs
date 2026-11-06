using BE;
using DAL;
using INT;

namespace BLL
{
    public class TemaPropuestoBLL_413BE
    {
        private readonly TemaPropuestoDAL_413BE _temaDAL = new TemaPropuestoDAL_413BE();
        private readonly VerificadorBLL _verificador = new VerificadorBLL();

        public List<TemaPropuesto_413BE> FiltrarGruposCandidatos_413BE(List<TemaPropuesto_413BE> grupos, int umbral)
        {
            return grupos.Where(g => g.CantidadReclamos_413BE >= umbral).ToList();
        }

        public List<TemaPropuesto_413BE> CalcularRanking_413BE(List<TemaPropuesto_413BE> temas)
        {
            if (temas.Any(t => t.CostoSolucion_413BE <= 0))
            {
                throw new ArgumentException(TraduccionAyuda_413BE.Obtener_413BE("ex_costoSolucionInvalido", "Ingrese un costo de solución mayor a cero para cada grupo"));
            }
            List<TemaPropuesto_413BE> ranking = temas
                .OrderByDescending(t => t.AhorroEstimado_413BE)
                .ThenByDescending(t => t.CantidadReclamos_413BE)
                .ToList();
            for (int i = 0; i < ranking.Count; i++)
            {
                ranking[i].PosicionRanking_413BE = i + 1;
            }
            return ranking;
        }

        public void GuardarTemas_413BE(int idPropuesta, List<TemaPropuesto_413BE> ranking)
        {
            foreach (TemaPropuesto_413BE tema in ranking)
            {
                tema.IdPropuesta_413BE = idPropuesta;
                _temaDAL.Insertar_413BE(tema);
            }
            RecalcularTemas_413BE(idPropuesta);
        }

        public List<TemaPropuesto_413BE> ObtenerTemasPropuesta_413BE(int idPropuesta)
        {
            List<TemaPropuesto_413BE> temas = _temaDAL.ObtenerPorPropuesta_413BE(idPropuesta);
            return CalcularRanking_413BE(temas);
        }

        public void IncluirTemasEnOrdenDia_413BE(int idOrdenDia, List<TemaPropuesto_413BE> temasIncluidos)
        {
            for (int i = 0; i < temasIncluidos.Count; i++)
            {
                TemaPropuesto_413BE tema = temasIncluidos[i];
                tema.IdOrdenDia_413BE = idOrdenDia;
                tema.OrdenEnOrdenDia_413BE = i + 1;
                _temaDAL.Actualizar_413BE(tema);
            }
            foreach (int idPropuesta in temasIncluidos.Select(t => t.IdPropuesta_413BE).Distinct())
            {
                RecalcularTemas_413BE(idPropuesta);
            }
        }

        private void RecalcularTemas_413BE(int idPropuesta)
        {
            foreach (TemaPropuesto_413BE persistido in _temaDAL.ObtenerPorPropuesta_413BE(idPropuesta))
            {
                _temaDAL.ActualizarDvh_413BE(persistido.IdTema_413BE, _verificador.CalcularDVH(persistido));
            }
            _verificador.ActualizarDVV("TEMA_PROPUESTO", _temaDAL.ObtenerTodos_413BE().Cast<IVerificable>().ToList());
        }
    }
}
