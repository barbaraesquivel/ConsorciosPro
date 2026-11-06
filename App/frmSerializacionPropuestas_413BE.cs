using BE;
using BLL;
using INT;
using SER;

namespace AppBase
{
    public partial class frmSerializacionPropuestas_413BE : Form, IIdiomaObserver
    {
        private readonly PropuestaAsambleaBLL_413BE _propuestaBLL_413BE = new PropuestaAsambleaBLL_413BE();
        private Dictionary<int, string> _consorcios_413BE = new Dictionary<int, string>();
        private Dictionary<int, string> _categorias_413BE = new Dictionary<int, string>();
        private PaquetePropuesta_413BE? _paqueteLeido_413BE;

        public frmSerializacionPropuestas_413BE()
        {
            InitializeComponent();
        }

        private void frmSerializacionPropuestas_FormClosing_413BE(object sender, FormClosingEventArgs e)
        {
            SessionManager.QuitarObservador(this);
        }

        public void ActualizarIdioma(IIdioma idioma)
        {
            frmMdiPrincipal f = (frmMdiPrincipal)this.MdiParent!;
            f.CambiarIdiomaFormulario(this, idioma);
            MostrarResumen_413BE();
        }

        private static string TextoEstado_413BE(EstadoPropuesta_413BE estado)
        {
            return estado == EstadoPropuesta_413BE.GENERADA_413BE
                ? TraduccionAyuda_413BE.Obtener_413BE("enum_propuesta_generada", "Generada")
                : TraduccionAyuda_413BE.Obtener_413BE("enum_propuesta_conOrdenDia", "Con orden del día");
        }

        private string NombreConsorcio_413BE(int idConsorcio)
        {
            return _consorcios_413BE.TryGetValue(idConsorcio, out string? nombre) ? nombre : idConsorcio.ToString();
        }

        private void frmSerializacionPropuestas_Load_413BE(object sender, EventArgs e)
        {
            SessionManager.AgregarObservador(this);
            ActualizarIdioma(SessionManager.Idioma);
            try
            {
                _consorcios_413BE = new ConsorcioBLL_413BE().ObtenerTodos_413BE().ToDictionary(c => c.IdConsorcio_413BE, c => c.Nombre_413BE);
                _categorias_413BE = new CategoriaBLL_413BE().ObtenerTodos_413BE().ToDictionary(c => c.IdCategoria_413BE, c => c.Nombre_413BE);
                dgvPropuestas.Rows.Clear();
                foreach (PropuestaAsamblea_413BE p in _propuestaBLL_413BE.ConsultarHistorialPropuestas_413BE(null, null, null, null))
                {
                    int fila = dgvPropuestas.Rows.Add(p.IdPropuesta_413BE, NombreConsorcio_413BE(p.IdConsorcio_413BE),
                        p.FechaGeneracion_413BE.ToString("dd/MM/yyyy HH:mm"), TextoEstado_413BE(p.Estado_413BE));
                    dgvPropuestas.Rows[fila].Tag = p;
                }
                dgvPropuestas.ClearSelection();
                dgvPropuestas.CurrentCell = null;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, this.Text);
            }
            _paqueteLeido_413BE = null;
            dgvTemasLeidos.Rows.Clear();
            MostrarResumen_413BE();
        }

