using BE;
using BLL;
using INT;
using SER;

namespace AppBase
{
    public partial class frmHistorialPropuestas_413BE : Form, IIdiomaObserver
    {
        private readonly PropuestaAsambleaBLL_413BE _propuestaBLL_413BE = new PropuestaAsambleaBLL_413BE();
        private readonly TemaPropuestoBLL_413BE _temaBLL_413BE = new TemaPropuestoBLL_413BE();
        private readonly OrdenDelDiaBLL_413BE _ordenBLL_413BE = new OrdenDelDiaBLL_413BE();
        private Dictionary<int, string> _consorcios_413BE = new Dictionary<int, string>();
        private Dictionary<int, string> _categorias_413BE = new Dictionary<int, string>();
        private bool _cargando_413BE;
        private bool _hayDetalle_413BE;
        private OrdenDelDia_413BE? _ordenMostrada_413BE;
        private List<PropuestaAsamblea_413BE> _propuestas_413BE = new List<PropuestaAsamblea_413BE>();

        public frmHistorialPropuestas_413BE()
        {
            InitializeComponent();
        }

        private void frmHistorialPropuestas_FormClosing_413BE(object sender, FormClosingEventArgs e)
        {
            SessionManager.QuitarObservador(this);
        }

        public void ActualizarIdioma(IIdioma idioma)
        {
            frmMdiPrincipal f = (frmMdiPrincipal)this.MdiParent!;
            f.CambiarIdiomaFormulario(this, idioma);
            int indiceEstado = cboEstado.SelectedIndex;
            cboEstado.Items.Clear();
            cboEstado.Items.Add(TraduccionAyuda_413BE.Obtener_413BE("enum_propuesta_todos", "Todos"));
            cboEstado.Items.Add(TextoEstado_413BE(EstadoPropuesta_413BE.GENERADA_413BE));
            cboEstado.Items.Add(TextoEstado_413BE(EstadoPropuesta_413BE.CON_ORDEN_DIA_413BE));
            cboEstado.SelectedIndex = indiceEstado < 0 ? 0 : indiceEstado;
            MostrarFechaAsamblea_413BE();
        }

        private static string TextoEstado_413BE(EstadoPropuesta_413BE estado)
        {
            return estado == EstadoPropuesta_413BE.GENERADA_413BE
                ? TraduccionAyuda_413BE.Obtener_413BE("enum_propuesta_generada", "Generada")
                : TraduccionAyuda_413BE.Obtener_413BE("enum_propuesta_conOrdenDia", "Con orden del día");
        }

        private void frmHistorialPropuestas_Load_413BE(object sender, EventArgs e)
        {
            SessionManager.AgregarObservador(this);
            ActualizarIdioma(SessionManager.Idioma);
            try
            {
                List<Consorcio_413BE> consorcios = new ConsorcioBLL_413BE().ObtenerTodos_413BE();
                _consorcios_413BE = consorcios.ToDictionary(c => c.IdConsorcio_413BE, c => c.Nombre_413BE);
                _categorias_413BE = new CategoriaBLL_413BE().ObtenerTodos_413BE().ToDictionary(c => c.IdCategoria_413BE, c => c.Nombre_413BE);
                cboConsorcio.DisplayMember = "Nombre_413BE";
                cboConsorcio.Items.Add(TraduccionAyuda_413BE.Obtener_413BE("enum_propuesta_todos", "Todos"));
                cboConsorcio.Items.AddRange(consorcios.Cast<object>().ToArray());
                cboConsorcio.SelectedIndex = 0;
                cboEstado.SelectedIndex = 0;
                dtpDesde.Value = DateTime.Today.AddMonths(-1);
                dtpHasta.Value = DateTime.Today;
                MostrarPropuestas_413BE(_propuestaBLL_413BE.ConsultarHistorialPropuestas_413BE(null, null, null, null));
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, this.Text);
            }
        }

        private void MostrarPropuestas_413BE(List<PropuestaAsamblea_413BE> propuestas)
        {
            _propuestas_413BE = propuestas;
            btnExportarHistorial.Enabled = propuestas.Count > 0;
            _cargando_413BE = true;
            try
            {
                dgvPropuestas.Rows.Clear();
                foreach (PropuestaAsamblea_413BE p in propuestas)
                {
                    string consorcio = _consorcios_413BE.TryGetValue(p.IdConsorcio_413BE, out string? nombre) ? nombre : p.IdConsorcio_413BE.ToString();
                    int fila = dgvPropuestas.Rows.Add(p.IdPropuesta_413BE, consorcio, p.FechaGeneracion_413BE.ToString("dd/MM/yyyy HH:mm"),
                        p.PeriodoDesde_413BE.ToString("dd/MM/yyyy") + " - " + p.PeriodoHasta_413BE.ToString("dd/MM/yyyy"),
                        p.UmbralRepeticion_413BE, TextoEstado_413BE(p.Estado_413BE));
                    dgvPropuestas.Rows[fila].Tag = p;
                }
                dgvPropuestas.ClearSelection();
                dgvPropuestas.CurrentCell = null;
            }
            finally
            {
                _cargando_413BE = false;
            }
            LimpiarDetalle_413BE();
        }

