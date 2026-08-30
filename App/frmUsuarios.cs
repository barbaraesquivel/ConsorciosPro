using BE;
using BLL;
using INT;
using Microsoft.VisualBasic.ApplicationServices;
using SER.Composite;
using SER;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace AppBase
{
    public partial class frmUsuarios : Form, IIdiomaObserver
    {
        public frmUsuarios()
        {
            InitializeComponent();
            datas.Add(dataFamilias);
            datas.Add(dataPermisos);
            datas.Add(dataPermisosFamilias);
            datas.Add(dataPermisosUser);
            datas.Add(dataUsuarios);
        }
        List<DataGridView> datas = new List<DataGridView>();
        UsuarioBLL _users = new UsuarioBLL();
        PermisoBLL _permisos = new PermisoBLL();
        Usuario mUser;
        private void Actualizar(bool datos, bool editor)
        {
            foreach (Control c in this.Controls)
            {
                if (c is Button || c is TextBox || c is DataGridView || c is GroupBox)
                {
                    c.Visible = datos;
                    if (c is TextBox)
                        c.Visible = editor;
                }
            }
            btnSalir.Visible = true;
            lbEmail.Visible = editor;
            lbPass.Visible = editor;
            lbPermisosUsuario.Visible = datos;
            dataUsuarios.Visible = true;
            btnAceptar.Visible = editor;
            btnNuevo.Visible = true;
        }

        private void LoadForm(object sender, EventArgs e)
        {
            frmMdiPrincipal f = (frmMdiPrincipal)this.MdiParent;
            SessionManager.AgregarObservador(this);
            ActualizarIdioma(SessionManager.Idioma);
            mUser = null;

            dataUsuarios.Columns.Clear(); // replicar esa config para los datagid por tema "traduccion"
            dataUsuarios.DataSource = null;
            dataUsuarios.AutoGenerateColumns = false;
            dataUsuarios.DataSource = _users.GetAll();
            dataUsuarios.Columns.Add("Usuario", lbUser.Text);
            dataUsuarios.Columns["Usuario"].DataPropertyName = "Email";
            DataGridViewCheckBoxColumn check = new DataGridViewCheckBoxColumn();
            check.Name = "Bloq";
            check.HeaderText = lbBloq.Text;
            check.DataPropertyName = "Bloq";
            dataUsuarios.Columns.Add(check);



            dataPermisosUser.AutoGenerateColumns = false;

            dataPermisosFamilias.AutoGenerateColumns = false;

            dataFamilias.AutoGenerateColumns = false;
            dataFamilias.DataSource = _permisos.ObtenerTodasLasFamilias();

            dataPermisos.AutoGenerateColumns = false;
            dataPermisos.DataSource = _permisos.ObtenerTodasLasPatentes();

            txtEmail.Text = "";
            txtPass.Text = "";


            Actualizar(false, false);
        }


        private void Salir(object sender, EventArgs e)
        {
            this.Close();
        }

        private void Cancelar(object sender, EventArgs e)
        {
            LoadForm(sender, e);

        }

        private void Editar(object sender, EventArgs e)
        {
            Actualizar(false, true);
            txtEmail.Text = mUser.Email;
            txtPass.Text = "";
            btnCancelar.Visible = true;
        }

        private void Aceptar(object sender, EventArgs e)
        {
            if (txtEmail.Text != "" && txtPass.Text != "")
            {
                mUser.Email = txtEmail.Text;
                mUser.Password = Encriptador.Hash(txtPass.Text);
                if (mUser.Estado != INT.TipoEstado.Agregado)
                {
                    mUser.Estado = INT.TipoEstado.Modificado;
                }
                _users.Save(mUser);
            }
            LoadForm(sender, e);
        }

        private void Bloquear(object sender, EventArgs e)
        {
            if (!mUser.Bloq)
            {
                mUser.Bloq = true;
                _users.Save(mUser);
            }
            LoadForm(sender, e);
        }

        private void Desbloquear(object sender, EventArgs e)
        {
            if (mUser.Bloq)
            {
                mUser.Bloq = false;
                _users.Save(mUser);
            }
            LoadForm(sender, e);
        }

        private void Nuevo(object sender, EventArgs e)
        {
            mUser = new Usuario();
            mUser.Estado = INT.TipoEstado.Agregado;
            Actualizar(false, true);
            dataUsuarios.Visible = false;
        }
        private void ElegirUsuario(object sender, EventArgs e)
        {
            mUser = _users.GetAll().Where(x => x.Email == dataUsuarios.SelectedCells[0].Value.ToString()).FirstOrDefault();
            btnDesbloquear.Visible = mUser.Bloq;
            btnBloquear.Visible = !btnDesbloquear.Visible;
            lbUsuarioLog.Text = mUser.Email;
            _permisos.CompletarPermisosDeUsuario(mUser);
            Actualizar(true, false);
            dataPermisosUser.DataSource = null;
            if (mUser.Permisos.Count > 0)
                dataPermisosUser.DataSource = mUser.Permisos;
        }
        private void EleccionFamilia(object sender, EventArgs e)
        {
            dataPermisosFamilias.DataSource = null;
            if (dataFamilias.SelectedCells.Count > 0)
            {
                dataPermisosFamilias.DataSource = _permisos.ObtenerPermisosDeFamilia(dataFamilias.SelectedCells[0].Value.ToString());
                LimpiarSeleccion(dataFamilias);
            }

        }
        private void EleccionPatente(object sender, EventArgs e)
        {
            if (dataPermisos.SelectedCells.Count > 0)
            {
                LimpiarSeleccion(dataPermisos);
            }
        }
        private void EleccionPermisosUsuario(object sender, EventArgs e)
        {
            if (dataPermisosUser.SelectedCells.Count > 0)
            {
                LimpiarSeleccion(dataPermisosUser);
            }
        }
        private void LimpiarSeleccion(DataGridView d)
        {
            foreach (DataGridView data in datas)
            {
                if (data != d)
                {
                    data.ClearSelection();
                    lbUsuarioLog.Text = "";
                }
            }
        }
        private void Agregar(object sender, EventArgs e)
        {
            if (mUser != null && dataFamilias.SelectedCells.Count > 0 || dataPermisos.SelectedCells.Count > 0)
            {
                if (dataFamilias.SelectedCells.Count > 0)
                {
                    try
                    {
                        Familia f = _permisos.ObtenerTodasLasFamilias().Where(x => x.Nombre == dataFamilias.SelectedCells[0].Value.ToString()).FirstOrDefault();
                        _permisos.CompletarPermisosDeFamilia(f);
                        _users.AgregarPermiso(mUser, f);
                        dataPermisosUser.DataSource = null;
                        dataPermisosUser.DataSource = mUser.Permisos;
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show(ex.Message);
                    }
                }
                else
                {
                    try
                    {
                        Patente patente = _permisos.ObtenerTodasLasPatentes().Where(x => x.Nombre == dataPermisos.SelectedCells[0].Value.ToString()).FirstOrDefault();
                        _users.AgregarPermiso(mUser, patente);
                        dataPermisosUser.DataSource = null;
                        dataPermisosUser.DataSource = mUser.Permisos;
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show(ex.Message);
                    }
                }

            }
        }
        private void Quitar(object sender, EventArgs e)
        {
            if (mUser != null && dataPermisosUser.SelectedCells.Count > 0)
            {
                PermisoCompuesto permiso = (PermisoCompuesto)mUser.Permisos.Where(x => x.Nombre == dataPermisosUser.SelectedCells[0].Value.ToString()).FirstOrDefault();
                _users.QuitarPermiso(mUser, permiso);
                dataPermisosUser.DataSource = null;
                dataPermisosUser.DataSource = mUser.Permisos;
            }
        }

        private void Guardar(object sender, EventArgs e)
        {
            _users.Save(mUser);
            LoadForm(sender, e);
        }

        public void ActualizarIdioma(IIdioma idioma = null)
        {
            frmMdiPrincipal f = (frmMdiPrincipal)this.MdiParent;
            f.CambiarIdiomaFormulario(this, idioma);
        }

        private void frmUsuarios_FormClosing(object sender, FormClosingEventArgs e)
        {
            SessionManager.QuitarObservador(this);
        }

    }
}
