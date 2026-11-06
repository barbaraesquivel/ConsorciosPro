using INT;

namespace BE
{
    public class OrdenDelDia_413BE : IVerificable
    {
        private static readonly string[] _atributosVerificables = { "IdPropuesta_413BE", "FechaAsamblea_413BE", "FechaRegistro_413BE" };

        public int IdOrdenDia_413BE { get; set; }
        public int IdPropuesta_413BE { get; set; }
        public DateTime FechaAsamblea_413BE { get; set; }
        public DateTime FechaRegistro_413BE { get; set; }
        public int Dvh_413BE { get; set; }
        public List<TemaPropuesto_413BE> Temas_413BE { get; set; } = new List<TemaPropuesto_413BE>();

        Guid IEntity.Id { get { return new Guid(IdOrdenDia_413BE, 0, 0, new byte[8]); } }
        TipoEstado IEntity.Estado { get; set; }
        bool IEntity.Baja { get; set; }
        int IVerificable.DVH { get { return Dvh_413BE; } set { Dvh_413BE = value; } }
        string IVerificable.NombreTabla { get { return "ORDEN_DIA"; } }
        string[] IVerificable.AtributosVerificables { get { return _atributosVerificables; } }
    }
}
