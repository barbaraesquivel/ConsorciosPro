using BE;
using BLL;
using INT;
using SER;

namespace AppBase
{
    public partial class frmBitacoraProveedores_413BE : Form, IIdiomaObserver
    {
        private readonly ProveedorBLL_413BE _proveedorBLL_413BE = new ProveedorBLL_413BE();
        private readonly ProveedorCBLL_413BE _proveedorCBLL_413BE = new ProveedorCBLL_413BE();

        public frmBitacoraProveedores_413BE()
        {
            InitializeComponent();
        }

        private void frmBitacoraProveedores_FormClosing_413BE(object sender, FormClosingEventArgs e)
        {
            SessionManager.QuitarObservador(this);
        }

        public void ActualizarIdioma(IIdioma idioma)
        {
            frmMdiPrincipal f = (frmMdiPrincipal)this.MdiParent!;
            f.CambiarIdiomaFormulario(this, idioma);
            string todos = TraduccionAyuda_413BE.Obtener_413BE("enum_bitprov_todos", "Todos");
            foreach (ComboBox combo in new[] { cboCodigo, cboNombre })
            {
                if (combo.Items.Count > 0)
                {
                    int indice = combo.SelectedIndex;
                    combo.Items[0] = todos;
                    combo.SelectedIndex = indice;
                }
            }
        }

        private void frmBitacoraProveedores_Load_413BE(object sender, EventArgs e)
        {
            SessionManager.AgregarObservador(this);
            string todos = TraduccionAyuda_413BE.Obtener_413BE("enum_bitprov_todos", "Todos");
            try
            {
                cboCodigo.Items.Clear();
                cboCodigo.Items.Add(todos);
                foreach (int codigo in _proveedorBLL_413BE.ObtenerTodos_413BE().Select(p => p.IdProveedor_413BE).OrderBy(c => c))
                {
                    cboCodigo.Items.Add(codigo);
                }
                cboCodigo.SelectedIndex = 0;

                List<ProveedorC_413BE> historial = _proveedorCBLL_413BE.ObtenerHistorial_413BE(null, null);
                cboNombre.Items.Clear();
                cboNombre.Items.Add(todos);
                foreach (string nombre in historial.Select(v => v.Nombre_413BE).Distinct().OrderBy(n => n))
                {
                    cboNombre.Items.Add(nombre);
                }
                cboNombre.SelectedIndex = 0;
                MostrarBitacora_413BE(historial);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, this.Text);
            }
            ActualizarIdioma(SessionManager.Idioma);
        }

        private void MostrarBitacora_413BE(List<ProveedorC_413BE> historial)
        {
            dgvBitacora.Rows.Clear();
            foreach (ProveedorC_413BE v in historial)
            {
                int fila = dgvBitacora.Rows.Add(v.IdProveedor_413BE, v.Fecha_413BE.ToString("dd/MM/yyyy"), v.Hora_413BE.ToString(@"hh\:mm\:ss"),
                    v.Nombre_413BE, v.Cuit_413BE, v.Email_413BE, v.Habilitado_413BE ? "Sí" : "No", v.Act_413BE ? 1 : 0);
                dgvBitacora.Rows[fila].Tag = v;
                if (v.Act_413BE)
                {
                    dgvBitacora.Rows[fila].DefaultCellStyle.BackColor = Color.LightGreen;
                    dgvBitacora.Rows[fila].DefaultCellStyle.Font = new Font(dgvBitacora.Font, FontStyle.Bold);
                }
            }
            dgvBitacora.ClearSelection();
            dgvBitacora.CurrentCell = null;
        }

        private void RecargarBitacora_413BE()
        {
            int? codigo = cboCodigo.SelectedIndex > 0 ? (int)cboCodigo.SelectedItem! : null;
            string? nombre = cboNombre.SelectedIndex > 0 ? cboNombre.SelectedItem!.ToString() : null;
            MostrarBitacora_413BE(_proveedorCBLL_413BE.ObtenerHistorial_413BE(codigo, nombre));
        }

        private void cboFiltro_SelectionChangeCommitted_413BE(object sender, EventArgs e)
        {
            try
            {
                RecargarBitacora_413BE();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, this.Text);
            }
        }

        private void btnAplicar_Click_413BE(object sender, EventArgs e)
        {
            if (dgvBitacora.SelectedRows.Count == 0 || dgvBitacora.SelectedRows[0].Tag is not ProveedorC_413BE version)
            {
                MessageBox.Show(TraduccionAyuda_413BE.Obtener_413BE("ex_versionNoSeleccionada", "Seleccione una versión de la bitácora"), this.Text);
                return;
            }
            try
            {
                _proveedorCBLL_413BE.AplicarVersion_413BE(version.IdProveedorC_413BE);
            }
            catch (InvalidOperationException ex)
            {
                MessageBox.Show(ex.Message, this.Text);
                return;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, this.Text);
                return;
            }
            MessageBox.Show(TraduccionAyuda_413BE.Obtener_413BE("msg_versionAplicada", "Versión aplicada"), this.Text);
            try
            {
                RecargarBitacora_413BE();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, this.Text);
            }
        }

        private void btnSalir_Click_413BE(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
