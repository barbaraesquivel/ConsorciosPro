namespace AppBase
{
    partial class frmEditarIdiomas
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
            btnCrear = new Button();
            txtNuevoIdioma = new TextBox();
            lbNuevoIdioma = new Label();
            btnSalir = new Button();
            btnGuardar = new Button();
            btnCancelar = new Button();
            dataGridView1 = new DataGridView();
            lbOriginal = new Label();
            lbTraduccion = new Label();
            lbCompletar = new Label();
            lbTraduccionPara = new Label();
            lbIngresar = new Label();
            ((System.ComponentModel.ISupportInitialize)dataGridView1).BeginInit();
            SuspendLayout();
            // 
            // btnCrear
            // 
            btnCrear.Location = new Point(307, 24);
            btnCrear.Margin = new Padding(2);
            btnCrear.Name = "btnCrear";
            btnCrear.Size = new Size(78, 20);
            btnCrear.TabIndex = 0;
            btnCrear.Tag = "btn_crear";
            btnCrear.Text = "Crear";
            btnCrear.UseVisualStyleBackColor = true;
            btnCrear.Click += btnCrear_Click;
            // 
            // txtNuevoIdioma
            // 
            txtNuevoIdioma.Location = new Point(69, 33);
            txtNuevoIdioma.Margin = new Padding(2);
            txtNuevoIdioma.Name = "txtNuevoIdioma";
            txtNuevoIdioma.Size = new Size(198, 23);
            txtNuevoIdioma.TabIndex = 1;
            // 
            // lbNuevoIdioma
            // 
            lbNuevoIdioma.AutoSize = true;
            lbNuevoIdioma.Location = new Point(123, 16);
            lbNuevoIdioma.Margin = new Padding(2, 0, 2, 0);
            lbNuevoIdioma.Name = "lbNuevoIdioma";
            lbNuevoIdioma.Size = new Size(82, 15);
            lbNuevoIdioma.TabIndex = 2;
            lbNuevoIdioma.Tag = "lb_NuevoIdioma";
            lbNuevoIdioma.Text = "Nuevo Idioma";
            // 
            // btnSalir
            // 
            btnSalir.Location = new Point(69, 547);
            btnSalir.Margin = new Padding(2);
            btnSalir.Name = "btnSalir";
            btnSalir.Size = new Size(347, 20);
            btnSalir.TabIndex = 3;
            btnSalir.Tag = "btn_salir";
            btnSalir.Text = "Salir";
            btnSalir.UseVisualStyleBackColor = true;
            btnSalir.Visible = false;
            btnSalir.Click += Salir;
            // 
            // btnGuardar
            // 
            btnGuardar.Location = new Point(95, 512);
            btnGuardar.Margin = new Padding(2);
            btnGuardar.Name = "btnGuardar";
            btnGuardar.Size = new Size(78, 20);
            btnGuardar.TabIndex = 4;
            btnGuardar.Tag = "btn_guardar";
            btnGuardar.Text = "Guardar";
            btnGuardar.UseVisualStyleBackColor = true;
            btnGuardar.Visible = false;
            btnGuardar.Click += btnGuardar_Click;
            // 
            // btnCancelar
            // 
            btnCancelar.Location = new Point(304, 512);
            btnCancelar.Margin = new Padding(2);
            btnCancelar.Name = "btnCancelar";
            btnCancelar.Size = new Size(78, 20);
            btnCancelar.TabIndex = 5;
            btnCancelar.Tag = "btn_cancelar";
            btnCancelar.Text = "Cancelar";
            btnCancelar.UseVisualStyleBackColor = true;
            btnCancelar.Visible = false;
            btnCancelar.Click += btnCancelar_Click;
            // 
            // dataGridView1
            // 
            dataGridView1.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dataGridView1.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            dataGridView1.Location = new Point(17, 65);
            dataGridView1.Margin = new Padding(2);
            dataGridView1.Name = "dataGridView1";
            dataGridView1.RowHeadersVisible = false;
            dataGridView1.RowHeadersWidth = 62;
            dataGridView1.Size = new Size(463, 428);
            dataGridView1.TabIndex = 6;
            dataGridView1.Visible = false;
            // 
            // lbOriginal
            // 
            lbOriginal.Anchor = AnchorStyles.Bottom | AnchorStyles.Right;
            lbOriginal.AutoSize = true;
            lbOriginal.Enabled = false;
            lbOriginal.Location = new Point(456, 571);
            lbOriginal.Margin = new Padding(2, 0, 2, 0);
            lbOriginal.Name = "lbOriginal";
            lbOriginal.Size = new Size(49, 15);
            lbOriginal.TabIndex = 20;
            lbOriginal.Tag = "lb_original";
            lbOriginal.Text = "Original";
            lbOriginal.Visible = false;
            // 
            // lbTraduccion
            // 
            lbTraduccion.Anchor = AnchorStyles.Bottom | AnchorStyles.Right;
            lbTraduccion.AutoSize = true;
            lbTraduccion.Enabled = false;
            lbTraduccion.Location = new Point(440, 556);
            lbTraduccion.Margin = new Padding(2, 0, 2, 0);
            lbTraduccion.Name = "lbTraduccion";
            lbTraduccion.Size = new Size(65, 15);
            lbTraduccion.TabIndex = 21;
            lbTraduccion.Tag = "lb_traduccion";
            lbTraduccion.Text = "Traduccion";
            lbTraduccion.Visible = false;
            // 
            // lbCompletar
            // 
            lbCompletar.Anchor = AnchorStyles.Bottom | AnchorStyles.Right;
            lbCompletar.AutoSize = true;
            lbCompletar.Enabled = false;
            lbCompletar.Location = new Point(402, 541);
            lbCompletar.Margin = new Padding(2, 0, 2, 0);
            lbCompletar.Name = "lbCompletar";
            lbCompletar.Size = new Size(103, 15);
            lbCompletar.TabIndex = 22;
            lbCompletar.Tag = "lb_completar";
            lbCompletar.Text = "Completar Idioma";
            lbCompletar.Visible = false;
            // 
            // lbTraduccionPara
            // 
            lbTraduccionPara.Anchor = AnchorStyles.Bottom | AnchorStyles.Right;
            lbTraduccionPara.AutoSize = true;
            lbTraduccionPara.Enabled = false;
            lbTraduccionPara.Location = new Point(414, 526);
            lbTraduccionPara.Margin = new Padding(2, 0, 2, 0);
            lbTraduccionPara.Name = "lbTraduccionPara";
            lbTraduccionPara.Size = new Size(91, 15);
            lbTraduccionPara.TabIndex = 23;
            lbTraduccionPara.Tag = "lb_TraduccionPara";
            lbTraduccionPara.Text = "Traduccion para";
            lbTraduccionPara.Visible = false;
            // 
            // lbIngresar
            // 
            lbIngresar.Anchor = AnchorStyles.Bottom | AnchorStyles.Right;
            lbIngresar.AutoSize = true;
            lbIngresar.Enabled = false;
            lbIngresar.Location = new Point(456, 511);
            lbIngresar.Margin = new Padding(2, 0, 2, 0);
            lbIngresar.Name = "lbIngresar";
            lbIngresar.Size = new Size(49, 15);
            lbIngresar.TabIndex = 24;
            lbIngresar.Tag = "btn_ingresar";
            lbIngresar.Text = "Ingresar";
            lbIngresar.Visible = false;
            // 
            // frmEditarIdiomas
            // 
            AutoScaleDimensions = new SizeF(7F, 15F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(516, 592);
            Controls.Add(lbIngresar);
            Controls.Add(lbTraduccionPara);
            Controls.Add(lbCompletar);
            Controls.Add(lbTraduccion);
            Controls.Add(lbOriginal);
            Controls.Add(dataGridView1);
            Controls.Add(btnCancelar);
            Controls.Add(btnGuardar);
            Controls.Add(btnSalir);
            Controls.Add(lbNuevoIdioma);
            Controls.Add(txtNuevoIdioma);
            Controls.Add(btnCrear);
            Margin = new Padding(2);
            Name = "frmEditarIdiomas";
            Text = "frmEditarIdiomas";
            FormClosing += frmEditarIdiomas_FormClosing;
            Load += frmEditarIdiomas_Load;
            ((System.ComponentModel.ISupportInitialize)dataGridView1).EndInit();
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private Button btnCrear;
        private TextBox txtNuevoIdioma;
        private Label lbNuevoIdioma;
        private Button btnSalir;
        private Button btnGuardar;
        private Button btnCancelar;
        private DataGridView dataGridView1;
        private Label lbOriginal;
        private Label lbTraduccion;
        private Label lbCompletar;
        private Label lbTraduccionPara;
        private Label lbIngresar;
    }
}