        private void btnSerializar_Click_413BE(object sender, EventArgs e)
        {
            if (dgvPropuestas.SelectedRows.Count == 0 || dgvPropuestas.SelectedRows[0].Tag is not PropuestaAsamblea_413BE propuesta)
            {
                MessageBox.Show(TraduccionAyuda_413BE.Obtener_413BE("ex_seleccionePropuesta", "Seleccione una propuesta"), this.Text);
                return;
            }
            dlgGuardarXml.FileName = "Propuesta_" + propuesta.IdPropuesta_413BE + ".xml";
            if (dlgGuardarXml.ShowDialog(this) != DialogResult.OK) return;
            try
            {
                _propuestaBLL_413BE.ExportarPropuesta_413BE(propuesta.IdPropuesta_413BE, dlgGuardarXml.FileName);
                MessageBox.Show(lbSerializada.Text, this.Text);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, this.Text);
            }
        }

        private void btnDeserializar_Click_413BE(object sender, EventArgs e)
        {
            if (dlgAbrirXml.ShowDialog(this) != DialogResult.OK) return;
            PaquetePropuesta_413BE paquete;
            Dictionary<int, string> unidades;
            try
            {
                paquete = _propuestaBLL_413BE.ImportarPropuesta_413BE(dlgAbrirXml.FileName);
                unidades = new UnidadFuncionalBLL_413BE().ObtenerPorConsorcio_413BE(paquete.Propuesta_413BE.IdConsorcio_413BE)
                    .ToDictionary(u => u.IdUnidadFuncional_413BE, u => u.Identificador_413BE);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, this.Text);
                return;
            }
            _paqueteLeido_413BE = paquete;
            dgvTemasLeidos.Rows.Clear();
            foreach (TemaPropuesto_413BE t in paquete.Propuesta_413BE.Temas_413BE)
            {
                string categoria = _categorias_413BE.TryGetValue(t.IdCategoria_413BE, out string? nombre) ? nombre : t.IdCategoria_413BE.ToString();
                string ubicacion = t.IdUnidadFuncional_413BE != null
                    ? (unidades.TryGetValue(t.IdUnidadFuncional_413BE.Value, out string? identificador) ? identificador : t.IdUnidadFuncional_413BE.Value.ToString())
                    : t.AreaComun_413BE ?? "";
                dgvTemasLeidos.Rows.Add(t.PosicionRanking_413BE, categoria, ubicacion, t.CantidadReclamos_413BE,
                    t.CostoAcumulado_413BE.ToString("N2"), t.CostoSolucion_413BE.ToString("N2"), t.AhorroEstimado_413BE.ToString("N2"),
                    t.OrdenEnOrdenDia_413BE?.ToString() ?? "");
            }
            dgvTemasLeidos.ClearSelection();
            MostrarResumen_413BE();
        }

        private void MostrarResumen_413BE()
        {
            lbOrigenDatos.Visible = _paqueteLeido_413BE != null;
            if (_paqueteLeido_413BE == null)
            {
                lbResumenLeido.Text = "";
                return;
            }
            PropuestaAsamblea_413BE p = _paqueteLeido_413BE.Propuesta_413BE;
            string fechaAsamblea = _paqueteLeido_413BE.OrdenDelDia_413BE == null
                ? TraduccionAyuda_413BE.Obtener_413BE("lb_hisprop_sinOrdenDia", "Sin orden del día")
                : TraduccionAyuda_413BE.Obtener_413BE("lb_hisprop_lbFechaAsamblea", "Fecha de la asamblea:") + " "
                    + _paqueteLeido_413BE.OrdenDelDia_413BE.FechaAsamblea_413BE.ToString("dd/MM/yyyy");
            lbResumenLeido.Text =
                TraduccionAyuda_413BE.Obtener_413BE("lb_serprop_resPropuesta", "Propuesta:") + " " + p.IdPropuesta_413BE + "   " +
                TraduccionAyuda_413BE.Obtener_413BE("lb_serprop_resConsorcio", "Consorcio:") + " " + NombreConsorcio_413BE(p.IdConsorcio_413BE) + "   " +
                TraduccionAyuda_413BE.Obtener_413BE("lb_serprop_resPeriodo", "Período:") + " " + p.PeriodoDesde_413BE.ToString("dd/MM/yyyy") + " - " + p.PeriodoHasta_413BE.ToString("dd/MM/yyyy") + "   " +
                TraduccionAyuda_413BE.Obtener_413BE("lb_serprop_resUmbral", "Umbral:") + " " + p.UmbralRepeticion_413BE + "   " +
                TraduccionAyuda_413BE.Obtener_413BE("lb_serprop_resEstado", "Estado:") + " " + TextoEstado_413BE(p.Estado_413BE) + Environment.NewLine +
                fechaAsamblea;
        }
    }
}
