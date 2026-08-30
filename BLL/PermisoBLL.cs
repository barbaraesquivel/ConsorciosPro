using BE;
using DAL;
using INT;
using SER.Composite;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class PermisoBLL
    {
        PermisoDAL mPermiso;
        public PermisoBLL()
        {
            mPermiso = new PermisoDAL();
        }
        public bool Existe(PermisoCompuesto p, Guid id)
        {
            bool existe = false;
            if (p.Id.Equals(id))
                existe = true;
            else
                foreach (PermisoCompuesto i in p.ObtenerHijos)
                {
                    existe = Existe(i, id);
                }
            return existe;
        }
        public Array ObtenerTodosLosPermisos()
        {
            return mPermiso.ObtenerTodosLosPermisos();
        }
        public PermisoCompuesto GuardarPermiso(PermisoCompuesto p, bool esfamilia)
        {
            return mPermiso.GuardarPermiso(p, esfamilia);
        }
        public void GuardarFamilia(Familia f)
        {
            mPermiso.ActualizarFamilia(f);
        }
        public IList<Patente> ObtenerTodasLasPatentes()
        {
            return mPermiso.ObtenerTodasLasPatentes();
        }
        public IList<Familia> ObtenerTodasLasFamilias()
        {
            return mPermiso.ObtenerTodasLasFamilias();
        }
        public IList<IPermiso> ObtenerPermisosDeFamilia(string familia)
        {
            //return mPermiso.ObtenerTodosLosHijos(familia);
            return mPermiso.GetAll(familia);
        }
        public IList<IPermiso> ObtenerArbol()
        {
            return mPermiso.ObtenerArbolPermisos();
        }
        public IDictionary<Guid, IPermiso> ObtenerDiccionario()
        {
            return mPermiso.ObtenerDiccionario();
        }
        public void CompletarPermisosDeUsuario(Usuario u)
        {
            mPermiso.CompletarPermisosDeUsuario(u);
        }
        public void CompletarPermisosDeFamilia(Familia f)
        {
            mPermiso.CompletarPermisosDeFamilia(f);
        }
    }
}
