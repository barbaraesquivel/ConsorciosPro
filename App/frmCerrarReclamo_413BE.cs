using BE;
using BLL;
using INT;
using SER;

namespace AppBase
{
    public partial class frmCerrarReclamo_413BE : Form, IIdiomaObserver
    {
        private readonly ReclamoBLL_413BE _reclamoBLL = new ReclamoBLL_413BE();
        private CatalogosPN01_413BE _catalogos = null!;
        private bool _cargando;

        public frmCerrarReclamo_413BE()
        {
            InitializeComponent();
        }

        private void frmCerrarReclamo_FormClosing_413BE(object sender, FormClosingEventArgs e)
        {
            SessionManager.QuitarObservador(this);
        }

        public void ActualizarIdioma(IIdioma idioma)
        {
            frmMdiPrincipal f = (frmMdiPrincipal)this.MdiParent;
            f.CambiarIdiomaFormulario(this, idioma);
        }

        private void frmCerrarReclamo_Load_413BE(object sender, EventArgs e)
        {
            SessionManager.AgregarObservador(this);
            ActualizarIdioma(SessionManager.Idioma);
            try
            {
                _catalogos = new CatalogosPN01_413BE();
                ActualizarDerivados_413BE();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, this.Text);
            }
        }

        private void ActualizarDerivados_413BE()
        {
            _cargando = true;
            try
            {
                dgvDerivados.Rows.Clear();
                foreach (Reclamo_413BE r in _reclamoBLL.ObtenerDerivados_413BE())
                {
                    int fila = dgvDerivados.Rows.Add(r.IdReclamo_413BE, r.FechaAlta_413BE.ToString("dd/MM/yyyy"),
                        _catalogos.NombreConsorcio_413BE(r.IdConsorcio_413BE), _catalogos.NombreCategoria_413BE(r.IdCategoria_413BE),
                        CatalogosPN01_413BE.Prioridad_413BE(r.Prioridad_413BE), CatalogosPN01_413BE.Tipo_413BE(r.TipoImputacion_413BE));
                    dgvDerivados.Rows[fila].Tag = r;
                }
                dgvDerivados.ClearSelection();
                dgvDerivados.CurrentCell = null;
            }
            finally
            {
                _cargando = false;
            }
            MostrarReclamo_413BE();
        }

        private Reclamo_413BE? ReclamoSeleccionado_413BE()
        {
            if (dgvDerivados.SelectedRows.Count == 0) return null;
            return dgvDerivados.SelectedRows[0].Tag as Reclamo_413BE;
        }

        private void MostrarReclamo_413BE()
        {
            Reclamo_413BE? reclamo = ReclamoSeleccionado_413BE();
            txtDatosReclamo.Text = reclamo == null ? "" : _catalogos.DatosReclamo_413BE(reclamo);
            txtInforme.Text = "";
            txtNumeroFactura.Text = "";
            numCosto.Value = 0;
            MostrarImputacion_413BE(false);
        }

        private void MostrarImputacion_413BE(bool visible)
        {
            grpImputacion.Visible = visible;
            dgvDerivados.Enabled = !visible;
            txtInforme.Enabled = !visible;
            txtNumeroFactura.Enabled = !visible;
            numCosto.Enabled = !visible;
            btnCerrarReclamo.Enabled = !visible && ReclamoSeleccionado_413BE() != null;
        }

        private void dgvDerivados_SelectionChanged_413BE(object sender, EventArgs e)
        {
            if (_cargando) return;
            MostrarReclamo_413BE();
        }

        private void btnCerrarReclamo_Click_413BE(object sender, EventArgs e)
        {
            Reclamo_413BE? reclamo = ReclamoSeleccionado_413BE();
            if (reclamo == null) return;
            if (txtInforme.Text.Trim().Length == 0)
            {
                MessageBox.Show(TraduccionAyuda_413BE.Obtener_413BE("ex_informeCostoRequerido", "Complete el informe y un costo mayor a cero"), this.Text);
                return;
            }
            try
            {
                CierreReclamo_413BE cierre = _reclamoBLL.CalcularImputacion_413BE(reclamo, numCosto.Value);
                lblCuenta.Text = cierre.CuentaImputada_413BE;
                lblMonto.Text = "$ " + cierre.CostoImputado_413BE.ToString("N2");
                MostrarImputacion_413BE(true);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, this.Text);
            }
        }

        private void btnConfirmarCierre_Click_413BE(object sender, EventArgs e)
        {
            Reclamo_413BE? reclamo = ReclamoSeleccionado_413BE();
            if (reclamo == null) return;
            try
            {
                _reclamoBLL.CerrarReclamo_413BE(reclamo.IdReclamo_413BE, txtInforme.Text.Trim(), txtNumeroFactura.Text.Trim(), numCosto.Value);
                ActualizarDerivados_413BE();
                MessageBox.Show(lbReclamoCerrado.Text, this.Text);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, this.Text);
            }
        }

        private void btnCancelar_Click_413BE(object sender, EventArgs e)
        {
            MostrarImputacion_413BE(false);
        }
    }
}
