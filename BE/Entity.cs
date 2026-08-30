using INT;

namespace BE
{
    public class Entity : IEntity
    {
        public Entity()
        {
            _id = Guid.NewGuid();
        }
        protected Guid _id;
        public Guid Id { get { return _id; } }
        public TipoEstado Estado { get; set; }
        public bool Baja { get; set; }
    }
}
