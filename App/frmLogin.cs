using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using BLL;
using INT;
using SER;

namespace AppBase
{
    public partial class frmLogin : Form, IIdiomaObserver
    {
        UsuarioBLL _userBLL;
        public frmLogin()
        {
            InitializeComponent();

            _userBLL = new UsuarioBLL();
        }
        private void Salir(object sender, EventArgs e)
        {
            this.Close();
        }
        private void Ingresar(object sender, EventArgs e)
        {
            try
            {
                var res = _userBLL.Login(this.txt_Email.Text, this.txt_Pass.Text);

                frmMdiPrincipal f = (frmMdiPrincipal)this.MdiParent;
                if (res == TipoResultadoLogin.UsuarioValido)
                {
                    MessageBox.Show(lb_Bienvenido.Text + " " + this.txt_Email.Text + "!");
                }
                f.Actualizar();
                this.Close();

            }
            catch (ExcepcionesLogin ex)
            {
                switch (ex.Resultado)
                {
                    case TipoResultadoLogin.UsuarioInvalido:
                        MessageBox.Show(lb_usuario_incorrecto.Text);
                        break;
                    case TipoResultadoLogin.PasswordInvalido:
                        MessageBox.Show(lb_pass_incorrecta.Text);
                        break;
                    case TipoResultadoLogin.UsuarioBloqueado:
                        MessageBox.Show(lb_usuario_bloqueado.Text);
                        break;
                    case TipoResultadoLogin.UsuarioValido:
                        MessageBox.Show(lb_Bienvenido.Text + "!");
                        break;
                    default:
                        break;
                }
            }
        }
        private void frmLogin_Load(object sender, EventArgs e)
        {
            SessionManager.AgregarObservador(this);
            ActualizarIdioma(SessionManager.Idioma);
        }

        public void ActualizarIdioma(IIdioma idioma)
        {
            frmMdiPrincipal f = (frmMdiPrincipal)this.MdiParent;
            f.CambiarIdiomaFormulario(this, idioma);
        }

        private void frmLogin_FormClosing(object sender, FormClosingEventArgs e)
        {
            SessionManager.QuitarObservador(this);
        }
    }
}
