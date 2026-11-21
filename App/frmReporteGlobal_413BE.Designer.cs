namespace AppBase
{
    partial class frmReporteGlobal_413BE
    {
        private System.ComponentModel.IContainer components = null;

        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        private void InitializeComponent()
        {
            this.tlpPrincipal_413BE = new System.Windows.Forms.TableLayoutPanel();
            this.grpFiltros_413BE = new System.Windows.Forms.GroupBox();
            this.lblDesde_413BE = new System.Windows.Forms.Label();
            this.dtpDesde_413BE = new System.Windows.Forms.DateTimePicker();
            this.lblHasta_413BE = new System.Windows.Forms.Label();
            this.dtpHasta_413BE = new System.Windows.Forms.DateTimePicker();
            this.lblConsorcio_413BE = new System.Windows.Forms.Label();
            this.cboConsorcio_413BE = new System.Windows.Forms.ComboBox();
            this.btnGenerar_413BE = new System.Windows.Forms.Button();
            this.btnExportar_413BE = new System.Windows.Forms.Button();
            this.lbPdfGenerado_413BE = new System.Windows.Forms.Label();
            this.dlgGuardarPdf_413BE = new System.Windows.Forms.SaveFileDialog();
            this.grpResultados_413BE = new System.Windows.Forms.GroupBox();
            this.dgvReporte_413BE = new System.Windows.Forms.DataGridView();
            this.colConsorcio_413BE = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colCategoria_413BE = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colReclamos_413BE = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colCerrados_413BE = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colResolucion_413BE = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colCostoTotal_413BE = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colCostoPromedio_413BE = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colDiasPromedio_413BE = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colProveedor_413BE = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colIndicador_413BE = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.lblLeyenda_413BE = new System.Windows.Forms.Label();
            this.grpGrafico_413BE = new System.Windows.Forms.GroupBox();
            this.picGrafico_413BE = new System.Windows.Forms.PictureBox();
            ((System.ComponentModel.ISupportInitialize)(this.dgvReporte_413BE)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.picGrafico_413BE)).BeginInit();
            this.tlpPrincipal_413BE.SuspendLayout();
            this.grpFiltros_413BE.SuspendLayout();
            this.grpResultados_413BE.SuspendLayout();
            this.grpGrafico_413BE.SuspendLayout();
            this.SuspendLayout();
            // tlpPrincipal_413BE
            this.tlpPrincipal_413BE.ColumnCount = 1;
            this.tlpPrincipal_413BE.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.tlpPrincipal_413BE.Controls.Add(this.grpFiltros_413BE, 0, 0);
            this.tlpPrincipal_413BE.Controls.Add(this.grpResultados_413BE, 0, 1);
            this.tlpPrincipal_413BE.Controls.Add(this.lblLeyenda_413BE, 0, 2);
            this.tlpPrincipal_413BE.Controls.Add(this.grpGrafico_413BE, 0, 3);
            this.tlpPrincipal_413BE.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tlpPrincipal_413BE.Name = "tlpPrincipal_413BE";
            this.tlpPrincipal_413BE.Padding = new System.Windows.Forms.Padding(9);
            this.tlpPrincipal_413BE.RowCount = 4;
            this.tlpPrincipal_413BE.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 90F));
            this.tlpPrincipal_413BE.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 58F));
            this.tlpPrincipal_413BE.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 26F));
            this.tlpPrincipal_413BE.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 42F));
            this.tlpPrincipal_413BE.TabIndex = 0;
            // grpFiltros_413BE
            this.grpFiltros_413BE.Controls.Add(this.lblDesde_413BE);
            this.grpFiltros_413BE.Controls.Add(this.dtpDesde_413BE);
            this.grpFiltros_413BE.Controls.Add(this.lblHasta_413BE);
            this.grpFiltros_413BE.Controls.Add(this.dtpHasta_413BE);
            this.grpFiltros_413BE.Controls.Add(this.lblConsorcio_413BE);
            this.grpFiltros_413BE.Controls.Add(this.cboConsorcio_413BE);
            this.grpFiltros_413BE.Controls.Add(this.btnGenerar_413BE);
            this.grpFiltros_413BE.Controls.Add(this.btnExportar_413BE);
            this.grpFiltros_413BE.Dock = System.Windows.Forms.DockStyle.Fill;
            this.grpFiltros_413BE.Name = "grpFiltros_413BE";
            this.grpFiltros_413BE.TabIndex = 0;
            this.grpFiltros_413BE.TabStop = false;
            this.grpFiltros_413BE.Tag = "grp_repglo_grpFiltros";
            this.grpFiltros_413BE.Text = "Filtros";
            this.lblDesde_413BE.AutoSize = true;
            this.lblDesde_413BE.Location = new System.Drawing.Point(15, 24);
            this.lblDesde_413BE.Name = "lblDesde_413BE";
            this.lblDesde_413BE.TabIndex = 0;
            this.lblDesde_413BE.Tag = "lb_repglo_lblDesde";
            this.lblDesde_413BE.Text = "Desde";
            this.dtpDesde_413BE.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.dtpDesde_413BE.Location = new System.Drawing.Point(15, 44);
            this.dtpDesde_413BE.Name = "dtpDesde_413BE";
            this.dtpDesde_413BE.Size = new System.Drawing.Size(130, 23);
            this.dtpDesde_413BE.TabIndex = 1;
            this.lblHasta_413BE.AutoSize = true;
            this.lblHasta_413BE.Location = new System.Drawing.Point(165, 24);
            this.lblHasta_413BE.Name = "lblHasta_413BE";
            this.lblHasta_413BE.TabIndex = 2;
            this.lblHasta_413BE.Tag = "lb_repglo_lblHasta";
            this.lblHasta_413BE.Text = "Hasta";
            this.dtpHasta_413BE.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.dtpHasta_413BE.Location = new System.Drawing.Point(165, 44);
            this.dtpHasta_413BE.Name = "dtpHasta_413BE";
            this.dtpHasta_413BE.Size = new System.Drawing.Size(130, 23);
            this.dtpHasta_413BE.TabIndex = 3;
            this.lblConsorcio_413BE.AutoSize = true;
            this.lblConsorcio_413BE.Location = new System.Drawing.Point(315, 24);
            this.lblConsorcio_413BE.Name = "lblConsorcio_413BE";
            this.lblConsorcio_413BE.TabIndex = 4;
            this.lblConsorcio_413BE.Tag = "lb_repglo_lblConsorcio";
            this.lblConsorcio_413BE.Text = "Consorcio";
            this.cboConsorcio_413BE.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cboConsorcio_413BE.Location = new System.Drawing.Point(315, 44);
            this.cboConsorcio_413BE.Name = "cboConsorcio_413BE";
            this.cboConsorcio_413BE.Size = new System.Drawing.Size(240, 23);
            this.cboConsorcio_413BE.TabIndex = 5;
            this.btnGenerar_413BE.Location = new System.Drawing.Point(575, 41);
            this.btnGenerar_413BE.Name = "btnGenerar_413BE";
            this.btnGenerar_413BE.Size = new System.Drawing.Size(120, 28);
            this.btnGenerar_413BE.TabIndex = 6;
            this.btnGenerar_413BE.Tag = "btn_repglo_btnGenerar";
            this.btnGenerar_413BE.Text = "Generar";
            this.btnGenerar_413BE.UseVisualStyleBackColor = true;
            this.btnGenerar_413BE.Click += new System.EventHandler(this.btnGenerar_Click_413BE);
            this.btnExportar_413BE.Enabled = false;
            this.btnExportar_413BE.Location = new System.Drawing.Point(705, 41);
            this.btnExportar_413BE.Name = "btnExportar_413BE";
            this.btnExportar_413BE.Size = new System.Drawing.Size(130, 28);
            this.btnExportar_413BE.TabIndex = 7;
            this.btnExportar_413BE.Tag = "btn_repglo_btnExportar";
            this.btnExportar_413BE.Text = "Exportar a PDF";
            this.btnExportar_413BE.UseVisualStyleBackColor = true;
            this.btnExportar_413BE.Click += new System.EventHandler(this.btnExportar_Click_413BE);
            this.lbPdfGenerado_413BE.AutoSize = true;
            this.lbPdfGenerado_413BE.Location = new System.Drawing.Point(3, 3);
            this.lbPdfGenerado_413BE.Name = "lbPdfGenerado_413BE";
            this.lbPdfGenerado_413BE.TabIndex = 100;
            this.lbPdfGenerado_413BE.Tag = "lb_his_pdfGenerado";
            this.lbPdfGenerado_413BE.Text = "PDF generado correctamente";
            this.lbPdfGenerado_413BE.Visible = false;
            this.dlgGuardarPdf_413BE.Filter = "PDF|*.pdf";
            // grpResultados_413BE
            this.grpResultados_413BE.Controls.Add(this.dgvReporte_413BE);
            this.grpResultados_413BE.Dock = System.Windows.Forms.DockStyle.Fill;
            this.grpResultados_413BE.Name = "grpResultados_413BE";
            this.grpResultados_413BE.TabIndex = 1;
            this.grpResultados_413BE.TabStop = false;
            this.grpResultados_413BE.Tag = "grp_repglo_grpResultados";
            this.grpResultados_413BE.Text = "Resultados por consorcio y categoría";
            this.dgvReporte_413BE.AllowUserToAddRows = false;
            this.dgvReporte_413BE.AllowUserToDeleteRows = false;
            this.dgvReporte_413BE.AllowUserToResizeRows = false;
            this.dgvReporte_413BE.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgvReporte_413BE.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvReporte_413BE.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.colConsorcio_413BE, this.colCategoria_413BE, this.colReclamos_413BE, this.colCerrados_413BE, this.colResolucion_413BE,
            this.colCostoTotal_413BE, this.colCostoPromedio_413BE, this.colDiasPromedio_413BE, this.colProveedor_413BE, this.colIndicador_413BE});
            this.dgvReporte_413BE.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dgvReporte_413BE.MultiSelect = false;
            this.dgvReporte_413BE.Name = "dgvReporte_413BE";
            this.dgvReporte_413BE.ReadOnly = true;
            this.dgvReporte_413BE.RowHeadersVisible = false;
            this.dgvReporte_413BE.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgvReporte_413BE.TabIndex = 0;
            this.colConsorcio_413BE.FillWeight = 150F;
            this.colConsorcio_413BE.HeaderText = "Consorcio";
            this.colConsorcio_413BE.Name = "colConsorcio_413BE";
            this.colConsorcio_413BE.Tag = "col_repglo_colConsorcio";
            this.colCategoria_413BE.HeaderText = "Categoría";
            this.colCategoria_413BE.Name = "colCategoria_413BE";
            this.colCategoria_413BE.Tag = "col_repglo_colCategoria";
            this.colReclamos_413BE.FillWeight = 60F;
            this.colReclamos_413BE.HeaderText = "Reclamos";
            this.colReclamos_413BE.Name = "colReclamos_413BE";
            this.colReclamos_413BE.Tag = "col_repglo_colReclamos";
            this.colCerrados_413BE.FillWeight = 60F;
            this.colCerrados_413BE.HeaderText = "Cerrados";
            this.colCerrados_413BE.Name = "colCerrados_413BE";
            this.colCerrados_413BE.Tag = "col_repglo_colCerrados";
            this.colResolucion_413BE.FillWeight = 70F;
            this.colResolucion_413BE.HeaderText = "% resolución";
            this.colResolucion_413BE.Name = "colResolucion_413BE";
            this.colResolucion_413BE.Tag = "col_repglo_colResolucion";
            this.colCostoTotal_413BE.FillWeight = 90F;
            this.colCostoTotal_413BE.HeaderText = "Costo total";
            this.colCostoTotal_413BE.Name = "colCostoTotal_413BE";
            this.colCostoTotal_413BE.Tag = "col_repglo_colCostoTotal";
            this.colCostoPromedio_413BE.FillWeight = 90F;
            this.colCostoPromedio_413BE.HeaderText = "Costo promedio";
            this.colCostoPromedio_413BE.Name = "colCostoPromedio_413BE";
            this.colCostoPromedio_413BE.Tag = "col_repglo_colCostoPromedio";
            this.colDiasPromedio_413BE.FillWeight = 80F;
            this.colDiasPromedio_413BE.HeaderText = "Días promedio de cierre";
            this.colDiasPromedio_413BE.Name = "colDiasPromedio_413BE";
            this.colDiasPromedio_413BE.Tag = "col_repglo_colDiasPromedio";
            this.colProveedor_413BE.FillWeight = 150F;
            this.colProveedor_413BE.HeaderText = "Proveedor principal";
            this.colProveedor_413BE.Name = "colProveedor_413BE";
            this.colProveedor_413BE.Tag = "col_repglo_colProveedor";
            this.colIndicador_413BE.FillWeight = 120F;
            this.colIndicador_413BE.HeaderText = "Indicador";
            this.colIndicador_413BE.Name = "colIndicador_413BE";
            this.colIndicador_413BE.Tag = "col_repglo_colIndicador";
            // lblLeyenda_413BE
            this.lblLeyenda_413BE.AutoSize = true;
            this.lblLeyenda_413BE.ForeColor = System.Drawing.Color.Firebrick;
            this.lblLeyenda_413BE.Margin = new System.Windows.Forms.Padding(3, 6, 3, 0);
            this.lblLeyenda_413BE.Name = "lblLeyenda_413BE";
            this.lblLeyenda_413BE.TabIndex = 2;
            this.lblLeyenda_413BE.Tag = "lb_repglo_leyenda";
            this.lblLeyenda_413BE.Text = "En rojo: combinaciones con % de resolución menor o tiempo promedio de cierre mayor que el total general.";
            // grpGrafico_413BE
            this.grpGrafico_413BE.Controls.Add(this.picGrafico_413BE);
            this.grpGrafico_413BE.Dock = System.Windows.Forms.DockStyle.Fill;
            this.grpGrafico_413BE.Name = "grpGrafico_413BE";
            this.grpGrafico_413BE.TabIndex = 3;
            this.grpGrafico_413BE.TabStop = false;
            this.grpGrafico_413BE.Tag = "grp_repglo_grpGrafico";
            this.grpGrafico_413BE.Text = "Costo total por categoría";
            this.picGrafico_413BE.BackColor = System.Drawing.Color.White;
            this.picGrafico_413BE.Dock = System.Windows.Forms.DockStyle.Fill;
            this.picGrafico_413BE.Name = "picGrafico_413BE";
            this.picGrafico_413BE.TabStop = false;
            this.picGrafico_413BE.Paint += new System.Windows.Forms.PaintEventHandler(this.picGrafico_Paint_413BE);
            this.picGrafico_413BE.Resize += new System.EventHandler(this.picGrafico_Resize_413BE);
            // frmReporteGlobal_413BE
            this.AutoScaleDimensions = new System.Drawing.SizeF(7F, 15F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1100, 680);
            this.Controls.Add(this.tlpPrincipal_413BE);
            this.Controls.Add(this.lbPdfGenerado_413BE);
            this.Name = "frmReporteGlobal_413BE";
            this.Tag = "frm_repglo_frmReporteGlobal";
            this.Text = "Reporte Global";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.frmReporteGlobal_FormClosing_413BE);
            this.Load += new System.EventHandler(this.frmReporteGlobal_Load_413BE);
            ((System.ComponentModel.ISupportInitialize)(this.dgvReporte_413BE)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.picGrafico_413BE)).EndInit();
            this.tlpPrincipal_413BE.ResumeLayout(false);
            this.tlpPrincipal_413BE.PerformLayout();
            this.grpFiltros_413BE.ResumeLayout(false);
            this.grpFiltros_413BE.PerformLayout();
            this.grpResultados_413BE.ResumeLayout(false);
            this.grpGrafico_413BE.ResumeLayout(false);
            this.ResumeLayout(false);
            this.PerformLayout();
        }

        #endregion

        private System.Windows.Forms.TableLayoutPanel tlpPrincipal_413BE;
        private System.Windows.Forms.GroupBox grpFiltros_413BE;
        private System.Windows.Forms.Label lblDesde_413BE;
        private System.Windows.Forms.DateTimePicker dtpDesde_413BE;
        private System.Windows.Forms.Label lblHasta_413BE;
        private System.Windows.Forms.DateTimePicker dtpHasta_413BE;
        private System.Windows.Forms.Label lblConsorcio_413BE;
        private System.Windows.Forms.ComboBox cboConsorcio_413BE;
        private System.Windows.Forms.Button btnGenerar_413BE;
        private System.Windows.Forms.Button btnExportar_413BE;
        private System.Windows.Forms.Label lbPdfGenerado_413BE;
        private System.Windows.Forms.SaveFileDialog dlgGuardarPdf_413BE;
        private System.Windows.Forms.GroupBox grpResultados_413BE;
        private System.Windows.Forms.DataGridView dgvReporte_413BE;
        private System.Windows.Forms.DataGridViewTextBoxColumn colConsorcio_413BE;
        private System.Windows.Forms.DataGridViewTextBoxColumn colCategoria_413BE;
        private System.Windows.Forms.DataGridViewTextBoxColumn colReclamos_413BE;
        private System.Windows.Forms.DataGridViewTextBoxColumn colCerrados_413BE;
        private System.Windows.Forms.DataGridViewTextBoxColumn colResolucion_413BE;
        private System.Windows.Forms.DataGridViewTextBoxColumn colCostoTotal_413BE;
        private System.Windows.Forms.DataGridViewTextBoxColumn colCostoPromedio_413BE;
        private System.Windows.Forms.DataGridViewTextBoxColumn colDiasPromedio_413BE;
        private System.Windows.Forms.DataGridViewTextBoxColumn colProveedor_413BE;
        private System.Windows.Forms.DataGridViewTextBoxColumn colIndicador_413BE;
        private System.Windows.Forms.Label lblLeyenda_413BE;
        private System.Windows.Forms.GroupBox grpGrafico_413BE;
        private System.Windows.Forms.PictureBox picGrafico_413BE;
    }
}
