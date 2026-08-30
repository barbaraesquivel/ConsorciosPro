namespace AppBase
{
    partial class frmBackup
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
            lbTitulo = new Label();
            btnBackup = new Button();
            btnRestaurar = new Button();
            btnSalir = new Button();
            lbBackupOk = new Label();
            lbBackupError = new Label();
            lbRestoreOk = new Label();
            lbRestoreError = new Label();
            lbRestoreConfirm = new Label();
            SuspendLayout();
            // 
            // lbTitulo
            // 
            lbTitulo.AutoSize = true;
            lbTitulo.Location = new Point(40, 30);
            lbTitulo.Name = "lbTitulo";
            lbTitulo.Size = new Size(150, 15);
            lbTitulo.TabIndex = 0;
            lbTitulo.Tag = "lb_backupRestore";
            lbTitulo.Text = "Backup / Restaurar";
            // 
            // btnBackup
            // 
            btnBackup.Location = new Point(40, 70);
            btnBackup.Name = "btnBackup";
            btnBackup.Size = new Size(180, 30);
            btnBackup.TabIndex = 1;
            btnBackup.Tag = "btn_backup";
            btnBackup.Text = "Hacer Backup";
            btnBackup.UseVisualStyleBackColor = true;
            btnBackup.Click += HacerBackup;
            // 
            // btnRestaurar
            // 
            btnRestaurar.Location = new Point(40, 115);
            btnRestaurar.Name = "btnRestaurar";
            btnRestaurar.Size = new Size(180, 30);
            btnRestaurar.TabIndex = 2;
            btnRestaurar.Tag = "btn_restaurar";
            btnRestaurar.Text = "Restaurar";
            btnRestaurar.UseVisualStyleBackColor = true;
            btnRestaurar.Click += Restaurar;
            // 
            // btnSalir
            // 
            btnSalir.Location = new Point(40, 165);
            btnSalir.Name = "btnSalir";
            btnSalir.Size = new Size(180, 30);
            btnSalir.TabIndex = 3;
            btnSalir.Tag = "btn_salir";
            btnSalir.Text = "Salir";
            btnSalir.UseVisualStyleBackColor = true;
            btnSalir.Click += Salir;
            // 
            // lbBackupOk
            // 
            lbBackupOk.AutoSize = true;
            lbBackupOk.Location = new Point(400, 70);
            lbBackupOk.Name = "lbBackupOk";
            lbBackupOk.Size = new Size(120, 15);
            lbBackupOk.TabIndex = 4;
            lbBackupOk.Tag = "lb_backupOk";
            lbBackupOk.Text = "Backup realizado con exito";
            lbBackupOk.Visible = false;
            // 
            // lbBackupError
            // 
            lbBackupError.AutoSize = true;
            lbBackupError.Location = new Point(400, 90);
            lbBackupError.Name = "lbBackupError";
            lbBackupError.Size = new Size(120, 15);
            lbBackupError.TabIndex = 5;
            lbBackupError.Tag = "lb_backupError";
            lbBackupError.Text = "Error al realizar el backup";
            lbBackupError.Visible = false;
            // 
            // lbRestoreOk
            // 
            lbRestoreOk.AutoSize = true;
            lbRestoreOk.Location = new Point(400, 115);
            lbRestoreOk.Name = "lbRestoreOk";
            lbRestoreOk.Size = new Size(120, 15);
            lbRestoreOk.TabIndex = 6;
            lbRestoreOk.Tag = "lb_restoreOk";
            lbRestoreOk.Text = "Base de datos restaurada con exito";
            lbRestoreOk.Visible = false;
            // 
            // lbRestoreError
            // 
            lbRestoreError.AutoSize = true;
            lbRestoreError.Location = new Point(400, 135);
            lbRestoreError.Name = "lbRestoreError";
            lbRestoreError.Size = new Size(120, 15);
            lbRestoreError.TabIndex = 7;
            lbRestoreError.Tag = "lb_restoreError";
            lbRestoreError.Text = "Error al restaurar la base de datos";
            lbRestoreError.Visible = false;
            // 
            // lbRestoreConfirm
            // 
            lbRestoreConfirm.AutoSize = true;
            lbRestoreConfirm.Location = new Point(400, 165);
            lbRestoreConfirm.Name = "lbRestoreConfirm";
            lbRestoreConfirm.Size = new Size(120, 15);
            lbRestoreConfirm.TabIndex = 8;
            lbRestoreConfirm.Tag = "lb_restoreConfirm";
            lbRestoreConfirm.Text = "Esta accion reemplaza los datos actuales. ¿Desea continuar?";
            lbRestoreConfirm.Visible = false;
            // 
            // frmBackup
            // 
            AutoScaleDimensions = new SizeF(7F, 15F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(700, 250);
            Controls.Add(lbRestoreConfirm);
            Controls.Add(lbRestoreError);
            Controls.Add(lbRestoreOk);
            Controls.Add(lbBackupError);
            Controls.Add(lbBackupOk);
            Controls.Add(btnSalir);
            Controls.Add(btnRestaurar);
            Controls.Add(btnBackup);
            Controls.Add(lbTitulo);
            Name = "frmBackup";
            Tag = "lb_backupRestore";
            Text = "Backup / Restaurar";
            FormClosing += frmBackup_FormClosing;
            Load += frmBackup_Load;
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private Label lbTitulo;
        private Button btnBackup;
        private Button btnRestaurar;
        private Button btnSalir;
        private Label lbBackupOk;
        private Label lbBackupError;
        private Label lbRestoreOk;
        private Label lbRestoreError;
        private Label lbRestoreConfirm;
    }
}
