using INT;

namespace BE
{
    public class Consorcio_413BE : IVerificable
    {
        private static readonly string[] _atributosVerificables = { "Nombre_413BE", "Direccion_413BE", "CantidadUnidades_413BE", "Activo_413BE" };

        public int IdConsorcio_413BE { get; set; }
        public string Nombre_413BE { get; set; } = "";
        public string Direccion_413BE { get; set; } = "";
        public int CantidadUnidades_413BE { get; set; }
        public int Dvh_413BE { get; set; }
        public bool Activo_413BE { get; set; }

        Guid IEntity.Id { get { return new Guid(IdConsorcio_413BE, 0, 0, new byte[8]); } }
        TipoEstado IEntity.Estado { get; set; }
        bool IEntity.Baja { get; set; }
        int IVerificable.DVH { get { return Dvh_413BE; } set { Dvh_413BE = value; } }
        string IVerificable.NombreTabla { get { return "CONSORCIO"; } }
        string[] IVerificable.AtributosVerificables { get { return _atributosVerificables; } }
    }
}
