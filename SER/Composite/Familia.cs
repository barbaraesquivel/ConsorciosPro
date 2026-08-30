using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Runtime.ConstrainedExecution;
using System.Text;
using System.Threading.Tasks;
using INT;

namespace SER.Composite
{
    public class Familia : PermisoCompuesto, IPermiso
    {
        private IList<IPermiso> _hijos;        
        public Familia()
        {
            _id = Guid.NewGuid();
            _hijos = new List<IPermiso>();
        }
        public Familia(Guid g)
        {
            _hijos = new List<IPermiso>();
            _id = g;
        }
        public override void AgregarPermiso(IPermiso p)
        {
            bool tiene = false;
            tiene = ValidarFlia(p);            
            if (!tiene)
                _hijos.Add(p);
            else
                throw new Exception("ya existe esta patente en esta familia");


            bool ValidarFlia(IPermiso p2)
            {
                tiene = this.TieneHijo(p2);
                if (p2.ObtenerHijos.Count > 0 && !tiene)
                {
                    foreach(IPermiso hi in p2.ObtenerHijos)
                    {
                        tiene = ValidarFlia(hi);
                        if (tiene)
                        {
                            return true;
                        }
                    }
                }
                return tiene;
            }
        }
        public override IList<IPermiso> ObtenerHijos
        {
            get
            {
                return _hijos.ToArray();
            }
        }
        public override void QuitarPermiso(IPermiso p)
        {
            bool b = false;
            bool test = _hijos.Contains(p); // ver si funca el metodo contains
            b = this.TieneHijo(p);
            if (b)
            {
                _hijos.Remove(p);
            }
        }

        public override void VaciarHijos()
        {
            _hijos = new List<IPermiso>();
        }


        public bool TieneHijo(IPermiso hijo)
        {
            bool tiene = false;
            if (this.Id == hijo.Id)
            {
                tiene = true;
                return true;
            }
            else
            {
                if (this.ObtenerHijos.Count > 0)
                {
                    foreach (IPermiso p in this.ObtenerHijos)
                    {
                        if(p.Id == hijo.Id)
                        {
                            tiene = true;
                            return true;
                        }
                        else
                        {
                            if (p.ObtenerHijos.Count > 0)
                            {
                                tiene = ((Familia)p).TieneHijo(hijo);
                            }
                        }
                        if (tiene)
                        {
                            return true;
                        }
                    }
                }
            }
            return tiene;            
        }
    }
}
