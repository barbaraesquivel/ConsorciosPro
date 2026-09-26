using BE;
using BLL;
using INT;
using SER;

namespace AppBase
{
    public partial class frmMantenimientoConsorcios_413BE : Form, IIdiomaObserver
    {
        private readonly ConsorcioBLL_413BE _consorcioBLL = new ConsorcioBLL_413BE();
        private readonly UnidadFuncionalBLL_413BE _unidadBLL = new UnidadFuncionalBLL_413BE();
        private readonly ConsorcistaBLL_413BE _consorcistaBLL = new ConsorcistaBLL_413BE();
        private bool _cargando;
        private int? _idConsorcioSeleccionado;
        private int? _idUnidadFuncionalSeleccionada;
        private int? _idConsorcistaSeleccionado;

        public frmMantenimientoConsorcios_413BE()
        {
            InitializeComponent();
        }

        private void frmMantenimientoConsorcios_FormClosing_413BE(object sender, FormClosingEventArgs e)
        {
            SessionManager.QuitarObservador(this);
        }

        public void ActualizarIdioma(IIdioma idioma)
        {
            frmMdiPrincipal f = (frmMdiPrincipal)this.MdiParent;
            f.CambiarIdiomaFormulario(this, idioma);
            CargarTiposUnidadFuncional_413BE();
        }

        private void CargarTiposUnidadFuncional_413BE()
        {
            string? tipoSeleccionado = cboTipo.SelectedItem is KeyValuePair<string, string> actual ? actual.Key : null;
            cboTipo.DisplayMember = "Value";
            cboTipo.Items.Clear();
            cboTipo.Items.Add(new KeyValuePair<string, string>("Departamento", TraduccionAyuda_413BE.Obtener_413BE("enum_tipoUF_departamento", "Departamento")));
            cboTipo.Items.Add(new KeyValuePair<string, string>("Cochera", TraduccionAyuda_413BE.Obtener_413BE("enum_tipoUF_cochera", "Cochera")));
            cboTipo.Items.Add(new KeyValuePair<string, string>("Local", TraduccionAyuda_413BE.Obtener_413BE("enum_tipoUF_local", "Local")));
            cboTipo.Items.Add(new KeyValuePair<string, string>("Baulera", TraduccionAyuda_413BE.Obtener_413BE("enum_tipoUF_baulera", "Baulera")));
            if (tipoSeleccionado != null)
            {
                foreach (KeyValuePair<string, string> item in cboTipo.Items)
                {
                    if (item.Key == tipoSeleccionado) { cboTipo.SelectedItem = item; break; }
                }
            }
        }

        private void frmMantenimientoConsorcios_Load_413BE(object sender, EventArgs e)
        {
            SessionManager.AgregarObservador(this);
            ActualizarIdioma(SessionManager.Idioma);
            ActualizarConsorcios_413BE();
            ActualizarCombosConsorcio_413BE();
        }

        private void ActualizarConsorcios_413BE()
        {
            _cargando = true;
            try
            {
                dgvConsorcios.Rows.Clear();
                foreach (Consorcio_413BE c in _consorcioBLL.ObtenerTodos_413BE())
                {
                    int fila = dgvConsorcios.Rows.Add(c.IdConsorcio_413BE, c.Nombre_413BE, c.Direccion_413BE, c.CantidadUnidades_413BE, c.Activo_413BE ? "Sí" : "No");
                    dgvConsorcios.Rows[fila].Tag = c;
                }
                dgvConsorcios.ClearSelection();
                dgvConsorcios.CurrentCell = null;
            }
            finally
            {
                _cargando = false;
            }
            LimpiarFormularioConsorcio_413BE();
        }

        private Consorcio_413BE? ConsorcioSeleccionado_413BE()
        {
            if (dgvConsorcios.SelectedRows.Count == 0) return null;
            return dgvConsorcios.SelectedRows[0].Tag as Consorcio_413BE;
        }

