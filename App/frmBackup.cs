using BLL;
using INT;
using SER;
using System.Windows.Forms;

namespace AppBase
{
    public partial class frmBackup : Form, IIdiomaObserver
    {
        BackupBLL _backupBLL;
        public frmBackup()
        {
            InitializeComponent();
            _backupBLL = new BackupBLL();
        }

        private void frmBackup_Load(object sender, EventArgs e)
        {
            SessionManager.AgregarObservador(this);
            ActualizarIdioma(SessionManager.Idioma);
        }

        private void frmBackup_FormClosing(object sender, FormClosingEventArgs e)
        {
            SessionManager.QuitarObservador(this);
        }

        private void Salir(object sender, EventArgs e)
        {
            this.Close();
        }

        private void HacerBackup(object sender, EventArgs e)
        {
            using (SaveFileDialog dialogo = new SaveFileDialog())
            {
                dialogo.Filter = "Backup SQL Server (*.bak)|*.bak";
                dialogo.FileName = "backup.bak";
                if (dialogo.ShowDialog() == DialogResult.OK)
                {
                    try
                    {
                        this.Cursor = Cursors.WaitCursor;
                        _backupBLL.HacerBackup(dialogo.FileName);
                        MessageBox.Show(lbBackupOk.Text);
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show(lbBackupError.Text + ": " + ex.Message);
                    }
                    finally
                    {
                        this.Cursor = Cursors.Default;
                    }
                }
            }
        }

        private void Restaurar(object sender, EventArgs e)
        {
            using (OpenFileDialog dialogo = new OpenFileDialog())
            {
                dialogo.Filter = "Backup SQL Server (*.bak)|*.bak";
                if (dialogo.ShowDialog() == DialogResult.OK)
                {
                    if (MessageBox.Show(lbRestoreConfirm.Text, this.Text, MessageBoxButtons.YesNo) == DialogResult.Yes)
                    {
                        try
                        {
                            this.Cursor = Cursors.WaitCursor;
                            _backupBLL.Restaurar(dialogo.FileName);
                            MessageBox.Show(lbRestoreOk.Text);
                        }
                        catch (Exception ex)
                        {
                            MessageBox.Show(lbRestoreError.Text + ": " + ex.Message);
                        }
                        finally
                        {
                            this.Cursor = Cursors.Default;
                        }
                    }
                }
            }
        }

        public void ActualizarIdioma(IIdioma idioma)
        {
            frmMdiPrincipal f = (frmMdiPrincipal)this.MdiParent;
            f.CambiarIdiomaFormulario(this, idioma);
        }
    }
}
