using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using INT;

namespace SER.Composite
{
    public class Patente : PermisoCompuesto, IPermiso
    {
        
        public Patente()
        {
            _id = Guid.NewGuid();
        }        
        public Patente(Guid g)
        {            
            _id = g;
        }        
        public override void AgregarPermiso(IPermiso p)
        {

        }
        public override IList<IPermiso> ObtenerHijos
        {
            get
            {
                return new List<IPermiso>();
            }
        }
        public override void QuitarPermiso(IPermiso p)
        {
            
        }

        public override void VaciarHijos()
        {
            
        }
    }
}
