using BLL;
using SER;
using System.Windows.Forms;

namespace AppBase
{
    public partial class frmIntegridad : Form
    {
        ResolucionIntegridadBLL _resolucion;
        ResultadoIntegridad _problemas;
        bool _finalizado;

        public frmIntegridad(ResultadoIntegridad problemas)
        {
            InitializeComponent();
            _resolucion = new ResolucionIntegridadBLL();
            _problemas = problemas;
        }

        private void frmIntegridad_Load(object sender, EventArgs e)
        {
            if (this.Owner is frmMdiPrincipal f)
            {
                f.CambiarIdiomaFormulario(this, SessionManager.Idioma);
            }
            MostrarDetalle();
        }

        private void frmIntegridad_FormClosing(object sender, FormClosingEventArgs e)
        {
            if (!_finalizado && e.CloseReason == CloseReason.UserClosing)
            {
                e.Cancel = true;
            }
        }

        private void MostrarDetalle()
        {
            dgvDetalle.Rows.Clear();
            foreach (DiscrepanciaIntegridad d in _problemas.Discrepancias)
            {
                dgvDetalle.Rows.Add(d.Tabla, d.FilaId.HasValue ? d.FilaId.Value.ToString() : lbTablaCompleta.Text, d.Campos);
            }
        }

        private void Restaurar(object sender, EventArgs e)
        {
            using (OpenFileDialog dialogo = new OpenFileDialog())
            {
                dialogo.Filter = "Backup SQL Server (*.bak)|*.bak";
                if (dialogo.ShowDialog(this) != DialogResult.OK) return;
                if (MessageBox.Show(lbRestoreConfirm.Text, this.Text, MessageBoxButtons.YesNo) != DialogResult.Yes) return;
                Ejecutar(() => _resolucion.Restaurar(dialogo.FileName, _problemas), lbRestoreError.Text);
            }
        }

        private void Recalcular(object sender, EventArgs e)
        {
            if (MessageBox.Show(lbRecalcularConfirm.Text, this.Text, MessageBoxButtons.YesNo) != DialogResult.Yes) return;
            Ejecutar(() => _resolucion.Recalcular(_problemas), lbRecalcularError.Text);
        }

        private void Cancelar(object sender, EventArgs e)
        {
            try
            {
                _resolucion.Cancelar(_problemas);
                Terminar();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void Ejecutar(Func<ResultadoIntegridad> accion, string mensajeError)
        {
            try
            {
                this.Cursor = Cursors.WaitCursor;
                ResultadoIntegridad resultado = accion();
                if (!SessionManager.EstaLogueado())
                {
                    MessageBox.Show(lbSesionInvalida.Text);
                    Terminar();
                }
                else if (resultado.EsValido)
                {
                    Terminar();
                }
                else
                {
                    _problemas = resultado;
                    MostrarDetalle();
                    MessageBox.Show(lbIntegridadPersiste.Text);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(mensajeError + ": " + ex.Message);
            }
            finally
            {
                this.Cursor = Cursors.Default;
            }
        }

        private void Terminar()
        {
            _finalizado = true;
            this.DialogResult = DialogResult.OK;
            this.Close();
        }
    }
}
