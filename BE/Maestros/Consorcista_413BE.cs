using INT;

namespace BE
{
    public class Consorcista_413BE : IVerificable
    {
        private static readonly string[] _atributosVerificables = { "IdUnidadFuncional_413BE", "Dni_413BE", "Nombre_413BE", "Email_413BE", "EsPropietario_413BE", "Activo_413BE" };

        public int IdConsorcista_413BE { get; set; }
        public int IdUnidadFuncional_413BE { get; set; }
        public string Dni_413BE { get; set; } = "";
        public string Nombre_413BE { get; set; } = "";
        public string Email_413BE { get; set; } = "";
        public bool EsPropietario_413BE { get; set; }
        public bool Activo_413BE { get; set; }
        public int Dvh_413BE { get; set; }

        Guid IEntity.Id { get { return new Guid(IdConsorcista_413BE, 0, 0, new byte[8]); } }
        TipoEstado IEntity.Estado { get; set; }
        bool IEntity.Baja { get; set; }
        int IVerificable.DVH { get { return Dvh_413BE; } set { Dvh_413BE = value; } }
        string IVerificable.NombreTabla { get { return "CONSORCISTA"; } }
        string[] IVerificable.AtributosVerificables { get { return _atributosVerificables; } }
    }
}
