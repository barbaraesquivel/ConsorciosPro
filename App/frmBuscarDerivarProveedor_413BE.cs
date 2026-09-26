using BE;
using BLL;
using INT;
using SER;

namespace AppBase
{
    public partial class frmBuscarDerivarProveedor_413BE : Form, IIdiomaObserver
    {
        private readonly ReclamoBLL_413BE _reclamoBLL = new ReclamoBLL_413BE();
        private readonly ProveedorBLL_413BE _proveedorBLL = new ProveedorBLL_413BE();
        private CatalogosPN01_413BE _catalogos = null!;
        private bool _cargando;
        private int? _idReclamoMostrado;

        public frmBuscarDerivarProveedor_413BE()
        {
            InitializeComponent();
        }

        private void frmBuscarDerivarProveedor_FormClosing_413BE(object sender, FormClosingEventArgs e)
        {
            SessionManager.QuitarObservador(this);
        }

        public void ActualizarIdioma(IIdioma idioma)
        {
            frmMdiPrincipal f = (frmMdiPrincipal)this.MdiParent;
            f.CambiarIdiomaFormulario(this, idioma);
        }

        private void frmBuscarDerivarProveedor_Load_413BE(object sender, EventArgs e)
        {
            SessionManager.AgregarObservador(this);
            ActualizarIdioma(SessionManager.Idioma);
            try
            {
                _catalogos = new CatalogosPN01_413BE();
                ActualizarReclamos_413BE();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, this.Text);
            }
        }

        private void ActualizarReclamos_413BE()
        {
            _cargando = true;
            try
            {
                dgvReclamos.Rows.Clear();
                dgvProveedores.Rows.Clear();
                foreach (Reclamo_413BE r in _reclamoBLL.ObtenerClasificados_413BE())
                {
                    int fila = dgvReclamos.Rows.Add(r.IdReclamo_413BE, r.FechaAlta_413BE.ToString("dd/MM/yyyy"),
                        _catalogos.NombreConsorcio_413BE(r.IdConsorcio_413BE), _catalogos.NombreCategoria_413BE(r.IdCategoria_413BE),
                        CatalogosPN01_413BE.Prioridad_413BE(r.Prioridad_413BE), CatalogosPN01_413BE.Tipo_413BE(r.TipoImputacion_413BE));
                    dgvReclamos.Rows[fila].Tag = r;
                }
                dgvReclamos.ClearSelection();
                dgvReclamos.CurrentCell = null;
                _idReclamoMostrado = null;
            }
            finally
            {
                _cargando = false;
            }
            HabilitarDerivar_413BE();
        }

        private Reclamo_413BE? ReclamoSeleccionado_413BE()
        {
            if (dgvReclamos.SelectedRows.Count == 0) return null;
            return dgvReclamos.SelectedRows[0].Tag as Reclamo_413BE;
        }

        private DesempenoProveedor_413BE? ProveedorSeleccionado_413BE()
        {
            if (dgvProveedores.SelectedRows.Count == 0) return null;
            return dgvProveedores.SelectedRows[0].Tag as DesempenoProveedor_413BE;
        }

        private void HabilitarDerivar_413BE()
        {
            btnDerivar.Enabled = ReclamoSeleccionado_413BE() != null && ProveedorSeleccionado_413BE() != null;
        }

        private void MostrarProveedores_413BE(int idCategoria, CriterioOrden_413BE criterio)
        {
            List<DesempenoProveedor_413BE> desempenos = _proveedorBLL.BuscarProveedores_413BE(idCategoria, criterio);
            dgvProveedores.Rows.Clear();
            foreach (DesempenoProveedor_413BE d in desempenos)
            {
                bool sinHistorial = d.CantidadResueltos_413BE == 0;
                int fila = dgvProveedores.Rows.Add(d.NombreProveedor_413BE,
                    sinHistorial ? "" : d.PrecioPromedio_413BE.ToString("N2"),
                    sinHistorial ? "" : d.TiempoPromedioDias_413BE.ToString("N1"),
                    sinHistorial ? "" : d.TasaReincidencia_413BE.ToString("N1"));
                dgvProveedores.Rows[fila].Tag = d;
            }
            dgvProveedores.ClearSelection();
            dgvProveedores.CurrentCell = null;
            HabilitarDerivar_413BE();
        }

        private void dgvReclamos_SelectionChanged_413BE(object sender, EventArgs e)
        {
            if (_cargando) return;
            Reclamo_413BE? reclamo = ReclamoSeleccionado_413BE();
            if (reclamo == null)
            {
                _idReclamoMostrado = null;
                dgvProveedores.Rows.Clear();
                HabilitarDerivar_413BE();
                return;
            }
            if (_idReclamoMostrado == reclamo.IdReclamo_413BE) return;
            _idReclamoMostrado = reclamo.IdReclamo_413BE;
            try
            {
                _cargando = true;
                tabCriterios.SelectedIndex = (int)CriterioOrden_413BE.RECOMENDADO_413BE;
                _cargando = false;
                MostrarProveedores_413BE(reclamo.IdCategoria_413BE, CriterioOrden_413BE.RECOMENDADO_413BE);
                int sla = _reclamoBLL.ObtenerSlaPropuesto_413BE(reclamo);
                numSla.Value = Math.Min(Math.Max(sla, (int)numSla.Minimum), (int)numSla.Maximum);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, this.Text);
            }
            finally
            {
                _cargando = false;
            }
        }

        private void tabCriterios_SelectedIndexChanged_413BE(object sender, EventArgs e)
        {
            if (_cargando) return;
            Reclamo_413BE? reclamo = ReclamoSeleccionado_413BE();
            if (reclamo == null) return;
            try
            {
                MostrarProveedores_413BE(reclamo.IdCategoria_413BE, (CriterioOrden_413BE)tabCriterios.SelectedIndex);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, this.Text);
            }
        }

        private void dgvProveedores_SelectionChanged_413BE(object sender, EventArgs e)
        {
            HabilitarDerivar_413BE();
        }

        private void btnDerivar_Click_413BE(object sender, EventArgs e)
        {
            Reclamo_413BE? reclamo = ReclamoSeleccionado_413BE();
            DesempenoProveedor_413BE? proveedor = ProveedorSeleccionado_413BE();
            if (reclamo == null || proveedor == null) return;
            try
            {
                _reclamoBLL.DerivarReclamo_413BE(reclamo.IdReclamo_413BE, proveedor.IdProveedor_413BE, (int)numSla.Value);
                ActualizarReclamos_413BE();
                MessageBox.Show(lbReclamoDerivado.Text, this.Text);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, this.Text);
            }
        }
    }
}