        private void LimpiarFormularioConsorcio_413BE()
        {
            _idConsorcioSeleccionado = null;
            _cargando = true;
            txtNombre.Text = "";
            txtDireccion.Text = "";
            numCantidadUnidades.Value = numCantidadUnidades.Minimum;
            chkActivo.Checked = false;
            _cargando = false;
            HabilitarBotonesConsorcio_413BE();
        }

        private void HabilitarBotonesConsorcio_413BE()
        {
            Consorcio_413BE? seleccionado = ConsorcioSeleccionado_413BE();
            btnGuardarConsorcio.Enabled = txtNombre.Text.Trim().Length > 0 && txtDireccion.Text.Trim().Length > 0;
            btnInactivarConsorcio.Enabled = seleccionado != null && seleccionado.Activo_413BE;
            btnReactivarConsorcio.Enabled = seleccionado != null && !seleccionado.Activo_413BE;
            btnCancelarConsorcio.Enabled = seleccionado != null;
        }

        private void dgvConsorcios_SelectionChanged_413BE(object sender, EventArgs e)
        {
            if (_cargando) return;
            Consorcio_413BE? seleccionado = ConsorcioSeleccionado_413BE();
            _idConsorcioSeleccionado = seleccionado?.IdConsorcio_413BE;
            _cargando = true;
            txtNombre.Text = seleccionado?.Nombre_413BE ?? "";
            txtDireccion.Text = seleccionado?.Direccion_413BE ?? "";
            numCantidadUnidades.Value = seleccionado == null ? numCantidadUnidades.Minimum : Math.Max(seleccionado.CantidadUnidades_413BE, (int)numCantidadUnidades.Minimum);
            chkActivo.Checked = seleccionado?.Activo_413BE ?? false;
            _cargando = false;
            HabilitarBotonesConsorcio_413BE();
        }

        private void btnNuevoConsorcio_Click_413BE(object sender, EventArgs e)
        {
            dgvConsorcios.ClearSelection();
            LimpiarFormularioConsorcio_413BE();
        }

        private void txtNombre_TextChanged_413BE(object sender, EventArgs e) => HabilitarBotonesConsorcio_413BE();
        private void txtDireccion_TextChanged_413BE(object sender, EventArgs e) => HabilitarBotonesConsorcio_413BE();
        private void numCantidadUnidades_ValueChanged_413BE(object sender, EventArgs e) => HabilitarBotonesConsorcio_413BE();

        private void btnGuardarConsorcio_Click_413BE(object sender, EventArgs e)
        {
            try
            {
                if (_idConsorcioSeleccionado == null)
                {
                    Consorcio_413BE consorcio = new Consorcio_413BE();
                    consorcio.Nombre_413BE = txtNombre.Text.Trim();
                    consorcio.Direccion_413BE = txtDireccion.Text.Trim();
                    consorcio.CantidadUnidades_413BE = (int)numCantidadUnidades.Value;
                    _consorcioBLL.Insertar_413BE(consorcio);
                }
                else
                {
                    Consorcio_413BE consorcio = _consorcioBLL.ObtenerPorId_413BE(_idConsorcioSeleccionado.Value);
                    consorcio.Nombre_413BE = txtNombre.Text.Trim();
                    consorcio.Direccion_413BE = txtDireccion.Text.Trim();
                    consorcio.CantidadUnidades_413BE = (int)numCantidadUnidades.Value;
                    _consorcioBLL.Actualizar_413BE(consorcio);
                }
                ActualizarConsorcios_413BE();
                ActualizarCombosConsorcio_413BE();
                MessageBox.Show(lbGuardado.Text, this.Text);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, this.Text);
            }
        }

