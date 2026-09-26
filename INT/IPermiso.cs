using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace INT
{
    public interface IPermiso : IEntity
    {
        string Nombre { get; set; }
        void AgregarPermiso(IPermiso p);
        void QuitarPermiso(IPermiso p);
        void VaciarHijos();
        IList<IPermiso> ObtenerHijos { get; }
    }
}
