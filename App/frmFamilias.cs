using BLL;
using INT;
using SER;
using SER.Composite;
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
    public partial class frmFamilias : Form, IIdiomaObserver
    {
        PermisoBLL _permiso = new PermisoBLL();
        Familia mFam;
        IDictionary<Guid, IPermiso> diccionarioPermisos;
        public frmFamilias()
        {
            InitializeComponent();
        }        
        private void frmFamilias_Load(object sender, EventArgs e)
        {
            frmMdiPrincipal f = (frmMdiPrincipal)this.MdiParent;
            SessionManager.AgregarObservador(this);
            ActualizarIdioma(SessionManager.Idioma);        
            Actualizar(false);
        }

        private void Actualizar(bool nueva)
        {
            ComboFamilias.Items.Clear();
            foreach (Familia f in _permiso.ObtenerTodasLasFamilias())
            {
                ComboFamilias.Items.Add(f.Nombre);
            }
            btnCrear.Visible = nueva;
            txtNueva.Visible = nueva;
            mFam = null;
            foreach (Control c in this.Controls)
            {
                c.Visible = !nueva;
            }
            txtNueva.Text = "";
            txtNueva.Visible = nueva;
            btnCrear.Visible = nueva;
            lbNueva.Visible = nueva;
            btnCancelar.Visible = true;

            dataGridView1.Columns.Clear(); // replicar esa config para los datagid por tema "traduccion"
            dataGridView1.DataSource = null;
            dataGridView1.AutoGenerateColumns = false;
            dataGridView1.DataSource = _permiso.ObtenerTodasLasPatentes();
            dataGridView1.Columns.Add("Patentes", lbPatentes2.Text);
            dataGridView1.Columns["Patentes"].DataPropertyName = "Nombre";
            dataGridView3.Columns.Clear(); // replicar esa config para los datagid por tema "traduccion"
            dataGridView3.DataSource = null;
            dataGridView3.AutoGenerateColumns = false;
            dataGridView3.Columns.Add("Familias", lbFamilias2.Text);
            dataGridView3.Columns["Familias"].DataPropertyName = "Nombre";
            dataGridView3.DataSource = _permiso.ObtenerTodasLasFamilias();

            CargarPermisosFamilia();

            //----------------------------------------Tree
            diccionarioPermisos = _permiso.ObtenerDiccionario();
            ActualizarArbol();
        }
        private void ActualizarArbol()
        {
            
            treeView1.Nodes.Clear();
            //----------------------------------------Familias
            foreach (Familia f in _permiso.ObtenerTodasLasFamilias())
            {
                TreeNode nodoFamilia = CrearNodoRecursivo(f);
                treeView1.Nodes.Add(nodoFamilia);
            }
            //----------------------------------------Patente
            foreach (Patente p in _permiso.ObtenerTodasLasPatentes())
            {
                TreeNode nodoFamilia = new TreeNode(p.Nombre);
                treeView1.Nodes.Add(nodoFamilia);
            }
        }
        private TreeNode CrearNodoRecursivo(IPermiso permiso)
        {
            TreeNode nodo = new TreeNode(permiso.Nombre);
            if (permiso is Familia) 
            {
                permiso = diccionarioPermisos[permiso.Id];
                foreach (IPermiso permisoHijo in permiso.ObtenerHijos)
                {
                    TreeNode nodoHijo = CrearNodoRecursivo(permisoHijo);
                    nodo.Nodes.Add(nodoHijo);
                }
            }
            return nodo;
        }

        private void ElegirFamilia(object sender, EventArgs e)
        {            
            CargarPermisosFamilia();
        }
        private void CargarPermisosFamilia()
        {
            dataGridView2.DataSource = null;
            dataGridView2.Columns.Clear();
            dataGridView2.AutoGenerateColumns = false;
            if (ComboFamilias.SelectedIndex >= 0)
            {
                Guid Id = _permiso.ObtenerTodasLasFamilias().Where(x => x.Nombre == ComboFamilias.Items[ComboFamilias.SelectedIndex].ToString()).Select(x => x.Id).FirstOrDefault();
                IPermiso fam = diccionarioPermisos[Id];
                dataGridView2.DataSource = fam.ObtenerHijos;
                dataGridView2.Columns.Add("Permisos", lbPermisos2.Text);
                dataGridView2.Columns["Permisos"].DataPropertyName = "Nombre";
            }
        }

        private void Salir(object sender, EventArgs e)
        {
            this.Close();
        }

        private void Cancelar(object sender, EventArgs e)
        {
            ComboFamilias.SelectedIndex = -1;
            Actualizar(false);
        }

        private void Agregar(object sender, EventArgs e)
        {
            if (ComboFamilias.SelectedIndex >= 0 && dataGridView1.SelectedCells.Count > 0)
            {
                try
                {
                    Patente patente = _permiso.ObtenerTodasLasPatentes().Where(x => x.Nombre == dataGridView1.SelectedCells[0].Value.ToString()).FirstOrDefault();
                    AgregarIPermiso(patente);
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
            }

        }
        private void Quitar(object sender, EventArgs e)
        {
            if (ComboFamilias.SelectedIndex >= 0 && dataGridView2.SelectedCells.Count > 0)
            {
                if (mFam == null)
                {
                    mFam = _permiso.ObtenerTodasLasFamilias().Where(x => x.Nombre == ComboFamilias.Items[ComboFamilias.SelectedIndex].ToString()).FirstOrDefault();
                    _permiso.CompletarPermisosDeFamilia(mFam);
                }
                try
                {
                    mFam.QuitarPermiso(mFam.ObtenerHijos.Where(x => x.Nombre == dataGridView2.SelectedCells[0].Value.ToString()).FirstOrDefault());
                    dataGridView2.AutoGenerateColumns = false;
                    dataGridView2.DataSource = mFam.ObtenerHijos;
                    ActualizarArbol();
                }
                catch (Exception exe)
                {

                    throw exe;
                }
            }
        }

        private void AgregarFamilia(object sender, EventArgs e)
        {
            if (ComboFamilias.SelectedIndex >= 0 && dataGridView3.SelectedCells.Count > 0)
            {
                try
                {
                    Familia familia = _permiso.ObtenerTodasLasFamilias().Where(_x => _x.Nombre == dataGridView3.SelectedCells[0].Value.ToString()).FirstOrDefault();
                    _permiso.CompletarPermisosDeFamilia(familia);
                    AgregarIPermiso(familia);
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
            }
        }

        private void AgregarIPermiso(IPermiso permiso)
        {
            if (ComboFamilias.SelectedIndex >= 0 && dataGridView3.SelectedCells.Count > 0)
            {
                if (mFam == null)
                {
                    mFam = _permiso.ObtenerTodasLasFamilias().Where(x => x.Nombre == ComboFamilias.Items[ComboFamilias.SelectedIndex].ToString()).FirstOrDefault();
                    _permiso.CompletarPermisosDeFamilia(mFam);
                }
                try
                {
                    mFam.AgregarPermiso(permiso);
                    dataGridView2.AutoGenerateColumns = false;
                    dataGridView2.DataSource = mFam.ObtenerHijos;
                    ActualizarArbol();
                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }
        }


        private void Guardar(object sender, EventArgs e)
        {
            try
            {
                if(mFam != null)
                {
                    _permiso.GuardarFamilia(mFam);
                    Actualizar(false);
                }
                else
                {
                    MessageBox.Show("Seleecione una familiar");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            
        }

        private void NuevaFamilia(object sender, EventArgs e)
        {
            Actualizar(true);
        }

        private void Crear(object sender, EventArgs e)
        {
            if (txtNueva.Text != "")
            {
                Familia f = new Familia();
                f.Nombre = txtNueva.Text;
                _permiso.GuardarPermiso(f, true);
                Actualizar(false);
            }
        }

        public void ActualizarIdioma(IIdioma idioma)
        {
            frmMdiPrincipal f = (frmMdiPrincipal)this.MdiParent;
            f.CambiarIdiomaFormulario(this, idioma);
        }

        private void frmFamilias_FormClosing(object sender, FormClosingEventArgs e)
        {
            SessionManager.QuitarObservador(this);
        }
    }
}
