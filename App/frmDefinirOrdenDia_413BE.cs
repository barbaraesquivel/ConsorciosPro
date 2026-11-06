using BE;
using BLL;
using INT;
using SER;

namespace AppBase
{
    public partial class frmDefinirOrdenDia_413BE : Form, IIdiomaObserver
    {
        private readonly PropuestaAsambleaBLL_413BE _propuestaBLL_413BE = new PropuestaAsambleaBLL_413BE();
        private readonly TemaPropuestoBLL_413BE _temaBLL_413BE = new TemaPropuestoBLL_413BE();
        private Dictionary<int, string> _consorcios_413BE = new Dictionary<int, string>();
        private Dictionary<int, string> _categorias_413BE = new Dictionary<int, string>();
        private bool _cargando_413BE;
        private int? _idPropuestaMostrada_413BE;

        public frmDefinirOrdenDia_413BE()
        {
            InitializeComponent();
        }

        private void frmDefinirOrdenDia_FormClosing_413BE(object sender, FormClosingEventArgs e)
        {
            SessionManager.QuitarObservador(this);
        }

        public void ActualizarIdioma(IIdioma idioma)
        {
            frmMdiPrincipal f = (frmMdiPrincipal)this.MdiParent!;
            f.CambiarIdiomaFormulario(this, idioma);
        }

        private void frmDefinirOrdenDia_Load_413BE(object sender, EventArgs e)
        {
            SessionManager.AgregarObservador(this);
            ActualizarIdioma(SessionManager.Idioma);
            try
            {
                _consorcios_413BE = new ConsorcioBLL_413BE().ObtenerTodos_413BE().ToDictionary(c => c.IdConsorcio_413BE, c => c.Nombre_413BE);
                _categorias_413BE = new CategoriaBLL_413BE().ObtenerTodos_413BE().ToDictionary(c => c.IdCategoria_413BE, c => c.Nombre_413BE);
                CargarPropuestas_413BE();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, this.Text);
            }
        }

        private void CargarPropuestas_413BE()
        {
            _cargando_413BE = true;
            try
            {
                dgvPropuestas.Rows.Clear();
                foreach (PropuestaAsamblea_413BE p in _propuestaBLL_413BE.ObtenerPropuestasGeneradas_413BE())
                {
                    string consorcio = _consorcios_413BE.TryGetValue(p.IdConsorcio_413BE, out string? nombre) ? nombre : p.IdConsorcio_413BE.ToString();
                    int fila = dgvPropuestas.Rows.Add(p.IdPropuesta_413BE, consorcio, p.FechaGeneracion_413BE.ToString("dd/MM/yyyy HH:mm"),
                        p.PeriodoDesde_413BE.ToString("dd/MM/yyyy") + " - " + p.PeriodoHasta_413BE.ToString("dd/MM/yyyy"), p.UmbralRepeticion_413BE);
                    dgvPropuestas.Rows[fila].Tag = p;
                }
                dgvPropuestas.ClearSelection();
                dgvPropuestas.CurrentCell = null;
            }
            finally
            {
                _cargando_413BE = false;
            }
            LimpiarTemas_413BE();
        }

        private void LimpiarTemas_413BE()
        {
            _idPropuestaMostrada_413BE = null;
            dgvTemas.Rows.Clear();
            dtpFechaAsamblea.Value = DateTime.Today;
            HabilitarControles_413BE(false);
        }

        private void HabilitarControles_413BE(bool habilitar)
        {
            btnSubir.Enabled = habilitar;
            btnBajar.Enabled = habilitar;
            dtpFechaAsamblea.Enabled = habilitar;
            btnRegistrarOrdenDia.Enabled = habilitar;
            btnCancelar.Enabled = habilitar;
        }

        private PropuestaAsamblea_413BE? PropuestaSeleccionada_413BE()
        {
            if (dgvPropuestas.SelectedRows.Count == 0) return null;
            return dgvPropuestas.SelectedRows[0].Tag as PropuestaAsamblea_413BE;
        }

