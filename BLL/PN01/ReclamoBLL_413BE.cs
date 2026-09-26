using System.Transactions;
using BE;
using DAL;
using INT;
using SER;

namespace BLL
{
    public class ReclamoBLL_413BE
    {
        private readonly ReclamoDAL_413BE _reclamoDAL = new ReclamoDAL_413BE();
        private readonly AdjuntoDAL_413BE _adjuntoDAL = new AdjuntoDAL_413BE();
        private readonly DerivacionDAL_413BE _derivacionDAL = new DerivacionDAL_413BE();
        private readonly CierreReclamoDAL_413BE _cierreDAL = new CierreReclamoDAL_413BE();
        private readonly AlmacenAdjuntosService_413BE _almacen = new AlmacenAdjuntosService_413BE();
        private readonly ExportadorPdfService_413BE _exportador = new ExportadorPdfService_413BE();
        private readonly VerificadorBLL _verificador = new VerificadorBLL();

        public List<Reclamo_413BE> ObtenerPendientes_413BE()
        {
            return _reclamoDAL.ObtenerPorEstado_413BE(EstadoReclamo_413BE.PENDIENTE_CLASIFICACION_413BE);
        }

        public List<Reclamo_413BE> ObtenerClasificados_413BE()
        {
            return _reclamoDAL.ObtenerPorEstado_413BE(EstadoReclamo_413BE.CLASIFICADO_413BE);
        }

        public List<Reclamo_413BE> ObtenerDerivados_413BE()
        {
            return _reclamoDAL.ObtenerPorEstado_413BE(EstadoReclamo_413BE.DERIVADO_413BE);
        }

        public Reclamo_413BE DetectarReincidencia_413BE(Reclamo_413BE reclamo)
        {
            DateTime desde = DateTime.Now.AddDays(-30);
            List<Reclamo_413BE> cerrados = _reclamoDAL.ObtenerCerradosRecientes_413BE(reclamo, desde);
            return cerrados.FirstOrDefault()!;
        }

        public int CargarReclamo_413BE(Reclamo_413BE reclamo, List<string> rutasFotos)
        {
            reclamo.Estado_413BE = EstadoReclamo_413BE.PENDIENTE_CLASIFICACION_413BE;
            reclamo.FechaAlta_413BE = DateTime.Now;
            reclamo.Reincidente_413BE = false;
            reclamo.Prioridad_413BE = null;
            reclamo.TipoImputacion_413BE = null;
            using (TransactionScope transaccion = new TransactionScope())
            {
                int idReclamo = _reclamoDAL.Insertar_413BE(reclamo);
                reclamo.IdReclamo_413BE = idReclamo;
                List<Adjunto_413BE> adjuntos = new List<Adjunto_413BE>();
                foreach (string rutaOrigen in rutasFotos)
                {
                    string nombre = _almacen.Guardar_413BE(rutaOrigen);
                    Adjunto_413BE adjunto = new Adjunto_413BE();
                    adjunto.IdReclamo_413BE = idReclamo;
                    adjunto.NombreArchivo_413BE = nombre;
                    adjunto.Tipo_413BE = "FOTO";
                    adjunto.IdAdjunto_413BE = _adjuntoDAL.Insertar_413BE(adjunto);
                    adjuntos.Add(adjunto);
                }
                RecalcularReclamo_413BE(reclamo);
                if (adjuntos.Count > 0) RecalcularAdjuntos_413BE(adjuntos);
                transaccion.Complete();
                return idReclamo;
            }
        }

        public void MarcarReincidencia_413BE(int idReclamo, int idReclamoOriginal)
        {
            Reclamo_413BE reclamo = _reclamoDAL.ObtenerPorId_413BE(idReclamo);
            reclamo.Reincidente_413BE = true;
            reclamo.IdReclamoOriginal_413BE = idReclamoOriginal;
            _reclamoDAL.Actualizar_413BE(reclamo);
            RecalcularReclamo_413BE(reclamo);
        }

        public void ClasificarReclamo_413BE(int idReclamo, int idCategoria, TipoImputacion_413BE tipo, PrioridadReclamo_413BE prioridad)
        {
            Reclamo_413BE reclamo = _reclamoDAL.ObtenerPorId_413BE(idReclamo);
            if (tipo == TipoImputacion_413BE.PARTICULAR_413BE && reclamo.AreaComun_413BE != null)
            {
                throw new InvalidOperationException(TraduccionAyuda_413BE.Obtener_413BE("ex_gastoParticularSinUnidad", "El gasto particular requiere una unidad funcional"));
            }
            reclamo.IdCategoria_413BE = idCategoria;
            reclamo.TipoImputacion_413BE = tipo;
            reclamo.Prioridad_413BE = prioridad;
            reclamo.Estado_413BE = EstadoReclamo_413BE.CLASIFICADO_413BE;
            _reclamoDAL.Actualizar_413BE(reclamo);
            RecalcularReclamo_413BE(reclamo);
        }

