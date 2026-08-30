namespace AppBase
{
    partial class frmMdiPrincipal
    {
        /// <summary>
        ///  Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        ///  Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        ///  Required method for Designer support - do not modify
        ///  the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            menuPrincipal = new MenuStrip();
            sesiónToolStripMenuItem = new ToolStripMenuItem();
            iniciarSesiónToolStripMenuItem = new ToolStripMenuItem();
            cerrarSesiónToolStripMenuItem = new ToolStripMenuItem();
            usuariosToolStripMenuItem = new ToolStripMenuItem();
            familiasToolStripMenuItem = new ToolStripMenuItem();
            idiomaToolStripMenuItem = new ToolStripMenuItem();
            nuevoIdiomaToolStripMenuItem = new ToolStripMenuItem();
            baseDeDatosToolStripMenuItem = new ToolStripMenuItem();
            backupRestoreToolStripMenuItem = new ToolStripMenuItem();
            lbdeslog_1 = new Label();
            lbdeslog_2 = new Label();
            menuPrincipal.SuspendLayout();
            SuspendLayout();
            // 
            // menuPrincipal
            // 
            menuPrincipal.ImageScalingSize = new Size(24, 24);
            menuPrincipal.Items.AddRange(new ToolStripItem[] { sesiónToolStripMenuItem, usuariosToolStripMenuItem, familiasToolStripMenuItem, idiomaToolStripMenuItem, nuevoIdiomaToolStripMenuItem, baseDeDatosToolStripMenuItem });
            menuPrincipal.Location = new Point(0, 0);
            menuPrincipal.Name = "menuPrincipal";
            menuPrincipal.Size = new Size(1220, 24);
            menuPrincipal.TabIndex = 1;
            menuPrincipal.Text = "menuPrincipal";
            // 
            // sesiónToolStripMenuItem
            // 
            sesiónToolStripMenuItem.DropDownItems.AddRange(new ToolStripItem[] { iniciarSesiónToolStripMenuItem, cerrarSesiónToolStripMenuItem });
            sesiónToolStripMenuItem.Name = "sesiónToolStripMenuItem";
            sesiónToolStripMenuItem.Size = new Size(53, 20);
            sesiónToolStripMenuItem.Tag = "lb_sesion";
            sesiónToolStripMenuItem.Text = "Sesión";
            // 
            // iniciarSesiónToolStripMenuItem
            // 
            iniciarSesiónToolStripMenuItem.Name = "iniciarSesiónToolStripMenuItem";
            iniciarSesiónToolStripMenuItem.Size = new Size(143, 22);
            iniciarSesiónToolStripMenuItem.Tag = "lb_IniciarSesion";
            iniciarSesiónToolStripMenuItem.Text = "Iniciar Sesión";
            iniciarSesiónToolStripMenuItem.Click += Logearse;
            // 
            // cerrarSesiónToolStripMenuItem
            // 
            cerrarSesiónToolStripMenuItem.Name = "cerrarSesiónToolStripMenuItem";
            cerrarSesiónToolStripMenuItem.Size = new Size(143, 22);
            cerrarSesiónToolStripMenuItem.Tag = "lb_CerrarSesion";
            cerrarSesiónToolStripMenuItem.Text = "Cerrar Sesión";
            cerrarSesiónToolStripMenuItem.Click += Desloguearse;
            // 
            // usuariosToolStripMenuItem
            // 
            usuariosToolStripMenuItem.Name = "usuariosToolStripMenuItem";
            usuariosToolStripMenuItem.Size = new Size(64, 20);
            usuariosToolStripMenuItem.Tag = "lb_Usuarios";
            usuariosToolStripMenuItem.Text = "Usuarios";
            usuariosToolStripMenuItem.Click += EditarUsuarios;
            // 
            // familiasToolStripMenuItem
            // 
            familiasToolStripMenuItem.Name = "familiasToolStripMenuItem";
            familiasToolStripMenuItem.Size = new Size(62, 20);
            familiasToolStripMenuItem.Tag = "lb_familias";
            familiasToolStripMenuItem.Text = "Familias";
            familiasToolStripMenuItem.Click += EditarFamilias;
            // 
            // idiomaToolStripMenuItem
            // 
            idiomaToolStripMenuItem.Name = "idiomaToolStripMenuItem";
            idiomaToolStripMenuItem.Size = new Size(56, 20);
            idiomaToolStripMenuItem.Tag = "lb_Idioma";
            idiomaToolStripMenuItem.Text = "Idioma";
            // 
            // nuevoIdiomaToolStripMenuItem
            // 
            nuevoIdiomaToolStripMenuItem.Name = "nuevoIdiomaToolStripMenuItem";
            nuevoIdiomaToolStripMenuItem.Size = new Size(94, 20);
            nuevoIdiomaToolStripMenuItem.Tag = "lb_NuevoIdioma";
            nuevoIdiomaToolStripMenuItem.Text = "Nuevo Idioma";
            nuevoIdiomaToolStripMenuItem.Click += crearIdiomaToolStripMenuItem_Click;
            // 
            // baseDeDatosToolStripMenuItem
            // 
            baseDeDatosToolStripMenuItem.DropDownItems.AddRange(new ToolStripItem[] { backupRestoreToolStripMenuItem });
            baseDeDatosToolStripMenuItem.Name = "baseDeDatosToolStripMenuItem";
            baseDeDatosToolStripMenuItem.Size = new Size(94, 20);
            baseDeDatosToolStripMenuItem.Tag = "lb_baseDeDatos";
            baseDeDatosToolStripMenuItem.Text = "Base de Datos";
            baseDeDatosToolStripMenuItem.Visible = false;
            // 
            // backupRestoreToolStripMenuItem
            // 
            backupRestoreToolStripMenuItem.Name = "backupRestoreToolStripMenuItem";
            backupRestoreToolStripMenuItem.Size = new Size(180, 22);
            backupRestoreToolStripMenuItem.Tag = "lb_backupRestore";
            backupRestoreToolStripMenuItem.Text = "Backup / Restaurar";
            backupRestoreToolStripMenuItem.Click += AbrirBackup;
            // 
            // lbdeslog_1
            // 
            lbdeslog_1.AutoSize = true;
            lbdeslog_1.Location = new Point(1458, 868);
            lbdeslog_1.Name = "lbdeslog_1";
            lbdeslog_1.Size = new Size(76, 15);
            lbdeslog_1.TabIndex = 2;
            lbdeslog_1.Tag = "lb_deslog_1";
            lbdeslog_1.Text = "¿Quiere salir?";
            lbdeslog_1.Visible = false;
            // 
            // lbdeslog_2
            // 
            lbdeslog_2.AutoSize = true;
            lbdeslog_2.Location = new Point(1458, 841);
            lbdeslog_2.Name = "lbdeslog_2";
            lbdeslog_2.Size = new Size(29, 15);
            lbdeslog_2.TabIndex = 4;
            lbdeslog_2.Tag = "btn_salir";
            lbdeslog_2.Text = "Salir";
            lbdeslog_2.Visible = false;
            // 
            // frmMdiPrincipal
            // 
            AutoScaleDimensions = new SizeF(7F, 15F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(1220, 784);
            Controls.Add(lbdeslog_2);
            Controls.Add(lbdeslog_1);
            Controls.Add(menuPrincipal);
            IsMdiContainer = true;
            MainMenuStrip = menuPrincipal;
            Name = "frmMdiPrincipal";
            Tag = "lb_principal";
            Text = "Principal";
            FormClosing += frmMdiPrincipal_FormClosing;
            Load += frmMdiPrincipal_Load;
            menuPrincipal.ResumeLayout(false);
            menuPrincipal.PerformLayout();
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion


        private MenuStrip menuPrincipal;
        private ToolStripMenuItem sesiónToolStripMenuItem;
        private ToolStripMenuItem iniciarSesiónToolStripMenuItem;
        private ToolStripMenuItem cerrarSesiónToolStripMenuItem;
        private ToolStripMenuItem usuariosToolStripMenuItem;
        private ToolStripMenuItem familiasToolStripMenuItem;
        private ToolStripMenuItem idiomaToolStripMenuItem;
        private Label lbdeslog_1;
        private Label lbdeslog_2;
        private ToolStripMenuItem nuevoIdiomaToolStripMenuItem;
        private ToolStripMenuItem baseDeDatosToolStripMenuItem;
        private ToolStripMenuItem backupRestoreToolStripMenuItem;
    }
}
