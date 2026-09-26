using BE;
using BLL;
using INT;
using SER;

namespace AppBase
{
    public partial class frmHistorialReclamos_413BE : Form, IIdiomaObserver
    {
        private readonly ReclamoBLL_413BE _reclamoBLL = new ReclamoBLL_413BE();
        private readonly ProveedorBLL_413BE _proveedorBLL = new ProveedorBLL_413BE();
        private CatalogosPN01_413BE _catalogos = null!;
        private List<Reclamo_413BE> _reclamos = new List<Reclamo_413BE>();
        private List<DesempenoProveedor_413BE> _desempeno = new List<DesempenoProveedor_413BE>();

        public frmHistorialReclamos_413BE()
        {
            InitializeComponent();
        }

        private void frmHistorialReclamos_FormClosing_413BE(object sender, FormClosingEventArgs e)
        {
            SessionManager.QuitarObservador(this);
        }

        public void ActualizarIdioma(IIdioma idioma)
        {
            frmMdiPrincipal f = (frmMdiPrincipal)this.MdiParent;
            f.CambiarIdiomaFormulario(this, idioma);
            int indiceEstado = cboEstado.SelectedIndex;
            cboEstado.Items.Clear();
            cboEstado.Items.Add(TraduccionAyuda_413BE.Obtener_413BE("enum_estado_todos", "(Todos)"));
            cboEstado.Items.Add(TraduccionAyuda_413BE.Obtener_413BE("enum_estado_pendiente", "Pendiente de clasificación"));
            cboEstado.Items.Add(TraduccionAyuda_413BE.Obtener_413BE("enum_estado_clasificado", "Clasificado"));
            cboEstado.Items.Add(TraduccionAyuda_413BE.Obtener_413BE("enum_estado_derivado", "Derivado"));
            cboEstado.Items.Add(TraduccionAyuda_413BE.Obtener_413BE("enum_estado_cerrado", "Cerrado"));
            cboEstado.SelectedIndex = indiceEstado;
        }

        private void frmHistorialReclamos_Load_413BE(object sender, EventArgs e)
        {
            SessionManager.AgregarObservador(this);
            ActualizarIdioma(SessionManager.Idioma);
            try
            {
                _catalogos = new CatalogosPN01_413BE();
                List<Proveedor_413BE> proveedores = _proveedorBLL.ObtenerTodos_413BE();

                cboConsorcio.DisplayMember = "Nombre_413BE";
                cboConsorcio.Items.Add("(Todos)");
                cboConsorcio.Items.AddRange(_catalogos.ObtenerConsorcios_413BE().Cast<object>().ToArray());
                cboConsorcio.SelectedIndex = 0;

                cboProveedor.DisplayMember = "Nombre_413BE";
                cboProveedor.Items.Add("(Todos)");
                cboProveedor.Items.AddRange(proveedores.Cast<object>().ToArray());
                cboProveedor.SelectedIndex = 0;

                cboCategoria.DisplayMember = "Nombre_413BE";
                cboCategoria.Items.Add("(Todos)");
                cboCategoria.Items.AddRange(_catalogos.ObtenerCategorias_413BE().Cast<object>().ToArray());
                cboCategoria.SelectedIndex = 0;

                cboEstado.SelectedIndex = 0;

                cboProveedorDesempeno.DisplayMember = "Nombre_413BE";
                cboProveedorDesempeno.Items.AddRange(proveedores.Cast<object>().ToArray());

                MostrarHistorial_413BE(_reclamoBLL.ConsultarHistorial_413BE(null, null, null, null, null, null));
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, this.Text);
            }
        }

