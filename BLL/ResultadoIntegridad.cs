using System;
using System.Collections.Generic;
using System.Linq;

namespace BLL
{
    public class DiscrepanciaIntegridad
    {
        public string Tabla { get; set; }
        public Guid? FilaId { get; set; }
        public bool ErrorHorizontal { get; set; }
        public bool ErrorVertical { get; set; }

        public string Campos
        {
            get { return (ErrorHorizontal ? "DVH" : "") + (ErrorHorizontal && ErrorVertical ? " + " : "") + (ErrorVertical ? "DVV" : ""); }
        }

        public override string ToString()
        {
            return Tabla + (FilaId.HasValue ? " fila " + FilaId : "") + " [" + Campos + " invalido]";
        }
    }

    public class ResultadoIntegridad
    {
        public IList<DiscrepanciaIntegridad> Discrepancias { get; } = new List<DiscrepanciaIntegridad>();
        public bool EsValido { get { return Discrepancias.Count == 0; } }
        public IList<string> TablasAfectadas { get { return Discrepancias.Select(d => d.Tabla).Distinct().ToList(); } }
        public string Detalle { get { return string.Join("; ", Discrepancias.Select(d => d.ToString())); } }
    }
}