        private void btnInactivarConsorcio_Click_413BE(object sender, EventArgs e)
        {
            if (_idConsorcioSeleccionado == null) return;
            try
            {
                _consorcioBLL.Inactivar_413BE(_idConsorcioSeleccionado.Value);
                ActualizarConsorcios_413BE();
                ActualizarCombosConsorcio_413BE();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, this.Text);
            }
        }

        private void btnReactivarConsorcio_Click_413BE(object sender, EventArgs e)
        {
            if (_idConsorcioSeleccionado == null) return;
            try
            {
                _consorcioBLL.Reactivar_413BE(_idConsorcioSeleccionado.Value);
                ActualizarConsorcios_413BE();
                ActualizarCombosConsorcio_413BE();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, this.Text);
            }
        }

        private void btnCancelarConsorcio_Click_413BE(object sender, EventArgs e)
        {
            dgvConsorcios.ClearSelection();
            LimpiarFormularioConsorcio_413BE();
        }

        private void ActualizarCombosConsorcio_413BE()
        {
            _cargando = true;
            List<Consorcio_413BE> consorcios = _consorcioBLL.ObtenerTodos_413BE();
            foreach (ComboBox combo in new[] { cboConsorcio, cboConsorcioConsorcista })
            {
                object? anterior = combo.SelectedValue;
                combo.DisplayMember = "Nombre_413BE";
                combo.ValueMember = "IdConsorcio_413BE";
                combo.DataSource = consorcios.ToList();
                if (anterior != null) combo.SelectedValue = anterior;
                if (combo.SelectedIndex < 0 && consorcios.Count > 0) combo.SelectedIndex = 0;
            }
            _cargando = false;
            ActualizarUnidadesFuncionales_413BE();
            ActualizarUnidadesFuncionalesConsorcista_413BE();
        }

        private void ActualizarUnidadesFuncionales_413BE()
        {
            _cargando = true;
            try
            {
                dgvUnidadesFuncionales.Rows.Clear();
                if (cboConsorcio.SelectedItem is Consorcio_413BE consorcio)
                {
                    foreach (UnidadFuncional_413BE u in _unidadBLL.ObtenerPorConsorcio_413BE(consorcio.IdConsorcio_413BE))
                    {
                        int fila = dgvUnidadesFuncionales.Rows.Add(u.IdUnidadFuncional_413BE, u.Identificador_413BE, u.Tipo_413BE, u.Activa_413BE ? "Sí" : "No");
                        dgvUnidadesFuncionales.Rows[fila].Tag = u;
                    }
                }
                dgvUnidadesFuncionales.ClearSelection();
                dgvUnidadesFuncionales.CurrentCell = null;
            }
            finally
            {
                _cargando = false;
            }
            LimpiarFormularioUnidadFuncional_413BE();
        }

        private UnidadFuncional_413BE? UnidadFuncionalSeleccionada_413BE()
        {
            if (dgvUnidadesFuncionales.SelectedRows.Count == 0) return null;
            return dgvUnidadesFuncionales.SelectedRows[0].Tag as UnidadFuncional_413BE;
        }

        private void LimpiarFormularioUnidadFuncional_413BE()
        {
            _idUnidadFuncionalSeleccionada = null;
            _cargando = true;
            txtIdentificador.Text = "";
            cboTipo.SelectedIndex = -1;
            chkActiva.Checked = false;
            _cargando = false;
            HabilitarBotonesUnidadFuncional_413BE();
        }

        private void HabilitarBotonesUnidadFuncional_413BE()
        {
            UnidadFuncional_413BE? seleccionada = UnidadFuncionalSeleccionada_413BE();
            btnGuardarUnidadFuncional.Enabled = cboConsorcio.SelectedItem is Consorcio_413BE && txtIdentificador.Text.Trim().Length > 0 && cboTipo.SelectedIndex >= 0;
            btnInactivarUnidadFuncional.Enabled = seleccionada != null && seleccionada.Activa_413BE;
            btnReactivarUnidadFuncional.Enabled = seleccionada != null && !seleccionada.Activa_413BE;
            btnCancelarUnidadFuncional.Enabled = seleccionada != null;
        }

        private void cboConsorcio_SelectedIndexChanged_413BE(object sender, EventArgs e)
        {
            if (_cargando) return;
            ActualizarUnidadesFuncionales_413BE();
        }

        private void dgvUnidadesFuncionales_SelectionChanged_413BE(object sender, EventArgs e)
        {
            if (_cargando) return;
            UnidadFuncional_413BE? seleccionada = UnidadFuncionalSeleccionada_413BE();
            _idUnidadFuncionalSeleccionada = seleccionada?.IdUnidadFuncional_413BE;
            _cargando = true;
            txtIdentificador.Text = seleccionada?.Identificador_413BE ?? "";
            cboTipo.SelectedIndex = -1;
            if (seleccionada != null)
            {
                foreach (KeyValuePair<string, string> item in cboTipo.Items)
                {
                    if (item.Key == seleccionada.Tipo_413BE) { cboTipo.SelectedItem = item; break; }
                }
            }
            chkActiva.Checked = seleccionada?.Activa_413BE ?? false;
            _cargando = false;
            HabilitarBotonesUnidadFuncional_413BE();
        }

        private void btnNuevoUnidadFuncional_Click_413BE(object sender, EventArgs e)
        {
            dgvUnidadesFuncionales.ClearSelection();
            LimpiarFormularioUnidadFuncional_413BE();
        }

        private void txtIdentificador_TextChanged_413BE(object sender, EventArgs e) => HabilitarBotonesUnidadFuncional_413BE();
        private void cboTipo_SelectedIndexChanged_413BE(object sender, EventArgs e) => HabilitarBotonesUnidadFuncional_413BE();

        private void btnGuardarUnidadFuncional_Click_413BE(object sender, EventArgs e)
        {
            if (cboConsorcio.SelectedItem is not Consorcio_413BE consorcio) return;
            try
            {
                if (_idUnidadFuncionalSeleccionada == null)
                {
                    UnidadFuncional_413BE unidad = new UnidadFuncional_413BE();
                    unidad.IdConsorcio_413BE = consorcio.IdConsorcio_413BE;
                    unidad.Identificador_413BE = txtIdentificador.Text.Trim();
                    unidad.Tipo_413BE = ((KeyValuePair<string, string>)cboTipo.SelectedItem!).Key;
                    _unidadBLL.Insertar_413BE(unidad);
                }
                else
                {
                    UnidadFuncional_413BE unidad = _unidadBLL.ObtenerPorId_413BE(_idUnidadFuncionalSeleccionada.Value);
                    unidad.Identificador_413BE = txtIdentificador.Text.Trim();
                    unidad.Tipo_413BE = ((KeyValuePair<string, string>)cboTipo.SelectedItem!).Key;
                    _unidadBLL.Actualizar_413BE(unidad);
                }
                ActualizarUnidadesFuncionales_413BE();
                ActualizarUnidadesFuncionalesConsorcista_413BE();
                MessageBox.Show(lbGuardado.Text, this.Text);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, this.Text);
            }
        }

        private void btnInactivarUnidadFuncional_Click_413BE(object sender, EventArgs e)
        {
            if (_idUnidadFuncionalSeleccionada == null) return;
            try
            {
                _unidadBLL.Inactivar_413BE(_idUnidadFuncionalSeleccionada.Value);
                ActualizarUnidadesFuncionales_413BE();
                ActualizarUnidadesFuncionalesConsorcista_413BE();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, this.Text);
            }
        }

        private void btnReactivarUnidadFuncional_Click_413BE(object sender, EventArgs e)
        {
            if (_idUnidadFuncionalSeleccionada == null) return;
            try
            {
                _unidadBLL.Reactivar_413BE(_idUnidadFuncionalSeleccionada.Value);
                ActualizarUnidadesFuncionales_413BE();
                ActualizarUnidadesFuncionalesConsorcista_413BE();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, this.Text);
            }
        }

        private void btnCancelarUnidadFuncional_Click_413BE(object sender, EventArgs e)
        {
            dgvUnidadesFuncionales.ClearSelection();
            LimpiarFormularioUnidadFuncional_413BE();
        }

        private void ActualizarUnidadesFuncionalesConsorcista_413BE()
        {
            _cargando = true;
            if (cboConsorcioConsorcista.SelectedItem is Consorcio_413BE consorcio)
            {
                cboUnidadFuncionalConsorcista.DisplayMember = "Identificador_413BE";
                cboUnidadFuncionalConsorcista.ValueMember = "IdUnidadFuncional_413BE";
                cboUnidadFuncionalConsorcista.DataSource = _unidadBLL.ObtenerPorConsorcio_413BE(consorcio.IdConsorcio_413BE);
            }
            else
            {
                cboUnidadFuncionalConsorcista.DataSource = null;
            }
            _cargando = false;
            ActualizarConsorcistas_413BE();
        }

        private void ActualizarConsorcistas_413BE()
        {
            _cargando = true;
            try
            {
                dgvConsorcistas.Rows.Clear();
                if (cboUnidadFuncionalConsorcista.SelectedItem is UnidadFuncional_413BE unidad)
                {
                    foreach (Consorcista_413BE p in _consorcistaBLL.ObtenerPorUnidad_413BE(unidad.IdUnidadFuncional_413BE))
                    {
                        int fila = dgvConsorcistas.Rows.Add(p.IdConsorcista_413BE, p.Dni_413BE, p.Nombre_413BE, p.Email_413BE,
                            p.EsPropietario_413BE ? "Propietario" : "Inquilino", p.Activo_413BE ? "Sí" : "No");
                        dgvConsorcistas.Rows[fila].Tag = p;
                    }
                }
                dgvConsorcistas.ClearSelection();
                dgvConsorcistas.CurrentCell = null;
            }
            finally
            {
                _cargando = false;
            }
            LimpiarFormularioConsorcista_413BE();
        }

        private Consorcista_413BE? ConsorcistaSeleccionado_413BE()
        {
            if (dgvConsorcistas.SelectedRows.Count == 0) return null;
            return dgvConsorcistas.SelectedRows[0].Tag as Consorcista_413BE;
        }

        private void LimpiarFormularioConsorcista_413BE()
        {
            _idConsorcistaSeleccionado = null;
            _cargando = true;
            txtDni.Text = "";
            txtNombreConsorcista.Text = "";
            txtEmailConsorcista.Text = "";
            rdoPropietario.Checked = true;
            chkActivoConsorcista.Checked = false;
            _cargando = false;
            HabilitarBotonesConsorcista_413BE();
        }

        private void HabilitarBotonesConsorcista_413BE()
        {
            Consorcista_413BE? seleccionado = ConsorcistaSeleccionado_413BE();
            btnGuardarConsorcista.Enabled = cboUnidadFuncionalConsorcista.SelectedItem is UnidadFuncional_413BE
                && txtDni.Text.Trim().Length > 0 && txtNombreConsorcista.Text.Trim().Length > 0;
            btnInactivarConsorcista.Enabled = seleccionado != null && seleccionado.Activo_413BE;
            btnReactivarConsorcista.Enabled = seleccionado != null && !seleccionado.Activo_413BE;
            btnCancelarConsorcista.Enabled = seleccionado != null;
        }

        private void cboConsorcioConsorcista_SelectedIndexChanged_413BE(object sender, EventArgs e)
        {
            if (_cargando) return;
            ActualizarUnidadesFuncionalesConsorcista_413BE();
        }

        private void cboUnidadFuncionalConsorcista_SelectedIndexChanged_413BE(object sender, EventArgs e)
        {
            if (_cargando) return;
            ActualizarConsorcistas_413BE();
        }

        private void dgvConsorcistas_SelectionChanged_413BE(object sender, EventArgs e)
        {
            if (_cargando) return;
            Consorcista_413BE? seleccionado = ConsorcistaSeleccionado_413BE();
            _idConsorcistaSeleccionado = seleccionado?.IdConsorcista_413BE;
            _cargando = true;
            txtDni.Text = seleccionado?.Dni_413BE ?? "";
            txtNombreConsorcista.Text = seleccionado?.Nombre_413BE ?? "";
            txtEmailConsorcista.Text = seleccionado?.Email_413BE ?? "";
            rdoPropietario.Checked = seleccionado?.EsPropietario_413BE ?? true;
            rdoInquilino.Checked = seleccionado != null && !seleccionado.EsPropietario_413BE;
            chkActivoConsorcista.Checked = seleccionado?.Activo_413BE ?? false;
            _cargando = false;
            HabilitarBotonesConsorcista_413BE();
        }

        private void btnNuevoConsorcista_Click_413BE(object sender, EventArgs e)
        {
            dgvConsorcistas.ClearSelection();
            LimpiarFormularioConsorcista_413BE();
        }

        private void rdoPropietario_CheckedChanged_413BE(object sender, EventArgs e) { }
        private void txtDni_TextChanged_413BE(object sender, EventArgs e) => HabilitarBotonesConsorcista_413BE();
        private void txtNombreConsorcista_TextChanged_413BE(object sender, EventArgs e) => HabilitarBotonesConsorcista_413BE();
        private void txtEmailConsorcista_TextChanged_413BE(object sender, EventArgs e) => HabilitarBotonesConsorcista_413BE();

        private void btnGuardarConsorcista_Click_413BE(object sender, EventArgs e)
        {
            if (cboUnidadFuncionalConsorcista.SelectedItem is not UnidadFuncional_413BE unidad) return;
            try
            {
                if (_idConsorcistaSeleccionado == null)
                {
                    Consorcista_413BE consorcista = new Consorcista_413BE();
                    consorcista.IdUnidadFuncional_413BE = unidad.IdUnidadFuncional_413BE;
                    consorcista.Dni_413BE = txtDni.Text.Trim();
                    consorcista.Nombre_413BE = txtNombreConsorcista.Text.Trim();
                    consorcista.Email_413BE = txtEmailConsorcista.Text.Trim();
                    consorcista.EsPropietario_413BE = rdoPropietario.Checked;
                    _consorcistaBLL.Insertar_413BE(consorcista);
                }
                else
                {
                    Consorcista_413BE consorcista = _consorcistaBLL.ObtenerPorId_413BE(_idConsorcistaSeleccionado.Value);
                    consorcista.Dni_413BE = txtDni.Text.Trim();
                    consorcista.Nombre_413BE = txtNombreConsorcista.Text.Trim();
                    consorcista.Email_413BE = txtEmailConsorcista.Text.Trim();
                    consorcista.EsPropietario_413BE = rdoPropietario.Checked;
                    _consorcistaBLL.Actualizar_413BE(consorcista);
                }
                ActualizarConsorcistas_413BE();
                MessageBox.Show(lbGuardado.Text, this.Text);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, this.Text);
            }
        }

        private void btnInactivarConsorcista_Click_413BE(object sender, EventArgs e)
        {
            if (_idConsorcistaSeleccionado == null) return;
            try
            {
                _consorcistaBLL.Inactivar_413BE(_idConsorcistaSeleccionado.Value);
                ActualizarConsorcistas_413BE();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, this.Text);
            }
        }

        private void btnReactivarConsorcista_Click_413BE(object sender, EventArgs e)
        {
            if (_idConsorcistaSeleccionado == null) return;
            try
            {
                _consorcistaBLL.Reactivar_413BE(_idConsorcistaSeleccionado.Value);
                ActualizarConsorcistas_413BE();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, this.Text);
            }
        }

        private void btnCancelarConsorcista_Click_413BE(object sender, EventArgs e)
        {
            dgvConsorcistas.ClearSelection();
            LimpiarFormularioConsorcista_413BE();
        }
    }
}
