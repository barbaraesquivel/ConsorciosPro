using BE;
using BLL;
using INT;
using SER;

namespace AppBase
{
    public partial class frmCargarClasificarReclamo_413BE : Form, IIdiomaObserver
    {
        private readonly ReclamoBLL_413BE _reclamoBLL = new ReclamoBLL_413BE();
        private CatalogosPN01_413BE _catalogos = null!;
        private bool _cargando;

        public frmCargarClasificarReclamo_413BE()
        {
            InitializeComponent();
        }

        private void frmCargarClasificarReclamo_FormClosing_413BE(object sender, FormClosingEventArgs e)
        {
            SessionManager.QuitarObservador(this);
        }

        public void ActualizarIdioma(IIdioma idioma)
        {
            frmMdiPrincipal f = (frmMdiPrincipal)this.MdiParent;
            f.CambiarIdiomaFormulario(this, idioma);
            CargarItemsFijos_413BE();
        }

        private void CargarItemsFijos_413BE()
        {
            int indiceTipo = cboTipoImputacion.SelectedIndex;
            cboTipoImputacion.Items.Clear();
            cboTipoImputacion.Items.Add(TraduccionAyuda_413BE.Obtener_413BE("enum_tipoImputacion_comun", "Común"));
            cboTipoImputacion.Items.Add(TraduccionAyuda_413BE.Obtener_413BE("enum_tipoImputacion_particular", "Particular"));
            cboTipoImputacion.SelectedIndex = indiceTipo;

            int indicePrioridad = cboPrioridad.SelectedIndex;
            cboPrioridad.Items.Clear();
            cboPrioridad.Items.Add(TraduccionAyuda_413BE.Obtener_413BE("enum_prioridad_urgente", "Urgente"));
            cboPrioridad.Items.Add(TraduccionAyuda_413BE.Obtener_413BE("enum_prioridad_media", "Media"));
            cboPrioridad.Items.Add(TraduccionAyuda_413BE.Obtener_413BE("enum_prioridad_baja", "Baja"));
            cboPrioridad.SelectedIndex = indicePrioridad;
        }

        private void frmCargarClasificarReclamo_Load_413BE(object sender, EventArgs e)
        {
            SessionManager.AgregarObservador(this);
            ActualizarIdioma(SessionManager.Idioma);
            _cargando = true;
            try
            {
                _catalogos = new CatalogosPN01_413BE();
                cboConsorcio.DisplayMember = "Nombre_413BE";
                cboConsorcio.ValueMember = "IdConsorcio_413BE";
                cboConsorcio.DataSource = new ConsorcioBLL_413BE().ObtenerActivos_413BE();
                cboCategoria.DisplayMember = "Nombre_413BE";
                cboCategoria.ValueMember = "IdCategoria_413BE";
                cboCategoria.DataSource = _catalogos.ObtenerCategorias_413BE();
                cboCategoriaClasificacion.DisplayMember = "Nombre_413BE";
                cboCategoriaClasificacion.ValueMember = "IdCategoria_413BE";
                cboCategoriaClasificacion.DataSource = _catalogos.ObtenerCategorias_413BE();
                cboConsorcio.SelectedIndex = -1;
                cboCategoria.SelectedIndex = -1;
                cboCategoriaClasificacion.SelectedIndex = -1;
                cboAreaComun.SelectedIndex = -1;
                cboTipoImputacion.SelectedIndex = -1;
                cboPrioridad.SelectedIndex = -1;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, this.Text);
            }
            finally
            {
                _cargando = false;
            }
            ActualizarPendientes_413BE();
            HabilitarGuardar_413BE();
        }

        private void ActualizarPendientes_413BE()
        {
            _cargando = true;
            try
            {
                dgvPendientes.Rows.Clear();
                foreach (Reclamo_413BE r in _reclamoBLL.ObtenerPendientes_413BE())
                {
                    int fila = dgvPendientes.Rows.Add(r.IdReclamo_413BE, r.FechaAlta_413BE.ToString("dd/MM/yyyy"),
                        _catalogos.NombreConsorcio_413BE(r.IdConsorcio_413BE), _catalogos.Ubicacion_413BE(r),
                        _catalogos.NombreCategoria_413BE(r.IdCategoria_413BE), CatalogosPN01_413BE.Estado_413BE(r.Estado_413BE));
                    dgvPendientes.Rows[fila].Tag = r;
                }
                dgvPendientes.ClearSelection();
                dgvPendientes.CurrentCell = null;
            }
            finally
            {
                _cargando = false;
            }
            MostrarDatosReclamo_413BE();
        }

