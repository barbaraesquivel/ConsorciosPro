namespace AppBase
{
    partial class frmDefinirOrdenDia_413BE
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
            this.tlpPrincipal = new System.Windows.Forms.TableLayoutPanel();
            this.grpPropuestas = new System.Windows.Forms.GroupBox();
            this.dgvPropuestas = new System.Windows.Forms.DataGridView();
            this.dgvPropuestasColId = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvPropuestasColConsorcio = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvPropuestasColFechaGeneracion = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvPropuestasColPeriodo = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvPropuestasColUmbral = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.grpTemas = new System.Windows.Forms.GroupBox();
            this.dgvTemas = new System.Windows.Forms.DataGridView();
            this.dgvTemasColIncluir = new System.Windows.Forms.DataGridViewCheckBoxColumn();
            this.dgvTemasColPosicion = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvTemasColCategoria = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvTemasColUbicacion = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvTemasColCantidad = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvTemasColCostoAcumulado = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvTemasColCostoSolucion = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvTemasColAhorro = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.pnlOrden = new System.Windows.Forms.Panel();
            this.btnSubir = new System.Windows.Forms.Button();
            this.btnBajar = new System.Windows.Forms.Button();
            this.grpRegistro = new System.Windows.Forms.GroupBox();
            this.lblFechaAsamblea = new System.Windows.Forms.Label();
            this.dtpFechaAsamblea = new System.Windows.Forms.DateTimePicker();
            this.btnRegistrarOrdenDia = new System.Windows.Forms.Button();
            this.btnCancelar = new System.Windows.Forms.Button();
            this.lbOrdenRegistrado = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.dgvPropuestas)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgvTemas)).BeginInit();
            this.tlpPrincipal.SuspendLayout();
            this.grpPropuestas.SuspendLayout();
            this.grpTemas.SuspendLayout();
            this.pnlOrden.SuspendLayout();
            this.grpRegistro.SuspendLayout();
            this.SuspendLayout();
            // tlpPrincipal
            this.tlpPrincipal.Controls.Add(this.grpPropuestas, 0, 0);
            this.tlpPrincipal.Controls.Add(this.grpTemas, 0, 1);
            this.tlpPrincipal.Controls.Add(this.grpRegistro, 0, 2);
            this.tlpPrincipal.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.tlpPrincipal.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 35F));
            this.tlpPrincipal.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 65F));
            this.tlpPrincipal.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 80F));
            this.tlpPrincipal.ColumnCount = 1;
            this.tlpPrincipal.RowCount = 3;
            this.tlpPrincipal.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tlpPrincipal.Padding = new System.Windows.Forms.Padding(9);
            this.tlpPrincipal.Name = "tlpPrincipal";
            this.tlpPrincipal.TabIndex = 0;
            // grpPropuestas
            this.grpPropuestas.Controls.Add(this.dgvPropuestas);
            this.grpPropuestas.Dock = System.Windows.Forms.DockStyle.Fill;
            this.grpPropuestas.Name = "grpPropuestas";
            this.grpPropuestas.TabIndex = 0;
            this.grpPropuestas.TabStop = false;
            this.grpPropuestas.Tag = "grp_ordia_grpPropuestas";
            this.grpPropuestas.Text = "Propuestas generadas";
            this.dgvPropuestas.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.dgvPropuestasColId, this.dgvPropuestasColConsorcio, this.dgvPropuestasColFechaGeneracion, this.dgvPropuestasColPeriodo, this.dgvPropuestasColUmbral});
            this.dgvPropuestas.AllowUserToAddRows = false;
            this.dgvPropuestas.AllowUserToDeleteRows = false;
            this.dgvPropuestas.AllowUserToResizeRows = false;
            this.dgvPropuestas.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgvPropuestas.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvPropuestas.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dgvPropuestas.MultiSelect = false;
            this.dgvPropuestas.Name = "dgvPropuestas";
            this.dgvPropuestas.ReadOnly = true;
            this.dgvPropuestas.RowHeadersVisible = false;
            this.dgvPropuestas.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgvPropuestas.TabIndex = 0;
            this.dgvPropuestas.SelectionChanged += new System.EventHandler(this.dgvPropuestas_SelectionChanged_413BE);
            this.dgvPropuestasColId.FillWeight = 30F;
            this.dgvPropuestasColId.HeaderText = "Id";
            this.dgvPropuestasColId.Name = "dgvPropuestasColId";
            this.dgvPropuestasColId.ReadOnly = true;
            this.dgvPropuestasColId.Tag = "col_ordia_dgvPropuestasColId";
            this.dgvPropuestasColConsorcio.HeaderText = "Consorcio";
            this.dgvPropuestasColConsorcio.Name = "dgvPropuestasColConsorcio";
            this.dgvPropuestasColConsorcio.ReadOnly = true;
            this.dgvPropuestasColConsorcio.Tag = "col_ordia_dgvPropuestasColConsorcio";
            this.dgvPropuestasColFechaGeneracion.HeaderText = "Fecha de generación";
            this.dgvPropuestasColFechaGeneracion.Name = "dgvPropuestasColFechaGeneracion";
            this.dgvPropuestasColFechaGeneracion.ReadOnly = true;
            this.dgvPropuestasColFechaGeneracion.Tag = "col_ordia_dgvPropuestasColFechaGeneracion";
            this.dgvPropuestasColPeriodo.HeaderText = "Período";
            this.dgvPropuestasColPeriodo.Name = "dgvPropuestasColPeriodo";
            this.dgvPropuestasColPeriodo.ReadOnly = true;
            this.dgvPropuestasColPeriodo.Tag = "col_ordia_dgvPropuestasColPeriodo";
            this.dgvPropuestasColUmbral.FillWeight = 50F;
            this.dgvPropuestasColUmbral.HeaderText = "Umbral";
            this.dgvPropuestasColUmbral.Name = "dgvPropuestasColUmbral";
            this.dgvPropuestasColUmbral.ReadOnly = true;
            this.dgvPropuestasColUmbral.Tag = "col_ordia_dgvPropuestasColUmbral";
            // grpTemas
            this.grpTemas.Controls.Add(this.dgvTemas);
            this.grpTemas.Controls.Add(this.pnlOrden);
            this.grpTemas.Dock = System.Windows.Forms.DockStyle.Fill;
            this.grpTemas.Name = "grpTemas";
            this.grpTemas.TabIndex = 1;
            this.grpTemas.TabStop = false;
            this.grpTemas.Tag = "grp_ordia_grpTemas";
            this.grpTemas.Text = "Temas de la propuesta";
            this.dgvTemas.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.dgvTemasColIncluir, this.dgvTemasColPosicion, this.dgvTemasColCategoria, this.dgvTemasColUbicacion, this.dgvTemasColCantidad, this.dgvTemasColCostoAcumulado, this.dgvTemasColCostoSolucion, this.dgvTemasColAhorro});
            this.dgvTemas.AllowUserToAddRows = false;
            this.dgvTemas.AllowUserToDeleteRows = false;
            this.dgvTemas.AllowUserToResizeRows = false;
            this.dgvTemas.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgvTemas.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvTemas.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dgvTemas.MultiSelect = false;
            this.dgvTemas.Name = "dgvTemas";
            this.dgvTemas.RowHeadersVisible = false;
            this.dgvTemas.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgvTemas.TabIndex = 0;
            this.dgvTemasColIncluir.FillWeight = 40F;
            this.dgvTemasColIncluir.HeaderText = "Incluir";
            this.dgvTemasColIncluir.Name = "dgvTemasColIncluir";
            this.dgvTemasColIncluir.ReadOnly = false;
            this.dgvTemasColIncluir.Tag = "col_ordia_dgvTemasColIncluir";
            this.dgvTemasColPosicion.FillWeight = 50F;
            this.dgvTemasColPosicion.HeaderText = "Posición ranking";
            this.dgvTemasColPosicion.Name = "dgvTemasColPosicion";
            this.dgvTemasColPosicion.ReadOnly = true;
            this.dgvTemasColPosicion.Tag = "col_ordia_dgvTemasColPosicion";
            this.dgvTemasColCategoria.HeaderText = "Categoría";
            this.dgvTemasColCategoria.Name = "dgvTemasColCategoria";
            this.dgvTemasColCategoria.ReadOnly = true;
            this.dgvTemasColCategoria.Tag = "col_ordia_dgvTemasColCategoria";
            this.dgvTemasColUbicacion.HeaderText = "Ubicación";
            this.dgvTemasColUbicacion.Name = "dgvTemasColUbicacion";
            this.dgvTemasColUbicacion.ReadOnly = true;
            this.dgvTemasColUbicacion.Tag = "col_ordia_dgvTemasColUbicacion";
            this.dgvTemasColCantidad.HeaderText = "Cantidad de reclamos";
            this.dgvTemasColCantidad.Name = "dgvTemasColCantidad";
            this.dgvTemasColCantidad.ReadOnly = true;
            this.dgvTemasColCantidad.Tag = "col_ordia_dgvTemasColCantidad";
            this.dgvTemasColCostoAcumulado.HeaderText = "Costo acumulado";
            this.dgvTemasColCostoAcumulado.Name = "dgvTemasColCostoAcumulado";
            this.dgvTemasColCostoAcumulado.ReadOnly = true;
            this.dgvTemasColCostoAcumulado.Tag = "col_ordia_dgvTemasColCostoAcumulado";
            this.dgvTemasColCostoSolucion.HeaderText = "Costo de solución";
            this.dgvTemasColCostoSolucion.Name = "dgvTemasColCostoSolucion";
            this.dgvTemasColCostoSolucion.ReadOnly = true;
            this.dgvTemasColCostoSolucion.Tag = "col_ordia_dgvTemasColCostoSolucion";
            this.dgvTemasColAhorro.HeaderText = "Ahorro estimado";
            this.dgvTemasColAhorro.Name = "dgvTemasColAhorro";
            this.dgvTemasColAhorro.ReadOnly = true;
            this.dgvTemasColAhorro.Tag = "col_ordia_dgvTemasColAhorro";
            this.pnlOrden.Controls.Add(this.btnSubir);
            this.pnlOrden.Controls.Add(this.btnBajar);
            this.pnlOrden.Dock = System.Windows.Forms.DockStyle.Right;
            this.pnlOrden.Name = "pnlOrden";
            this.pnlOrden.Size = new System.Drawing.Size(110, 200);
            this.pnlOrden.TabIndex = 1;
            this.btnSubir.Enabled = false;
            this.btnSubir.Location = new System.Drawing.Point(8, 6);
            this.btnSubir.Name = "btnSubir";
            this.btnSubir.Size = new System.Drawing.Size(95, 28);
            this.btnSubir.TabIndex = 0;
            this.btnSubir.Tag = "btn_ordia_btnSubir";
            this.btnSubir.Text = "Subir";
            this.btnSubir.UseVisualStyleBackColor = true;
            this.btnSubir.Click += new System.EventHandler(this.btnSubir_Click_413BE);
            this.btnBajar.Enabled = false;
            this.btnBajar.Location = new System.Drawing.Point(8, 42);
            this.btnBajar.Name = "btnBajar";
            this.btnBajar.Size = new System.Drawing.Size(95, 28);
            this.btnBajar.TabIndex = 1;
            this.btnBajar.Tag = "btn_ordia_btnBajar";
            this.btnBajar.Text = "Bajar";
            this.btnBajar.UseVisualStyleBackColor = true;
            this.btnBajar.Click += new System.EventHandler(this.btnBajar_Click_413BE);
            // grpRegistro
            this.grpRegistro.Controls.Add(this.lblFechaAsamblea);
            this.grpRegistro.Controls.Add(this.dtpFechaAsamblea);
            this.grpRegistro.Controls.Add(this.btnRegistrarOrdenDia);
            this.grpRegistro.Controls.Add(this.btnCancelar);
            this.grpRegistro.Dock = System.Windows.Forms.DockStyle.Fill;
            this.grpRegistro.Name = "grpRegistro";
            this.grpRegistro.TabIndex = 2;
            this.grpRegistro.TabStop = false;
            this.grpRegistro.Tag = "grp_ordia_grpRegistro";
            this.grpRegistro.Text = "Orden del día";
            this.lblFechaAsamblea.AutoSize = true;
            this.lblFechaAsamblea.Location = new System.Drawing.Point(15, 34);
            this.lblFechaAsamblea.Name = "lblFechaAsamblea";
            this.lblFechaAsamblea.TabIndex = 0;
            this.lblFechaAsamblea.Tag = "lb_ordia_lblFechaAsamblea";
            this.lblFechaAsamblea.Text = "Fecha de la asamblea";
            this.dtpFechaAsamblea.Enabled = false;
            this.dtpFechaAsamblea.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.dtpFechaAsamblea.Location = new System.Drawing.Point(170, 30);
            this.dtpFechaAsamblea.Name = "dtpFechaAsamblea";
            this.dtpFechaAsamblea.Size = new System.Drawing.Size(130, 23);
            this.dtpFechaAsamblea.TabIndex = 1;
            this.btnRegistrarOrdenDia.Enabled = false;
            this.btnRegistrarOrdenDia.Location = new System.Drawing.Point(330, 27);
            this.btnRegistrarOrdenDia.Name = "btnRegistrarOrdenDia";
            this.btnRegistrarOrdenDia.Size = new System.Drawing.Size(180, 28);
            this.btnRegistrarOrdenDia.TabIndex = 2;
            this.btnRegistrarOrdenDia.Tag = "btn_ordia_btnRegistrarOrdenDia";
            this.btnRegistrarOrdenDia.Text = "Registrar orden del día";
            this.btnRegistrarOrdenDia.UseVisualStyleBackColor = true;
            this.btnRegistrarOrdenDia.Click += new System.EventHandler(this.btnRegistrarOrdenDia_Click_413BE);
            this.btnCancelar.Enabled = false;
            this.btnCancelar.Location = new System.Drawing.Point(525, 27);
            this.btnCancelar.Name = "btnCancelar";
            this.btnCancelar.Size = new System.Drawing.Size(120, 28);
            this.btnCancelar.TabIndex = 3;
            this.btnCancelar.Tag = "btn_ordia_btnCancelar";
            this.btnCancelar.Text = "Cancelar";
            this.btnCancelar.UseVisualStyleBackColor = true;
            this.btnCancelar.Click += new System.EventHandler(this.btnCancelar_Click_413BE);
            // mensaje oculto
            this.lbOrdenRegistrado.AutoSize = true;
            this.lbOrdenRegistrado.Location = new System.Drawing.Point(3, 3);
            this.lbOrdenRegistrado.Name = "lbOrdenRegistrado";
            this.lbOrdenRegistrado.TabIndex = 100;
            this.lbOrdenRegistrado.Tag = "lb_ordia_ordenRegistrado";
            this.lbOrdenRegistrado.Text = "Orden del día registrado";
            this.lbOrdenRegistrado.Visible = false;
            // frmDefinirOrdenDia_413BE
            this.AutoScaleDimensions = new System.Drawing.SizeF(7F, 15F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1100, 700);
            this.Controls.Add(this.tlpPrincipal);
            this.Controls.Add(this.lbOrdenRegistrado);
            this.MinimumSize = new System.Drawing.Size(900, 600);
            this.Name = "frmDefinirOrdenDia_413BE";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterParent;
            this.Text = "Definir orden del día";
            this.Load += new System.EventHandler(this.frmDefinirOrdenDia_Load_413BE);
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.frmDefinirOrdenDia_FormClosing_413BE);
            ((System.ComponentModel.ISupportInitialize)(this.dgvPropuestas)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgvTemas)).EndInit();
            this.tlpPrincipal.ResumeLayout(false);
            this.grpPropuestas.ResumeLayout(false);
            this.grpTemas.ResumeLayout(false);
            this.pnlOrden.ResumeLayout(false);
            this.grpRegistro.ResumeLayout(false);
            this.grpRegistro.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();
        }

        #endregion

        private System.Windows.Forms.TableLayoutPanel tlpPrincipal;
        private System.Windows.Forms.GroupBox grpPropuestas;
        private System.Windows.Forms.DataGridView dgvPropuestas;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvPropuestasColId;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvPropuestasColConsorcio;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvPropuestasColFechaGeneracion;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvPropuestasColPeriodo;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvPropuestasColUmbral;
        private System.Windows.Forms.GroupBox grpTemas;
        private System.Windows.Forms.DataGridView dgvTemas;
        private System.Windows.Forms.DataGridViewCheckBoxColumn dgvTemasColIncluir;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvTemasColPosicion;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvTemasColCategoria;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvTemasColUbicacion;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvTemasColCantidad;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvTemasColCostoAcumulado;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvTemasColCostoSolucion;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvTemasColAhorro;
        private System.Windows.Forms.Panel pnlOrden;
        private System.Windows.Forms.Button btnSubir;
        private System.Windows.Forms.Button btnBajar;
        private System.Windows.Forms.GroupBox grpRegistro;
        private System.Windows.Forms.Label lblFechaAsamblea;
        private System.Windows.Forms.DateTimePicker dtpFechaAsamblea;
        private System.Windows.Forms.Button btnRegistrarOrdenDia;
        private System.Windows.Forms.Button btnCancelar;
        private System.Windows.Forms.Label lbOrdenRegistrado;
    }
}
