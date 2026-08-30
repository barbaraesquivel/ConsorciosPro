using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Principal;
using System.Text;
using System.Threading.Tasks;

namespace INT
{
    public interface ICrud<T> where T : IEntity
    {
        T GetByID(Guid id);
        IList<T> GetAll();
        void Save(T entity);
        void Delete(T entity);
    }
}
