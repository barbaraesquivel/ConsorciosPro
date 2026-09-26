using INT;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using BE;

namespace DAL
{
    public class DigitoVerificadorVerticalDAL : AbstractDAL<DigitoVerificadorVertical>
    {
        public DigitoVerificadorVerticalDAL()
        {
            CargarEnt();
        }
        private void CargarEnt()
        {
            try
            {
                DataSet d = _dAO.ObtenerDatos("SELECT * FROM DigitoVerificadorVertical");
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
        private DigitoVerificadorVertical Completar(DataRow d)
        {
            DigitoVerificadorVertical dvv = new DigitoVerificadorVertical(Guid.Parse(d["DVV_ID"].ToString()));
            dvv.Tabla = d["DVV_Tabla"].ToString();
            dvv.Atributo = d["DVV_Atributo"].ToString();
            dvv.Valor = Convert.ToInt32(d["DVV_Valor"]);
            dvv.FechaCalculo = Convert.ToDateTime(d["DVV_FechaCalculo"]);
            dvv.Estado = TipoEstado.SinCambios;
            return dvv;
        }
        public DigitoVerificadorVertical ObtenerPorTabla(string tabla)
        {
            return _entities.Where(x => x.Tabla == tabla).FirstOrDefault();
        }
        public override void Sincronizar()
        {
            foreach (DigitoVerificadorVertical dvv in _entities)
            {
                switch (dvv.Estado)
                {
                    case TipoEstado.Agregado:
                        _dAO.EjecutarQuery(
                            "INSERT INTO DigitoVerificadorVertical (DVV_ID, DVV_Tabla, DVV_Atributo, DVV_Valor, DVV_FechaCalculo) VALUES ('"
                            + dvv.Id + "','" + dvv.Tabla + "','" + dvv.Atributo + "'," + dvv.Valor + ",'"
                            + dvv.FechaCalculo.ToString("yyyy-MM-dd HH:mm:ss") + "')");
                        break;
                    case TipoEstado.Modificado:
                        _dAO.EjecutarQuery(
                            "UPDATE DigitoVerificadorVertical SET DVV_Valor=" + dvv.Valor + ", DVV_FechaCalculo='"
                            + dvv.FechaCalculo.ToString("yyyy-MM-dd HH:mm:ss") + "' WHERE DVV_ID='" + dvv.Id + "'");
                        break;
                }
                dvv.Estado = TipoEstado.SinCambios;
            }
        }
    }
}
