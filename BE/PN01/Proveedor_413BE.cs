using INT;

namespace BE
{
    public class Proveedor_413BE : IVerificable
    {
        private static readonly string[] _atributosVerificables = { "Nombre_413BE", "Cuit_413BE", "Email_413BE", "Habilitado_413BE" };

        public int IdProveedor_413BE { get; set; }
        public string Nombre_413BE { get; set; } = "";
        public string Cuit_413BE { get; set; } = "";
        public string Email_413BE { get; set; } = "";
        public bool Habilitado_413BE { get; set; }
        public List<int> IdsCategorias_413BE { get; set; } = new List<int>();
        public int Dvh_413BE { get; set; }

        Guid IEntity.Id { get { return new Guid(IdProveedor_413BE, 0, 0, new byte[8]); } }
        TipoEstado IEntity.Estado { get; set; }
        bool IEntity.Baja { get; set; }
        int IVerificable.DVH { get { return Dvh_413BE; } set { Dvh_413BE = value; } }
        string IVerificable.NombreTabla { get { return "PROVEEDOR"; } }
        string[] IVerificable.AtributosVerificables { get { return _atributosVerificables; } }
    }
}
