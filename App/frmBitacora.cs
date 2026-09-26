using BE;
using BLL;
using INT;
using SER;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows.Forms;

namespace AppBase
{
    public partial class frmBitacora : Form, IIdiomaObserver
    {
        BitacoraBLL _bitacoraBLL;
        UsuarioBLL _usuarioBLL;
        IList<Bitacora> _resultados;

        public frmBitacora()
        {
            InitializeComponent();
            _bitacoraBLL = new BitacoraBLL();
            _usuarioBLL = new UsuarioBLL();
            _resultados = new List<Bitacora>();
        }

        private void LoadForm(object sender, EventArgs e)
        {
            SessionManager.AgregarObservador(this);
            ActualizarIdioma(SessionManager.Idioma);

            cmbUsuario.DisplayMember = "Email";
            cmbUsuario.ValueMember = "Id";
            var usuarios = new List<Usuario> { new Usuario(Guid.Empty) { Email = lbTodos.Text } };
            foreach (var u in _usuarioBLL.GetAll()) usuarios.Add(u);
            cmbUsuario.DataSource = usuarios;

            dtpDesde.Value = DateTime.Today.AddMonths(-1);
            dtpHasta.Value = DateTime.Today;
            chkFiltrarFecha.Checked = false;
            dtpDesde.Enabled = false;
            dtpHasta.Enabled = false;

            dataResultados.AutoGenerateColumns = false;
            dataResultados.Columns.Clear();
            dataResultados.Columns.Add(new DataGridViewTextBoxColumn { Name = "Fecha", HeaderText = lbFecha.Text, Tag = lbFecha.Tag, DataPropertyName = "FechaHora", DefaultCellStyle = new DataGridViewCellStyle { Format = "dd/MM/yyyy HH:mm:ss" } });
            dataResultados.Columns.Add(new DataGridViewTextBoxColumn { Name = "Usuario", HeaderText = lbUsuario.Text, Tag = lbUsuario.Tag, DataPropertyName = "UsuarioEmail" });
            dataResultados.Columns.Add(new DataGridViewTextBoxColumn { Name = "Actividad", HeaderText = lbActividad.Text, Tag = lbActividad.Tag, DataPropertyName = "Actividad" });
            dataResultados.Columns.Add(new DataGridViewTextBoxColumn { Name = "EntidadId", HeaderText = "Id", Tag = "lb_id", DataPropertyName = "EntidadId" });
            dataResultados.Columns.Add(new DataGridViewTextBoxColumn { Name = "Detalle", HeaderText = lbDetalle.Text, Tag = lbDetalle.Tag, DataPropertyName = "Detalle" });

            Buscar(sender, e);
        }

        private void HabilitarFecha(object sender, EventArgs e)
        {
            dtpDesde.Enabled = chkFiltrarFecha.Checked;
            dtpHasta.Enabled = chkFiltrarFecha.Checked;
        }

        private void Buscar(object sender, EventArgs e)
        {
            var filtro = new FiltroBitacora();
            var usuarioSel = (Usuario)cmbUsuario.SelectedItem;
            if (usuarioSel != null && usuarioSel.Id != Guid.Empty) filtro.UsuarioId = usuarioSel.Id;
            if (chkFiltrarFecha.Checked)
            {
                filtro.FechaDesde = dtpDesde.Value.Date;
                filtro.FechaHasta = dtpHasta.Value.Date;
            }
            if (!string.IsNullOrWhiteSpace(txtActividad.Text)) filtro.Actividad = txtActividad.Text.Trim();

            _resultados = _bitacoraBLL.Buscar(filtro);
            dataResultados.DataSource = null;
            dataResultados.DataSource = _resultados;
        }

        private void Exportar(object sender, EventArgs e)
        {
            using (SaveFileDialog dialogo = new SaveFileDialog())
            {
                dialogo.Filter = "CSV (*.csv)|*.csv";
                dialogo.FileName = "bitacora.csv";
                if (dialogo.ShowDialog() == DialogResult.OK)
                {
                    try
                    {
                        _bitacoraBLL.ExportarCsv(_resultados, dialogo.FileName);
                        MessageBox.Show(lbExportOk.Text);
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show(lbExportError.Text + ": " + ex.Message);
                    }
                }
            }
        }

        private void Salir(object sender, EventArgs e)
        {
            this.Close();
        }

        public void ActualizarIdioma(IIdioma idioma)
        {
            frmMdiPrincipal f = (frmMdiPrincipal)this.MdiParent;
            f.CambiarIdiomaFormulario(this, idioma);
        }

        private void frmBitacora_FormClosing(object sender, FormClosingEventArgs e)
        {
            SessionManager.QuitarObservador(this);
        }
    }
}
