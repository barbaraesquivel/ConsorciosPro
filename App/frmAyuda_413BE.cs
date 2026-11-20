using BE;
using BLL;
using INT;
using SER;

namespace AppBase
{
    // Ayuda general (D02): buscador, árbol de temas y texto del tema. Sin lógica de negocio: todo sale de AyudaBLL_413BE.
    public partial class frmAyuda_413BE : Form, IIdiomaObserver
    {
        private readonly AyudaBLL_413BE _ayudaBLL_413BE = new AyudaBLL_413BE();
        private string _temaActual_413BE = AyudaBLL_413BE.TemaInicio_413BE;
        private bool _cargando_413BE;
        private readonly Font _fuenteTitulo_413BE;
        private readonly Font _fuenteTexto_413BE;

        public frmAyuda_413BE()
        {
            InitializeComponent();
            _fuenteTitulo_413BE = new Font(rtbTema_413BE.Font.FontFamily, 13F, FontStyle.Bold);
            _fuenteTexto_413BE = new Font(rtbTema_413BE.Font.FontFamily, 10F, FontStyle.Regular);
        }

        private void frmAyuda_Load_413BE(object? sender, EventArgs e)
        {
            SessionManager.AgregarObservador(this);
            ActualizarIdioma(SessionManager.Idioma);
        }

        private void frmAyuda_FormClosing_413BE(object? sender, FormClosingEventArgs e)
        {
            SessionManager.QuitarObservador(this);
        }

        private void frmAyuda_FormClosed_413BE(object? sender, FormClosedEventArgs e)
        {
            _fuenteTitulo_413BE.Dispose();
            _fuenteTexto_413BE.Dispose();
        }

        public void ActualizarIdioma(IIdioma idioma)
        {
            if (MdiParent is frmMdiPrincipal principal)
            {
                principal.CambiarIdiomaFormulario(this, idioma);
            }
            CargarArbol_413BE();
        }

        public void MostrarTema_413BE(string clave)
        {
            _temaActual_413BE = _ayudaBLL_413BE.ExisteTema_413BE(clave) ? clave : AyudaBLL_413BE.TemaInicio_413BE;
            tmrBuscar_413BE.Stop();
            if (txtBuscar_413BE.Text.Length > 0)
            {
                _cargando_413BE = true;
                txtBuscar_413BE.Text = "";
                _cargando_413BE = false;
            }
            CargarArbol_413BE();
        }

        private void CargarArbol_413BE()
        {
            List<TemaAyuda_413BE> arbol;
            try
            {
                arbol = _ayudaBLL_413BE.Buscar_413BE(txtBuscar_413BE.Text);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, this.Text);
                return;
            }

            _cargando_413BE = true;
            TreeNode? seleccionado = null;
            TreeNode? primero = null;
            trvTemas_413BE.BeginUpdate();
            try
            {
                trvTemas_413BE.Nodes.Clear();
                foreach (TemaAyuda_413BE grupo in arbol)
                {
                    TreeNode nodoGrupo = new TreeNode(grupo.Titulo_413BE) { Name = grupo.Clave_413BE, Tag = grupo };
                    foreach (TemaAyuda_413BE tema in grupo.Hijos_413BE)
                    {
                        TreeNode nodoTema = new TreeNode(tema.Titulo_413BE) { Name = tema.Clave_413BE, Tag = tema };
                        nodoGrupo.Nodes.Add(nodoTema);
                        if (tema.Clave_413BE == _temaActual_413BE) seleccionado = nodoTema;
                        primero ??= nodoTema;
                    }
                    trvTemas_413BE.Nodes.Add(nodoGrupo);
                }
                trvTemas_413BE.ExpandAll();
            }
            finally
            {
                trvTemas_413BE.EndUpdate();
            }

            TreeNode? mostrar = seleccionado ?? primero;
            if (mostrar != null && mostrar.Tag is TemaAyuda_413BE temaMostrado)
            {
                trvTemas_413BE.SelectedNode = mostrar;
                mostrar.EnsureVisible();
                _temaActual_413BE = temaMostrado.Clave_413BE;
                MostrarTexto_413BE(temaMostrado);
            }
            else
            {
                rtbTema_413BE.Clear();
                rtbTema_413BE.SelectionFont = _fuenteTexto_413BE;
                rtbTema_413BE.AppendText(_ayudaBLL_413BE.ObtenerTexto_413BE("ayu_ui_sinResultados", "No se encontraron temas para la búsqueda."));
            }
            _cargando_413BE = false;
        }

        private void MostrarTexto_413BE(TemaAyuda_413BE tema)
        {
            rtbTema_413BE.Clear();
            rtbTema_413BE.SelectionFont = _fuenteTitulo_413BE;
            rtbTema_413BE.AppendText(tema.Titulo_413BE + Environment.NewLine + Environment.NewLine);
            rtbTema_413BE.SelectionFont = _fuenteTexto_413BE;
            if (tema.EsGrupo_413BE)
            {
                foreach (TemaAyuda_413BE hijo in tema.Hijos_413BE)
                {
                    rtbTema_413BE.AppendText("•  " + hijo.Titulo_413BE + Environment.NewLine);
                }
            }
            else
            {
                foreach (string linea in tema.Lineas_413BE)
                {
                    rtbTema_413BE.AppendText(linea + Environment.NewLine + Environment.NewLine);
                }
            }
            rtbTema_413BE.SelectionStart = 0;
            rtbTema_413BE.ScrollToCaret();
        }

        private void trvTemas_AfterSelect_413BE(object? sender, TreeViewEventArgs e)
        {
            if (_cargando_413BE || e.Node?.Tag is not TemaAyuda_413BE tema) return;
            if (!tema.EsGrupo_413BE) _temaActual_413BE = tema.Clave_413BE;
            MostrarTexto_413BE(tema);
        }

        private void txtBuscar_TextChanged_413BE(object? sender, EventArgs e)
        {
            if (_cargando_413BE) return;
            tmrBuscar_413BE.Stop();
            tmrBuscar_413BE.Start();
        }

        private void tmrBuscar_Tick_413BE(object? sender, EventArgs e)
        {
            tmrBuscar_413BE.Stop();
            CargarArbol_413BE();
        }
    }
}
