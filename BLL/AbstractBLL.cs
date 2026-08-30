using INT;

namespace BLL
{
    public abstract class AbstractBLL<T> : ICrud<T> where T : IEntity
    {
        protected ICrud<T> _crud;

        public void Delete(T entity)
        {
            _crud.Delete(entity);
        }

        public IList<T> GetAll()
        {
            IList<T> list = new List<T>();
            foreach (T entity in _crud.GetAll()) { list.Add(entity); }
            return list;
        }

        public T GetByID(Guid id)
        {
            try
            {
                if (_crud.GetByID(id).Baja) throw new Exception("Baja");
                return _crud.GetByID(id);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public void Save(T entity)
        {
            _crud.Save(entity);
        }
    }
}
