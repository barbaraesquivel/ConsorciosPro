using BE;
using BLL;
using INT;
using SER;

namespace AppBase
{
    public partial class frmMantenimientoProveedores_413BE : Form, IIdiomaObserver
    {
        private readonly ProveedorBLL_413BE _proveedorBLL_413BE = new ProveedorBLL_413BE();
        private bool _cargando_413BE;

        public frmMantenimientoProveedores_413BE()
        {
            InitializeComponent();
        }

        private void frmMantenimientoProveedores_FormClosing_413BE(object sender, FormClosingEventArgs e)
        {
            SessionManager.QuitarObservador(this);
        }

        public void ActualizarIdioma(IIdioma idioma)
        {
            frmMdiPrincipal f = (frmMdiPrincipal)this.MdiParent!;
            f.CambiarIdiomaFormulario(this, idioma);
        }

        private void frmMantenimientoProveedores_Load_413BE(object sender, EventArgs e)
        {
            SessionManager.AgregarObservador(this);
            ActualizarIdioma(SessionManager.Idioma);
            CargarProveedores_413BE();
        }

        private void CargarProveedores_413BE()
        {
            _cargando_413BE = true;
            try
            {
                dgvProveedores.Rows.Clear();
                foreach (Proveedor_413BE p in _proveedorBLL_413BE.ObtenerTodos_413BE())
                {
                    int fila = dgvProveedores.Rows.Add(p.IdProveedor_413BE, p.Nombre_413BE, p.Cuit_413BE, p.Email_413BE, p.Habilitado_413BE ? "Sí" : "No");
                    dgvProveedores.Rows[fila].Tag = p;
                }
                dgvProveedores.ClearSelection();
                dgvProveedores.CurrentCell = null;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, this.Text);
            }
            finally
            {
                _cargando_413BE = false;
            }
            MostrarSeleccionado_413BE();
        }

        private Proveedor_413BE? ProveedorSeleccionado_413BE()
        {
            if (dgvProveedores.SelectedRows.Count == 0) return null;
            return dgvProveedores.SelectedRows[0].Tag as Proveedor_413BE;
        }

        private void MostrarSeleccionado_413BE()
        {
            Proveedor_413BE? seleccionado = ProveedorSeleccionado_413BE();
            txtNombre.Text = seleccionado?.Nombre_413BE ?? "";
            txtCuit.Text = seleccionado?.Cuit_413BE ?? "";
            txtEmail.Text = seleccionado?.Email_413BE ?? "";
            btnModificar.Enabled = seleccionado != null;
            btnInhabilitar.Enabled = seleccionado != null && seleccionado.Habilitado_413BE;
            btnHabilitar.Enabled = seleccionado != null && !seleccionado.Habilitado_413BE;
        }

        private void dgvProveedores_SelectionChanged_413BE(object sender, EventArgs e)
        {
            if (_cargando_413BE) return;
            MostrarSeleccionado_413BE();
        }

        private void btnNuevo_Click_413BE(object sender, EventArgs e)
        {
            using (frmRegistrarProveedor_413BE f = new frmRegistrarProveedor_413BE(0))
            {
                f.StartPosition = FormStartPosition.CenterParent;
                f.ShowDialog(this);
            }
            CargarProveedores_413BE();
        }

        private void btnModificar_Click_413BE(object sender, EventArgs e)
        {
            Proveedor_413BE? seleccionado = ProveedorSeleccionado_413BE();
            if (seleccionado == null) return;
            Proveedor_413BE proveedor = new Proveedor_413BE();
            proveedor.IdProveedor_413BE = seleccionado.IdProveedor_413BE;
            proveedor.Nombre_413BE = txtNombre.Text;
            proveedor.Cuit_413BE = txtCuit.Text;
            proveedor.Email_413BE = txtEmail.Text;
            proveedor.Habilitado_413BE = seleccionado.Habilitado_413BE;
            try
            {
                _proveedorBLL_413BE.ModificarProveedor_413BE(proveedor);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, this.Text);
                return;
            }
            MessageBox.Show(TraduccionAyuda_413BE.Obtener_413BE("msg_proveedorModificado", "Proveedor modificado"), this.Text);
            CargarProveedores_413BE();
        }

        private void btnInhabilitar_Click_413BE(object sender, EventArgs e)
        {
            Proveedor_413BE? seleccionado = ProveedorSeleccionado_413BE();
            if (seleccionado == null) return;
            try
            {
                _proveedorBLL_413BE.InhabilitarProveedor_413BE(seleccionado.IdProveedor_413BE);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, this.Text);
                return;
            }
            CargarProveedores_413BE();
        }

        private void btnHabilitar_Click_413BE(object sender, EventArgs e)
        {
            Proveedor_413BE? seleccionado = ProveedorSeleccionado_413BE();
            if (seleccionado == null) return;
            try
            {
                _proveedorBLL_413BE.HabilitarProveedor_413BE(seleccionado.IdProveedor_413BE);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, this.Text);
                return;
            }
            CargarProveedores_413BE();
        }
    }
}
