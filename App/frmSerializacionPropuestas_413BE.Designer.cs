namespace AppBase
{
    partial class frmSerializacionPropuestas_413BE
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
            this.dgvPropuestasColEstado = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.pnlAcciones = new System.Windows.Forms.Panel();
            this.btnSerializar = new System.Windows.Forms.Button();
            this.btnDeserializar = new System.Windows.Forms.Button();
            this.grpLeidos = new System.Windows.Forms.GroupBox();
            this.dgvTemasLeidos = new System.Windows.Forms.DataGridView();
            this.dgvTemasLeidosColPosicion = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvTemasLeidosColCategoria = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvTemasLeidosColUbicacion = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvTemasLeidosColCantidad = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvTemasLeidosColCostoAcumulado = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvTemasLeidosColCostoSolucion = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvTemasLeidosColAhorro = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvTemasLeidosColOrden = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.pnlResumen = new System.Windows.Forms.Panel();
            this.lbOrigenDatos = new System.Windows.Forms.Label();
            this.lbResumenLeido = new System.Windows.Forms.Label();
            this.dlgGuardarXml = new System.Windows.Forms.SaveFileDialog();
            this.dlgAbrirXml = new System.Windows.Forms.OpenFileDialog();
            this.lbSerializada = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.dgvPropuestas)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgvTemasLeidos)).BeginInit();
            this.tlpPrincipal.SuspendLayout();
            this.grpPropuestas.SuspendLayout();
            this.pnlAcciones.SuspendLayout();
            this.grpLeidos.SuspendLayout();
            this.pnlResumen.SuspendLayout();
            this.SuspendLayout();
            // tlpPrincipal
            this.tlpPrincipal.Controls.Add(this.grpPropuestas, 0, 0);
            this.tlpPrincipal.Controls.Add(this.grpLeidos, 0, 1);
            this.tlpPrincipal.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.tlpPrincipal.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 45F));
            this.tlpPrincipal.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 55F));
            this.tlpPrincipal.ColumnCount = 1;
            this.tlpPrincipal.RowCount = 2;
            this.tlpPrincipal.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tlpPrincipal.Padding = new System.Windows.Forms.Padding(9);
            this.tlpPrincipal.Name = "tlpPrincipal";
            this.tlpPrincipal.TabIndex = 0;
            // grpPropuestas
            this.grpPropuestas.Controls.Add(this.dgvPropuestas);
            this.grpPropuestas.Controls.Add(this.pnlAcciones);
            this.grpPropuestas.Dock = System.Windows.Forms.DockStyle.Fill;
            this.grpPropuestas.Name = "grpPropuestas";
            this.grpPropuestas.TabIndex = 0;
            this.grpPropuestas.TabStop = false;
            this.grpPropuestas.Tag = "grp_serprop_grpPropuestas";
            this.grpPropuestas.Text = "Propuestas";
            this.dgvPropuestas.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.dgvPropuestasColId, this.dgvPropuestasColConsorcio, this.dgvPropuestasColFechaGeneracion, this.dgvPropuestasColEstado});
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
            this.dgvPropuestasColId.FillWeight = 30F;
            this.dgvPropuestasColId.HeaderText = "Id";
            this.dgvPropuestasColId.Name = "dgvPropuestasColId";
            this.dgvPropuestasColId.ReadOnly = true;
            this.dgvPropuestasColId.Tag = "col_serprop_dgvPropuestasColId";
            this.dgvPropuestasColConsorcio.HeaderText = "Consorcio";
            this.dgvPropuestasColConsorcio.Name = "dgvPropuestasColConsorcio";
            this.dgvPropuestasColConsorcio.ReadOnly = true;
            this.dgvPropuestasColConsorcio.Tag = "col_serprop_dgvPropuestasColConsorcio";
            this.dgvPropuestasColFechaGeneracion.HeaderText = "Fecha de generación";
            this.dgvPropuestasColFechaGeneracion.Name = "dgvPropuestasColFechaGeneracion";
            this.dgvPropuestasColFechaGeneracion.ReadOnly = true;
            this.dgvPropuestasColFechaGeneracion.Tag = "col_serprop_dgvPropuestasColFechaGeneracion";
            this.dgvPropuestasColEstado.HeaderText = "Estado";
            this.dgvPropuestasColEstado.Name = "dgvPropuestasColEstado";
            this.dgvPropuestasColEstado.ReadOnly = true;
            this.dgvPropuestasColEstado.Tag = "col_serprop_dgvPropuestasColEstado";
            this.pnlAcciones.Controls.Add(this.btnSerializar);
            this.pnlAcciones.Controls.Add(this.btnDeserializar);
            this.pnlAcciones.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.pnlAcciones.Name = "pnlAcciones";
            this.pnlAcciones.Size = new System.Drawing.Size(1056, 40);
            this.pnlAcciones.TabIndex = 1;
            this.btnSerializar.Location = new System.Drawing.Point(6, 6);
            this.btnSerializar.Name = "btnSerializar";
            this.btnSerializar.Size = new System.Drawing.Size(240, 28);
            this.btnSerializar.TabIndex = 0;
            this.btnSerializar.Tag = "btn_serprop_btnSerializar";
            this.btnSerializar.Text = "Serializar propuesta seleccionada";
            this.btnSerializar.UseVisualStyleBackColor = true;
            this.btnSerializar.Click += new System.EventHandler(this.btnSerializar_Click_413BE);
            this.btnDeserializar.Location = new System.Drawing.Point(260, 6);
            this.btnDeserializar.Name = "btnDeserializar";
            this.btnDeserializar.Size = new System.Drawing.Size(200, 28);
            this.btnDeserializar.TabIndex = 1;
            this.btnDeserializar.Tag = "btn_serprop_btnDeserializar";
            this.btnDeserializar.Text = "Deserializar archivo…";
            this.btnDeserializar.UseVisualStyleBackColor = true;
            this.btnDeserializar.Click += new System.EventHandler(this.btnDeserializar_Click_413BE);
            // grpLeidos
            this.grpLeidos.Controls.Add(this.dgvTemasLeidos);
            this.grpLeidos.Controls.Add(this.pnlResumen);
            this.grpLeidos.Dock = System.Windows.Forms.DockStyle.Fill;
            this.grpLeidos.Name = "grpLeidos";
            this.grpLeidos.TabIndex = 1;
            this.grpLeidos.TabStop = false;
            this.grpLeidos.Tag = "grp_serprop_grpLeidos";
            this.grpLeidos.Text = "Propuesta deserializada";
            this.dgvTemasLeidos.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.dgvTemasLeidosColPosicion, this.dgvTemasLeidosColCategoria, this.dgvTemasLeidosColUbicacion, this.dgvTemasLeidosColCantidad, this.dgvTemasLeidosColCostoAcumulado, this.dgvTemasLeidosColCostoSolucion, this.dgvTemasLeidosColAhorro, this.dgvTemasLeidosColOrden});
            this.dgvTemasLeidos.AllowUserToAddRows = false;
            this.dgvTemasLeidos.AllowUserToDeleteRows = false;
            this.dgvTemasLeidos.AllowUserToResizeRows = false;
            this.dgvTemasLeidos.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgvTemasLeidos.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvTemasLeidos.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dgvTemasLeidos.MultiSelect = false;
            this.dgvTemasLeidos.Name = "dgvTemasLeidos";
            this.dgvTemasLeidos.ReadOnly = true;
            this.dgvTemasLeidos.RowHeadersVisible = false;
            this.dgvTemasLeidos.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgvTemasLeidos.TabIndex = 0;
            this.dgvTemasLeidosColPosicion.FillWeight = 50F;
            this.dgvTemasLeidosColPosicion.HeaderText = "Posición";
            this.dgvTemasLeidosColPosicion.Name = "dgvTemasLeidosColPosicion";
            this.dgvTemasLeidosColPosicion.Tag = "col_serprop_dgvTemasLeidosColPosicion";
            this.dgvTemasLeidosColCategoria.HeaderText = "Categoría";
            this.dgvTemasLeidosColCategoria.Name = "dgvTemasLeidosColCategoria";
            this.dgvTemasLeidosColCategoria.Tag = "col_serprop_dgvTemasLeidosColCategoria";
            this.dgvTemasLeidosColUbicacion.HeaderText = "Ubicación";
            this.dgvTemasLeidosColUbicacion.Name = "dgvTemasLeidosColUbicacion";
            this.dgvTemasLeidosColUbicacion.Tag = "col_serprop_dgvTemasLeidosColUbicacion";
            this.dgvTemasLeidosColCantidad.FillWeight = 60F;
            this.dgvTemasLeidosColCantidad.HeaderText = "Cantidad";
            this.dgvTemasLeidosColCantidad.Name = "dgvTemasLeidosColCantidad";
            this.dgvTemasLeidosColCantidad.Tag = "col_serprop_dgvTemasLeidosColCantidad";
            this.dgvTemasLeidosColCostoAcumulado.HeaderText = "Costo acumulado";
            this.dgvTemasLeidosColCostoAcumulado.Name = "dgvTemasLeidosColCostoAcumulado";
            this.dgvTemasLeidosColCostoAcumulado.Tag = "col_serprop_dgvTemasLeidosColCostoAcumulado";
            this.dgvTemasLeidosColCostoSolucion.HeaderText = "Costo de solución";
            this.dgvTemasLeidosColCostoSolucion.Name = "dgvTemasLeidosColCostoSolucion";
            this.dgvTemasLeidosColCostoSolucion.Tag = "col_serprop_dgvTemasLeidosColCostoSolucion";
            this.dgvTemasLeidosColAhorro.HeaderText = "Ahorro estimado";
            this.dgvTemasLeidosColAhorro.Name = "dgvTemasLeidosColAhorro";
            this.dgvTemasLeidosColAhorro.Tag = "col_serprop_dgvTemasLeidosColAhorro";
            this.dgvTemasLeidosColOrden.HeaderText = "Orden en el orden del día";
            this.dgvTemasLeidosColOrden.Name = "dgvTemasLeidosColOrden";
            this.dgvTemasLeidosColOrden.Tag = "col_serprop_dgvTemasLeidosColOrden";
            this.pnlResumen.Controls.Add(this.lbOrigenDatos);
            this.pnlResumen.Controls.Add(this.lbResumenLeido);
            this.pnlResumen.Dock = System.Windows.Forms.DockStyle.Top;
            this.pnlResumen.Name = "pnlResumen";
            this.pnlResumen.Size = new System.Drawing.Size(1056, 64);
            this.pnlResumen.TabIndex = 1;
            this.lbOrigenDatos.AutoSize = true;
            this.lbOrigenDatos.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Bold);
            this.lbOrigenDatos.Location = new System.Drawing.Point(6, 4);
            this.lbOrigenDatos.Name = "lbOrigenDatos";
            this.lbOrigenDatos.TabIndex = 0;
            this.lbOrigenDatos.Tag = "lb_serprop_lbOrigenDatos";
            this.lbOrigenDatos.Text = "Datos leídos del archivo (no se guardan en la base)";
            this.lbOrigenDatos.Visible = false;
            this.lbResumenLeido.AutoSize = true;
            this.lbResumenLeido.Location = new System.Drawing.Point(6, 24);
            this.lbResumenLeido.Name = "lbResumenLeido";
            this.lbResumenLeido.TabIndex = 1;
            this.lbResumenLeido.Tag = "lb_serprop_lbResumenLeido";
            this.lbResumenLeido.Text = "";
            // dialogos
            this.dlgGuardarXml.DefaultExt = "xml";
            this.dlgGuardarXml.Filter = "XML (*.xml)|*.xml";
            this.dlgAbrirXml.DefaultExt = "xml";
            this.dlgAbrirXml.Filter = "XML (*.xml)|*.xml";
            // mensaje oculto
            this.lbSerializada.AutoSize = true;
            this.lbSerializada.Location = new System.Drawing.Point(3, 3);
            this.lbSerializada.Name = "lbSerializada";
            this.lbSerializada.TabIndex = 100;
            this.lbSerializada.Tag = "lb_serprop_serializada";
            this.lbSerializada.Text = "Propuesta serializada";
            this.lbSerializada.Visible = false;
            // frmSerializacionPropuestas_413BE
            this.AutoScaleDimensions = new System.Drawing.SizeF(7F, 15F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1100, 700);
            this.Controls.Add(this.tlpPrincipal);
            this.Controls.Add(this.lbSerializada);
            this.MinimumSize = new System.Drawing.Size(900, 600);
            this.Name = "frmSerializacionPropuestas_413BE";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterParent;
            this.Text = "Serializar propuestas";
            this.Load += new System.EventHandler(this.frmSerializacionPropuestas_Load_413BE);
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.frmSerializacionPropuestas_FormClosing_413BE);
            ((System.ComponentModel.ISupportInitialize)(this.dgvPropuestas)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgvTemasLeidos)).EndInit();
            this.tlpPrincipal.ResumeLayout(false);
            this.grpPropuestas.ResumeLayout(false);
            this.pnlAcciones.ResumeLayout(false);
            this.grpLeidos.ResumeLayout(false);
            this.pnlResumen.ResumeLayout(false);
            this.pnlResumen.PerformLayout();
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
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvPropuestasColEstado;
        private System.Windows.Forms.Panel pnlAcciones;
        private System.Windows.Forms.Button btnSerializar;
        private System.Windows.Forms.Button btnDeserializar;
        private System.Windows.Forms.GroupBox grpLeidos;
        private System.Windows.Forms.DataGridView dgvTemasLeidos;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvTemasLeidosColPosicion;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvTemasLeidosColCategoria;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvTemasLeidosColUbicacion;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvTemasLeidosColCantidad;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvTemasLeidosColCostoAcumulado;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvTemasLeidosColCostoSolucion;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvTemasLeidosColAhorro;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvTemasLeidosColOrden;
        private System.Windows.Forms.Panel pnlResumen;
        private System.Windows.Forms.Label lbOrigenDatos;
        private System.Windows.Forms.Label lbResumenLeido;
        private System.Windows.Forms.SaveFileDialog dlgGuardarXml;
        private System.Windows.Forms.OpenFileDialog dlgAbrirXml;
        private System.Windows.Forms.Label lbSerializada;
    }
}
