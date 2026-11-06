using System.Transactions;
using BE;
using DAL;
using INT;
using SER;

namespace BLL
{
    public class PropuestaAsambleaBLL_413BE
    {
        private readonly PropuestaAsambleaDAL_413BE _propuestaDAL = new PropuestaAsambleaDAL_413BE();
        private readonly VerificadorBLL _verificador = new VerificadorBLL();
        private readonly ExportadorPdfService_413BE _exportador = new ExportadorPdfService_413BE();

        public int ObtenerUmbralRepeticion_413BE()
        {
            string mensaje = TraduccionAyuda_413BE.Obtener_413BE("ex_umbralNoConfigurado", "Debe configurarse el umbral de repetición");
            string valor;
            try
            {
                valor = new ConfiguracionService_413BE().LeerValor_413BE("UmbralRepeticion");
            }
            catch (InvalidOperationException)
            {
                throw new InvalidOperationException(mensaje);
            }
            if (!int.TryParse(valor, out int umbral) || umbral < 1)
            {
                throw new InvalidOperationException(mensaje);
            }
            return umbral;
        }

        public int GuardarPropuesta_413BE(int idConsorcio, DateTime desde, DateTime hasta, int umbral, List<TemaPropuesto_413BE> ranking)
        {
            using (TransactionScope transaccion = new TransactionScope())
            {
                PropuestaAsamblea_413BE propuesta = new PropuestaAsamblea_413BE();
                propuesta.IdConsorcio_413BE = idConsorcio;
                propuesta.FechaGeneracion_413BE = DateTime.Now;
                propuesta.PeriodoDesde_413BE = desde.Date;
                propuesta.PeriodoHasta_413BE = hasta.Date;
                propuesta.UmbralRepeticion_413BE = umbral;
                propuesta.Estado_413BE = EstadoPropuesta_413BE.GENERADA_413BE;
                int id = _propuestaDAL.Insertar_413BE(propuesta);
                new TemaPropuestoBLL_413BE().GuardarTemas_413BE(id, ranking);
                RecalcularPropuesta_413BE(propuesta);
                transaccion.Complete();
                return id;
            }
        }

        public List<PropuestaAsamblea_413BE> ObtenerPropuestasGeneradas_413BE()
        {
            return _propuestaDAL.ObtenerPorEstado_413BE(EstadoPropuesta_413BE.GENERADA_413BE);
        }

        public int RegistrarOrdenDelDia_413BE(int idPropuesta, DateTime fechaAsamblea, List<TemaPropuesto_413BE> temasIncluidos)
        {
            if (temasIncluidos.Count == 0)
            {
                throw new ArgumentException(TraduccionAyuda_413BE.Obtener_413BE("ex_ningunTemaIncluido", "Incluya al menos un tema en el orden del día"));
            }
            if (fechaAsamblea.Date < DateTime.Today)
            {
                throw new ArgumentException(TraduccionAyuda_413BE.Obtener_413BE("ex_fechaAsambleaInvalida", "La fecha de la asamblea no puede ser anterior a hoy"));
            }
            using (TransactionScope transaccion = new TransactionScope())
            {
                int idOrden = new OrdenDelDiaBLL_413BE().GuardarOrdenDelDia_413BE(idPropuesta, fechaAsamblea);
                new TemaPropuestoBLL_413BE().IncluirTemasEnOrdenDia_413BE(idOrden, temasIncluidos);
                PropuestaAsamblea_413BE propuesta = _propuestaDAL.ObtenerPorId_413BE(idPropuesta);
                propuesta.Estado_413BE = EstadoPropuesta_413BE.CON_ORDEN_DIA_413BE;
                _propuestaDAL.Actualizar_413BE(propuesta);
                RecalcularPropuesta_413BE(propuesta);
                transaccion.Complete();
                return idOrden;
            }
        }