        private void LimpiarDetalle_413BE()
        {
            dgvTemas.Rows.Clear();
            _hayDetalle_413BE = false;
            _ordenMostrada_413BE = null;
            MostrarFechaAsamblea_413BE();
        }

        private void MostrarFechaAsamblea_413BE()
        {
            if (!_hayDetalle_413BE)
            {
                lbFechaAsamblea.Text = "";
            }
            else if (_ordenMostrada_413BE == null)
            {
                lbFechaAsamblea.Text = TraduccionAyuda_413BE.Obtener_413BE("lb_hisprop_sinOrdenDia", "Sin orden del día");
            }
            else
            {
                lbFechaAsamblea.Text = TraduccionAyuda_413BE.Obtener_413BE("lb_hisprop_lbFechaAsamblea", "Fecha de la asamblea:") + " "
                    + _ordenMostrada_413BE.FechaAsamblea_413BE.ToString("dd/MM/yyyy");
            }
        }

        private void btnFiltrar_Click_413BE(object sender, EventArgs e)
        {
            int? idConsorcio = (cboConsorcio.SelectedItem as Consorcio_413BE)?.IdConsorcio_413BE;
            EstadoPropuesta_413BE? estado = cboEstado.SelectedIndex > 0 ? (EstadoPropuesta_413BE)(cboEstado.SelectedIndex - 1) : (EstadoPropuesta_413BE?)null;
            DateTime? desde = chkDesde.Checked ? dtpDesde.Value : (DateTime?)null;
            DateTime? hasta = chkHasta.Checked ? dtpHasta.Value : (DateTime?)null;
            List<PropuestaAsamblea_413BE> propuestas;
            try
            {
                propuestas = _propuestaBLL_413BE.ConsultarHistorialPropuestas_413BE(idConsorcio, estado, desde, hasta);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, this.Text);
                return;
            }
            MostrarPropuestas_413BE(propuestas);
        }

        private void dgvPropuestas_SelectionChanged_413BE(object sender, EventArgs e)
        {
            if (_cargando_413BE) return;
            if (dgvPropuestas.SelectedRows.Count == 0 || dgvPropuestas.SelectedRows[0].Tag is not PropuestaAsamblea_413BE propuesta)
            {
                LimpiarDetalle_413BE();
                return;
            }
            try
            {
                List<TemaPropuesto_413BE> temas = _temaBLL_413BE.ObtenerTemasPropuesta_413BE(propuesta.IdPropuesta_413BE);
                OrdenDelDia_413BE? orden = _ordenBLL_413BE.ObtenerOrdenDelDia_413BE(propuesta.IdPropuesta_413BE);
                Dictionary<int, string> unidades = new UnidadFuncionalBLL_413BE().ObtenerPorConsorcio_413BE(propuesta.IdConsorcio_413BE)
                    .ToDictionary(u => u.IdUnidadFuncional_413BE, u => u.Identificador_413BE);
                string si = TraduccionAyuda_413BE.Obtener_413BE("lb_hisprop_si", "Sí");
                string no = TraduccionAyuda_413BE.Obtener_413BE("lb_hisprop_no", "No");
                dgvTemas.Rows.Clear();
                foreach (TemaPropuesto_413BE t in temas)
                {
                    string categoria = _categorias_413BE.TryGetValue(t.IdCategoria_413BE, out string? nombre) ? nombre : t.IdCategoria_413BE.ToString();
                    string ubicacion = t.IdUnidadFuncional_413BE != null
                        ? (unidades.TryGetValue(t.IdUnidadFuncional_413BE.Value, out string? identificador) ? identificador : t.IdUnidadFuncional_413BE.Value.ToString())
                        : t.AreaComun_413BE ?? "";
                    bool incluido = t.IdOrdenDia_413BE != null;
                    dgvTemas.Rows.Add(t.PosicionRanking_413BE, categoria, ubicacion, t.CantidadReclamos_413BE,
                        t.CostoAcumulado_413BE.ToString("N2"), t.CostoSolucion_413BE.ToString("N2"), t.AhorroEstimado_413BE.ToString("N2"),
                        incluido ? si : no, incluido ? t.OrdenEnOrdenDia_413BE?.ToString() : "");
                }
                dgvTemas.ClearSelection();
                _hayDetalle_413BE = true;
                _ordenMostrada_413BE = orden;
                MostrarFechaAsamblea_413BE();
            }
            catch (Exception ex)
            {
                LimpiarDetalle_413BE();
                MessageBox.Show(ex.Message, this.Text);
            }
        }

        private void btnExportarHistorial_Click_413BE(object sender, EventArgs e)
        {
            dlgGuardarPdf.FileName = "historial_propuestas.pdf";
            if (dlgGuardarPdf.ShowDialog() != DialogResult.OK) return;
            try
            {
                _propuestaBLL_413BE.ExportarHistorialPropuestas_413BE(_propuestas_413BE, dlgGuardarPdf.FileName);
                MessageBox.Show(lbPdfGenerado.Text, this.Text);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, this.Text);
            }
        }
    }
}
