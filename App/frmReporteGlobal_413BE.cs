using BE;
using BLL;
using INT;
using SER;

namespace AppBase
{
    public partial class frmReporteGlobal_413BE : Form, IIdiomaObserver
    {
        private static readonly Color ColorAlerta_413BE = Color.Firebrick;
        private static readonly Color ColorBarra_413BE = Color.FromArgb(70, 110, 160);

        private readonly ReporteGlobalBLL_413BE _reporteBLL_413BE = new ReporteGlobalBLL_413BE();
        private ReporteGlobal_413BE? _reporte_413BE;

        public frmReporteGlobal_413BE()
        {
            InitializeComponent();
        }

        private void frmReporteGlobal_FormClosing_413BE(object? sender, FormClosingEventArgs e)
        {
            SessionManager.QuitarObservador(this);
        }

        public void ActualizarIdioma(IIdioma idioma)
        {
            if (this.MdiParent is frmMdiPrincipal principal)
            {
                principal.CambiarIdiomaFormulario(this, idioma);
            }
            if (cboConsorcio_413BE.Items.Count > 0)
            {
                int indice = cboConsorcio_413BE.SelectedIndex;
                cboConsorcio_413BE.Items[0] = TextoTodos_413BE();
                cboConsorcio_413BE.SelectedIndex = indice < 0 ? 0 : indice;
            }
            if (_reporte_413BE != null) MostrarReporte_413BE(_reporte_413BE);
            picGrafico_413BE.Invalidate();
        }

        private void frmReporteGlobal_Load_413BE(object? sender, EventArgs e)
        {
            SessionManager.AgregarObservador(this);
            dtpDesde_413BE.Value = DateTime.Today.AddMonths(-6);
            dtpHasta_413BE.Value = DateTime.Today;
            try
            {
                List<Consorcio_413BE> consorcios = new ConsorcioBLL_413BE().ObtenerTodos_413BE();
                cboConsorcio_413BE.DisplayMember = "Nombre_413BE";
                cboConsorcio_413BE.Items.Add(TextoTodos_413BE());
                cboConsorcio_413BE.Items.AddRange(consorcios.Cast<object>().ToArray());
                cboConsorcio_413BE.SelectedIndex = 0;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, this.Text);
            }
            ActualizarIdioma(SessionManager.Idioma);
        }

        private static string TextoTodos_413BE()
        {
            return TraduccionAyuda_413BE.Obtener_413BE("lb_repglo_todos", "Todos");
        }

