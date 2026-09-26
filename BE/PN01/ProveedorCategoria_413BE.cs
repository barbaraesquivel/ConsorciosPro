using INT;

namespace BE
{
    public class ProveedorCategoria_413BE : IVerificable
    {
        private static readonly string[] _atributosVerificables = { "IdProveedor_413BE", "IdCategoria_413BE" };

        public int IdProveedor_413BE { get; set; }
        public int IdCategoria_413BE { get; set; }
        public int Dvh_413BE { get; set; }

        Guid IEntity.Id { get { return new Guid(IdProveedor_413BE, (short)(IdCategoria_413BE >> 16), (short)IdCategoria_413BE, new byte[8]); } }
        TipoEstado IEntity.Estado { get; set; }
        bool IEntity.Baja { get; set; }
        int IVerificable.DVH { get { return Dvh_413BE; } set { Dvh_413BE = value; } }
        string IVerificable.NombreTabla { get { return "PROVEEDOR_CATEGORIA"; } }
        string[] IVerificable.AtributosVerificables { get { return _atributosVerificables; } }
    }
}
