using BE;
using DAL;
using INT;
using SER;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;

namespace BLL
{
    public class BitacoraBLL : AbstractBLL<Bitacora>
    {
        public BitacoraBLL()
        {
            _crud = new BitacoraDAL();
        }

        public void Registrar(Guid? usuarioId, string actividad, string entidadId = "", string detalle = "")
        {
            Bitacora b = new Bitacora();
            b.UsuarioId = usuarioId;
            b.Actividad = actividad;
            b.EntidadId = entidadId ?? "";
            b.Detalle = detalle ?? "";
            b.Estado = TipoEstado.Agregado;
            _crud.Save(b);
        }

        public void RegistrarDeUsuarioActual(string actividad, string entidadId = "", string detalle = "")
        {
            Guid? usuarioId = SessionManager.EstaLogueado() ? SessionManager.Instancia.Usuario.Id : (Guid?)null;
            Registrar(usuarioId, actividad, entidadId, detalle);
        }

        public IList<Bitacora> Buscar(FiltroBitacora filtro)
        {
            IEnumerable<Bitacora> query = _crud.GetAll();
            if (filtro.UsuarioId.HasValue)
                query = query.Where(b => b.UsuarioId == filtro.UsuarioId.Value);
            if (filtro.FechaDesde.HasValue)
                query = query.Where(b => b.FechaHora >= filtro.FechaDesde.Value.Date);
            if (filtro.FechaHasta.HasValue)
                query = query.Where(b => b.FechaHora < filtro.FechaHasta.Value.Date.AddDays(1));
            if (!string.IsNullOrWhiteSpace(filtro.Actividad))
                query = query.Where(b => b.Actividad.IndexOf(filtro.Actividad, StringComparison.OrdinalIgnoreCase) >= 0);
            return query.ToList();
        }

        public void ExportarCsv(IList<Bitacora> resultados, string rutaArchivo)
        {
            StringBuilder sb = new StringBuilder();
            sb.AppendLine("Fecha,Hora,Usuario,Actividad,EntidadId,Detalle");
            foreach (Bitacora b in resultados)
            {
                sb.AppendLine(string.Join(",",
                    CsvSafe(b.FechaHora.ToString("yyyy-MM-dd")),
                    CsvSafe(b.FechaHora.ToString("HH:mm:ss")),
                    CsvSafe(b.UsuarioEmail),
                    CsvSafe(b.Actividad),
                    CsvSafe(b.EntidadId),
                    CsvSafe(b.Detalle)));
            }
            File.WriteAllText(rutaArchivo, sb.ToString(), Encoding.UTF8);
        }

        private static string CsvSafe(string valor)
        {
            valor ??= "";
            if (valor.Contains(',') || valor.Contains('"') || valor.Contains('\n'))
                return "\"" + valor.Replace("\"", "\"\"") + "\"";
            return valor;
        }
    }
}
