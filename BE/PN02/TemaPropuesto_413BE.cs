using INT;

namespace BE
{
    public class TemaPropuesto_413BE : IVerificable
    {
        private static readonly string[] _atributosVerificables = {
            "IdPropuesta_413BE", "IdCategoria_413BE", "IdUnidadFuncional_413BE", "AreaComun_413BE", "CantidadReclamos_413BE",
            "CostoAcumulado_413BE", "TiempoPromedioAbiertoDias_413BE", "CostoSolucion_413BE", "IdOrdenDia_413BE", "OrdenEnOrdenDia_413BE" };

        public int IdTema_413BE { get; set; }
        public int IdPropuesta_413BE { get; set; }
        public int IdCategoria_413BE { get; set; }
        public int? IdUnidadFuncional_413BE { get; set; }
        public string? AreaComun_413BE { get; set; }
        public int CantidadReclamos_413BE { get; set; }
        public decimal CostoAcumulado_413BE { get; set; }
        public double TiempoPromedioAbiertoDias_413BE { get; set; }
        public decimal CostoSolucion_413BE { get; set; }
        public int? IdOrdenDia_413BE { get; set; }
        public int? OrdenEnOrdenDia_413BE { get; set; }
        public int Dvh_413BE { get; set; }
        public decimal AhorroEstimado_413BE => CostoAcumulado_413BE - CostoSolucion_413BE;
        public int PosicionRanking_413BE { get; set; }

        Guid IEntity.Id { get { return new Guid(IdTema_413BE, 0, 0, new byte[8]); } }
        TipoEstado IEntity.Estado { get; set; }
        bool IEntity.Baja { get; set; }
        int IVerificable.DVH { get { return Dvh_413BE; } set { Dvh_413BE = value; } }
        string IVerificable.NombreTabla { get { return "TEMA_PROPUESTO"; } }
        string[] IVerificable.AtributosVerificables { get { return _atributosVerificables; } }
    }
}
