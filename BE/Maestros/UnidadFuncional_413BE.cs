using INT;

namespace BE
{
    public class UnidadFuncional_413BE : IVerificable
    {
        private static readonly string[] _atributosVerificables = { "IdConsorcio_413BE", "Identificador_413BE", "Tipo_413BE", "Activa_413BE" };

        public int IdUnidadFuncional_413BE { get; set; }
        public int IdConsorcio_413BE { get; set; }
        public string Identificador_413BE { get; set; } = "";
        public string Tipo_413BE { get; set; } = "";
        public bool Activa_413BE { get; set; }
        public int Dvh_413BE { get; set; }

        Guid IEntity.Id { get { return new Guid(IdUnidadFuncional_413BE, 0, 0, new byte[8]); } }
        TipoEstado IEntity.Estado { get; set; }
        bool IEntity.Baja { get; set; }
        int IVerificable.DVH { get { return Dvh_413BE; } set { Dvh_413BE = value; } }
        string IVerificable.NombreTabla { get { return "UNIDAD_FUNCIONAL"; } }
        string[] IVerificable.AtributosVerificables { get { return _atributosVerificables; } }
    }
}
