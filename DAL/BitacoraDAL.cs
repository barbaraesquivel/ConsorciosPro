using INT;
using System;
using System.Collections.Generic;
using System.Data;
using BE;

namespace DAL
{
    public class BitacoraDAL : AbstractDAL<Bitacora>
    {
        public BitacoraDAL()
        {
            CargarEnt();
        }
        private void CargarEnt()
        {
            try
            {
                DataSet d = _dAO.ObtenerDatos(
                    "SELECT b.*, u.Usuario_User FROM Bitacora b LEFT JOIN Usuario u ON b.Bitacora_UsuarioID = u.Usuario_ID ORDER BY b.Bitacora_FechaHora DESC");
                if (d.Tables.Count >= 0)
                    if (d.Tables[0].Rows.Count > 0)
                    {
                        foreach (DataRow dr in d.Tables[0].Rows)
                        {
                            _entities.Add(Completar(dr));
                        }
                    }
            }
            catch (Exception) { throw; }
        }
        private Bitacora Completar(DataRow d)
        {
            Bitacora b = new Bitacora(Guid.Parse(d["Bitacora_ID"].ToString()));
            b.FechaHora = Convert.ToDateTime(d["Bitacora_FechaHora"]);
            b.UsuarioId = d["Bitacora_UsuarioID"] == DBNull.Value ? (Guid?)null : Guid.Parse(d["Bitacora_UsuarioID"].ToString());
            b.UsuarioEmail = d["Usuario_User"] == DBNull.Value ? "" : d["Usuario_User"].ToString();
            b.Actividad = d["Bitacora_Actividad"].ToString();
            b.EntidadId = d["Bitacora_EntidadId"] == DBNull.Value ? "" : d["Bitacora_EntidadId"].ToString();
            b.Detalle = d["Bitacora_Detalle"] == DBNull.Value ? "" : d["Bitacora_Detalle"].ToString();
            b.Estado = TipoEstado.SinCambios;
            return b;
        }
        public override void Sincronizar()
        {
            foreach (Bitacora b in _entities)
            {
                if (b.Estado == TipoEstado.Agregado)
                {
                    string usuarioId = b.UsuarioId.HasValue ? "'" + b.UsuarioId.Value + "'" : "NULL";
                    _dAO.EjecutarQuery(
                        "INSERT INTO Bitacora (Bitacora_ID, Bitacora_FechaHora, Bitacora_UsuarioID, Bitacora_Actividad, Bitacora_EntidadId, Bitacora_Detalle) VALUES ('"
                        + b.Id + "','" + b.FechaHora.ToString("yyyy-MM-dd HH:mm:ss") + "'," + usuarioId + ",'"
                        + b.Actividad.Replace("'", "''") + "','"
                        + b.EntidadId.Replace("'", "''") + "','" + b.Detalle.Replace("'", "''") + "')");
                    b.Estado = TipoEstado.SinCambios;
                }
            }
        }
    }
}
