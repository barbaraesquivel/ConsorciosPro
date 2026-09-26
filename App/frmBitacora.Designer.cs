namespace AppBase
{
    partial class frmBitacora
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
            lbUsuario = new Label();
            cmbUsuario = new ComboBox();
            chkFiltrarFecha = new CheckBox();
            lbDesde = new Label();
            dtpDesde = new DateTimePicker();
            lbHasta = new Label();
            dtpHasta = new DateTimePicker();
            lbActividad = new Label();
            txtActividad = new TextBox();
            btnBuscar = new Button();
            btnExportar = new Button();
            btnSalir = new Button();
            dataResultados = new DataGridView();
            lbFecha = new Label();
            lbDetalle = new Label();
            lbTodos = new Label();
            lbExportOk = new Label();
            lbExportError = new Label();
            ((System.ComponentModel.ISupportInitialize)dataResultados).BeginInit();
            SuspendLayout();
            lbUsuario.AutoSize = true;
            lbUsuario.Location = new Point(20, 22);
            lbUsuario.Name = "lbUsuario";
            lbUsuario.Size = new Size(60, 15);
            lbUsuario.TabIndex = 0;
            lbUsuario.Tag = "lb_Usuario";
            lbUsuario.Text = "Usuario";
            cmbUsuario.DropDownStyle = ComboBoxStyle.DropDownList;
            cmbUsuario.Location = new Point(90, 19);
            cmbUsuario.Name = "cmbUsuario";
            cmbUsuario.Size = new Size(200, 23);
            cmbUsuario.TabIndex = 1;
            chkFiltrarFecha.AutoSize = true;
            chkFiltrarFecha.Location = new Point(310, 21);
            chkFiltrarFecha.Name = "chkFiltrarFecha";
            chkFiltrarFecha.Size = new Size(110, 19);
            chkFiltrarFecha.TabIndex = 2;
            chkFiltrarFecha.Tag = "chk_filtrar_fecha";
            chkFiltrarFecha.Text = "Filtrar por fecha";
            chkFiltrarFecha.CheckedChanged += HabilitarFecha;
            lbDesde.AutoSize = true;
            lbDesde.Location = new Point(430, 22);
            lbDesde.Name = "lbDesde";
            lbDesde.Size = new Size(42, 15);
            lbDesde.TabIndex = 3;
            lbDesde.Tag = "lb_desde";
            lbDesde.Text = "Desde";
            dtpDesde.Format = DateTimePickerFormat.Short;
            dtpDesde.Location = new Point(478, 19);
            dtpDesde.Name = "dtpDesde";
            dtpDesde.Size = new Size(110, 23);
            dtpDesde.TabIndex = 4;
            lbHasta.AutoSize = true;
            lbHasta.Location = new Point(600, 22);
            lbHasta.Name = "lbHasta";
            lbHasta.Size = new Size(37, 15);
            lbHasta.TabIndex = 5;
            lbHasta.Tag = "lb_hasta";
            lbHasta.Text = "Hasta";
            dtpHasta.Format = DateTimePickerFormat.Short;
            dtpHasta.Location = new Point(645, 19);
            dtpHasta.Name = "dtpHasta";
            dtpHasta.Size = new Size(110, 23);
            dtpHasta.TabIndex = 6;
            lbActividad.AutoSize = true;
            lbActividad.Location = new Point(20, 55);
            lbActividad.Name = "lbActividad";
            lbActividad.Size = new Size(58, 15);
            lbActividad.TabIndex = 7;
            lbActividad.Tag = "lb_actividad";
            lbActividad.Text = "Actividad";
            txtActividad.Location = new Point(90, 52);
            txtActividad.Name = "txtActividad";
            txtActividad.Size = new Size(200, 23);
            txtActividad.TabIndex = 8;
            btnBuscar.Location = new Point(20, 90);
            btnBuscar.Name = "btnBuscar";
            btnBuscar.Size = new Size(120, 30);
            btnBuscar.TabIndex = 9;
            btnBuscar.Tag = "btn_buscar";
            btnBuscar.Text = "Buscar";
            btnBuscar.UseVisualStyleBackColor = true;
            btnBuscar.Click += Buscar;
            btnExportar.Location = new Point(150, 90);
            btnExportar.Name = "btnExportar";
            btnExportar.Size = new Size(140, 30);
            btnExportar.TabIndex = 10;
            btnExportar.Tag = "btn_exportar_csv";
            btnExportar.Text = "Exportar CSV";
            btnExportar.UseVisualStyleBackColor = true;
            btnExportar.Click += Exportar;
            btnSalir.Location = new Point(635, 90);
            btnSalir.Name = "btnSalir";
            btnSalir.Size = new Size(120, 30);
            btnSalir.TabIndex = 11;
            btnSalir.Tag = "btn_salir";
            btnSalir.Text = "Salir";
            btnSalir.UseVisualStyleBackColor = true;
            btnSalir.Click += Salir;
            dataResultados.AllowUserToAddRows = false;
            dataResultados.AllowUserToDeleteRows = false;
            dataResultados.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dataResultados.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            dataResultados.Location = new Point(20, 135);
            dataResultados.Name = "dataResultados";
            dataResultados.ReadOnly = true;
            dataResultados.RowHeadersVisible = false;
            dataResultados.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
            dataResultados.Size = new Size(940, 480);
            dataResultados.TabIndex = 12;
            lbFecha.AutoSize = true;
            lbFecha.Location = new Point(20, 645);
            lbFecha.Name = "lbFecha";
            lbFecha.Size = new Size(38, 15);
            lbFecha.TabIndex = 13;
            lbFecha.Tag = "lb_fecha";
            lbFecha.Text = "Fecha";
            lbFecha.Visible = false;
            lbDetalle.AutoSize = true;
            lbDetalle.Location = new Point(100, 645);
            lbDetalle.Name = "lbDetalle";
            lbDetalle.Size = new Size(46, 15);
            lbDetalle.TabIndex = 14;
            lbDetalle.Tag = "lb_detalle";
            lbDetalle.Text = "Detalle";
            lbDetalle.Visible = false;
            lbTodos.AutoSize = true;
            lbTodos.Location = new Point(180, 645);
            lbTodos.Name = "lbTodos";
            lbTodos.Size = new Size(48, 15);
            lbTodos.TabIndex = 15;
            lbTodos.Tag = "lb_todos";
            lbTodos.Text = "(Todos)";
            lbTodos.Visible = false;
            lbExportOk.AutoSize = true;
            lbExportOk.Location = new Point(260, 645);
            lbExportOk.Name = "lbExportOk";
            lbExportOk.Size = new Size(140, 15);
            lbExportOk.TabIndex = 16;
            lbExportOk.Tag = "lb_export_ok";
            lbExportOk.Text = "Exportacion realizada con exito";
            lbExportOk.Visible = false;
            lbExportError.AutoSize = true;
            lbExportError.Location = new Point(420, 645);
            lbExportError.Name = "lbExportError";
            lbExportError.Size = new Size(110, 15);
            lbExportError.TabIndex = 17;
            lbExportError.Tag = "lb_export_error";
            lbExportError.Text = "Error al exportar";
            lbExportError.Visible = false;
            AutoScaleDimensions = new SizeF(7F, 15F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(980, 680);
            Controls.Add(lbUsuario);
            Controls.Add(cmbUsuario);
            Controls.Add(chkFiltrarFecha);
            Controls.Add(lbDesde);
            Controls.Add(dtpDesde);
            Controls.Add(lbHasta);
            Controls.Add(dtpHasta);
            Controls.Add(lbActividad);
            Controls.Add(txtActividad);
            Controls.Add(btnBuscar);
            Controls.Add(btnExportar);
            Controls.Add(btnSalir);
            Controls.Add(dataResultados);
            Controls.Add(lbFecha);
            Controls.Add(lbDetalle);
            Controls.Add(lbTodos);
            Controls.Add(lbExportOk);
            Controls.Add(lbExportError);
            Name = "frmBitacora";
            Tag = "lb_bitacora";
            Text = "Bitacora";
            FormClosing += frmBitacora_FormClosing;
            Load += LoadForm;
            ((System.ComponentModel.ISupportInitialize)dataResultados).EndInit();
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private Label lbUsuario;
        private ComboBox cmbUsuario;
        private CheckBox chkFiltrarFecha;
        private Label lbDesde;
        private DateTimePicker dtpDesde;
        private Label lbHasta;
        private DateTimePicker dtpHasta;
        private Label lbActividad;
        private TextBox txtActividad;
        private Button btnBuscar;
        private Button btnExportar;
        private Button btnSalir;
        private DataGridView dataResultados;
        private Label lbFecha;
        private Label lbDetalle;
        private Label lbTodos;
        private Label lbExportOk;
        private Label lbExportError;
    }
}
