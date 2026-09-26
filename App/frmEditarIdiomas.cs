using BE;
using BLL;
using INT;
using Microsoft.VisualBasic.ApplicationServices;
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
    public partial class frmEditarIdiomas : Form, IIdiomaObserver
    {
        TraductorBLL _traductorBLL;
        Idioma _idioma;
        IDictionary<string,ITraduccion> _diccionarioLocal;
        public frmEditarIdiomas()
        {
            InitializeComponent();

            _traductorBLL = new TraductorBLL();
        }

        public void ActualizarIdioma(IIdioma idioma)
        {
            frmMdiPrincipal f = (frmMdiPrincipal)this.MdiParent;
            f.CambiarIdiomaFormulario(this, idioma);
        }

        private void frmEditarIdiomas_Load(object sender, EventArgs e)
        {
            SessionManager.AgregarObservador(this);
            ActualizarIdioma(SessionManager.Idioma);
            Nuevo(false);
        }
        private void Salir(object sender, EventArgs e)
        {
            this.Close();
        }

        private void frmEditarIdiomas_FormClosing(object sender, FormClosingEventArgs e)
        {
            SessionManager.QuitarObservador(this);
        }

        private void btnCrear_Click(object sender, EventArgs e)
        {
            if (txtNuevoIdioma.Text != "")
            {
                _idioma = new Idioma();
                _idioma.Nombre = txtNuevoIdioma.Text;
                Nuevo(true);
                dataGridView1.Columns.Clear();
                dataGridView1.Rows.Clear();
                dataGridView1.DataSource = null;
                dataGridView1.AutoGenerateColumns = false;
                _diccionarioLocal = _traductorBLL.ObtenerTraduccion(SessionManager.Idioma);
                dataGridView1.Columns.Add("Indice","");
                dataGridView1.Columns.Add("Diccionario",lbOriginal.Text);             
                dataGridView1.Columns.Add("Traduccion", lbTraduccion.Text);
                foreach(ITraduccion tra in _diccionarioLocal.Values)
                {                    
                    DataGridViewRow gr = new DataGridViewRow();
                    gr.CreateCells(dataGridView1);
                    gr.Cells[0].Value = tra.Etiqueta.Id.ToString();
                    gr.Cells[1].Value = tra.Texto;                    
                    dataGridView1.Rows.Add(gr);
                }
                dataGridView1.AllowUserToAddRows = false;
                dataGridView1.Columns["Indice"].Visible = false;
            }
            else
            {
                MessageBox.Show(lbCompletar.Text);
            }
        }
        private void Nuevo(bool nuevo)
        {
            lbNuevoIdioma.Visible = !nuevo;
            txtNuevoIdioma.Visible = !nuevo;
            btnCrear.Visible = !nuevo;
            dataGridView1.Visible = nuevo;
            btnGuardar.Visible = nuevo;
            btnCancelar.Visible = nuevo;
        }

        private void btnCancelar_Click(object sender, EventArgs e)
        {
            this.frmEditarIdiomas_Load(sender, e);
        }

        private void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                List<ITraduccion> lista = new List<ITraduccion>();
                foreach (DataGridViewRow dr in dataGridView1.Rows)
                {
                    if (dr.Cells["Traduccion"].Value is not null)
                    {                        
                        ITraduccion tra = _diccionarioLocal.Values.Where(x => x.Etiqueta.Id.ToString() ==  dr.Cells["Indice"].Value.ToString()).FirstOrDefault();
                        tra.Texto = dr.Cells["Traduccion"].Value.ToString();
                        lista.Add(tra);
                    }
                    else
                    {
                        throw new Exception(lbIngresar.Text + " " + lbTraduccionPara.Text + ": " + dr.Cells["Diccionario"].Value.ToString());
                    }
                }
                _traductorBLL.CrearIdioma(lista, _idioma);
                this.frmEditarIdiomas_Load(sender, e);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            
        }
    }
}
