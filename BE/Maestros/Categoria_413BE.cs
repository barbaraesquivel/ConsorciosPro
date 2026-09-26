using INT;

namespace BE
{
    public class Categoria_413BE : IVerificable
    {
        private static readonly string[] _atributosVerificables = { "Nombre_413BE" };

        public int IdCategoria_413BE { get; set; }
        public string Nombre_413BE { get; set; } = "";
        public int Dvh_413BE { get; set; }

        Guid IEntity.Id { get { return new Guid(IdCategoria_413BE, 0, 0, new byte[8]); } }
        TipoEstado IEntity.Estado { get; set; }
        bool IEntity.Baja { get; set; }
        int IVerificable.DVH { get { return Dvh_413BE; } set { Dvh_413BE = value; } }
        string IVerificable.NombreTabla { get { return "CATEGORIA"; } }
        string[] IVerificable.AtributosVerificables { get { return _atributosVerificables; } }
    }
}
