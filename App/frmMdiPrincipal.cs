using BE;
using BLL;
using INT;
using SER;
using SER.Composite;
using System.Windows.Forms;

namespace AppBase
{
    public partial class frmMdiPrincipal : Form, IIdiomaObserver
    {
        UsuarioBLL _userBLL;
        Usuario _usuario;
        TraductorBLL _traductor;
        public frmMdiPrincipal()
        {
            InitializeComponent();

            SessionManager.AgregarObservador(this);

            _userBLL = new UsuarioBLL();
            _traductor = new TraductorBLL();
        }
        private void Logearse(object sender, EventArgs e)
        {
            frmLogin f = new frmLogin();
            f.MdiParent = this;
            f.Show();
        }
        private void Desloguearse(object sender, EventArgs e)
        {
            if (MessageBox.Show(lbdeslog_1.Text, lbdeslog_2.Text, MessageBoxButtons.YesNo) == DialogResult.Yes)
            {
                _userBLL.Logout();
                Actualizar();
            }
           // frmMdiPrincipal_Load(sender, e);
        }
        private void frmMdiPrincipal_Load(object sender, EventArgs e)
        {
            Actualizar();
        }
        public void Actualizar()
        {
            foreach (ToolStripItem c in menuPrincipal.Items)
            {
                if (c.Name != "sesiónToolStripMenuItem" && c.Name != "idiomaToolStripMenuItem")
                {
                    c.Visible = false;
                }
            }
            if (SessionManager.EstaLogueado())
            {
                _usuario = _userBLL.CargarUsuario();
                iniciarSesiónToolStripMenuItem.Enabled = false;
                cerrarSesiónToolStripMenuItem.Enabled = true;

                foreach (PermisoCompuesto p in _usuario.Permisos)
                {
                    ValidarPermisos(p);
                }
            }
            else
            {
                iniciarSesiónToolStripMenuItem.Enabled = true;
                cerrarSesiónToolStripMenuItem.Enabled = false;
            }
            ActualizarIdioma(SessionManager.Idioma);
            CargarIdiomas();
        }
        private void ValidarPermisos(PermisoCompuesto p)
        {
            if (p is Familia)
            {
                foreach (PermisoCompuesto h in p.ObtenerHijos)
                {
                    ValidarPermisos(h);
                }
            }
            //--------Familias
            if (p.Permiso == TipoPatente.GestPermisos)
            {
                familiasToolStripMenuItem.Visible = true;
            }
            //--------Usuarios
            if (p.Permiso == TipoPatente.GestUsuarios)
            {
                usuariosToolStripMenuItem.Visible = true;
            }
            //--------Editar Idioma
            if (p.Permiso == TipoPatente.GestIdiomas)
            {
                nuevoIdiomaToolStripMenuItem.Visible = true;
            }
            //--------Base de Datos // Backup y Restore
            if (p.Permiso == TipoPatente.GestBackup)
            {
                baseDeDatosToolStripMenuItem.Visible = true;
            }
        }

        private void EditarFamilias(object sender, EventArgs e)
        {
            frmFamilias f = new frmFamilias();
            f.MdiParent = this;
            f.WindowState = FormWindowState.Maximized;
            f.Show();
        }

        private void EditarUsuarios(object sender, EventArgs e)
        {
            frmUsuarios f = new frmUsuarios();
            f.MdiParent = this;
            f.WindowState = FormWindowState.Maximized;
            f.Show();
        }

        private void AbrirBackup(object sender, EventArgs e)
        {
            frmBackup f = new frmBackup();
            f.MdiParent = this;
            f.WindowState = FormWindowState.Maximized;
            f.Show();
        }

        public void ActualizarIdioma(IIdioma idioma = null)
        {
            _traductor = new TraductorBLL();
            var mTraducciones = _traductor.ObtenerTraduccion(idioma);
            if (this.Tag != null && mTraducciones.ContainsKey(this.Tag.ToString()))
                this.Text = mTraducciones[this.Tag.ToString()].Texto;

            foreach (ToolStripMenuItem c3 in menuPrincipal.Items)
            {
                CambiarMenu(c3);

                void CambiarMenu(ToolStripMenuItem menu)
                {
                    if (menu.Tag != null && mTraducciones.ContainsKey(menu.Tag.ToString()))
                    {
                        menu.Text = mTraducciones[menu.Tag.ToString()].Texto;
                    }
                    if (menu.HasDropDownItems)
                    {
                        foreach (ToolStripMenuItem menu2 in menu.DropDownItems)
                        {
                            CambiarMenu(menu2);
                        }
                    }
                }
            }
            CambiarIdiomaFormulario(this, idioma);

        }
        public void CambiarIdiomaFormulario(Form formulario, IIdioma idioma)
        {
            if (idioma == null)
            {
                foreach (var item in idiomaToolStripMenuItem.DropDownItems)
                {
                    if (((ToolStripMenuItem)item).Checked)
                    {
                        idioma = new Idioma(((IIdioma)((ToolStripMenuItem)item).Tag).Id);
                    }

                }
            }
            _traductor = new TraductorBLL();
            var mTraducciones = _traductor.ObtenerTraduccion(idioma);
            if (formulario.Tag != null && mTraducciones.ContainsKey(formulario.Tag.ToString()))
                this.Text = mTraducciones[formulario.Tag.ToString()].Texto;

            foreach (Control c in formulario.Controls)
            {
                CambiarControl(c);
            }

            void CambiarControl(Control control)
            {
                if (control.Tag != null && mTraducciones.ContainsKey(control.Tag.ToString()))
                {
                    control.Text = mTraducciones[control.Tag.ToString()].Texto;
                }
                if (control.HasChildren)
                {
                    foreach (Control c2 in control.Controls)
                    {
                        CambiarControl(c2);
                    }
                }
            }
        }
        private void frmMdiPrincipal_FormClosing(object sender, FormClosingEventArgs e)
        {
            SessionManager.QuitarObservador(this);
        }
        private void CargarIdiomas()
        {
            this.idiomaToolStripMenuItem.DropDownItems.Clear();
            var idiomas = _traductor.ObtenerIdiomas();
            foreach (var item in idiomas)
            {
                var t = new ToolStripMenuItem();
                t.Text = item.Nombre;
                t.Tag = item;
                t.Checked = item.Default;
                this.idiomaToolStripMenuItem.DropDownItems.Add(t);
                t.Click += idioma_Click;
            }
        }
        private void idioma_Click(object sender, EventArgs e)
        {
            SessionManager.Idioma = (IIdioma)((ToolStripMenuItem)sender).Tag;
            ActualizarIdioma(SessionManager.Idioma);
            MarcarIdioma();
        }
        private void MarcarIdioma()
        {
            if (SessionManager.Idioma != null)
            {
                foreach (var item in idiomaToolStripMenuItem.DropDownItems)
                {

                    ((ToolStripMenuItem)item).Checked = SessionManager.Idioma.Id.Equals(((IIdioma)((ToolStripMenuItem)item).Tag).Id);
                    if (((ToolStripMenuItem)item).Checked)
                    {
                        ((ToolStripMenuItem)item).Enabled = false;
                    }
                    else
                        ((ToolStripMenuItem)item).Enabled = true;
                }
            }
        }
        private void crearIdiomaToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmEditarIdiomas f = new frmEditarIdiomas();
            f.MdiParent = this;
            f.Show();
        }
    }
}
