namespace INT
{
    public interface IEntity
    {
        Guid Id { get; }
        TipoEstado Estado { get; set; }
        bool Baja { get; set; }
    }
}