        public List<PropuestaAsamblea_413BE> ConsultarHistorialPropuestas_413BE(int? idConsorcio, EstadoPropuesta_413BE? estado, DateTime? desde, DateTime? hasta)
        {
            if (desde != null && hasta != null && desde.Value.Date > hasta.Value.Date)
            {
                throw new ArgumentException(TraduccionAyuda_413BE.Obtener_413BE("ex_fechasInvertidas", "La fecha desde no puede ser posterior a la fecha hasta"));
            }
            return _propuestaDAL.ObtenerPorFiltro_413BE(idConsorcio, estado, desde, hasta);
        }

        public void ExportarHistorialPropuestas_413BE(List<PropuestaAsamblea_413BE> propuestas, string ruta)
        {
            Dictionary<int, string> consorcios = new ConsorcioBLL_413BE().ObtenerTodos_413BE().ToDictionary(c => c.IdConsorcio_413BE, c => c.Nombre_413BE);
            List<string> encabezados = new List<string> { "Id", "Consorcio", "Fecha de generación", "Período desde", "Período hasta", "Umbral de repetición", "Estado" };
            List<List<string>> filas = new List<List<string>>();
            foreach (PropuestaAsamblea_413BE p in propuestas)
            {
                filas.Add(new List<string>
                {
                    p.IdPropuesta_413BE.ToString(),
                    consorcios.TryGetValue(p.IdConsorcio_413BE, out string? consorcio) ? consorcio : "",
                    p.FechaGeneracion_413BE.ToString("dd/MM/yyyy HH:mm"),
                    p.PeriodoDesde_413BE.ToString("dd/MM/yyyy"),
                    p.PeriodoHasta_413BE.ToString("dd/MM/yyyy"),
                    p.UmbralRepeticion_413BE.ToString(),
                    p.Estado_413BE == EstadoPropuesta_413BE.GENERADA_413BE
                        ? TraduccionAyuda_413BE.Obtener_413BE("enum_propuesta_generada", "Generada")
                        : TraduccionAyuda_413BE.Obtener_413BE("enum_propuesta_conOrdenDia", "Con orden del día")
                });
            }
            _exportador.ExportarTabla_413BE("Historial de propuestas", encabezados, filas, ruta);
        }

        public void ExportarPropuesta_413BE(int idPropuesta, string ruta)
        {
            PropuestaAsamblea_413BE propuesta = _propuestaDAL.ObtenerPorId_413BE(idPropuesta);
            propuesta.Temas_413BE = new TemaPropuestoBLL_413BE().ObtenerTemasPropuesta_413BE(idPropuesta);
            OrdenDelDia_413BE? orden = new OrdenDelDiaBLL_413BE().ObtenerOrdenDelDia_413BE(idPropuesta);
            PaquetePropuesta_413BE paquete = new PaquetePropuesta_413BE();
            paquete.Propuesta_413BE = propuesta;
            paquete.OrdenDelDia_413BE = orden;
            paquete.FechaExportacion_413BE = DateTime.Now;
            new SerializacionService_413BE().Serializar_413BE(paquete, ruta);
        }

        public PaquetePropuesta_413BE ImportarPropuesta_413BE(string ruta)
        {
            try
            {
                return new SerializacionService_413BE().Deserializar_413BE<PaquetePropuesta_413BE>(ruta);
            }
            catch (InvalidOperationException ex)
            {
                throw new InvalidOperationException(
                    TraduccionAyuda_413BE.Obtener_413BE("ex_archivoPropuestaInvalido", "El archivo no es una propuesta válida"), ex.InnerException ?? ex);
            }
        }

        private void RecalcularPropuesta_413BE(PropuestaAsamblea_413BE propuesta)
        {
            PropuestaAsamblea_413BE persistida = _propuestaDAL.ObtenerPorId_413BE(propuesta.IdPropuesta_413BE);
            propuesta.Dvh_413BE = _verificador.CalcularDVH(persistida);
            _propuestaDAL.ActualizarDvh_413BE(propuesta.IdPropuesta_413BE, propuesta.Dvh_413BE);
            _verificador.ActualizarDVV("PROPUESTA_ASAMBLEA", _propuestaDAL.ObtenerTodos_413BE().Cast<IVerificable>().ToList());
        }
    }
}
