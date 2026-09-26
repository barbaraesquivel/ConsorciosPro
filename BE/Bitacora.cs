using INT;
using System;

namespace BE
{
    public class Bitacora : Entity, IBitacora
    {
        public Bitacora()
        {
            FechaHora = DateTime.Now;
            Actividad = "";
            EntidadId = "";
            Detalle = "";
        }
        public Bitacora(Guid id)
        {
            _id = id;
            Actividad = "";
            EntidadId = "";
            Detalle = "";
        }
        public DateTime FechaHora { get; set; }
        public Guid? UsuarioId { get; set; }
        public string Actividad { get; set; }
        public string EntidadId { get; set; }
        public string Detalle { get; set; }
        public string UsuarioEmail { get; set; } = "";
    }
}
