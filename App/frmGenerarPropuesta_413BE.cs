using System.Globalization;
using BE;
using BLL;
using INT;
using SER;

namespace AppBase
{
    public partial class frmGenerarPropuesta_413BE : Form, IIdiomaObserver
    {
        private readonly ReclamoBLL_413BE _reclamoBLL_413BE = new ReclamoBLL_413BE();
        private readonly TemaPropuestoBLL_413BE _temaBLL_413BE = new TemaPropuestoBLL_413BE();
        private readonly PropuestaAsambleaBLL_413BE _propuestaBLL_413BE = new PropuestaAsambleaBLL_413BE();
        private Dictionary<int, string> _categorias_413BE = new Dictionary<int, string>();
        private Dictionary<int, string> _unidades_413BE = new Dictionary<int, string>();
        private List<TemaPropuesto_413BE> _grupos_413BE = new List<TemaPropuesto_413BE>();
        private List<TemaPropuesto_413BE> _ranking_413BE = new List<TemaPropuesto_413BE>();
        private int? _umbral_413BE;
        private int _idConsorcioAnalizado_413BE;
        private DateTime _desdeAnalizado_413BE;
        private DateTime _hastaAnalizado_413BE;

        public frmGenerarPropuesta_413BE()
        {
            InitializeComponent();
        }

        private void frmGenerarPropuesta_FormClosing_413BE(object sender, FormClosingEventArgs e)
        {
            SessionManager.QuitarObservador(this);
        }

        public void ActualizarIdioma(IIdioma idioma)
        {
            frmMdiPrincipal f = (frmMdiPrincipal)this.MdiParent!;
            f.CambiarIdiomaFormulario(this, idioma);
            MostrarUmbral_413BE();
        }

        private void frmGenerarPropuesta_Load_413BE(object sender, EventArgs e)
        {
            SessionManager.AgregarObservador(this);
            ActualizarIdioma(SessionManager.Idioma);
            try
            {
                cboConsorcio.DisplayMember = "Nombre_413BE";
                cboConsorcio.ValueMember = "IdConsorcio_413BE";
                cboConsorcio.DataSource = new ConsorcioBLL_413BE().ObtenerTodos_413BE();
                _categorias_413BE = new CategoriaBLL_413BE().ObtenerTodos_413BE().ToDictionary(c => c.IdCategoria_413BE, c => c.Nombre_413BE);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, this.Text);
            }
            Limpiar_413BE();
        }

        private void Limpiar_413BE()
        {
            dtpHasta.Value = DateTime.Today;
            dtpDesde.Value = DateTime.Today.AddMonths(-1);
            dgvGrupos.Rows.Clear();
            dgvRanking.Rows.Clear();
            _grupos_413BE = new List<TemaPropuesto_413BE>();
            _ranking_413BE = new List<TemaPropuesto_413BE>();
            _umbral_413BE = null;
            MostrarUmbral_413BE();
            btnCalcularAhorro.Enabled = false;
            btnGuardarPropuesta.Enabled = false;
        }

        private void MostrarUmbral_413BE()
        {
            lbUmbral.Visible = _umbral_413BE != null;
            if (_umbral_413BE == null) return;
            string texto = lbUmbral.Text;
            int separador = texto.IndexOf(':');
            if (separador >= 0) texto = texto.Substring(0, separador + 1);
            lbUmbral.Text = texto + " " + _umbral_413BE;
        }

        private string Ubicacion_413BE(TemaPropuesto_413BE tema)
        {
            if (tema.IdUnidadFuncional_413BE != null)
            {
                return _unidades_413BE.TryGetValue(tema.IdUnidadFuncional_413BE.Value, out string? identificador) ? identificador : tema.IdUnidadFuncional_413BE.Value.ToString();
            }
            return tema.AreaComun_413BE ?? "";
        }

        private string Categoria_413BE(int idCategoria)
        {
            return _categorias_413BE.TryGetValue(idCategoria, out string? nombre) ? nombre : idCategoria.ToString();
        }

