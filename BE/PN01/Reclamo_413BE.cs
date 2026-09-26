using INT;

namespace BE
{
    public class Reclamo_413BE : IVerificable
    {
        private static readonly string[] _atributosVerificables = {
            "IdConsorcio_413BE", "IdConsorcista_413BE", "IdCategoria_413BE", "IdUnidadFuncional_413BE", "AreaComun_413BE",
            "IdReclamoOriginal_413BE", "Descripcion_413BE", "FechaAlta_413BE", "Estado_413BE", "Prioridad_413BE",
            "TipoImputacion_413BE", "Reincidente_413BE" };

        public int IdReclamo_413BE { get; set; }
        public int IdConsorcio_413BE { get; set; }
        public int IdConsorcista_413BE { get; set; }
        public int IdCategoria_413BE { get; set; }
        public int? IdUnidadFuncional_413BE { get; set; }
        public string? AreaComun_413BE { get; set; }
        public int? IdReclamoOriginal_413BE { get; set; }
        public string Descripcion_413BE { get; set; } = "";
        public DateTime FechaAlta_413BE { get; set; }
        public EstadoReclamo_413BE Estado_413BE { get; set; }
        public PrioridadReclamo_413BE? Prioridad_413BE { get; set; }
        public TipoImputacion_413BE? TipoImputacion_413BE { get; set; }
        public bool Reincidente_413BE { get; set; }
        public List<Adjunto_413BE> Adjuntos_413BE { get; set; } = new List<Adjunto_413BE>();
        public int Dvh_413BE { get; set; }

        Guid IEntity.Id { get { return new Guid(IdReclamo_413BE, 0, 0, new byte[8]); } }
        TipoEstado IEntity.Estado { get; set; }
        bool IEntity.Baja { get; set; }
        int IVerificable.DVH { get { return Dvh_413BE; } set { Dvh_413BE = value; } }
        string IVerificable.NombreTabla { get { return "RECLAMO"; } }
        string[] IVerificable.AtributosVerificables { get { return _atributosVerificables; } }
    }
}
