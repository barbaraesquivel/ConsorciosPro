using System;

namespace INT
{
    public interface IVerificable : IEntity
    {
        int DVH { get; set; }
        string NombreTabla { get; }
        string[] AtributosVerificables { get; }
    }
}
