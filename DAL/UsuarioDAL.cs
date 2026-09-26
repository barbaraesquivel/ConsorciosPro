using INT;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BE;

namespace DAL
{
    public class UsuarioDAL : AbstractDAL<Usuario>
    {
        Usuario u;
        Usuario u2;
        public UsuarioDAL()
        {
            CargarEnt();
        }
        private void CargarEnt()
        {
            try
            {
                DataSet d = _dAO.ObtenerDatos("SELECT * FROM Usuario");
                if (d.Tables.Count >= 0)
                    if (d.Tables[0].Rows.Count > 0)
                    {
                        foreach (DataRow dr in d.Tables[0].Rows)
                        {
                            Completar(dr, u);
                            _entities.Add(u2);
                        }
                    }
            }
            catch (Exception ex) { throw; }
        }
        private void Completar(DataRow d, Usuario u)
        {
            u = new Usuario(Guid.Parse(d["Usuario_ID"].ToString()));
            u.Email = d["Usuario_User"].ToString();
            u.Password = d["Usuario_Pass"].ToString();
            u.Bloq = bool.Parse(d["Usuario_Bloq"].ToString());
            u.Baja = (d["Usuario_Baja"]) != DBNull.Value && Convert.ToBoolean(d["Usuario_Baja"]); ;
            u.DVH = d["Usuario_DVH"] == DBNull.Value ? 0 : Convert.ToInt32(d["Usuario_DVH"]);
            u.Estado = TipoEstado.SinCambios;
            u2 = u;
        }
        public void ActualizarDVH(Guid id, int dvh)
        {
            _dAO.EjecutarQuery("UPDATE Usuario SET Usuario_DVH=" + dvh + " WHERE Usuario_ID='" + id + "'");
        }
        public override void Sincronizar()
        {
            foreach (Usuario u in this._entities)
            {
                switch (u.Estado)
                {
                    case INT.TipoEstado.Agregado:
                        _dAO.EjecutarQuery("INSERT INTO Usuario (Usuario_ID, Usuario_User, Usuario_Pass, Usuario_Bloq, Usuario_DVH) VALUES ('" + u.Id + "','" + u.Email + "','" + u.Password + "','" + u.Bloq + "'," + u.DVH + ")");
                        break;
                    case INT.TipoEstado.Modificado:
                        _dAO.EjecutarQuery("UPDATE Usuario SET Usuario_User='" + u.Email + "',Usuario_Pass='" + u.Password + "',Usuario_Bloq='" + u.Bloq + "',Usuario_Baja='" + u.Baja + "',Usuario_DVH=" + u.DVH + " WHERE Usuario_ID='" + u.Id + "'");
                        new PermisoDAL().GuardarFamiliaUsuario(u);
                        break;
                }
            }
        }
    }
}
