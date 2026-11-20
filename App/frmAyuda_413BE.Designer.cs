namespace AppBase
{
    partial class frmAyuda_413BE
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
            this.components = new System.ComponentModel.Container();
            this.pnlBuscar_413BE = new System.Windows.Forms.Panel();
            this.lblBuscar_413BE = new System.Windows.Forms.Label();
            this.txtBuscar_413BE = new System.Windows.Forms.TextBox();
            this.splAyuda_413BE = new System.Windows.Forms.SplitContainer();
            this.trvTemas_413BE = new System.Windows.Forms.TreeView();
            this.rtbTema_413BE = new System.Windows.Forms.RichTextBox();
            this.tmrBuscar_413BE = new System.Windows.Forms.Timer(this.components);
            this.pnlBuscar_413BE.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.splAyuda_413BE)).BeginInit();
            this.splAyuda_413BE.Panel1.SuspendLayout();
            this.splAyuda_413BE.Panel2.SuspendLayout();
            this.splAyuda_413BE.SuspendLayout();
            this.SuspendLayout();
            //
            // pnlBuscar_413BE
            //
            this.pnlBuscar_413BE.Controls.Add(this.txtBuscar_413BE);
            this.pnlBuscar_413BE.Controls.Add(this.lblBuscar_413BE);
            this.pnlBuscar_413BE.Dock = System.Windows.Forms.DockStyle.Top;
            this.pnlBuscar_413BE.Name = "pnlBuscar_413BE";
            this.pnlBuscar_413BE.Padding = new System.Windows.Forms.Padding(9);
            this.pnlBuscar_413BE.Size = new System.Drawing.Size(884, 42);
            this.pnlBuscar_413BE.TabIndex = 0;
            //
            // lblBuscar_413BE
            //
            this.lblBuscar_413BE.AutoSize = true;
            this.lblBuscar_413BE.Location = new System.Drawing.Point(9, 13);
            this.lblBuscar_413BE.Name = "lblBuscar_413BE";
            this.lblBuscar_413BE.Size = new System.Drawing.Size(45, 15);
            this.lblBuscar_413BE.TabIndex = 0;
            this.lblBuscar_413BE.Tag = "lb_ayu_lblBuscar";
            this.lblBuscar_413BE.Text = "Buscar:";
            //
            // txtBuscar_413BE
            //
            this.txtBuscar_413BE.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) | System.Windows.Forms.AnchorStyles.Right)));
            this.txtBuscar_413BE.Location = new System.Drawing.Point(80, 9);
            this.txtBuscar_413BE.Name = "txtBuscar_413BE";
            this.txtBuscar_413BE.Size = new System.Drawing.Size(795, 23);
            this.txtBuscar_413BE.TabIndex = 1;
            this.txtBuscar_413BE.TextChanged += new System.EventHandler(this.txtBuscar_TextChanged_413BE);
            //
            // splAyuda_413BE
            //
            this.splAyuda_413BE.Dock = System.Windows.Forms.DockStyle.Fill;
            this.splAyuda_413BE.Location = new System.Drawing.Point(0, 42);
            this.splAyuda_413BE.Name = "splAyuda_413BE";
            this.splAyuda_413BE.Panel1.Controls.Add(this.trvTemas_413BE);
            this.splAyuda_413BE.Panel1.Padding = new System.Windows.Forms.Padding(9, 0, 0, 9);
            this.splAyuda_413BE.Panel2.Controls.Add(this.rtbTema_413BE);
            this.splAyuda_413BE.Panel2.Padding = new System.Windows.Forms.Padding(0, 0, 9, 9);
            this.splAyuda_413BE.Size = new System.Drawing.Size(884, 519);
            this.splAyuda_413BE.SplitterDistance = 300;
            this.splAyuda_413BE.TabIndex = 1;
            //
            // trvTemas_413BE
            //
            this.trvTemas_413BE.Dock = System.Windows.Forms.DockStyle.Fill;
            this.trvTemas_413BE.HideSelection = false;
            this.trvTemas_413BE.Name = "trvTemas_413BE";
            this.trvTemas_413BE.TabIndex = 0;
            this.trvTemas_413BE.AfterSelect += new System.Windows.Forms.TreeViewEventHandler(this.trvTemas_AfterSelect_413BE);
            //
            // rtbTema_413BE
            //
            this.rtbTema_413BE.BackColor = System.Drawing.SystemColors.Window;
            this.rtbTema_413BE.Dock = System.Windows.Forms.DockStyle.Fill;
            this.rtbTema_413BE.Name = "rtbTema_413BE";
            this.rtbTema_413BE.ReadOnly = true;
            this.rtbTema_413BE.TabIndex = 0;
            this.rtbTema_413BE.Text = "";
            //
            // tmrBuscar_413BE
            //
            this.tmrBuscar_413BE.Interval = 300;
            this.tmrBuscar_413BE.Tick += new System.EventHandler(this.tmrBuscar_Tick_413BE);
            //
            // frmAyuda_413BE
            //
            this.AutoScaleDimensions = new System.Drawing.SizeF(7F, 15F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(884, 561);
            this.Controls.Add(this.splAyuda_413BE);
            this.Controls.Add(this.pnlBuscar_413BE);
            this.MinimumSize = new System.Drawing.Size(600, 400);
            this.Name = "frmAyuda_413BE";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterParent;
            this.Tag = "frm_ayu_frmAyuda";
            this.Text = "Ayuda";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.frmAyuda_FormClosing_413BE);
            this.FormClosed += new System.Windows.Forms.FormClosedEventHandler(this.frmAyuda_FormClosed_413BE);
            this.Load += new System.EventHandler(this.frmAyuda_Load_413BE);
            this.pnlBuscar_413BE.ResumeLayout(false);
            this.pnlBuscar_413BE.PerformLayout();
            this.splAyuda_413BE.Panel1.ResumeLayout(false);
            this.splAyuda_413BE.Panel2.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.splAyuda_413BE)).EndInit();
            this.splAyuda_413BE.ResumeLayout(false);
            this.ResumeLayout(false);
        }

        #endregion

        private System.Windows.Forms.Panel pnlBuscar_413BE;
        private System.Windows.Forms.Label lblBuscar_413BE;
        private System.Windows.Forms.TextBox txtBuscar_413BE;
        private System.Windows.Forms.SplitContainer splAyuda_413BE;
        private System.Windows.Forms.TreeView trvTemas_413BE;
        private System.Windows.Forms.RichTextBox rtbTema_413BE;
        private System.Windows.Forms.Timer tmrBuscar_413BE;
    }
}