        private Reclamo_413BE? ReclamoSeleccionado_413BE()
        {
            if (dgvPendientes.SelectedRows.Count == 0) return null;
            return dgvPendientes.SelectedRows[0].Tag as Reclamo_413BE;
        }

        private void MostrarDatosReclamo_413BE()
        {
            Reclamo_413BE? reclamo = ReclamoSeleccionado_413BE();
            if (reclamo == null)
            {
                txtDatosReclamo.Text = "";
                cboCategoriaClasificacion.SelectedIndex = -1;
                cboTipoImputacion.SelectedIndex = -1;
                cboPrioridad.SelectedIndex = -1;
            }
            else
            {
                txtDatosReclamo.Text = _catalogos.DatosReclamo_413BE(reclamo);
                cboCategoriaClasificacion.SelectedValue = reclamo.IdCategoria_413BE;
                cboTipoImputacion.SelectedIndex = -1;
                cboPrioridad.SelectedIndex = -1;
            }
            HabilitarClasificar_413BE();
        }

        private void HabilitarGuardar_413BE()
        {
            bool ubicacion = rdoUnidadFuncional.Checked ? cboUnidadFuncional.SelectedItem != null : cboAreaComun.SelectedIndex >= 0;
            btnGuardar.Enabled = cboConsorcio.SelectedItem != null && ubicacion && cboConsorcista.SelectedItem != null
                && cboCategoria.SelectedItem != null && txtDescripcion.Text.Trim().Length > 0;
        }

        private void HabilitarClasificar_413BE()
        {
            btnClasificar.Enabled = ReclamoSeleccionado_413BE() != null && cboCategoriaClasificacion.SelectedValue != null
                && cboTipoImputacion.SelectedIndex >= 0 && cboPrioridad.SelectedIndex >= 0;
        }

        private void CargarUnidades_413BE()
        {
            _cargando = true;
            cboUnidadFuncional.DisplayMember = "Identificador_413BE";
            cboUnidadFuncional.ValueMember = "IdUnidadFuncional_413BE";
            if (cboConsorcio.SelectedItem is Consorcio_413BE consorcio)
            {
                cboUnidadFuncional.DataSource = new UnidadFuncionalBLL_413BE().ObtenerActivasPorConsorcio_413BE(consorcio.IdConsorcio_413BE);
            }
            else
            {
                cboUnidadFuncional.DataSource = null;
            }
            cboUnidadFuncional.SelectedIndex = -1;
            _cargando = false;
            CargarConsorcistas_413BE();
        }

        private void CargarConsorcistas_413BE()
        {
            _cargando = true;
            List<Consorcista_413BE> consorcistas = new List<Consorcista_413BE>();
            if (cboConsorcio.SelectedItem is Consorcio_413BE consorcio)
            {
                if (rdoUnidadFuncional.Checked)
                {
                    if (cboUnidadFuncional.SelectedItem is UnidadFuncional_413BE unidad)
                    {
                        consorcistas = new ConsorcistaBLL_413BE().ObtenerActivosPorUnidad_413BE(unidad.IdUnidadFuncional_413BE);
                    }
                }
                else
                {
                    consorcistas = new ConsorcistaBLL_413BE().ObtenerActivosPorConsorcio_413BE(consorcio.IdConsorcio_413BE);
                }
            }
            cboConsorcista.DisplayMember = "Nombre_413BE";
            cboConsorcista.ValueMember = "IdConsorcista_413BE";
            cboConsorcista.DataSource = consorcistas;
            cboConsorcista.SelectedIndex = -1;
            _cargando = false;
            HabilitarGuardar_413BE();
        }

        private void cboConsorcio_SelectedIndexChanged_413BE(object sender, EventArgs e)
        {
            if (_cargando) return;
            CargarUnidades_413BE();
        }

        private void rdoUnidadFuncional_CheckedChanged_413BE(object sender, EventArgs e)
        {
            cboUnidadFuncional.Visible = rdoUnidadFuncional.Checked;
            cboAreaComun.Visible = !rdoUnidadFuncional.Checked;
            if (_cargando) return;
            CargarConsorcistas_413BE();
        }

        private void cboUnidadFuncional_SelectedIndexChanged_413BE(object sender, EventArgs e)
        {
            if (_cargando) return;
            CargarConsorcistas_413BE();
        }

