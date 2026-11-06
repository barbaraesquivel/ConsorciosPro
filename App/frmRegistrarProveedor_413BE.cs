using BE;
using BLL;
using INT;
using SER;

namespace AppBase
{
    public partial class frmRegistrarProveedor_413BE : Form, IIdiomaObserver
    {
        private readonly int _idCategoriaPreseleccionada_413BE;

        public frmRegistrarProveedor_413BE(int idCategoriaPreseleccionada)
        {
            InitializeComponent();
            _idCategoriaPreseleccionada_413BE = idCategoriaPreseleccionada;
        }

        private void frmRegistrarProveedor_FormClosing_413BE(object sender, FormClosingEventArgs e)
        {
            SessionManager.QuitarObservador(this);
        }

        public void ActualizarIdioma(IIdioma idioma)
        {
            frmMdiPrincipal f = (frmMdiPrincipal)(this.MdiParent ?? this.Owner!.MdiParent!);
            f.CambiarIdiomaFormulario(this, idioma);
        }

        private void frmRegistrarProveedor_Load_413BE(object sender, EventArgs e)
        {
            SessionManager.AgregarObservador(this);
            ActualizarIdioma(SessionManager.Idioma);
            try
            {
                clbCategorias.Items.Clear();
                foreach (Categoria_413BE c in new CategoriaBLL_413BE().ObtenerTodos_413BE())
                {
                    int indice = clbCategorias.Items.Add(c);
                    if (c.IdCategoria_413BE == _idCategoriaPreseleccionada_413BE)
                    {
                        clbCategorias.SetItemChecked(indice, true);
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, this.Text);
            }
        }

        private void btnGuardar_Click_413BE(object sender, EventArgs e)
        {
            Proveedor_413BE proveedor = new Proveedor_413BE();
            proveedor.Nombre_413BE = txtNombre.Text;
            proveedor.Cuit_413BE = txtCuit.Text;
            proveedor.Email_413BE = txtEmail.Text;
            foreach (object item in clbCategorias.CheckedItems)
            {
                proveedor.IdsCategorias_413BE.Add(((Categoria_413BE)item).IdCategoria_413BE);
            }
            try
            {
                new ProveedorBLL_413BE().RegistrarProveedor_413BE(proveedor);
            }
            catch (ArgumentException ex)
            {
                MessageBox.Show(ex.Message, this.Text);
                return;
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
            MessageBox.Show(lbProveedorRegistrado.Text, this.Text);
            this.DialogResult = DialogResult.OK;
            this.Close();
        }

        private void btnCancelar_Click_413BE(object sender, EventArgs e)
        {
            this.DialogResult = DialogResult.Cancel;
            this.Close();
        }
    }
}
