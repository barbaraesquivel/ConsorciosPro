namespace AppBase
{
    partial class frmUsuarios
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
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
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            DataGridViewCellStyle dataGridViewCellStyle1 = new DataGridViewCellStyle();
            DataGridViewCellStyle dataGridViewCellStyle2 = new DataGridViewCellStyle();
            DataGridViewCellStyle dataGridViewCellStyle3 = new DataGridViewCellStyle();
            DataGridViewCellStyle dataGridViewCellStyle4 = new DataGridViewCellStyle();
            DataGridViewCellStyle dataGridViewCellStyle5 = new DataGridViewCellStyle();
            DataGridViewCellStyle dataGridViewCellStyle6 = new DataGridViewCellStyle();
            dataUsuarios = new DataGridView();
            lbUser = new Label();
            btnDesbloquear = new Button();
            btnEditarDatos = new Button();
            btnBloquear = new Button();
            btnNuevo = new Button();
            dataPermisosUser = new DataGridView();
            Permisos = new DataGridViewTextBoxColumn();
            dataFamilias = new DataGridView();
            Familia = new DataGridViewTextBoxColumn();
            dataPermisos = new DataGridView();
            Patente = new DataGridViewTextBoxColumn();
            dataPermisosFamilias = new DataGridView();
            Permiso = new DataGridViewTextBoxColumn();
            txtEmail = new TextBox();
            txtPass = new TextBox();
            lbEmail = new Label();
            lbPass = new Label();
            lbPermisosUsuario = new Label();
            lbFamilias = new Label();
            lbPermisosFamilias = new Label();
            lbPatentes = new Label();
            btnQuitar = new Button();
            btnAgregar = new Button();
            groupBox1 = new GroupBox();
            groupBox2 = new GroupBox();
            btnAceptar = new Button();
            btnGuardar = new Button();
            btnSalir = new Button();
            btnCancelar = new Button();
            lbUsuario = new Label();
            lbBloq = new Label();
            lbUsuarioLog = new Label();
            ((System.ComponentModel.ISupportInitialize)dataUsuarios).BeginInit();
            ((System.ComponentModel.ISupportInitialize)dataPermisosUser).BeginInit();
            ((System.ComponentModel.ISupportInitialize)dataFamilias).BeginInit();
            ((System.ComponentModel.ISupportInitialize)dataPermisos).BeginInit();
            ((System.ComponentModel.ISupportInitialize)dataPermisosFamilias).BeginInit();
            groupBox1.SuspendLayout();
            groupBox2.SuspendLayout();
            SuspendLayout();
            // 
            // dataUsuarios
            // 
            dataUsuarios.AllowUserToAddRows = false;
            dataUsuarios.AllowUserToDeleteRows = false;
            dataUsuarios.AllowUserToResizeColumns = false;
            dataUsuarios.AllowUserToResizeRows = false;
            dataUsuarios.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dataUsuarios.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            dataUsuarios.EditMode = DataGridViewEditMode.EditProgrammatically;
            dataUsuarios.Location = new Point(17, 98);
            dataUsuarios.Margin = new Padding(4, 5, 4, 5);
            dataUsuarios.MultiSelect = false;
            dataUsuarios.Name = "dataUsuarios";
            dataUsuarios.RowHeadersVisible = false;
            dataUsuarios.RowHeadersWidth = 62;
            dataUsuarios.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
            dataUsuarios.Size = new Size(550, 850);
            dataUsuarios.TabIndex = 0;
            dataUsuarios.DoubleClick += ElegirUsuario;
            // 
            // lbUser
            // 
            lbUser.AutoSize = true;
            lbUser.Location = new Point(250, 68);
            lbUser.Margin = new Padding(4, 0, 4, 0);
            lbUser.Name = "lbUser";
            lbUser.Size = new Size(78, 25);
            lbUser.TabIndex = 1;
            lbUser.Tag = "lb_Usuarios";
            lbUser.Text = "usuarios";
            // 
            // btnDesbloquear
            // 
            btnDesbloquear.Location = new Point(590, 208);
            btnDesbloquear.Margin = new Padding(4, 5, 4, 5);
            btnDesbloquear.Name = "btnDesbloquear";
            btnDesbloquear.Size = new Size(136, 38);
            btnDesbloquear.TabIndex = 2;
            btnDesbloquear.Tag = "btn_desbloquear";
            btnDesbloquear.Text = "Desbloquear";
            btnDesbloquear.UseVisualStyleBackColor = true;
            btnDesbloquear.Click += Desbloquear;
            // 
            // btnEditarDatos
            // 
            btnEditarDatos.Location = new Point(656, 277);
            btnEditarDatos.Margin = new Padding(4, 5, 4, 5);
            btnEditarDatos.Name = "btnEditarDatos";
            btnEditarDatos.Size = new Size(136, 38);
            btnEditarDatos.TabIndex = 3;
            btnEditarDatos.Tag = "btn_editar_datos";
            btnEditarDatos.Text = "Editar Datos";
            btnEditarDatos.UseVisualStyleBackColor = true;
            btnEditarDatos.Click += Editar;
            // 
            // btnBloquear
            // 
            btnBloquear.Location = new Point(734, 208);
            btnBloquear.Margin = new Padding(4, 5, 4, 5);
            btnBloquear.Name = "btnBloquear";
            btnBloquear.Size = new Size(136, 38);
            btnBloquear.TabIndex = 4;
            btnBloquear.Tag = "btn_bloquear";
            btnBloquear.Text = "Bloquear";
            btnBloquear.UseVisualStyleBackColor = true;
            btnBloquear.Click += Bloquear;
            // 
            // btnNuevo
            // 
            btnNuevo.Location = new Point(216, 20);
            btnNuevo.Margin = new Padding(4, 5, 4, 5);
            btnNuevo.Name = "btnNuevo";
            btnNuevo.Size = new Size(136, 38);
            btnNuevo.TabIndex = 5;
            btnNuevo.Tag = "btn_nuevo_user";
            btnNuevo.Text = "Nuevo Usuario";
            btnNuevo.UseVisualStyleBackColor = true;
            btnNuevo.Click += Nuevo;
            // 
            // dataPermisosUser
            // 
            dataPermisosUser.AllowUserToAddRows = false;
            dataPermisosUser.AllowUserToDeleteRows = false;
            dataPermisosUser.AllowUserToResizeColumns = false;
            dataPermisosUser.AllowUserToResizeRows = false;
            dataGridViewCellStyle1.Alignment = DataGridViewContentAlignment.MiddleCenter;
            dataPermisosUser.AlternatingRowsDefaultCellStyle = dataGridViewCellStyle1;
            dataPermisosUser.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dataPermisosUser.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            dataPermisosUser.ColumnHeadersVisible = false;
            dataPermisosUser.Columns.AddRange(new DataGridViewColumn[] { Permisos });
            dataGridViewCellStyle2.Alignment = DataGridViewContentAlignment.MiddleCenter;
            dataGridViewCellStyle2.BackColor = SystemColors.Window;
            dataGridViewCellStyle2.Font = new Font("Segoe UI", 9F);
            dataGridViewCellStyle2.ForeColor = SystemColors.ControlText;
            dataGridViewCellStyle2.SelectionBackColor = SystemColors.Highlight;
            dataGridViewCellStyle2.SelectionForeColor = SystemColors.HighlightText;
            dataGridViewCellStyle2.WrapMode = DataGridViewTriState.False;
            dataPermisosUser.DefaultCellStyle = dataGridViewCellStyle2;
            dataPermisosUser.EditMode = DataGridViewEditMode.EditProgrammatically;
            dataPermisosUser.Location = new Point(886, 98);
            dataPermisosUser.Margin = new Padding(4, 5, 4, 5);
            dataPermisosUser.MultiSelect = false;
            dataPermisosUser.Name = "dataPermisosUser";
            dataPermisosUser.RowHeadersVisible = false;
            dataPermisosUser.RowHeadersWidth = 62;
            dataGridViewCellStyle3.Alignment = DataGridViewContentAlignment.MiddleCenter;
            dataPermisosUser.RowsDefaultCellStyle = dataGridViewCellStyle3;
            dataPermisosUser.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
            dataPermisosUser.Size = new Size(263, 645);
            dataPermisosUser.TabIndex = 6;
            dataPermisosUser.SelectionChanged += EleccionPermisosUsuario;
            // 
            // Permisos
            // 
            Permisos.DataPropertyName = "Nombre";
            Permisos.HeaderText = "Permisos";
            Permisos.MinimumWidth = 8;
            Permisos.Name = "Permisos";
            Permisos.ReadOnly = true;
            // 
            // dataFamilias
            // 
            dataFamilias.AllowUserToAddRows = false;
            dataFamilias.AllowUserToDeleteRows = false;
            dataFamilias.AllowUserToResizeColumns = false;
            dataFamilias.AllowUserToResizeRows = false;
            dataFamilias.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dataFamilias.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            dataFamilias.ColumnHeadersVisible = false;
            dataFamilias.Columns.AddRange(new DataGridViewColumn[] { Familia });
            dataFamilias.EditMode = DataGridViewEditMode.EditProgrammatically;
            dataFamilias.Location = new Point(23, 75);
            dataFamilias.Margin = new Padding(4, 5, 4, 5);
            dataFamilias.MultiSelect = false;
            dataFamilias.Name = "dataFamilias";
            dataFamilias.RowHeadersVisible = false;
            dataFamilias.RowHeadersWidth = 62;
            dataGridViewCellStyle4.Alignment = DataGridViewContentAlignment.MiddleCenter;
            dataFamilias.RowsDefaultCellStyle = dataGridViewCellStyle4;
            dataFamilias.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
            dataFamilias.Size = new Size(263, 263);
            dataFamilias.TabIndex = 7;
            dataFamilias.SelectionChanged += EleccionFamilia;
            // 
            // Familia
            // 
            Familia.DataPropertyName = "Nombre";
            Familia.HeaderText = "Familia";
            Familia.MinimumWidth = 8;
            Familia.Name = "Familia";
            Familia.ReadOnly = true;
            // 
            // dataPermisos
            // 
            dataPermisos.AllowUserToAddRows = false;
            dataPermisos.AllowUserToDeleteRows = false;
            dataPermisos.AllowUserToResizeColumns = false;
            dataPermisos.AllowUserToResizeRows = false;
            dataPermisos.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dataPermisos.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            dataPermisos.ColumnHeadersVisible = false;
            dataPermisos.Columns.AddRange(new DataGridViewColumn[] { Patente });
            dataPermisos.EditMode = DataGridViewEditMode.EditProgrammatically;
            dataPermisos.Location = new Point(24, 573);
            dataPermisos.Margin = new Padding(4, 5, 4, 5);
            dataPermisos.MultiSelect = false;
            dataPermisos.Name = "dataPermisos";
            dataPermisos.RowHeadersVisible = false;
            dataPermisos.RowHeadersWidth = 62;
            dataGridViewCellStyle5.Alignment = DataGridViewContentAlignment.MiddleCenter;
            dataPermisos.RowsDefaultCellStyle = dataGridViewCellStyle5;
            dataPermisos.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
            dataPermisos.Size = new Size(261, 355);
            dataPermisos.TabIndex = 8;
            dataPermisos.SelectionChanged += EleccionPatente;
            // 
            // Patente
            // 
            Patente.DataPropertyName = "Nombre";
            Patente.HeaderText = "Patente";
            Patente.MinimumWidth = 8;
            Patente.Name = "Patente";
            Patente.ReadOnly = true;
            // 
            // dataPermisosFamilias
            // 
            dataPermisosFamilias.AllowUserToAddRows = false;
            dataPermisosFamilias.AllowUserToDeleteRows = false;
            dataPermisosFamilias.AllowUserToResizeColumns = false;
            dataPermisosFamilias.AllowUserToResizeRows = false;
            dataPermisosFamilias.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dataPermisosFamilias.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            dataPermisosFamilias.ColumnHeadersVisible = false;
            dataPermisosFamilias.Columns.AddRange(new DataGridViewColumn[] { Permiso });
            dataPermisosFamilias.EditMode = DataGridViewEditMode.EditProgrammatically;
            dataPermisosFamilias.Enabled = false;
            dataPermisosFamilias.Location = new Point(294, 75);
            dataPermisosFamilias.Margin = new Padding(4, 5, 4, 5);
            dataPermisosFamilias.MultiSelect = false;
            dataPermisosFamilias.Name = "dataPermisosFamilias";
            dataPermisosFamilias.RowHeadersVisible = false;
            dataPermisosFamilias.RowHeadersWidth = 62;
            dataGridViewCellStyle6.Alignment = DataGridViewContentAlignment.MiddleCenter;
            dataPermisosFamilias.RowsDefaultCellStyle = dataGridViewCellStyle6;
            dataPermisosFamilias.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
            dataPermisosFamilias.Size = new Size(263, 373);
            dataPermisosFamilias.TabIndex = 9;
            // 
            // Permiso
            // 
            Permiso.DataPropertyName = "Nombre";
            Permiso.HeaderText = "Permiso";
            Permiso.MinimumWidth = 8;
            Permiso.Name = "Permiso";
            Permiso.ReadOnly = true;
            // 
            // txtEmail
            // 
            txtEmail.Location = new Point(590, 407);
            txtEmail.Margin = new Padding(4, 5, 4, 5);
            txtEmail.Name = "txtEmail";
            txtEmail.Size = new Size(278, 31);
            txtEmail.TabIndex = 10;
            // 
            // txtPass
            // 
            txtPass.Location = new Point(590, 547);
            txtPass.Margin = new Padding(4, 5, 4, 5);
            txtPass.Name = "txtPass";
            txtPass.PasswordChar = '*';
            txtPass.Size = new Size(278, 31);
            txtPass.TabIndex = 11;
            // 
            // lbEmail
            // 
            lbEmail.AutoSize = true;
            lbEmail.Location = new Point(697, 377);
            lbEmail.Margin = new Padding(4, 0, 4, 0);
            lbEmail.Name = "lbEmail";
            lbEmail.Size = new Size(54, 25);
            lbEmail.TabIndex = 12;
            lbEmail.Tag = "lb_email";
            lbEmail.Text = "Email";
            // 
            // lbPass
            // 
            lbPass.AutoSize = true;
            lbPass.Location = new Point(681, 517);
            lbPass.Margin = new Padding(4, 0, 4, 0);
            lbPass.Name = "lbPass";
            lbPass.Size = new Size(101, 25);
            lbPass.TabIndex = 13;
            lbPass.Tag = "lb_pass";
            lbPass.Text = "Contraseña";
            // 
            // lbPermisosUsuario
            // 
            lbPermisosUsuario.AutoSize = true;
            lbPermisosUsuario.Location = new Point(941, 68);
            lbPermisosUsuario.Margin = new Padding(4, 0, 4, 0);
            lbPermisosUsuario.Name = "lbPermisosUsuario";
            lbPermisosUsuario.Size = new Size(148, 25);
            lbPermisosUsuario.TabIndex = 14;
            lbPermisosUsuario.Tag = "lb_permisos_user";
            lbPermisosUsuario.Text = "Permisos Usuario";
            // 
            // lbFamilias
            // 
            lbFamilias.AutoSize = true;
            lbFamilias.Location = new Point(124, 45);
            lbFamilias.Margin = new Padding(4, 0, 4, 0);
            lbFamilias.Name = "lbFamilias";
            lbFamilias.Size = new Size(74, 25);
            lbFamilias.TabIndex = 15;
            lbFamilias.Tag = "lb_familias";
            lbFamilias.Text = "Familias";
            // 
            // lbPermisosFamilias
            // 
            lbPermisosFamilias.AutoSize = true;
            lbPermisosFamilias.Location = new Point(333, 45);
            lbPermisosFamilias.Margin = new Padding(4, 0, 4, 0);
            lbPermisosFamilias.Name = "lbPermisosFamilias";
            lbPermisosFamilias.Size = new Size(185, 25);
            lbPermisosFamilias.TabIndex = 16;
            lbPermisosFamilias.Tag = "lb_permisos_fam";
            lbPermisosFamilias.Text = "Permisos de la Familia";
            // 
            // lbPatentes
            // 
            lbPatentes.AutoSize = true;
            lbPatentes.Location = new Point(109, 543);
            lbPatentes.Margin = new Padding(4, 0, 4, 0);
            lbPatentes.Name = "lbPatentes";
            lbPatentes.Size = new Size(78, 25);
            lbPatentes.TabIndex = 17;
            lbPatentes.Tag = "lb_patentes";
            lbPatentes.Text = "Patentes";
            // 
            // btnQuitar
            // 
            btnQuitar.Location = new Point(1173, 480);
            btnQuitar.Margin = new Padding(4, 5, 4, 5);
            btnQuitar.Name = "btnQuitar";
            btnQuitar.Size = new Size(136, 168);
            btnQuitar.TabIndex = 19;
            btnQuitar.Tag = "btn_quitar";
            btnQuitar.Text = "Quitar-->";
            btnQuitar.UseVisualStyleBackColor = true;
            btnQuitar.Click += Quitar;
            // 
            // btnAgregar
            // 
            btnAgregar.Location = new Point(1173, 277);
            btnAgregar.Margin = new Padding(4, 5, 4, 5);
            btnAgregar.Name = "btnAgregar";
            btnAgregar.Size = new Size(136, 168);
            btnAgregar.TabIndex = 18;
            btnAgregar.Tag = "btn_agregar";
            btnAgregar.Text = "<--Agregar";
            btnAgregar.UseVisualStyleBackColor = true;
            btnAgregar.Click += Agregar;
            // 
            // groupBox1
            // 
            groupBox1.Controls.Add(dataPermisos);
            groupBox1.Controls.Add(groupBox2);
            groupBox1.Controls.Add(lbPatentes);
            groupBox1.Location = new Point(1340, 20);
            groupBox1.Margin = new Padding(4, 5, 4, 5);
            groupBox1.Name = "groupBox1";
            groupBox1.Padding = new Padding(4, 5, 4, 5);
            groupBox1.Size = new Size(623, 957);
            groupBox1.TabIndex = 20;
            groupBox1.TabStop = false;
            groupBox1.Tag = "lb_permisos";
            groupBox1.Text = "Permisos";
            // 
            // groupBox2
            // 
            groupBox2.Controls.Add(dataPermisosFamilias);
            groupBox2.Controls.Add(dataFamilias);
            groupBox2.Controls.Add(lbFamilias);
            groupBox2.Controls.Add(lbPermisosFamilias);
            groupBox2.Location = new Point(24, 43);
            groupBox2.Margin = new Padding(4, 5, 4, 5);
            groupBox2.Name = "groupBox2";
            groupBox2.Padding = new Padding(4, 5, 4, 5);
            groupBox2.Size = new Size(590, 478);
            groupBox2.TabIndex = 0;
            groupBox2.TabStop = false;
            groupBox2.Tag = "lb_familias";
            groupBox2.Text = "Familia";
            // 
            // btnAceptar
            // 
            btnAceptar.Location = new Point(641, 610);
            btnAceptar.Margin = new Padding(4, 5, 4, 5);
            btnAceptar.Name = "btnAceptar";
            btnAceptar.Size = new Size(167, 38);
            btnAceptar.TabIndex = 21;
            btnAceptar.Tag = "btn_aceptar";
            btnAceptar.Text = "Aceptar";
            btnAceptar.UseVisualStyleBackColor = true;
            btnAceptar.Click += Aceptar;
            // 
            // btnGuardar
            // 
            btnGuardar.Location = new Point(727, 825);
            btnGuardar.Margin = new Padding(4, 5, 4, 5);
            btnGuardar.Name = "btnGuardar";
            btnGuardar.Size = new Size(167, 38);
            btnGuardar.TabIndex = 22;
            btnGuardar.Tag = "btn_guardar";
            btnGuardar.Text = "Guardar";
            btnGuardar.UseVisualStyleBackColor = true;
            btnGuardar.Click += Guardar;
            // 
            // btnSalir
            // 
            btnSalir.Location = new Point(727, 910);
            btnSalir.Margin = new Padding(4, 5, 4, 5);
            btnSalir.Name = "btnSalir";
            btnSalir.Size = new Size(487, 38);
            btnSalir.TabIndex = 23;
            btnSalir.Tag = "btn_salir";
            btnSalir.Text = "Salir";
            btnSalir.UseVisualStyleBackColor = true;
            btnSalir.Click += Salir;
            // 
            // btnCancelar
            // 
            btnCancelar.Location = new Point(1047, 825);
            btnCancelar.Margin = new Padding(4, 5, 4, 5);
            btnCancelar.Name = "btnCancelar";
            btnCancelar.Size = new Size(167, 38);
            btnCancelar.TabIndex = 24;
            btnCancelar.Tag = "btn_cancelar";
            btnCancelar.Text = "Cancelar";
            btnCancelar.UseVisualStyleBackColor = true;
            btnCancelar.Click += Cancelar;
            // 
            // lbUsuario
            // 
            lbUsuario.AutoSize = true;
            lbUsuario.Location = new Point(590, 957);
            lbUsuario.Margin = new Padding(4, 0, 4, 0);
            lbUsuario.Name = "lbUsuario";
            lbUsuario.Size = new Size(72, 25);
            lbUsuario.TabIndex = 25;
            lbUsuario.Tag = "lb_Usuario";
            lbUsuario.Text = "Usuario";
            lbUsuario.Visible = false;
            // 
            // lbBloq
            // 
            lbBloq.AutoSize = true;
            lbBloq.Location = new Point(620, 957);
            lbBloq.Margin = new Padding(4, 0, 4, 0);
            lbBloq.Name = "lbBloq";
            lbBloq.Size = new Size(98, 25);
            lbBloq.TabIndex = 26;
            lbBloq.Tag = "lb_usuario_bloqueado";
            lbBloq.Text = "Bloqueado";
            lbBloq.Visible = false;
            // 
            // lbUsuarioLog
            // 
            lbUsuarioLog.AutoSize = true;
            lbUsuarioLog.Font = new Font("Segoe UI", 15F);
            lbUsuarioLog.Location = new Point(676, 63);
            lbUsuarioLog.Margin = new Padding(4, 0, 4, 0);
            lbUsuarioLog.Name = "lbUsuarioLog";
            lbUsuarioLog.Size = new Size(0, 41);
            lbUsuarioLog.TabIndex = 27;
            lbUsuarioLog.Tag = "lb_usuario_log";
            // 
            // frmUsuarios
            // 
            AutoScaleDimensions = new SizeF(10F, 25F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(1980, 997);
            Controls.Add(lbUsuarioLog);
            Controls.Add(lbBloq);
            Controls.Add(lbUsuario);
            Controls.Add(btnCancelar);
            Controls.Add(btnSalir);
            Controls.Add(btnGuardar);
            Controls.Add(btnAceptar);
            Controls.Add(groupBox1);
            Controls.Add(btnQuitar);
            Controls.Add(btnAgregar);
            Controls.Add(lbPermisosUsuario);
            Controls.Add(lbPass);
            Controls.Add(lbEmail);
            Controls.Add(txtPass);
            Controls.Add(txtEmail);
            Controls.Add(dataPermisosUser);
            Controls.Add(btnNuevo);
            Controls.Add(btnBloquear);
            Controls.Add(btnEditarDatos);
            Controls.Add(btnDesbloquear);
            Controls.Add(lbUser);
            Controls.Add(dataUsuarios);
            Margin = new Padding(4, 5, 4, 5);
            Name = "frmUsuarios";
            Tag = "lb_usuarios";
            Text = "Usuarios";
            FormClosing += frmUsuarios_FormClosing;
            Load += LoadForm;
            ((System.ComponentModel.ISupportInitialize)dataUsuarios).EndInit();
            ((System.ComponentModel.ISupportInitialize)dataPermisosUser).EndInit();
            ((System.ComponentModel.ISupportInitialize)dataFamilias).EndInit();
            ((System.ComponentModel.ISupportInitialize)dataPermisos).EndInit();
            ((System.ComponentModel.ISupportInitialize)dataPermisosFamilias).EndInit();
            groupBox1.ResumeLayout(false);
            groupBox1.PerformLayout();
            groupBox2.ResumeLayout(false);
            groupBox2.PerformLayout();
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private DataGridView dataUsuarios;
        private Label lbUser;
        private Button btnDesbloquear;
        private Button btnEditarDatos;
        private Button btnBloquear;
        private Button btnNuevo;
        private DataGridView dataPermisosUser;
        private DataGridView dataFamilias;
        private DataGridView dataPermisos;
        private DataGridView dataPermisosFamilias;
        private TextBox txtEmail;
        private TextBox txtPass;
        private Label lbEmail;
        private Label lbPass;
        private Label lbPermisosUsuario;
        private Label lbFamilias;
        private Label lbPermisosFamilias;
        private Label lbPatentes;
        private Button btnQuitar;
        private Button btnAgregar;
        private GroupBox groupBox1;
        private GroupBox groupBox2;
        private DataGridViewTextBoxColumn Permisos;
        private DataGridViewTextBoxColumn Familia;
        private DataGridViewTextBoxColumn Patente;
        private Button btnAceptar;
        private Button btnGuardar;
        private Button btnSalir;
        private Button btnCancelar;
        private DataGridViewTextBoxColumn Permiso;
        private Label lbUsuario;
        private Label lbBloq;
        private Label lbUsuarioLog;
    }
}