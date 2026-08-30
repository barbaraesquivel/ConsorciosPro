using BE;
using INT;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SER.Composite;
using System.Data.SqlClient;
using System.Runtime.Intrinsics.X86;
using System.Reflection.PortableExecutable;
using System.Security.Cryptography.X509Certificates;

namespace DAL
{
    public class PermisoDAL
    {
        Patente p2 = new Patente();

        public Array ObtenerTodosLosPermisos()
        {
            return Enum.GetValues(typeof(TipoPatente));
        }
        DAO mDAO = new DAO();

        public PermisoCompuesto GuardarPermiso(PermisoCompuesto p, bool esfamilia)
        {
            try
            {
                if (esfamilia)
                    mDAO.EjecutarQuery("INSERT INTO Permiso (Permiso_ID, Permiso_Descripcion) VALUES ('" + p.Id + "','" + p.Nombre + "')");
                else
                    mDAO.EjecutarQuery("INSERT INTO Permiso (Permiso_ID, Permiso_Descripcion,Permiso_Tipo) VALUES ('" + p.Id + "','" + p.Nombre + "','" + p.Permiso + "')");
                return p;
            }
            catch (Exception)
            {
                throw;
            }
        }
        public void ActualizarFamilia(Familia f)
        {
            try
            {
                mDAO.EjecutarQuery("DELETE FROM Familia_Patente where Padre_ID ='" + f.Id.ToString() + "'");
                foreach (PermisoCompuesto p in f.ObtenerHijos)
                {
                    mDAO.EjecutarQuery("INSERT INTO Familia_Patente (Padre_ID,Hijo_ID) VALUES ('" + f.Id.ToString() + "','" + p.Id.ToString() + "')");
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public IList<Patente> ObtenerTodasLasPatentes()
        {
            IList<Patente> list = new List<Patente>();
            DataSet d = mDAO.ObtenerDatos("SELECT * FROM Permiso WHERE Permiso_Tipo is not null;");
            if (d.Tables.Count >= 0)
                if (d.Tables[0].Rows.Count > 0)
                {
                    foreach (DataRow dr in d.Tables[0].Rows)
                    {
                        Patente p = new Patente(Guid.Parse(dr["Permiso_ID"].ToString()));
                        p.Estado = TipoEstado.SinCambios;
                        p.Permiso = (TipoPatente)Int32.Parse(dr["Permiso_Tipo"].ToString());
                        p.Nombre = dr["Permiso_Descripcion"].ToString();
                        list.Add(p);
                    }
                }
            return list;
        }
        public IList<Familia> ObtenerTodasLasFamilias()
        {
            DataSet d = mDAO.ObtenerDatos("SELECT * FROM Permiso WHERE Permiso_Tipo is null;");
            var lista = new List<Familia>();
            if (d.Tables.Count >= 0)
                if (d.Tables[0].Rows.Count > 0)
                {
                    foreach (DataRow dr in d.Tables[0].Rows)
                    {
                        Familia f = new Familia(Guid.Parse(dr["Permiso_ID"].ToString()));
                        f.Estado = TipoEstado.SinCambios;
                        f.Nombre = dr["Permiso_Descripcion"].ToString();
                        lista.Add(f);
                    }
                }
            return lista;
        }
        public IList<Patente> ObtenerTodosLosHijos(string familia)
        {
            Familia fam = new Familia();
            List<Patente> lista = new List<Patente>();
            DataSet d = mDAO.ObtenerDatos("SELECT * FROM Permiso WHERE Permiso_Descripcion= '" + familia + "';");
            if (d.Tables.Count >= 0)
                if (d.Tables[0].Rows.Count > 0)
                {
                    foreach (DataRow dr in d.Tables[0].Rows)
                    {
                        fam = new Familia(Guid.Parse(dr["Permiso_ID"].ToString()));
                    }
                    DataSet d2 = mDAO.ObtenerDatos("SELECT * FROM Familia_Patente WHERE Padre_ID='" + fam.Id.ToString() + "'");

                    if (d2.Tables.Count >= 0)
                        if (d2.Tables[0].Rows.Count > 0)
                        {
                            foreach (DataRow dr2 in d2.Tables[0].Rows)
                            {
                                DataSet d3 = mDAO.ObtenerDatos("SELECT * FROM Permiso WHERE Permiso_Tipo =" + dr2["Patente_Tipo"] + ";");
                                foreach (DataRow dr3 in d3.Tables[0].Rows)
                                {
                                    Patente p = new Patente(Guid.Parse(dr3["Permiso_ID"].ToString()));
                                    p.Estado = TipoEstado.SinCambios;
                                    p.Permiso = (TipoPatente)Int32.Parse(dr3["Permiso_Tipo"].ToString());
                                    p.Nombre = dr3["Permiso_Descripcion"].ToString();
                                    lista.Add(p);
                                }
                            }
                        }
                }
            return lista;
        }
        public IList<IPermiso> GetAll(string familia)
        {
            IPermiso fam = ObtenerTodasLasFamilias().Where(x => x.Nombre == familia).FirstOrDefault();
            var lista = new List<IPermiso>();
            string comando = "with recursivo as (select sp2.Padre_ID, sp2.Hijo_ID from Familia_Patente SP2 where sp2.Padre_ID = '" + fam.Id + "' UNION ALL select sp.Padre_ID, sp.Hijo_ID from Familia_Patente sp inner join recursivo r on r.Hijo_ID= sp.Padre_ID) select r.Padre_ID,r.Hijo_ID,p.Permiso_ID,p.Permiso_Descripcion, p.Permiso_Tipo from recursivo r inner join Permiso p on r.Hijo_ID = p.Permiso_ID ORDER BY r.Padre_ID DESC";

            DataSet ds = mDAO.ObtenerDatos(comando);
            if (ds.Tables.Count >= 0)
            {
                if (ds.Tables[0].Rows.Count > 0)
                {
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        Guid id_padre = new Guid();
                        int permiso;
                        PermisoCompuesto c;
                        if (dr["Padre_ID"] != DBNull.Value)
                        {
                            id_padre = Guid.Parse(dr["Padre_ID"].ToString());
                        }
                        Guid id = Guid.Parse(dr["Permiso_ID"].ToString());
                        string nombre = dr["Permiso_Descripcion"].ToString();

                        var permisoTipo = dr["Permiso_Tipo"];
                        if (permisoTipo == DBNull.Value)
                        {                            
                            c = new Familia(id);                            
                        }
                        else
                        {
                            c = new Patente(id);
                            c.Permiso = (TipoPatente)Int32.Parse(dr["Permiso_Tipo"].ToString());
                            
                        }
                        c.Nombre = nombre;
                        var padre = GetComponent(id_padre, lista);
                        if (padre == null)
                        {
                            lista.Add(c);
                        }
                        else
                        {
                            padre.AgregarPermiso(c);
                        }
                    }
                }
            } 
            return lista;
        }
        public IList<IPermiso> ObtenerArbolPermisos()
        {
            IDictionary<Guid, IPermiso> permisosDiccionario = ObtenerDiccionario();
            List<IPermiso> permisosRaiz = new List<IPermiso>();
            var hijos = new HashSet<Guid>(permisosDiccionario.Values.SelectMany(p => p.ObtenerHijos).Select(h => h.Id));
            permisosRaiz = permisosDiccionario.Values.Where(p => !hijos.Contains(p.Id)).ToList();
            return permisosRaiz;
        }
        public IDictionary<Guid, IPermiso> ObtenerDiccionario()
        {
            Dictionary<Guid, IPermiso> permisosDiccionario = new Dictionary<Guid, IPermiso>();            
            string comando = "Select * from Permiso";
            DataSet ds = mDAO.ObtenerDatos(comando);
            if (ds.Tables.Count >= 0)
            {
                if (ds.Tables[0].Rows.Count > 0)
                {
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        PermisoCompuesto permiso;
                        if (dr["Permiso_Tipo"] == DBNull.Value)
                        {
                            permiso = new Familia(Guid.Parse(dr["Permiso_ID"].ToString()));
                        }
                        else
                        {
                            permiso = new Patente(Guid.Parse(dr["Permiso_ID"].ToString()));
                            permiso.Permiso = (TipoPatente)Int32.Parse(dr["Permiso_Tipo"].ToString());
                        }
                        permiso.Nombre = dr["Permiso_Descripcion"].ToString();
                        permisosDiccionario[permiso.Id] = permiso;
                    }
                }
            }
            string comando2 = "Select * from Familia_Patente";
            DataSet ds2 = mDAO.ObtenerDatos(comando2);
            if (ds2.Tables.Count >= 0)
            {
                if (ds2.Tables[0].Rows.Count > 0)
                {
                    foreach (DataRow dr in ds2.Tables[0].Rows)
                    {
                        Guid padreId = Guid.Parse(dr["Padre_ID"].ToString());
                        Guid hijoId = Guid.Parse(dr["Hijo_ID"].ToString());
                        if (permisosDiccionario.TryGetValue(padreId, out var padre) && permisosDiccionario.TryGetValue(hijoId, out var hijo))
                        {
                            padre.AgregarPermiso(hijo);
                        }
                    }
                }
            }
            return permisosDiccionario;
        }
        private IPermiso GetComponent(Guid id, IList<IPermiso> lista)
        {

            IPermiso component = lista != null ? lista.Where(i => i.Id.Equals(id)).FirstOrDefault() : null;

            if (component == null && lista != null)
            {
                foreach (var c in lista)
                {
                    var l = GetComponent(id, c.ObtenerHijos);
                    if (l != null && l.Id == id)
                    {
                        return l;
                    }
                    else
                    {
                        if (l != null)
                        {
                            return GetComponent(id, l.ObtenerHijos);
                        }                            
                    }
                }
            }
            return component;
        }

        public void CompletarPermisosDeUsuario(Usuario u)
        {
            u.Permisos.Clear();
            DataSet d = mDAO.ObtenerDatos("SELECT * FROM Usuario_Permiso up INNER JOIN Permiso p ON up.Permiso_ID=p.Permiso_ID WHERE Usuario_ID='" + u.Id + "'");
            if (d.Tables.Count >= 0)
                if (d.Tables[0].Rows.Count > 0)
                {
                    foreach (DataRow dr in d.Tables[0].Rows)
                    {

                        if (String.IsNullOrEmpty(dr["Permiso_Tipo"].ToString()))
                        {
                            Familia _permiso = new Familia(Guid.Parse(dr["Permiso_ID"].ToString()));
                            _permiso.Nombre = dr["Permiso_Descripcion"].ToString();
                            CompletarPermisosDeFamilia(_permiso);
                            u.Permisos.Add(_permiso);
                        }
                        else
                        {
                            Patente _permiso = new Patente(Guid.Parse(dr["Permiso_ID"].ToString()));
                            _permiso.Permiso = (TipoPatente)Int32.Parse(dr["Permiso_Tipo"].ToString());
                            _permiso.Nombre = dr["Permiso_Descripcion"].ToString();
                            u.Permisos.Add(_permiso);
                        }
                    }
                }
        }
        public void CompletarPermisosDeFamilia(Familia f)
        {
            //IList<Patente> l = ObtenerTodosLosHijos(f.Nombre);
            IList<IPermiso> l = GetAll(f.Nombre);
            foreach (IPermiso p in l)
            {
                f.AgregarPermiso(p);
            }
        }
        public void GuardarFamiliaUsuario(Usuario u)
        {
            mDAO.EjecutarQuery("DELETE FROM Usuario_Permiso where Usuario_ID ='" + u.Id + "'");
            foreach (PermisoCompuesto f in u.Permisos)
            {
               mDAO.EjecutarQuery("INSERT INTO Usuario_Permiso (Permiso_ID,Usuario_ID) VALUES ('" + f.Id + "','" + u.Id + "')");
            }
        }
    }
}