        private void cboAreaComun_SelectedIndexChanged_413BE(object sender, EventArgs e)
        {
            HabilitarGuardar_413BE();
        }

        private void cboConsorcista_SelectedIndexChanged_413BE(object sender, EventArgs e)
        {
            HabilitarGuardar_413BE();
        }

        private void cboCategoria_SelectedIndexChanged_413BE(object sender, EventArgs e)
        {
            HabilitarGuardar_413BE();
        }

        private void txtDescripcion_TextChanged_413BE(object sender, EventArgs e)
        {
            HabilitarGuardar_413BE();
        }

        private void btnAdjuntarFoto_Click_413BE(object sender, EventArgs e)
        {
            if (dlgFoto.ShowDialog() == DialogResult.OK)
            {
                lstFotos.Items.Add(dlgFoto.FileName);
            }
        }

        private bool ConfirmarReincidencia_413BE(Reclamo_413BE original)
        {
            string mensaje = string.Format(lbConfirmarReincidencia.Text, original.IdReclamo_413BE);
            return MessageBox.Show(mensaje, this.Text, MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes;
        }

        private void btnGuardar_Click_413BE(object sender, EventArgs e)
        {
            try
            {
                Reclamo_413BE reclamo = new Reclamo_413BE();
                reclamo.IdConsorcio_413BE = ((Consorcio_413BE)cboConsorcio.SelectedItem!).IdConsorcio_413BE;
                reclamo.IdConsorcista_413BE = ((Consorcista_413BE)cboConsorcista.SelectedItem!).IdConsorcista_413BE;
                reclamo.IdCategoria_413BE = ((Categoria_413BE)cboCategoria.SelectedItem!).IdCategoria_413BE;
                if (rdoUnidadFuncional.Checked)
                {
                    reclamo.IdUnidadFuncional_413BE = ((UnidadFuncional_413BE)cboUnidadFuncional.SelectedItem!).IdUnidadFuncional_413BE;
                }
                else
                {
                    reclamo.AreaComun_413BE = cboAreaComun.SelectedItem!.ToString();
                }
                reclamo.Descripcion_413BE = txtDescripcion.Text.Trim();
                List<string> rutasFotos = lstFotos.Items.Cast<string>().ToList();

                Reclamo_413BE original = _reclamoBLL.DetectarReincidencia_413BE(reclamo);
                bool esReincidencia = false;
                if (original != null)
                {
                    esReincidencia = ConfirmarReincidencia_413BE(original);
                }
                int idReclamo = _reclamoBLL.CargarReclamo_413BE(reclamo, rutasFotos);
                if (esReincidencia)
                {
                    _reclamoBLL.MarcarReincidencia_413BE(idReclamo, original!.IdReclamo_413BE);
                }
                ActualizarPendientes_413BE();
                txtDescripcion.Text = "";
                lstFotos.Items.Clear();
                MessageBox.Show(lbReclamoRegistrado.Text, this.Text);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, this.Text);
            }
        }

        private void dgvPendientes_SelectionChanged_413BE(object sender, EventArgs e)
        {
            if (_cargando) return;
            MostrarDatosReclamo_413BE();
        }

        private void cboCategoriaClasificacion_SelectedIndexChanged_413BE(object sender, EventArgs e)
        {
            HabilitarClasificar_413BE();
        }

        private void cboTipoImputacion_SelectedIndexChanged_413BE(object sender, EventArgs e)
        {
            HabilitarClasificar_413BE();
        }

        private void cboPrioridad_SelectedIndexChanged_413BE(object sender, EventArgs e)
        {
            HabilitarClasificar_413BE();
        }

        private void btnClasificar_Click_413BE(object sender, EventArgs e)
        {
            Reclamo_413BE? reclamo = ReclamoSeleccionado_413BE();
            if (reclamo == null) return;
            try
            {
                int idCategoria = Convert.ToInt32(cboCategoriaClasificacion.SelectedValue);
                TipoImputacion_413BE tipo = (TipoImputacion_413BE)cboTipoImputacion.SelectedIndex;
                PrioridadReclamo_413BE prioridad = (PrioridadReclamo_413BE)cboPrioridad.SelectedIndex;
                _reclamoBLL.ClasificarReclamo_413BE(reclamo.IdReclamo_413BE, idCategoria, tipo, prioridad);
                ActualizarPendientes_413BE();
                MessageBox.Show(lbReclamoClasificado.Text, this.Text);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, this.Text);
            }
        }
    }
}