        public int ObtenerSlaPropuesto_413BE(Reclamo_413BE reclamo)
        {
            switch (reclamo.Prioridad_413BE)
            {
                case PrioridadReclamo_413BE.URGENTE_413BE: return 2;
                case PrioridadReclamo_413BE.MEDIA_413BE: return 7;
                case PrioridadReclamo_413BE.BAJA_413BE: return 15;
                default: return 7;
            }
        }

        public void DerivarReclamo_413BE(int idReclamo, int idProveedor, int plazoSlaDias)
        {
            if (plazoSlaDias <= 0)
            {
                throw new ArgumentException(TraduccionAyuda_413BE.Obtener_413BE("ex_plazoSlaInvalido", "Ingrese un plazo de resolución válido"));
            }
            using (TransactionScope transaccion = new TransactionScope())
            {
                Reclamo_413BE reclamo = _reclamoDAL.ObtenerPorId_413BE(idReclamo);
                Derivacion_413BE derivacion = new Derivacion_413BE();
                derivacion.IdReclamo_413BE = idReclamo;
                derivacion.IdProveedor_413BE = idProveedor;
                derivacion.FechaDerivacion_413BE = DateTime.Now;
                derivacion.PlazoSlaDias_413BE = plazoSlaDias;
                derivacion.IdDerivacion_413BE = _derivacionDAL.Insertar_413BE(derivacion);
                reclamo.Estado_413BE = EstadoReclamo_413BE.DERIVADO_413BE;
                _reclamoDAL.Actualizar_413BE(reclamo);
                RecalcularDerivacion_413BE(derivacion);
                RecalcularReclamo_413BE(reclamo);
                transaccion.Complete();
            }
        }

        public CierreReclamo_413BE CalcularImputacion_413BE(Reclamo_413BE reclamo, decimal costo)
        {
            if (costo <= 0)
            {
                throw new ArgumentException(TraduccionAyuda_413BE.Obtener_413BE("ex_informeCostoRequerido", "Complete el informe y un costo mayor a cero"));
            }
            CierreReclamo_413BE cierre = new CierreReclamo_413BE();
            cierre.IdReclamo_413BE = reclamo.IdReclamo_413BE;
            cierre.CostoImputado_413BE = costo;
            if (reclamo.TipoImputacion_413BE == TipoImputacion_413BE.PARTICULAR_413BE)
            {
                cierre.CuentaImputada_413BE = "Unidad funcional " + reclamo.IdUnidadFuncional_413BE;
            }
            else
            {
                cierre.CuentaImputada_413BE = "Registro general del consorcio " + reclamo.IdConsorcio_413BE;
            }
            return cierre;
        }

        public void CerrarReclamo_413BE(int idReclamo, string informe, string numeroFactura, decimal costo)
        {
            using (TransactionScope transaccion = new TransactionScope())
            {
                Reclamo_413BE reclamo = _reclamoDAL.ObtenerPorId_413BE(idReclamo);
                CierreReclamo_413BE cierre = CalcularImputacion_413BE(reclamo, costo);
                cierre.InformeResolucion_413BE = informe;
                cierre.NumeroFactura_413BE = numeroFactura ?? "";
                cierre.FechaCierre_413BE = DateTime.Now;
                cierre.IdCierre_413BE = _cierreDAL.Insertar_413BE(cierre);
                reclamo.Estado_413BE = EstadoReclamo_413BE.CERRADO_413BE;
                _reclamoDAL.Actualizar_413BE(reclamo);
                RecalcularCierre_413BE(cierre);
                RecalcularReclamo_413BE(reclamo);
                transaccion.Complete();
            }
        }

        public List<Reclamo_413BE> ConsultarHistorial_413BE(int? idConsorcio, int? idProveedor, int? idCategoria, EstadoReclamo_413BE? estado, DateTime? desde, DateTime? hasta)
        {
            if (desde != null && hasta != null && desde.Value.Date > hasta.Value.Date)
            {
                throw new ArgumentException(TraduccionAyuda_413BE.Obtener_413BE("ex_fechasInvertidas", "La fecha desde no puede ser posterior a la fecha hasta"));
            }
            return _reclamoDAL.ObtenerPorFiltro_413BE(idConsorcio, idProveedor, idCategoria, estado, desde, hasta);
        }

