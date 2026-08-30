using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using INT;

namespace SER.Composite
{
    public abstract class PermisoCompuesto : IEntity, IPermiso
    {
        protected Guid _id;
        public Guid Id { get => _id; }

        public TipoEstado Estado { get; set; }
        public string Nombre { get; set; }

        public abstract void AgregarPermiso(IPermiso p);
        public abstract void QuitarPermiso(IPermiso p);
        public abstract void VaciarHijos();
        public TipoPatente Permiso { get; set; }
        public abstract IList<IPermiso> ObtenerHijos { get; }
        public bool Baja { get; set; }

    }
}
