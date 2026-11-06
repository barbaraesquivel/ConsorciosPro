namespace AppBase
{
    partial class frmRegistrarProveedor_413BE
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
            this.lblNombre = new System.Windows.Forms.Label();
            this.txtNombre = new System.Windows.Forms.TextBox();
            this.lblCuit = new System.Windows.Forms.Label();
            this.txtCuit = new System.Windows.Forms.TextBox();
            this.lblEmail = new System.Windows.Forms.Label();
            this.txtEmail = new System.Windows.Forms.TextBox();
            this.lblCategorias = new System.Windows.Forms.Label();
            this.clbCategorias = new System.Windows.Forms.CheckedListBox();
            this.btnGuardar = new System.Windows.Forms.Button();
            this.btnCancelar = new System.Windows.Forms.Button();
            this.lbProveedorRegistrado = new System.Windows.Forms.Label();
            this.SuspendLayout();
            this.lblNombre.AutoSize = true;
            this.lblNombre.Location = new System.Drawing.Point(20, 23);
            this.lblNombre.Name = "lblNombre";
            this.lblNombre.TabIndex = 0;
            this.lblNombre.Tag = "lb_regprov_lblNombre";
            this.lblNombre.Text = "Nombre";
            this.txtNombre.Location = new System.Drawing.Point(120, 20);
            this.txtNombre.MaxLength = 150;
            this.txtNombre.Name = "txtNombre";
            this.txtNombre.Size = new System.Drawing.Size(300, 23);
            this.txtNombre.TabIndex = 1;
            this.lblCuit.AutoSize = true;
            this.lblCuit.Location = new System.Drawing.Point(20, 58);
            this.lblCuit.Name = "lblCuit";
            this.lblCuit.TabIndex = 2;
            this.lblCuit.Tag = "lb_regprov_lblCuit";
            this.lblCuit.Text = "CUIT";
            this.txtCuit.Location = new System.Drawing.Point(120, 55);
            this.txtCuit.MaxLength = 20;
            this.txtCuit.Name = "txtCuit";
            this.txtCuit.Size = new System.Drawing.Size(300, 23);
            this.txtCuit.TabIndex = 3;
            this.lblEmail.AutoSize = true;
            this.lblEmail.Location = new System.Drawing.Point(20, 93);
            this.lblEmail.Name = "lblEmail";
            this.lblEmail.TabIndex = 4;
            this.lblEmail.Tag = "lb_regprov_lblEmail";
            this.lblEmail.Text = "Email";
            this.txtEmail.Location = new System.Drawing.Point(120, 90);
            this.txtEmail.MaxLength = 150;
            this.txtEmail.Name = "txtEmail";
            this.txtEmail.Size = new System.Drawing.Size(300, 23);
            this.txtEmail.TabIndex = 5;
            this.lblCategorias.AutoSize = true;
            this.lblCategorias.Location = new System.Drawing.Point(20, 128);
            this.lblCategorias.Name = "lblCategorias";
            this.lblCategorias.TabIndex = 6;
            this.lblCategorias.Tag = "lb_regprov_lblCategorias";
            this.lblCategorias.Text = "Categorías";
            this.clbCategorias.CheckOnClick = true;
            this.clbCategorias.DisplayMember = "Nombre_413BE";
            this.clbCategorias.FormattingEnabled = true;
            this.clbCategorias.Location = new System.Drawing.Point(120, 125);
            this.clbCategorias.Name = "clbCategorias";
            this.clbCategorias.Size = new System.Drawing.Size(300, 130);
            this.clbCategorias.TabIndex = 7;
            this.btnGuardar.Location = new System.Drawing.Point(120, 275);
            this.btnGuardar.Name = "btnGuardar";
            this.btnGuardar.Size = new System.Drawing.Size(140, 30);
            this.btnGuardar.TabIndex = 8;
            this.btnGuardar.Tag = "btn_regprov_btnGuardar";
            this.btnGuardar.Text = "Guardar";
            this.btnGuardar.UseVisualStyleBackColor = true;
            this.btnGuardar.Click += new System.EventHandler(this.btnGuardar_Click_413BE);
            this.btnCancelar.Location = new System.Drawing.Point(280, 275);
            this.btnCancelar.Name = "btnCancelar";
            this.btnCancelar.Size = new System.Drawing.Size(140, 30);
            this.btnCancelar.TabIndex = 9;
            this.btnCancelar.Tag = "btn_regprov_btnCancelar";
            this.btnCancelar.Text = "Cancelar";
            this.btnCancelar.UseVisualStyleBackColor = true;
            this.btnCancelar.Click += new System.EventHandler(this.btnCancelar_Click_413BE);
            this.lbProveedorRegistrado.AutoSize = true;
            this.lbProveedorRegistrado.Location = new System.Drawing.Point(3, 3);
            this.lbProveedorRegistrado.Name = "lbProveedorRegistrado";
            this.lbProveedorRegistrado.Size = new System.Drawing.Size(120, 15);
            this.lbProveedorRegistrado.TabIndex = 100;
            this.lbProveedorRegistrado.Tag = "lb_regprov_proveedorRegistrado";
            this.lbProveedorRegistrado.Text = "Proveedor registrado";
            this.lbProveedorRegistrado.Visible = false;
            this.AcceptButton = this.btnGuardar;
            this.AutoScaleDimensions = new System.Drawing.SizeF(7F, 15F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.CancelButton = this.btnCancelar;
            this.ClientSize = new System.Drawing.Size(450, 325);
            this.Controls.Add(this.lblNombre);
            this.Controls.Add(this.txtNombre);
            this.Controls.Add(this.lblCuit);
            this.Controls.Add(this.txtCuit);
            this.Controls.Add(this.lblEmail);
            this.Controls.Add(this.txtEmail);
            this.Controls.Add(this.lblCategorias);
            this.Controls.Add(this.clbCategorias);
            this.Controls.Add(this.btnGuardar);
            this.Controls.Add(this.btnCancelar);
            this.Controls.Add(this.lbProveedorRegistrado);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "frmRegistrarProveedor_413BE";
            this.ShowInTaskbar = false;
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterParent;
            this.Tag = "frm_regprov_frmRegistrarProveedor";
            this.Text = "Registrar proveedor";
            this.Load += new System.EventHandler(this.frmRegistrarProveedor_Load_413BE);
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.frmRegistrarProveedor_FormClosing_413BE);
            this.ResumeLayout(false);
            this.PerformLayout();
        }

        #endregion

        private System.Windows.Forms.Label lblNombre;
        private System.Windows.Forms.TextBox txtNombre;
        private System.Windows.Forms.Label lblCuit;
        private System.Windows.Forms.TextBox txtCuit;
        private System.Windows.Forms.Label lblEmail;
        private System.Windows.Forms.TextBox txtEmail;
        private System.Windows.Forms.Label lblCategorias;
        private System.Windows.Forms.CheckedListBox clbCategorias;
        private System.Windows.Forms.Button btnGuardar;
        private System.Windows.Forms.Button btnCancelar;
        private System.Windows.Forms.Label lbProveedorRegistrado;
    }
}