        private void btnAnalizar_Click_413BE(object sender, EventArgs e)
        {
            if (cboConsorcio.SelectedValue == null) return;
            int idConsorcio = (int)cboConsorcio.SelectedValue;
            DateTime desde = dtpDesde.Value.Date;
            DateTime hasta = dtpHasta.Value.Date;
            dgvGrupos.Rows.Clear();
            dgvRanking.Rows.Clear();
            btnCalcularAhorro.Enabled = false;
            btnGuardarPropuesta.Enabled = false;
            _umbral_413BE = null;
            MostrarUmbral_413BE();
            List<TemaPropuesto_413BE> candidatos;
            int umbral;
            try
            {
                List<TemaPropuesto_413BE> grupos = _reclamoBLL_413BE.ObtenerGruposReclamos_413BE(idConsorcio, desde, hasta);
                umbral = _propuestaBLL_413BE.ObtenerUmbralRepeticion_413BE();
                candidatos = _temaBLL_413BE.FiltrarGruposCandidatos_413BE(grupos, umbral);
                _unidades_413BE = new UnidadFuncionalBLL_413BE().ObtenerPorConsorcio_413BE(idConsorcio)
                    .ToDictionary(u => u.IdUnidadFuncional_413BE, u => u.Identificador_413BE);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, this.Text);
                return;
            }
            if (candidatos.Count == 0)
            {
                MessageBox.Show(lbNingunGrupo.Text, this.Text);
                return;
            }
            _grupos_413BE = candidatos;
            _umbral_413BE = umbral;
            _idConsorcioAnalizado_413BE = idConsorcio;
            _desdeAnalizado_413BE = desde;
            _hastaAnalizado_413BE = hasta;
            foreach (TemaPropuesto_413BE g in _grupos_413BE)
            {
                int fila = dgvGrupos.Rows.Add(Categoria_413BE(g.IdCategoria_413BE), Ubicacion_413BE(g), g.CantidadReclamos_413BE,
                    g.CostoAcumulado_413BE.ToString("N2"), g.TiempoPromedioAbiertoDias_413BE.ToString("N1"), "");
                dgvGrupos.Rows[fila].Tag = g;
            }
            MostrarUmbral_413BE();
            btnCalcularAhorro.Enabled = true;
        }

        private void btnCalcularAhorro_Click_413BE(object sender, EventArgs e)
        {
            dgvGrupos.EndEdit();
            List<TemaPropuesto_413BE> temas = new List<TemaPropuesto_413BE>();
            foreach (DataGridViewRow fila in dgvGrupos.Rows)
            {
                if (fila.Tag is not TemaPropuesto_413BE tema) continue;
                string texto = Convert.ToString(fila.Cells[dgvGruposColCostoSolucion.Index].Value) ?? "";
                tema.CostoSolucion_413BE = decimal.TryParse(texto, NumberStyles.Number, CultureInfo.CurrentCulture, out decimal costo) ? costo : 0;
                temas.Add(tema);
            }
            List<TemaPropuesto_413BE> ranking;
            try
            {
                ranking = _temaBLL_413BE.CalcularRanking_413BE(temas);
            }
            catch (ArgumentException ex)
            {
                MessageBox.Show(ex.Message, this.Text);
                return;
            }
            _ranking_413BE = ranking;
            dgvRanking.Rows.Clear();
            foreach (TemaPropuesto_413BE t in _ranking_413BE)
            {
                dgvRanking.Rows.Add(t.PosicionRanking_413BE, Categoria_413BE(t.IdCategoria_413BE), Ubicacion_413BE(t), t.CantidadReclamos_413BE,
                    t.CostoAcumulado_413BE.ToString("N2"), t.CostoSolucion_413BE.ToString("N2"), t.AhorroEstimado_413BE.ToString("N2"));
            }
            btnGuardarPropuesta.Enabled = true;
        }

        private void dgvGrupos_CellValueChanged_413BE(object? sender, DataGridViewCellEventArgs e)
        {
            btnGuardarPropuesta.Enabled = false;
        }

        private void btnGuardarPropuesta_Click_413BE(object sender, EventArgs e)
        {
            if (_ranking_413BE.Count == 0 || _umbral_413BE == null) return;
            try
            {
                _propuestaBLL_413BE.GuardarPropuesta_413BE(_idConsorcioAnalizado_413BE, _desdeAnalizado_413BE, _hastaAnalizado_413BE,
                    _umbral_413BE.Value, _ranking_413BE);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, this.Text);
                return;
            }
            MessageBox.Show(lbPropuestaGenerada.Text, this.Text);
            Limpiar_413BE();
        }

        private void btnCancelar_Click_413BE(object sender, EventArgs e)
        {
            Limpiar_413BE();
        }
    }
}