        public void ExportarHistorial_413BE(List<Reclamo_413BE> reclamos, string ruta)
        {
            Dictionary<int, string> consorcios = new ConsorcioBLL_413BE().ObtenerTodos_413BE().ToDictionary(c => c.IdConsorcio_413BE, c => c.Nombre_413BE);
            Dictionary<int, string> categorias = new CategoriaBLL_413BE().ObtenerTodos_413BE().ToDictionary(c => c.IdCategoria_413BE, c => c.Nombre_413BE);
            List<string> encabezados = new List<string> { "Id", "Fecha de alta", "Consorcio", "Categoría", "Estado", "Prioridad", "Tipo de imputación", "Reincidente" };
            List<List<string>> filas = new List<List<string>>();
            foreach (Reclamo_413BE r in reclamos)
            {
                filas.Add(new List<string>
                {
                    r.IdReclamo_413BE.ToString(),
                    r.FechaAlta_413BE.ToString("dd/MM/yyyy"),
                    consorcios.TryGetValue(r.IdConsorcio_413BE, out string? consorcio) ? consorcio : "",
                    categorias.TryGetValue(r.IdCategoria_413BE, out string? categoria) ? categoria : "",
                    TextoEstado_413BE(r.Estado_413BE),
                    r.Prioridad_413BE == null ? "" : TextoPrioridad_413BE(r.Prioridad_413BE.Value),
                    r.TipoImputacion_413BE == null ? "" : (r.TipoImputacion_413BE == TipoImputacion_413BE.COMUN_413BE ? "Común" : "Particular"),
                    r.Reincidente_413BE ? "Sí" : "No"
                });
            }
            _exportador.ExportarTabla_413BE("Historial de reclamos", encabezados, filas, ruta);
        }

        private static string TextoEstado_413BE(EstadoReclamo_413BE estado)
        {
            switch (estado)
            {
                case EstadoReclamo_413BE.PENDIENTE_CLASIFICACION_413BE: return "Pendiente de clasificación";
                case EstadoReclamo_413BE.CLASIFICADO_413BE: return "Clasificado";
                case EstadoReclamo_413BE.DERIVADO_413BE: return "Derivado";
                default: return "Cerrado";
            }
        }

        private static string TextoPrioridad_413BE(PrioridadReclamo_413BE prioridad)
        {
            switch (prioridad)
            {
                case PrioridadReclamo_413BE.URGENTE_413BE: return "Urgente";
                case PrioridadReclamo_413BE.MEDIA_413BE: return "Media";
                default: return "Baja";
            }
        }

        private void RecalcularReclamo_413BE(Reclamo_413BE reclamo)
        {
            reclamo.Dvh_413BE = _verificador.CalcularDVH(reclamo);
            _reclamoDAL.ActualizarDvh_413BE(reclamo.IdReclamo_413BE, reclamo.Dvh_413BE);
            _verificador.ActualizarDVV("RECLAMO", _reclamoDAL.ObtenerTodos_413BE().Cast<IVerificable>().ToList());
        }

        private void RecalcularAdjuntos_413BE(IEnumerable<Adjunto_413BE> adjuntosNuevos)
        {
            foreach (Adjunto_413BE a in adjuntosNuevos)
            {
                a.Dvh_413BE = _verificador.CalcularDVH(a);
                _adjuntoDAL.ActualizarDvh_413BE(a.IdAdjunto_413BE, a.Dvh_413BE);
            }
            _verificador.ActualizarDVV("ADJUNTO", _adjuntoDAL.ObtenerTodos_413BE().Cast<IVerificable>().ToList());
        }

        private void RecalcularDerivacion_413BE(Derivacion_413BE derivacion)
        {
            derivacion.Dvh_413BE = _verificador.CalcularDVH(derivacion);
            _derivacionDAL.ActualizarDvh_413BE(derivacion.IdDerivacion_413BE, derivacion.Dvh_413BE);
            _verificador.ActualizarDVV("DERIVACION", _derivacionDAL.ObtenerTodos_413BE().Cast<IVerificable>().ToList());
        }

        private void RecalcularCierre_413BE(CierreReclamo_413BE cierre)
        {
            CierreReclamo_413BE persistido = _cierreDAL.ObtenerPorReclamo_413BE(cierre.IdReclamo_413BE)!;
            cierre.Dvh_413BE = _verificador.CalcularDVH(persistido);
            _cierreDAL.ActualizarDvh_413BE(cierre.IdCierre_413BE, cierre.Dvh_413BE);
            _verificador.ActualizarDVV("CIERRE_RECLAMO", _cierreDAL.ObtenerTodos_413BE().Cast<IVerificable>().ToList());
        }
    }
}
