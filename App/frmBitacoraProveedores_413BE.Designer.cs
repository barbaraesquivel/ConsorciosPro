namespace AppBase
{
    partial class frmBitacoraProveedores_413BE
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
            this.grpFiltros = new System.Windows.Forms.GroupBox();
            this.lblCodigo = new System.Windows.Forms.Label();
            this.cboCodigo = new System.Windows.Forms.ComboBox();
            this.lblNombre = new System.Windows.Forms.Label();
            this.cboNombre = new System.Windows.Forms.ComboBox();
            this.grpBitacora = new System.Windows.Forms.GroupBox();
            this.dgvBitacora = new System.Windows.Forms.DataGridView();
            this.dgvBitacoraColCodigo = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvBitacoraColFecha = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvBitacoraColHora = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvBitacoraColNombre = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvBitacoraColCuit = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvBitacoraColEmail = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvBitacoraColHabilitado = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvBitacoraColAct = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.pnlBotones = new System.Windows.Forms.Panel();
            this.btnAplicar = new System.Windows.Forms.Button();
            this.btnSalir = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.dgvBitacora)).BeginInit();
            this.tlpPrincipal.SuspendLayout();
            this.grpFiltros.SuspendLayout();
            this.grpBitacora.SuspendLayout();
            this.pnlBotones.SuspendLayout();
            this.SuspendLayout();
            // tlpPrincipal
            this.tlpPrincipal.Controls.Add(this.grpFiltros, 0, 0);
            this.tlpPrincipal.Controls.Add(this.grpBitacora, 0, 1);
            this.tlpPrincipal.Controls.Add(this.pnlBotones, 0, 2);
            this.tlpPrincipal.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.tlpPrincipal.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 90F));
            this.tlpPrincipal.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.tlpPrincipal.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 50F));
            this.tlpPrincipal.ColumnCount = 1;
            this.tlpPrincipal.RowCount = 3;
            this.tlpPrincipal.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tlpPrincipal.Padding = new System.Windows.Forms.Padding(9);
            this.tlpPrincipal.Name = "tlpPrincipal";
            this.tlpPrincipal.TabIndex = 0;
            // grpFiltros
            this.grpFiltros.Controls.Add(this.lblCodigo);
            this.grpFiltros.Controls.Add(this.cboCodigo);
            this.grpFiltros.Controls.Add(this.lblNombre);
            this.grpFiltros.Controls.Add(this.cboNombre);
            this.grpFiltros.Dock = System.Windows.Forms.DockStyle.Fill;
            this.grpFiltros.Name = "grpFiltros";
            this.grpFiltros.TabIndex = 0;
            this.grpFiltros.TabStop = false;
            this.grpFiltros.Tag = "grp_bitprov_grpFiltros";
            this.grpFiltros.Text = "Filtros";
            this.lblCodigo.AutoSize = true;
            this.lblCodigo.Location = new System.Drawing.Point(15, 24);
            this.lblCodigo.Name = "lblCodigo";
            this.lblCodigo.TabIndex = 0;
            this.lblCodigo.Tag = "lb_bitprov_lblCodigo";
            this.lblCodigo.Text = "Código de proveedor";
            this.cboCodigo.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cboCodigo.Location = new System.Drawing.Point(15, 44);
            this.cboCodigo.Name = "cboCodigo";
            this.cboCodigo.Size = new System.Drawing.Size(160, 23);
            this.cboCodigo.TabIndex = 1;
            this.cboCodigo.SelectionChangeCommitted += new System.EventHandler(this.cboFiltro_SelectionChangeCommitted_413BE);
            this.lblNombre.AutoSize = true;
            this.lblNombre.Location = new System.Drawing.Point(195, 24);
            this.lblNombre.Name = "lblNombre";
            this.lblNombre.TabIndex = 2;
            this.lblNombre.Tag = "lb_bitprov_lblNombre";
            this.lblNombre.Text = "Nombre";
            this.cboNombre.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cboNombre.Location = new System.Drawing.Point(195, 44);
            this.cboNombre.Name = "cboNombre";
            this.cboNombre.Size = new System.Drawing.Size(300, 23);
            this.cboNombre.TabIndex = 3;
            this.cboNombre.SelectionChangeCommitted += new System.EventHandler(this.cboFiltro_SelectionChangeCommitted_413BE);
            // grpBitacora
            this.grpBitacora.Controls.Add(this.dgvBitacora);
            this.grpBitacora.Dock = System.Windows.Forms.DockStyle.Fill;
            this.grpBitacora.Name = "grpBitacora";
            this.grpBitacora.TabIndex = 1;
            this.grpBitacora.TabStop = false;
            this.grpBitacora.Tag = "grp_bitprov_grpBitacora";
            this.grpBitacora.Text = "Versiones registradas";
            this.dgvBitacora.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.dgvBitacoraColCodigo, this.dgvBitacoraColFecha, this.dgvBitacoraColHora, this.dgvBitacoraColNombre, this.dgvBitacoraColCuit, this.dgvBitacoraColEmail, this.dgvBitacoraColHabilitado, this.dgvBitacoraColAct});
            this.dgvBitacora.AllowUserToAddRows = false;
            this.dgvBitacora.AllowUserToDeleteRows = false;
            this.dgvBitacora.AllowUserToResizeRows = false;
            this.dgvBitacora.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgvBitacora.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvBitacora.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dgvBitacora.MultiSelect = false;
            this.dgvBitacora.Name = "dgvBitacora";
            this.dgvBitacora.ReadOnly = true;
            this.dgvBitacora.RowHeadersVisible = false;
            this.dgvBitacora.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgvBitacora.TabIndex = 0;
            this.dgvBitacoraColCodigo.FillWeight = 50F;
            this.dgvBitacoraColCodigo.HeaderText = "Cod. proveedor";
            this.dgvBitacoraColCodigo.Name = "dgvBitacoraColCodigo";
            this.dgvBitacoraColCodigo.ReadOnly = true;
            this.dgvBitacoraColCodigo.Tag = "col_bitprov_dgvBitacoraColCodigo";
            this.dgvBitacoraColFecha.FillWeight = 60F;
            this.dgvBitacoraColFecha.HeaderText = "Fecha";
            this.dgvBitacoraColFecha.Name = "dgvBitacoraColFecha";
            this.dgvBitacoraColFecha.ReadOnly = true;
            this.dgvBitacoraColFecha.Tag = "col_bitprov_dgvBitacoraColFecha";
            this.dgvBitacoraColHora.FillWeight = 50F;
            this.dgvBitacoraColHora.HeaderText = "Hora";
            this.dgvBitacoraColHora.Name = "dgvBitacoraColHora";
            this.dgvBitacoraColHora.ReadOnly = true;
            this.dgvBitacoraColHora.Tag = "col_bitprov_dgvBitacoraColHora";
            this.dgvBitacoraColNombre.HeaderText = "Nombre";
            this.dgvBitacoraColNombre.Name = "dgvBitacoraColNombre";
            this.dgvBitacoraColNombre.ReadOnly = true;
            this.dgvBitacoraColNombre.Tag = "col_bitprov_dgvBitacoraColNombre";
            this.dgvBitacoraColCuit.FillWeight = 70F;
            this.dgvBitacoraColCuit.HeaderText = "CUIT";
            this.dgvBitacoraColCuit.Name = "dgvBitacoraColCuit";
            this.dgvBitacoraColCuit.ReadOnly = true;
            this.dgvBitacoraColCuit.Tag = "col_bitprov_dgvBitacoraColCuit";
            this.dgvBitacoraColEmail.HeaderText = "Email";
            this.dgvBitacoraColEmail.Name = "dgvBitacoraColEmail";
            this.dgvBitacoraColEmail.ReadOnly = true;
            this.dgvBitacoraColEmail.Tag = "col_bitprov_dgvBitacoraColEmail";
            this.dgvBitacoraColHabilitado.FillWeight = 50F;
            this.dgvBitacoraColHabilitado.HeaderText = "Habilitado";
            this.dgvBitacoraColHabilitado.Name = "dgvBitacoraColHabilitado";
            this.dgvBitacoraColHabilitado.ReadOnly = true;
            this.dgvBitacoraColHabilitado.Tag = "col_bitprov_dgvBitacoraColHabilitado";
            this.dgvBitacoraColAct.FillWeight = 30F;
            this.dgvBitacoraColAct.HeaderText = "Act";
            this.dgvBitacoraColAct.Name = "dgvBitacoraColAct";
            this.dgvBitacoraColAct.ReadOnly = true;
            this.dgvBitacoraColAct.Tag = "col_bitprov_dgvBitacoraColAct";
            // pnlBotones
            this.pnlBotones.Controls.Add(this.btnAplicar);
            this.pnlBotones.Controls.Add(this.btnSalir);
            this.pnlBotones.Dock = System.Windows.Forms.DockStyle.Fill;
            this.pnlBotones.Name = "pnlBotones";
            this.pnlBotones.TabIndex = 2;
            this.btnAplicar.Location = new System.Drawing.Point(3, 8);
            this.btnAplicar.Name = "btnAplicar";
            this.btnAplicar.Size = new System.Drawing.Size(140, 30);
            this.btnAplicar.TabIndex = 0;
            this.btnAplicar.Tag = "btn_bitprov_btnAplicar";
            this.btnAplicar.Text = "Aplicar";
            this.btnAplicar.UseVisualStyleBackColor = true;
            this.btnAplicar.Click += new System.EventHandler(this.btnAplicar_Click_413BE);
            this.btnSalir.Location = new System.Drawing.Point(155, 8);
            this.btnSalir.Name = "btnSalir";
            this.btnSalir.Size = new System.Drawing.Size(140, 30);
            this.btnSalir.TabIndex = 1;
            this.btnSalir.Tag = "btn_bitprov_btnSalir";
            this.btnSalir.Text = "Salir";
            this.btnSalir.UseVisualStyleBackColor = true;
            this.btnSalir.Click += new System.EventHandler(this.btnSalir_Click_413BE);
            // frmBitacoraProveedores_413BE
            this.AutoScaleDimensions = new System.Drawing.SizeF(7F, 15F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1100, 700);
            this.Controls.Add(this.tlpPrincipal);
            this.MinimumSize = new System.Drawing.Size(900, 600);
            this.Name = "frmBitacoraProveedores_413BE";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterParent;
            this.Tag = "frm_bitprov_frmBitacoraProveedores";
            this.Text = "Bitácora de cambios de proveedores";
            this.Load += new System.EventHandler(this.frmBitacoraProveedores_Load_413BE);
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.frmBitacoraProveedores_FormClosing_413BE);
            ((System.ComponentModel.ISupportInitialize)(this.dgvBitacora)).EndInit();
            this.tlpPrincipal.ResumeLayout(false);
            this.grpFiltros.ResumeLayout(false);
            this.grpFiltros.PerformLayout();
            this.grpBitacora.ResumeLayout(false);
            this.pnlBotones.ResumeLayout(false);
            this.ResumeLayout(false);
            this.PerformLayout();
        }

        #endregion

        private System.Windows.Forms.TableLayoutPanel tlpPrincipal;
        private System.Windows.Forms.GroupBox grpFiltros;
        private System.Windows.Forms.Label lblCodigo;
        private System.Windows.Forms.ComboBox cboCodigo;
        private System.Windows.Forms.Label lblNombre;
        private System.Windows.Forms.ComboBox cboNombre;
        private System.Windows.Forms.GroupBox grpBitacora;
        private System.Windows.Forms.DataGridView dgvBitacora;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvBitacoraColCodigo;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvBitacoraColFecha;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvBitacoraColHora;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvBitacoraColNombre;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvBitacoraColCuit;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvBitacoraColEmail;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvBitacoraColHabilitado;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvBitacoraColAct;
        private System.Windows.Forms.Panel pnlBotones;
        private System.Windows.Forms.Button btnAplicar;
        private System.Windows.Forms.Button btnSalir;
    }
}
