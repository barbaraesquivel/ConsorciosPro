using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using INT;

namespace DAL
{
    public abstract class AbstractDAL<T> : ICrud<T> where T : IEntity
    {
        protected IList<T> _entities;
        protected DAO _dAO;
        public AbstractDAL()
        {
            _entities = new List<T>();
            _dAO = new DAO();
        }
        public abstract void Sincronizar();
        public void Save(T entity)
        {
            if (_entities.Contains(entity))
            {
                _entities.Where(i => i.Id.Equals(entity.Id)).FirstOrDefault().Estado = TipoEstado.Modificado;
            }
            else
            {
                entity.Estado = TipoEstado.Agregado;
                _entities.Add(entity);                                              
            }
            Sincronizar();
        }
        public void Delete(T entity)
        {
            try
            {
                if (this._entities.Contains(entity))
                {
                    _entities.Where(i => i.Id.Equals(entity.Id)).FirstOrDefault().Estado = TipoEstado.Modificado;
                    _entities.Where(i => i.Id.Equals(entity.Id)).FirstOrDefault().Baja = true;
                    Sincronizar();
                }
                else throw new Exception("El elemento no esta en la lista");
            }
            catch (Exception)
            {
                throw;
            }
        }
        public IList<T> GetAll()
        {
            return this._entities;
        }
        public T GetById(Guid id)
        {
            return _entities.Where(i => i.Id.Equals(id)).FirstOrDefault();
        }
        public T GetByID(Guid id)
        {
            return _entities.Where(i => i.Id == id).FirstOrDefault();
        }
    }
}
