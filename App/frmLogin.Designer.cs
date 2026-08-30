namespace AppBase
{
    partial class frmLogin
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
            lbl_Email = new Label();
            txt_Email = new TextBox();
            btn_Ingresar = new Button();
            btn_Salir = new Button();
            txt_Pass = new TextBox();
            lbl_Pass = new Label();
            lb_Bienvenido = new Label();
            lb_usuario_incorrecto = new Label();
            lb_pass_incorrecta = new Label();
            lb_usuario_bloqueado = new Label();
            SuspendLayout();
            // 
            // lbl_Email
            // 
            lbl_Email.AutoSize = true;
            lbl_Email.Location = new Point(23, 25);
            lbl_Email.Name = "lbl_Email";
            lbl_Email.Size = new Size(36, 15);
            lbl_Email.TabIndex = 0;
            lbl_Email.Tag = "lb_email";
            lbl_Email.Text = "Email";
            // 
            // txt_Email
            // 
            txt_Email.Location = new Point(65, 22);
            txt_Email.Name = "txt_Email";
            txt_Email.Size = new Size(292, 23);
            txt_Email.TabIndex = 1;
            // 
            // btn_Ingresar
            // 
            btn_Ingresar.Location = new Point(23, 109);
            btn_Ingresar.Name = "btn_Ingresar";
            btn_Ingresar.Size = new Size(164, 23);
            btn_Ingresar.TabIndex = 4;
            btn_Ingresar.Tag = "btn_ingresar";
            btn_Ingresar.Text = "Ingresar";
            btn_Ingresar.UseVisualStyleBackColor = true;
            btn_Ingresar.Click += Ingresar;
            // 
            // btn_Salir
            // 
            btn_Salir.Location = new Point(193, 109);
            btn_Salir.Name = "btn_Salir";
            btn_Salir.Size = new Size(164, 23);
            btn_Salir.TabIndex = 5;
            btn_Salir.Tag = "btn_salir";
            btn_Salir.Text = "Salir";
            btn_Salir.UseVisualStyleBackColor = true;
            btn_Salir.Click += Salir;
            // 
            // txt_Pass
            // 
            txt_Pass.Location = new Point(96, 66);
            txt_Pass.Name = "txt_Pass";
            txt_Pass.PasswordChar = '*';
            txt_Pass.Size = new Size(261, 23);
            txt_Pass.TabIndex = 3;
            // 
            // lbl_Pass
            // 
            lbl_Pass.AutoSize = true;
            lbl_Pass.Location = new Point(23, 69);
            lbl_Pass.Name = "lbl_Pass";
            lbl_Pass.Size = new Size(67, 15);
            lbl_Pass.TabIndex = 2;
            lbl_Pass.Tag = "lb_pass";
            lbl_Pass.Text = "Contraseña";
            // 
            // lb_Bienvenido
            // 
            lb_Bienvenido.AutoSize = true;
            lb_Bienvenido.Location = new Point(369, 130);
            lb_Bienvenido.Name = "lb_Bienvenido";
            lb_Bienvenido.Size = new Size(69, 15);
            lb_Bienvenido.TabIndex = 6;
            lb_Bienvenido.Tag = "lb_bienvenido";
            lb_Bienvenido.Text = "Bienvenido ";
            lb_Bienvenido.Visible = false;
            // 
            // lb_usuario_incorrecto
            // 
            lb_usuario_incorrecto.AutoSize = true;
            lb_usuario_incorrecto.Location = new Point(369, 109);
            lb_usuario_incorrecto.Name = "lb_usuario_incorrecto";
            lb_usuario_incorrecto.Size = new Size(104, 15);
            lb_usuario_incorrecto.TabIndex = 7;
            lb_usuario_incorrecto.Tag = "lb_usuario_incorrecto";
            lb_usuario_incorrecto.Text = "Usuario Incorrecto";
            lb_usuario_incorrecto.Visible = false;
            // 
            // lb_pass_incorrecta
            // 
            lb_pass_incorrecta.AutoSize = true;
            lb_pass_incorrecta.Location = new Point(363, 38);
            lb_pass_incorrecta.Name = "lb_pass_incorrecta";
            lb_pass_incorrecta.Size = new Size(123, 15);
            lb_pass_incorrecta.TabIndex = 8;
            lb_pass_incorrecta.Tag = "lb_pass_incorrecta";
            lb_pass_incorrecta.Text = "Contraseña Incorrecta";
            lb_pass_incorrecta.Visible = false;
            // 
            // lb_usuario_bloqueado
            // 
            lb_usuario_bloqueado.AutoSize = true;
            lb_usuario_bloqueado.Location = new Point(363, 74);
            lb_usuario_bloqueado.Name = "lb_usuario_bloqueado";
            lb_usuario_bloqueado.Size = new Size(107, 15);
            lb_usuario_bloqueado.TabIndex = 9;
            lb_usuario_bloqueado.Tag = "lb_usuario_bloqueado";
            lb_usuario_bloqueado.Text = "Usuario Bloqueado";
            lb_usuario_bloqueado.Visible = false;
            // 
            // frmLogin
            // 
            AutoScaleDimensions = new SizeF(7F, 15F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(363, 154);
            Controls.Add(lb_usuario_bloqueado);
            Controls.Add(lb_pass_incorrecta);
            Controls.Add(lb_usuario_incorrecto);
            Controls.Add(lb_Bienvenido);
            Controls.Add(btn_Salir);
            Controls.Add(txt_Pass);
            Controls.Add(lbl_Pass);
            Controls.Add(btn_Ingresar);
            Controls.Add(txt_Email);
            Controls.Add(lbl_Email);
            Name = "frmLogin";
            FormClosing += frmLogin_FormClosing;
            Load += frmLogin_Load;
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private Label lbl_Email;
        private TextBox txt_Email;
        private Button btn_Ingresar;
        private Button btn_Salir;
        private TextBox txt_Pass;
        private Label lbl_Pass;
        private Label lb_Bienvenido;
        private Label lb_usuario_incorrecto;
        private Label lb_pass_incorrecta;
        private Label lb_usuario_bloqueado;
    }
}