        private void MostrarHistorial_413BE(List<Reclamo_413BE> reclamos)
        {
            _reclamos = reclamos;
            dgvReclamos.Rows.Clear();
            foreach (Reclamo_413BE r in reclamos)
            {
                dgvReclamos.Rows.Add(r.IdReclamo_413BE, r.FechaAlta_413BE.ToString("dd/MM/yyyy"),
                    _catalogos.NombreConsorcio_413BE(r.IdConsorcio_413BE), _catalogos.NombreCategoria_413BE(r.IdCategoria_413BE),
                    CatalogosPN01_413BE.Estado_413BE(r.Estado_413BE), CatalogosPN01_413BE.Prioridad_413BE(r.Prioridad_413BE),
                    CatalogosPN01_413BE.Tipo_413BE(r.TipoImputacion_413BE), r.Reincidente_413BE ? "Sí" : "No", r.Descripcion_413BE);
            }
            dgvReclamos.ClearSelection();
        }

        private void btnFiltrar_Click_413BE(object sender, EventArgs e)
        {
            int? idConsorcio = (cboConsorcio.SelectedItem as Consorcio_413BE)?.IdConsorcio_413BE;
            int? idProveedor = (cboProveedor.SelectedItem as Proveedor_413BE)?.IdProveedor_413BE;
            int? idCategoria = (cboCategoria.SelectedItem as Categoria_413BE)?.IdCategoria_413BE;
            EstadoReclamo_413BE? estado = cboEstado.SelectedIndex > 0 ? (EstadoReclamo_413BE)(cboEstado.SelectedIndex - 1) : (EstadoReclamo_413BE?)null;
            DateTime? desde = dtpDesde.Checked ? dtpDesde.Value : (DateTime?)null;
            DateTime? hasta = dtpHasta.Checked ? dtpHasta.Value : (DateTime?)null;
            try
            {
                MostrarHistorial_413BE(_reclamoBLL.ConsultarHistorial_413BE(idConsorcio, idProveedor, idCategoria, estado, desde, hasta));
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, this.Text);
            }
        }

        private void cboProveedorDesempeno_SelectedIndexChanged_413BE(object sender, EventArgs e)
        {
            btnVerDesempeno.Enabled = cboProveedorDesempeno.SelectedItem is Proveedor_413BE;
        }

        private void btnVerDesempeno_Click_413BE(object sender, EventArgs e)
        {
            if (cboProveedorDesempeno.SelectedItem is not Proveedor_413BE proveedor) return;
            try
            {
                _desempeno = _proveedorBLL.ObtenerDesempenoHistorico_413BE(proveedor.IdProveedor_413BE);
                dgvDesempeno.Rows.Clear();
                foreach (DesempenoProveedor_413BE d in _desempeno)
                {
                    dgvDesempeno.Rows.Add(d.NombreProveedor_413BE, d.NombreCategoria_413BE, d.PrecioPromedio_413BE.ToString("N2"),
                        d.TiempoPromedioDias_413BE.ToString("N1"), d.TasaReincidencia_413BE.ToString("N1"), d.CantidadResueltos_413BE);
                }
                dgvDesempeno.ClearSelection();
                btnExportarDesempeno.Enabled = true;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, this.Text);
            }
        }

        private void btnExportarHistorial_Click_413BE(object sender, EventArgs e)
        {
            dlgGuardarPdf.FileName = "historial_reclamos.pdf";
            if (dlgGuardarPdf.ShowDialog() != DialogResult.OK) return;
            try
            {
                _reclamoBLL.ExportarHistorial_413BE(_reclamos, dlgGuardarPdf.FileName);
                MessageBox.Show(lbPdfGenerado.Text, this.Text);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, this.Text);
            }
        }

        private void btnExportarDesempeno_Click_413BE(object sender, EventArgs e)
        {
            dlgGuardarPdf.FileName = "desempeno_proveedor.pdf";
            if (dlgGuardarPdf.ShowDialog() != DialogResult.OK) return;
            try
            {
                _proveedorBLL.ExportarDesempeno_413BE(_desempeno, dlgGuardarPdf.FileName);
                MessageBox.Show(lbPdfGenerado.Text, this.Text);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, this.Text);
            }
        }
    }
}
