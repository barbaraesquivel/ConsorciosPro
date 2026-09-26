using System;

namespace INT
{
    public interface IBitacora : IEntity
    {
        DateTime FechaHora { get; set; }
        Guid? UsuarioId { get; set; }
        string Actividad { get; set; }
        string EntidadId { get; set; }
        string Detalle { get; set; }
    }
}
