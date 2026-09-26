using INT;

namespace BE
{
    public class CierreReclamo_413BE : IVerificable
    {
        private static readonly string[] _atributosVerificables = {
            "IdReclamo_413BE", "FechaCierre_413BE", "InformeResolucion_413BE", "NumeroFactura_413BE", "CuentaImputada_413BE", "CostoImputado_413BE" };

        public int IdCierre_413BE { get; set; }
        public int IdReclamo_413BE { get; set; }
        public DateTime FechaCierre_413BE { get; set; }
        public string InformeResolucion_413BE { get; set; } = "";
        public string NumeroFactura_413BE { get; set; } = "";
        public string CuentaImputada_413BE { get; set; } = "";
        public decimal CostoImputado_413BE { get; set; }
        public int Dvh_413BE { get; set; }

        Guid IEntity.Id { get { return new Guid(IdCierre_413BE, 0, 0, new byte[8]); } }
        TipoEstado IEntity.Estado { get; set; }
        bool IEntity.Baja { get; set; }
        int IVerificable.DVH { get { return Dvh_413BE; } set { Dvh_413BE = value; } }
        string IVerificable.NombreTabla { get { return "CIERRE_RECLAMO"; } }
        string[] IVerificable.AtributosVerificables { get { return _atributosVerificables; } }
    }
}
