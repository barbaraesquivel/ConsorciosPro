using INT;

namespace BE
{
    public class Derivacion_413BE : IVerificable
    {
        private static readonly string[] _atributosVerificables = { "IdReclamo_413BE", "IdProveedor_413BE", "FechaDerivacion_413BE", "PlazoSlaDias_413BE" };

        public int IdDerivacion_413BE { get; set; }
        public int IdReclamo_413BE { get; set; }
        public int IdProveedor_413BE { get; set; }
        public DateTime FechaDerivacion_413BE { get; set; }
        public int PlazoSlaDias_413BE { get; set; }
        public int Dvh_413BE { get; set; }

        Guid IEntity.Id { get { return new Guid(IdDerivacion_413BE, 0, 0, new byte[8]); } }
        TipoEstado IEntity.Estado { get; set; }
        bool IEntity.Baja { get; set; }
        int IVerificable.DVH { get { return Dvh_413BE; } set { Dvh_413BE = value; } }
        string IVerificable.NombreTabla { get { return "DERIVACION"; } }
        string[] IVerificable.AtributosVerificables { get { return _atributosVerificables; } }
    }
}