        private void btnGenerar_Click_413BE(object? sender, EventArgs e)
        {
            Consorcio_413BE? consorcio = cboConsorcio_413BE.SelectedItem as Consorcio_413BE;
            try
            {
                _reporte_413BE = _reporteBLL_413BE.Generar_413BE(dtpDesde_413BE.Value, dtpHasta_413BE.Value,
                    consorcio?.IdConsorcio_413BE, consorcio?.Nombre_413BE ?? TextoTodos_413BE());
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, this.Text);
                return;
            }
            MostrarReporte_413BE(_reporte_413BE);
            if (_reporte_413BE.Filas_413BE.Count == 0)
            {
                MessageBox.Show(TraduccionAyuda_413BE.Obtener_413BE("lb_repglo_sinDatos", "No hay reclamos para los filtros elegidos."), this.Text);
            }
        }

        private void MostrarReporte_413BE(ReporteGlobal_413BE reporte)
        {
            dgvReporte_413BE.Rows.Clear();
            foreach (ReporteGlobalFila_413BE f in reporte.Filas_413BE)
            {
                int i = dgvReporte_413BE.Rows.Add(CeldasFila_413BE(f).Cast<object>().ToArray());
                if (f.Critica_413BE)
                {
                    dgvReporte_413BE.Rows[i].DefaultCellStyle.ForeColor = ColorAlerta_413BE;
                    dgvReporte_413BE.Rows[i].DefaultCellStyle.SelectionForeColor = Color.MistyRose;
                }
            }
            if (reporte.Filas_413BE.Count > 0)
            {
                int t = dgvReporte_413BE.Rows.Add(CeldasFila_413BE(reporte.Total_413BE).Cast<object>().ToArray());
                dgvReporte_413BE.Rows[t].DefaultCellStyle.Font = new Font(dgvReporte_413BE.Font, FontStyle.Bold);
                dgvReporte_413BE.Rows[t].DefaultCellStyle.BackColor = Color.Gainsboro;
            }
            dgvReporte_413BE.ClearSelection();
            btnExportar_413BE.Enabled = reporte.Filas_413BE.Count > 0;
            picGrafico_413BE.Invalidate();
        }

        // Textos de una fila, iguales para la grilla y para el PDF.
        private static List<string> CeldasFila_413BE(ReporteGlobalFila_413BE f)
        {
            string consorcio = f.EsTotal_413BE ? TraduccionAyuda_413BE.Obtener_413BE("lb_repglo_total", "Total general") : f.Consorcio_413BE;
            string proveedor = f.EsTotal_413BE ? ""
                : f.ProveedorPrincipal_413BE == null ? "-" : f.ProveedorPrincipal_413BE + " (" + f.AtendidosProveedorPrincipal_413BE + ")";
            List<string> motivos = new List<string>();
            if (f.ResolucionBaja_413BE) motivos.Add(TraduccionAyuda_413BE.Obtener_413BE("lb_repglo_motivoResolucion", "Resolución baja"));
            if (f.DemoraAlta_413BE) motivos.Add(TraduccionAyuda_413BE.Obtener_413BE("lb_repglo_motivoDemora", "Demora alta"));
            return new List<string>
            {
                consorcio,
                f.Categoria_413BE,
                f.CantidadReclamos_413BE.ToString(),
                f.CantidadCerrados_413BE.ToString(),
                f.PorcentajeResolucion_413BE.ToString("N2") + " %",
                f.CostoTotal_413BE.ToString("N2"),
                f.CostoPromedio_413BE.ToString("N2"),
                f.DiasPromedioCierre_413BE?.ToString("N2") ?? "-",
                proveedor,
                string.Join(" / ", motivos),
            };
        }

        private void btnExportar_Click_413BE(object? sender, EventArgs e)
        {
            if (_reporte_413BE == null || _reporte_413BE.Filas_413BE.Count == 0) return;
            dlgGuardarPdf_413BE.FileName = "reporte_global.pdf";
            if (dlgGuardarPdf_413BE.ShowDialog() != DialogResult.OK) return;
            try
            {
                List<string> encabezados = dgvReporte_413BE.Columns.Cast<DataGridViewColumn>().Select(c => c.HeaderText).ToList();
                List<List<string>> filas = _reporte_413BE.Filas_413BE.Select(CeldasFila_413BE).ToList();
                filas.Add(CeldasFila_413BE(_reporte_413BE.Total_413BE));
                string subtitulo = TraduccionAyuda_413BE.Obtener_413BE("lb_repglo_periodo", "Período") + ": "
                    + _reporte_413BE.Desde_413BE.ToString("dd/MM/yyyy") + " - " + _reporte_413BE.Hasta_413BE.ToString("dd/MM/yyyy")
                    + "   |   " + lblConsorcio_413BE.Text + ": " + _reporte_413BE.NombreConsorcio_413BE
                    + "   |   " + TraduccionAyuda_413BE.Obtener_413BE("lb_repglo_generado", "Generado") + ": "
                    + _reporte_413BE.FechaGeneracion_413BE.ToString("dd/MM/yyyy HH:mm");
                _reporteBLL_413BE.Exportar_413BE(_reporte_413BE, dlgGuardarPdf_413BE.FileName, this.Text, subtitulo, lblLeyenda_413BE.Text,
                    encabezados, filas, grpGrafico_413BE.Text);
                MessageBox.Show(lbPdfGenerado_413BE.Text, this.Text);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, this.Text);
            }
        }

        private void picGrafico_Resize_413BE(object? sender, EventArgs e)
        {
            picGrafico_413BE.Invalidate();
        }

        // Gráfico de barras horizontales: costo total imputado por categoría.
        private void picGrafico_Paint_413BE(object? sender, PaintEventArgs e)
        {
            Graphics g = e.Graphics;
            g.SmoothingMode = System.Drawing.Drawing2D.SmoothingMode.AntiAlias;
            Rectangle area = picGrafico_413BE.ClientRectangle;
            if (_reporte_413BE == null || _reporte_413BE.CostoPorCategoria_413BE.Count == 0) return;

            List<ReporteGlobalCategoria_413BE> barras = _reporte_413BE.CostoPorCategoria_413BE;
            Font fuente = picGrafico_413BE.Font;
            int margen = 10;
            int anchoEtiqueta = (int)Math.Ceiling(barras.Max(b => g.MeasureString(b.Categoria_413BE, fuente).Width)) + 10;
            int anchoValor = (int)Math.Ceiling(barras.Max(b => g.MeasureString(b.CostoTotal_413BE.ToString("N2"), fuente).Width)) + 10;
            int anchoMaximo = Math.Max(10, area.Width - 2 * margen - anchoEtiqueta - anchoValor);
            int alto = Math.Max(12, Math.Min(28, (area.Height - 2 * margen) / barras.Count - 6));
            decimal maximo = Math.Max(1m, barras.Max(b => b.CostoTotal_413BE));

            using (SolidBrush pincel = new SolidBrush(ColorBarra_413BE))
            using (SolidBrush texto = new SolidBrush(Color.Black))
            {
                int y = margen;
                foreach (ReporteGlobalCategoria_413BE b in barras)
                {
                    float centro = y + alto / 2f - fuente.Height / 2f;
                    g.DrawString(b.Categoria_413BE, fuente, texto, margen, centro);
                    int largo = (int)Math.Round((double)(b.CostoTotal_413BE / maximo) * anchoMaximo);
                    if (largo > 0) g.FillRectangle(pincel, margen + anchoEtiqueta, y, largo, alto);
                    g.DrawString(b.CostoTotal_413BE.ToString("N2"), fuente, texto, margen + anchoEtiqueta + largo + 4, centro);
                    y += alto + 6;
                }
            }
        }
    }
}
