using INT;

namespace BE
{
    public class PropuestaAsamblea_413BE : IVerificable
    {
        private static readonly string[] _atributosVerificables = {
            "IdConsorcio_413BE", "FechaGeneracion_413BE", "PeriodoDesde_413BE", "PeriodoHasta_413BE", "UmbralRepeticion_413BE", "Estado_413BE" };

        public int IdPropuesta_413BE { get; set; }
        public int IdConsorcio_413BE { get; set; }
        public DateTime FechaGeneracion_413BE { get; set; }
        public DateTime PeriodoDesde_413BE { get; set; }
        public DateTime PeriodoHasta_413BE { get; set; }
        public int UmbralRepeticion_413BE { get; set; }
        public EstadoPropuesta_413BE Estado_413BE { get; set; }
        public int Dvh_413BE { get; set; }
        public List<TemaPropuesto_413BE> Temas_413BE { get; set; } = new List<TemaPropuesto_413BE>();

        Guid IEntity.Id { get { return new Guid(IdPropuesta_413BE, 0, 0, new byte[8]); } }
        TipoEstado IEntity.Estado { get; set; }
        bool IEntity.Baja { get; set; }
        int IVerificable.DVH { get { return Dvh_413BE; } set { Dvh_413BE = value; } }
        string IVerificable.NombreTabla { get { return "PROPUESTA_ASAMBLEA"; } }
        string[] IVerificable.AtributosVerificables { get { return _atributosVerificables; } }
    }
}
