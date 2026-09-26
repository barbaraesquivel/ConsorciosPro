using INT;

namespace BE
{
    public class Adjunto_413BE : IVerificable
    {
        private static readonly string[] _atributosVerificables = { "IdReclamo_413BE", "NombreArchivo_413BE", "Tipo_413BE" };

        public int IdAdjunto_413BE { get; set; }
        public int IdReclamo_413BE { get; set; }
        public string NombreArchivo_413BE { get; set; } = "";
        public string Tipo_413BE { get; set; } = "";
        public int Dvh_413BE { get; set; }

        Guid IEntity.Id { get { return new Guid(IdAdjunto_413BE, 0, 0, new byte[8]); } }
        TipoEstado IEntity.Estado { get; set; }
        bool IEntity.Baja { get; set; }
        int IVerificable.DVH { get { return Dvh_413BE; } set { Dvh_413BE = value; } }
        string IVerificable.NombreTabla { get { return "ADJUNTO"; } }
        string[] IVerificable.AtributosVerificables { get { return _atributosVerificables; } }
    }
}