        private void dgvPropuestas_SelectionChanged_413BE(object sender, EventArgs e)
        {
            if (_cargando_413BE) return;
            PropuestaAsamblea_413BE? propuesta = PropuestaSeleccionada_413BE();
            if (propuesta == null)
            {
                LimpiarTemas_413BE();
                return;
            }
            if (_idPropuestaMostrada_413BE == propuesta.IdPropuesta_413BE) return;
            try
            {
                Dictionary<int, string> unidades = new UnidadFuncionalBLL_413BE().ObtenerPorConsorcio_413BE(propuesta.IdConsorcio_413BE)
                    .ToDictionary(u => u.IdUnidadFuncional_413BE, u => u.Identificador_413BE);
                List<TemaPropuesto_413BE> temas = _temaBLL_413BE.ObtenerTemasPropuesta_413BE(propuesta.IdPropuesta_413BE);
                dgvTemas.Rows.Clear();
                foreach (TemaPropuesto_413BE t in temas)
                {
                    string categoria = _categorias_413BE.TryGetValue(t.IdCategoria_413BE, out string? nombre) ? nombre : t.IdCategoria_413BE.ToString();
                    string ubicacion = t.IdUnidadFuncional_413BE != null
                        ? (unidades.TryGetValue(t.IdUnidadFuncional_413BE.Value, out string? identificador) ? identificador : t.IdUnidadFuncional_413BE.Value.ToString())
                        : t.AreaComun_413BE ?? "";
                    int fila = dgvTemas.Rows.Add(false, t.PosicionRanking_413BE, categoria, ubicacion, t.CantidadReclamos_413BE,
                        t.CostoAcumulado_413BE.ToString("N2"), t.CostoSolucion_413BE.ToString("N2"), t.AhorroEstimado_413BE.ToString("N2"));
                    dgvTemas.Rows[fila].Tag = t;
                }
                _idPropuestaMostrada_413BE = propuesta.IdPropuesta_413BE;
                dtpFechaAsamblea.Value = DateTime.Today;
                HabilitarControles_413BE(true);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, this.Text);
            }
        }

        private void MoverFila_413BE(int desplazamiento)
        {
            dgvTemas.EndEdit();
            if (dgvTemas.CurrentRow == null) return;
            int origen = dgvTemas.CurrentRow.Index;
            int destino = origen + desplazamiento;
            if (destino < 0 || destino >= dgvTemas.Rows.Count) return;
            DataGridViewRow fila = dgvTemas.Rows[origen];
            int columna = dgvTemas.CurrentCell?.ColumnIndex ?? 0;
            dgvTemas.Rows.RemoveAt(origen);
            dgvTemas.Rows.Insert(destino, fila);
            dgvTemas.CurrentCell = dgvTemas.Rows[destino].Cells[columna];
            dgvTemas.Rows[destino].Selected = true;
        }

        private void btnSubir_Click_413BE(object sender, EventArgs e)
        {
            MoverFila_413BE(-1);
        }

        private void btnBajar_Click_413BE(object sender, EventArgs e)
        {
            MoverFila_413BE(1);
        }

        private void btnRegistrarOrdenDia_Click_413BE(object sender, EventArgs e)
        {
            PropuestaAsamblea_413BE? propuesta = PropuestaSeleccionada_413BE();
            if (propuesta == null) return;
            dgvTemas.EndEdit();
            List<TemaPropuesto_413BE> temasIncluidos = new List<TemaPropuesto_413BE>();
            foreach (DataGridViewRow fila in dgvTemas.Rows)
            {
                if (Convert.ToBoolean(fila.Cells[dgvTemasColIncluir.Index].Value) && fila.Tag is TemaPropuesto_413BE tema)
                {
                    temasIncluidos.Add(tema);
                }
            }
            try
            {
                _propuestaBLL_413BE.RegistrarOrdenDelDia_413BE(propuesta.IdPropuesta_413BE, dtpFechaAsamblea.Value, temasIncluidos);
            }
            catch (ArgumentException ex)
            {
                MessageBox.Show(ex.Message, this.Text);
                return;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, this.Text);
                return;
            }
            MessageBox.Show(lbOrdenRegistrado.Text, this.Text);
            try
            {
                CargarPropuestas_413BE();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, this.Text);
            }
        }

        private void btnCancelar_Click_413BE(object sender, EventArgs e)
        {
            try
            {
                CargarPropuestas_413BE();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, this.Text);
            }
        }
    }
}
