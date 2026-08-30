namespace AppBase
{
    partial class frmFamilias
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
            dataGridView1 = new DataGridView();
            Patentes = new DataGridViewTextBoxColumn();
            lbPatentes2 = new Label();
            ComboFamilias = new ComboBox();
            dataGridView2 = new DataGridView();
            Permisos = new DataGridViewTextBoxColumn();
            lbPermisos2 = new Label();
            lbFam = new Label();
            lbPermisos = new Label();
            btnGuardar = new Button();
            btnCancelar = new Button();
            button3 = new Button();
            button4 = new Button();
            btnSalir = new Button();
            btnNueva = new Button();
            btnCrear = new Button();
            txtNueva = new TextBox();
            lbNueva = new Label();
            treeView1 = new TreeView();
            dataGridView3 = new DataGridView();
            Familias = new DataGridViewTextBoxColumn();
            lbFamilias2 = new Label();
            button1 = new Button();
            button2 = new Button();
            ((System.ComponentModel.ISupportInitialize)dataGridView1).BeginInit();
            ((System.ComponentModel.ISupportInitialize)dataGridView2).BeginInit();
            ((System.ComponentModel.ISupportInitialize)dataGridView3).BeginInit();
            SuspendLayout();
            // 
            // dataGridView1
            // 
            dataGridView1.AllowUserToAddRows = false;
            dataGridView1.AllowUserToDeleteRows = false;
            dataGridView1.AllowUserToResizeColumns = false;
            dataGridView1.AllowUserToResizeRows = false;
            dataGridView1.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dataGridView1.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            dataGridView1.Columns.AddRange(new DataGridViewColumn[] { Patentes });
            dataGridView1.EditMode = DataGridViewEditMode.EditProgrammatically;
            dataGridView1.Location = new Point(318, 31);
            dataGridView1.MultiSelect = false;
            dataGridView1.Name = "dataGridView1";
            dataGridView1.RowHeadersVisible = false;
            dataGridView1.RowHeadersWidth = 62;
            dataGridView1.SelectionMode = DataGridViewSelectionMode.CellSelect;
            dataGridView1.Size = new Size(204, 168);
            dataGridView1.TabIndex = 0;
            // 
            // Patentes
            // 
            Patentes.DataPropertyName = "Nombre";
            Patentes.HeaderText = "Patentes";
            Patentes.MinimumWidth = 8;
            Patentes.Name = "Patentes";
            Patentes.ReadOnly = true;
            // 
            // lbPatentes2
            // 
            lbPatentes2.Location = new Point(0, 0);
            lbPatentes2.Name = "lbPatentes2";
            lbPatentes2.Size = new Size(100, 23);
            lbPatentes2.TabIndex = 20;
            lbPatentes2.Tag = "lb_patentes";
            lbPatentes2.Text = "Patentes";
            // 
            // ComboFamilias
            // 
            ComboFamilias.FormattingEnabled = true;
            ComboFamilias.Location = new Point(11, 33);
            ComboFamilias.Name = "ComboFamilias";
            ComboFamilias.Size = new Size(203, 23);
            ComboFamilias.TabIndex = 1;
            ComboFamilias.SelectedIndexChanged += ElegirFamilia;
            // 
            // dataGridView2
            // 
            dataGridView2.AllowUserToAddRows = false;
            dataGridView2.AllowUserToDeleteRows = false;
            dataGridView2.AllowUserToResizeColumns = false;
            dataGridView2.AllowUserToResizeRows = false;
            dataGridView2.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dataGridView2.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            dataGridView2.Columns.AddRange(new DataGridViewColumn[] { Permisos });
            dataGridView2.EditMode = DataGridViewEditMode.EditProgrammatically;
            dataGridView2.Location = new Point(11, 72);
            dataGridView2.MultiSelect = false;
            dataGridView2.Name = "dataGridView2";
            dataGridView2.RowHeadersVisible = false;
            dataGridView2.RowHeadersWidth = 62;
            dataGridView2.SelectionMode = DataGridViewSelectionMode.CellSelect;
            dataGridView2.Size = new Size(203, 259);
            dataGridView2.TabIndex = 2;
            // 
            // Permisos
            // 
            Permisos.DataPropertyName = "Nombre";
            Permisos.HeaderText = "Permisos";
            Permisos.MinimumWidth = 8;
            Permisos.Name = "Permisos";
            Permisos.ReadOnly = true;
            // 
            // lbPermisos2
            // 
            lbPermisos2.Location = new Point(0, 0);
            lbPermisos2.Name = "lbPermisos2";
            lbPermisos2.Size = new Size(100, 23);
            lbPermisos2.TabIndex = 18;
            lbPermisos2.Tag = "lb_permisos";
            lbPermisos2.Text = "Permisos";
            // 
            // lbFam
            // 
            lbFam.AutoSize = true;
            lbFam.Location = new Point(11, 15);
            lbFam.Name = "lbFam";
            lbFam.Size = new Size(50, 15);
            lbFam.TabIndex = 3;
            lbFam.Tag = "lb_familias";
            lbFam.Text = "Familias";
            // 
            // lbPermisos
            // 
            lbPermisos.Location = new Point(0, 0);
            lbPermisos.Margin = new Padding(2, 0, 2, 0);
            lbPermisos.Name = "lbPermisos";
            lbPermisos.Size = new Size(55, 15);
            lbPermisos.TabIndex = 17;
            lbPermisos.Tag = "lb_permisos";
            lbPermisos.Text = "Permisos";
            // 
            // btnGuardar
            // 
            btnGuardar.Location = new Point(11, 497);
            btnGuardar.Name = "btnGuardar";
            btnGuardar.Size = new Size(374, 67);
            btnGuardar.TabIndex = 4;
            btnGuardar.Tag = "btn_guardar";
            btnGuardar.Text = "Guardar";
            btnGuardar.UseVisualStyleBackColor = true;
            btnGuardar.Click += Guardar;
            // 
            // btnCancelar
            // 
            btnCancelar.Location = new Point(412, 497);
            btnCancelar.Name = "btnCancelar";
            btnCancelar.Size = new Size(374, 67);
            btnCancelar.TabIndex = 5;
            btnCancelar.Tag = "btn_cancelar";
            btnCancelar.Text = "Cancelar";
            btnCancelar.UseVisualStyleBackColor = true;
            btnCancelar.Click += Cancelar;
            // 
            // button3
            // 
            button3.Location = new Point(220, 100);
            button3.Name = "button3";
            button3.Size = new Size(92, 23);
            button3.TabIndex = 6;
            button3.Tag = "btn_agregar";
            button3.Text = "<--Agregar";
            button3.UseVisualStyleBackColor = true;
            button3.Click += Agregar;
            // 
            // button4
            // 
            button4.Location = new Point(220, 148);
            button4.Name = "button4";
            button4.Size = new Size(92, 23);
            button4.TabIndex = 7;
            button4.Tag = "btn_quitar";
            button4.Text = "Quitar-->";
            button4.UseVisualStyleBackColor = true;
            button4.Click += Quitar;
            // 
            // btnSalir
            // 
            btnSalir.Location = new Point(11, 581);
            btnSalir.Name = "btnSalir";
            btnSalir.Size = new Size(775, 39);
            btnSalir.TabIndex = 8;
            btnSalir.Tag = "btn_salir";
            btnSalir.Text = "Salir";
            btnSalir.UseVisualStyleBackColor = true;
            btnSalir.Click += Salir;
            // 
            // btnNueva
            // 
            btnNueva.Location = new Point(29, 369);
            btnNueva.Name = "btnNueva";
            btnNueva.Size = new Size(204, 23);
            btnNueva.TabIndex = 9;
            btnNueva.Tag = "btn_nueva_fam";
            btnNueva.Text = "Nueva Familia";
            btnNueva.UseVisualStyleBackColor = true;
            btnNueva.Click += NuevaFamilia;
            // 
            // btnCrear
            // 
            btnCrear.Location = new Point(30, 455);
            btnCrear.Name = "btnCrear";
            btnCrear.Size = new Size(204, 23);
            btnCrear.TabIndex = 10;
            btnCrear.Tag = "btn_crear";
            btnCrear.Text = "Crear";
            btnCrear.UseVisualStyleBackColor = true;
            btnCrear.Visible = false;
            btnCrear.Click += Crear;
            // 
            // txtNueva
            // 
            txtNueva.Location = new Point(30, 426);
            txtNueva.Name = "txtNueva";
            txtNueva.Size = new Size(204, 23);
            txtNueva.TabIndex = 11;
            txtNueva.Visible = false;
            // 
            // lbNueva
            // 
            lbNueva.AutoSize = true;
            lbNueva.Location = new Point(75, 408);
            lbNueva.Name = "lbNueva";
            lbNueva.Size = new Size(120, 15);
            lbNueva.TabIndex = 12;
            lbNueva.Tag = "lb_NombreFamilia";
            lbNueva.Text = "Nombre de la Familia";
            // 
            // treeView1
            // 
            treeView1.Location = new Point(803, 29);
            treeView1.Name = "treeView1";
            treeView1.Size = new Size(308, 591);
            treeView1.TabIndex = 13;
            // 
            // dataGridView3
            // 
            dataGridView3.AllowUserToAddRows = false;
            dataGridView3.AllowUserToDeleteRows = false;
            dataGridView3.AllowUserToResizeColumns = false;
            dataGridView3.AllowUserToResizeRows = false;
            dataGridView3.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dataGridView3.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            dataGridView3.Columns.AddRange(new DataGridViewColumn[] { Familias });
            dataGridView3.EditMode = DataGridViewEditMode.EditProgrammatically;
            dataGridView3.Location = new Point(318, 205);
            dataGridView3.MultiSelect = false;
            dataGridView3.Name = "dataGridView3";
            dataGridView3.RowHeadersVisible = false;
            dataGridView3.RowHeadersWidth = 62;
            dataGridView3.SelectionMode = DataGridViewSelectionMode.CellSelect;
            dataGridView3.Size = new Size(204, 168);
            dataGridView3.TabIndex = 14;
            // 
            // Familias
            // 
            Familias.DataPropertyName = "Nombre";
            Familias.HeaderText = "Familias";
            Familias.MinimumWidth = 8;
            Familias.Name = "Familias";
            Familias.ReadOnly = true;
            // 
            // lbFamilias2
            // 
            lbFamilias2.Location = new Point(12, 15);
            lbFamilias2.Name = "lbFamilias2";
            lbFamilias2.Size = new Size(100, 23);
            lbFamilias2.TabIndex = 19;
            lbFamilias2.Tag = "lb_familias";
            lbFamilias2.Text = "Familias";
            // 
            // button1
            // 
            button1.Location = new Point(220, 283);
            button1.Name = "button1";
            button1.Size = new Size(92, 23);
            button1.TabIndex = 16;
            button1.Tag = "btn_quitar";
            button1.Text = "Quitar-->";
            button1.UseVisualStyleBackColor = true;
            button1.Click += Quitar;
            // 
            // button2
            // 
            button2.Location = new Point(220, 235);
            button2.Name = "button2";
            button2.Size = new Size(92, 23);
            button2.TabIndex = 15;
            button2.Tag = "btn_agregar";
            button2.Text = "<--Agregar";
            button2.UseVisualStyleBackColor = true;
            button2.Click += AgregarFamilia;
            // 
            // frmFamilias
            // 
            AutoScaleDimensions = new SizeF(7F, 15F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(1123, 637);
            Controls.Add(ComboFamilias);
            Controls.Add(lbFamilias2);
            Controls.Add(lbPatentes2);
            Controls.Add(lbPermisos2);
            Controls.Add(button1);
            Controls.Add(button2);
            Controls.Add(dataGridView3);
            Controls.Add(treeView1);
            Controls.Add(lbNueva);
            Controls.Add(txtNueva);
            Controls.Add(btnCrear);
            Controls.Add(btnNueva);
            Controls.Add(btnSalir);
            Controls.Add(button4);
            Controls.Add(button3);
            Controls.Add(btnCancelar);
            Controls.Add(btnGuardar);
            Controls.Add(lbFam);
            Controls.Add(lbPermisos);
            Controls.Add(dataGridView2);
            Controls.Add(dataGridView1);
            Name = "frmFamilias";
            Tag = "lb_familias";
            Text = "Familias";
            FormClosing += frmFamilias_FormClosing;
            Load += frmFamilias_Load;
            ((System.ComponentModel.ISupportInitialize)dataGridView1).EndInit();
            ((System.ComponentModel.ISupportInitialize)dataGridView2).EndInit();
            ((System.ComponentModel.ISupportInitialize)dataGridView3).EndInit();
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private DataGridView dataGridView1;
        private DataGridViewTextBoxColumn Patentes;
        private ComboBox ComboFamilias;
        private DataGridView dataGridView2;
        private DataGridViewTextBoxColumn Permisos;
        private Label lbFam;
        private Button btnGuardar;
        private Button btnCancelar;
        private Button button3;
        private Button button4;
        private Button btnSalir;
        private Button btnNueva;
        private Button btnCrear;
        private TextBox txtNueva;
        private Label lbNueva;
        private Label lbPatentes;
        private Label lbPermisos;
        private TreeView treeView1;
        private DataGridView dataGridView3;
        private Button button1;
        private Button button2;
        private DataGridViewTextBoxColumn Familias;
        private Label lbPermisos2;
        private Label lbFamilias2;
        private Label lbPatentes2;
    }
}