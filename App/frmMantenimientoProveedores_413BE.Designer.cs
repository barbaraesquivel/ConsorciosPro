namespace AppBase
{
    partial class frmMantenimientoProveedores_413BE
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
            this.grpProveedores = new System.Windows.Forms.GroupBox();
            this.dgvProveedores = new System.Windows.Forms.DataGridView();
            this.dgvProveedoresColCodigo = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvProveedoresColNombre = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvProveedoresColCuit = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvProveedoresColEmail = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dgvProveedoresColHabilitado = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.grpDatos = new System.Windows.Forms.GroupBox();
            this.lblNombre = new System.Windows.Forms.Label();
            this.txtNombre = new System.Windows.Forms.TextBox();
            this.lblCuit = new System.Windows.Forms.Label();
            this.txtCuit = new System.Windows.Forms.TextBox();
            this.lblEmail = new System.Windows.Forms.Label();
            this.txtEmail = new System.Windows.Forms.TextBox();
            this.btnNuevo = new System.Windows.Forms.Button();
            this.btnModificar = new System.Windows.Forms.Button();
            this.btnInhabilitar = new System.Windows.Forms.Button();
            this.btnHabilitar = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.dgvProveedores)).BeginInit();
            this.tlpPrincipal.SuspendLayout();
            this.grpProveedores.SuspendLayout();
            this.grpDatos.SuspendLayout();
            this.SuspendLayout();
            // tlpPrincipal
            this.tlpPrincipal.Controls.Add(this.grpProveedores, 0, 0);
            this.tlpPrincipal.Controls.Add(this.grpDatos, 0, 1);
            this.tlpPrincipal.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.tlpPrincipal.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.tlpPrincipal.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 170F));
            this.tlpPrincipal.ColumnCount = 1;
            this.tlpPrincipal.RowCount = 2;
            this.tlpPrincipal.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tlpPrincipal.Padding = new System.Windows.Forms.Padding(9);
            this.tlpPrincipal.Name = "tlpPrincipal";
            this.tlpPrincipal.TabIndex = 0;
            // grpProveedores
            this.grpProveedores.Controls.Add(this.dgvProveedores);
            this.grpProveedores.Dock = System.Windows.Forms.DockStyle.Fill;
            this.grpProveedores.Name = "grpProveedores";
            this.grpProveedores.TabIndex = 0;
            this.grpProveedores.TabStop = false;
            this.grpProveedores.Tag = "grp_mantprov_grpProveedores";
            this.grpProveedores.Text = "Proveedores";
            this.dgvProveedores.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.dgvProveedoresColCodigo, this.dgvProveedoresColNombre, this.dgvProveedoresColCuit, this.dgvProveedoresColEmail, this.dgvProveedoresColHabilitado});
            this.dgvProveedores.AllowUserToAddRows = false;
            this.dgvProveedores.AllowUserToDeleteRows = false;
            this.dgvProveedores.AllowUserToResizeRows = false;
            this.dgvProveedores.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgvProveedores.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvProveedores.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dgvProveedores.MultiSelect = false;
            this.dgvProveedores.Name = "dgvProveedores";
            this.dgvProveedores.ReadOnly = true;
            this.dgvProveedores.RowHeadersVisible = false;
            this.dgvProveedores.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgvProveedores.TabIndex = 0;
            this.dgvProveedores.SelectionChanged += new System.EventHandler(this.dgvProveedores_SelectionChanged_413BE);
            this.dgvProveedoresColCodigo.FillWeight = 40F;
            this.dgvProveedoresColCodigo.HeaderText = "Código";
            this.dgvProveedoresColCodigo.Name = "dgvProveedoresColCodigo";
            this.dgvProveedoresColCodigo.ReadOnly = true;
            this.dgvProveedoresColCodigo.Tag = "col_mantprov_dgvProveedoresColCodigo";
            this.dgvProveedoresColNombre.HeaderText = "Nombre";
            this.dgvProveedoresColNombre.Name = "dgvProveedoresColNombre";
            this.dgvProveedoresColNombre.ReadOnly = true;
            this.dgvProveedoresColNombre.Tag = "col_mantprov_dgvProveedoresColNombre";
            this.dgvProveedoresColCuit.FillWeight = 70F;
            this.dgvProveedoresColCuit.HeaderText = "CUIT";
            this.dgvProveedoresColCuit.Name = "dgvProveedoresColCuit";
            this.dgvProveedoresColCuit.ReadOnly = true;
            this.dgvProveedoresColCuit.Tag = "col_mantprov_dgvProveedoresColCuit";
            this.dgvProveedoresColEmail.HeaderText = "Email";
            this.dgvProveedoresColEmail.Name = "dgvProveedoresColEmail";
            this.dgvProveedoresColEmail.ReadOnly = true;
            this.dgvProveedoresColEmail.Tag = "col_mantprov_dgvProveedoresColEmail";
            this.dgvProveedoresColHabilitado.FillWeight = 50F;
            this.dgvProveedoresColHabilitado.HeaderText = "Habilitado";
            this.dgvProveedoresColHabilitado.Name = "dgvProveedoresColHabilitado";
            this.dgvProveedoresColHabilitado.ReadOnly = true;
            this.dgvProveedoresColHabilitado.Tag = "col_mantprov_dgvProveedoresColHabilitado";
            // grpDatos
            this.grpDatos.Controls.Add(this.lblNombre);
            this.grpDatos.Controls.Add(this.txtNombre);
            this.grpDatos.Controls.Add(this.lblCuit);
            this.grpDatos.Controls.Add(this.txtCuit);
            this.grpDatos.Controls.Add(this.lblEmail);
            this.grpDatos.Controls.Add(this.txtEmail);
            this.grpDatos.Controls.Add(this.btnNuevo);
            this.grpDatos.Controls.Add(this.btnModificar);
            this.grpDatos.Controls.Add(this.btnInhabilitar);
            this.grpDatos.Controls.Add(this.btnHabilitar);
            this.grpDatos.Dock = System.Windows.Forms.DockStyle.Fill;
            this.grpDatos.Name = "grpDatos";
            this.grpDatos.TabIndex = 1;
            this.grpDatos.TabStop = false;
            this.grpDatos.Tag = "grp_mantprov_grpDatos";
            this.grpDatos.Text = "Datos del proveedor";
            this.lblNombre.AutoSize = true;
            this.lblNombre.Location = new System.Drawing.Point(15, 26);
            this.lblNombre.Name = "lblNombre";
            this.lblNombre.TabIndex = 0;
            this.lblNombre.Tag = "lb_mantprov_lblNombre";
            this.lblNombre.Text = "Nombre";
            this.txtNombre.Location = new System.Drawing.Point(15, 46);
            this.txtNombre.MaxLength = 150;
            this.txtNombre.Name = "txtNombre";
            this.txtNombre.Size = new System.Drawing.Size(300, 23);
            this.txtNombre.TabIndex = 1;
            this.lblCuit.AutoSize = true;
            this.lblCuit.Location = new System.Drawing.Point(335, 26);
            this.lblCuit.Name = "lblCuit";
            this.lblCuit.TabIndex = 2;
            this.lblCuit.Tag = "lb_mantprov_lblCuit";
            this.lblCuit.Text = "CUIT";
            this.txtCuit.Location = new System.Drawing.Point(335, 46);
            this.txtCuit.MaxLength = 20;
            this.txtCuit.Name = "txtCuit";
            this.txtCuit.Size = new System.Drawing.Size(180, 23);
            this.txtCuit.TabIndex = 3;
            this.lblEmail.AutoSize = true;
            this.lblEmail.Location = new System.Drawing.Point(535, 26);
            this.lblEmail.Name = "lblEmail";
            this.lblEmail.TabIndex = 4;
            this.lblEmail.Tag = "lb_mantprov_lblEmail";
            this.lblEmail.Text = "Email";
            this.txtEmail.Location = new System.Drawing.Point(535, 46);
            this.txtEmail.MaxLength = 150;
            this.txtEmail.Name = "txtEmail";
            this.txtEmail.Size = new System.Drawing.Size(300, 23);
            this.txtEmail.TabIndex = 5;
            this.btnNuevo.Location = new System.Drawing.Point(15, 95);
            this.btnNuevo.Name = "btnNuevo";
            this.btnNuevo.Size = new System.Drawing.Size(140, 30);
            this.btnNuevo.TabIndex = 6;
            this.btnNuevo.Tag = "btn_mantprov_btnNuevo";
            this.btnNuevo.Text = "Nuevo";
            this.btnNuevo.UseVisualStyleBackColor = true;
            this.btnNuevo.Click += new System.EventHandler(this.btnNuevo_Click_413BE);
            this.btnModificar.Enabled = false;
            this.btnModificar.Location = new System.Drawing.Point(165, 95);
            this.btnModificar.Name = "btnModificar";
            this.btnModificar.Size = new System.Drawing.Size(140, 30);
            this.btnModificar.TabIndex = 7;
            this.btnModificar.Tag = "btn_mantprov_btnModificar";
            this.btnModificar.Text = "Modificar";
            this.btnModificar.UseVisualStyleBackColor = true;
            this.btnModificar.Click += new System.EventHandler(this.btnModificar_Click_413BE);
            this.btnInhabilitar.Enabled = false;
            this.btnInhabilitar.Location = new System.Drawing.Point(315, 95);
            this.btnInhabilitar.Name = "btnInhabilitar";
            this.btnInhabilitar.Size = new System.Drawing.Size(140, 30);
            this.btnInhabilitar.TabIndex = 8;
            this.btnInhabilitar.Tag = "btn_mantprov_btnInhabilitar";
            this.btnInhabilitar.Text = "Inhabilitar";
            this.btnInhabilitar.UseVisualStyleBackColor = true;
            this.btnInhabilitar.Click += new System.EventHandler(this.btnInhabilitar_Click_413BE);
            this.btnHabilitar.Enabled = false;
            this.btnHabilitar.Location = new System.Drawing.Point(465, 95);
            this.btnHabilitar.Name = "btnHabilitar";
            this.btnHabilitar.Size = new System.Drawing.Size(140, 30);
            this.btnHabilitar.TabIndex = 9;
            this.btnHabilitar.Tag = "btn_mantprov_btnHabilitar";
            this.btnHabilitar.Text = "Habilitar";
            this.btnHabilitar.UseVisualStyleBackColor = true;
            this.btnHabilitar.Click += new System.EventHandler(this.btnHabilitar_Click_413BE);
            // frmMantenimientoProveedores_413BE
            this.AutoScaleDimensions = new System.Drawing.SizeF(7F, 15F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1100, 700);
            this.Controls.Add(this.tlpPrincipal);
            this.MinimumSize = new System.Drawing.Size(900, 600);
            this.Name = "frmMantenimientoProveedores_413BE";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterParent;
            this.Tag = "frm_mantprov_frmMantenimientoProveedores";
            this.Text = "Mantenimiento de proveedores";
            this.Load += new System.EventHandler(this.frmMantenimientoProveedores_Load_413BE);
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.frmMantenimientoProveedores_FormClosing_413BE);
            ((System.ComponentModel.ISupportInitialize)(this.dgvProveedores)).EndInit();
            this.tlpPrincipal.ResumeLayout(false);
            this.grpProveedores.ResumeLayout(false);
            this.grpDatos.ResumeLayout(false);
            this.grpDatos.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();
        }

        #endregion

        private System.Windows.Forms.TableLayoutPanel tlpPrincipal;
        private System.Windows.Forms.GroupBox grpProveedores;
        private System.Windows.Forms.DataGridView dgvProveedores;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvProveedoresColCodigo;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvProveedoresColNombre;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvProveedoresColCuit;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvProveedoresColEmail;
        private System.Windows.Forms.DataGridViewTextBoxColumn dgvProveedoresColHabilitado;
        private System.Windows.Forms.GroupBox grpDatos;
        private System.Windows.Forms.Label lblNombre;
        private System.Windows.Forms.TextBox txtNombre;
        private System.Windows.Forms.Label lblCuit;
        private System.Windows.Forms.TextBox txtCuit;
        private System.Windows.Forms.Label lblEmail;
        private System.Windows.Forms.TextBox txtEmail;
        private System.Windows.Forms.Button btnNuevo;
        private System.Windows.Forms.Button btnModificar;
        private System.Windows.Forms.Button btnInhabilitar;
        private System.Windows.Forms.Button btnHabilitar;
    }
}
