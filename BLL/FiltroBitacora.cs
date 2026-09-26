using System;

namespace BLL
{
    public class FiltroBitacora
    {
        public Guid? UsuarioId { get; set; }
        public DateTime? FechaDesde { get; set; }
        public DateTime? FechaHasta { get; set; }
        public string Actividad { get; set; }
    }
}
