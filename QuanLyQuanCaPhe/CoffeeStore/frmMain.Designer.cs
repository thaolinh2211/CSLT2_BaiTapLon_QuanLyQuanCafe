namespace CoffeeStore
{
    partial class frmMain
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmMain));
            this.menuStrip1 = new System.Windows.Forms.MenuStrip();
            this.mnuDanhMuc = new System.Windows.Forms.ToolStripMenuItem();
            this.mnuHoaDon = new System.Windows.Forms.ToolStripMenuItem();
            this.mnuHoaDonNhap = new System.Windows.Forms.ToolStripMenuItem();
            this.mnuBan = new System.Windows.Forms.ToolStripMenuItem();
            this.mnuMon = new System.Windows.Forms.ToolStripMenuItem();
            this.mnuNhanVien = new System.Windows.Forms.ToolStripMenuItem();
            this.mnuNhaCungCap = new System.Windows.Forms.ToolStripMenuItem();
            this.mnuThongTinTaiKhoan = new System.Windows.Forms.ToolStripMenuItem();
            this.mnuThongTinCaNhan = new System.Windows.Forms.ToolStripMenuItem();
            this.mnuDangXuat = new System.Windows.Forms.ToolStripMenuItem();
            this.mnuThoat = new System.Windows.Forms.ToolStripMenuItem();
            this.panel2 = new System.Windows.Forms.Panel();
            this.listViewHoaDon = new System.Windows.Forms.ListView();
            this.panel3 = new System.Windows.Forms.Panel();
            this.numericUpDown3 = new System.Windows.Forms.NumericUpDown();
            this.numericUpDown2 = new System.Windows.Forms.NumericUpDown();
            this.button3 = new System.Windows.Forms.Button();
            this.button2 = new System.Windows.Forms.Button();
            this.button1 = new System.Windows.Forms.Button();
            this.panel4 = new System.Windows.Forms.Panel();
            this.numericUpDown1 = new System.Windows.Forms.NumericUpDown();
            this.btnThemMon = new System.Windows.Forms.Button();
            this.cbx2 = new System.Windows.Forms.ComboBox();
            this.cbx1 = new System.Windows.Forms.ComboBox();
            this.flowLayoutPanel1 = new System.Windows.Forms.FlowLayoutPanel();
            this.menuStrip1.SuspendLayout();
            this.panel2.SuspendLayout();
            this.panel3.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.numericUpDown3)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.numericUpDown2)).BeginInit();
            this.panel4.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.numericUpDown1)).BeginInit();
            this.SuspendLayout();
            // 
            // menuStrip1
            // 
            this.menuStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.mnuDanhMuc,
            this.mnuThongTinTaiKhoan,
            this.mnuThoat});
            this.menuStrip1.Location = new System.Drawing.Point(0, 0);
            this.menuStrip1.Name = "menuStrip1";
            this.menuStrip1.Size = new System.Drawing.Size(724, 24);
            this.menuStrip1.TabIndex = 0;
            this.menuStrip1.Text = "menuStrip1";
            // 
            // mnuDanhMuc
            // 
            this.mnuDanhMuc.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.mnuHoaDon,
            this.mnuHoaDonNhap,
            this.mnuBan,
            this.mnuMon,
            this.mnuNhanVien,
            this.mnuNhaCungCap});
            this.mnuDanhMuc.Name = "mnuDanhMuc";
            this.mnuDanhMuc.Size = new System.Drawing.Size(74, 20);
            this.mnuDanhMuc.Text = "Danh mục";
            // 
            // mnuHoaDon
            // 
            this.mnuHoaDon.Name = "mnuHoaDon";
            this.mnuHoaDon.Size = new System.Drawing.Size(200, 22);
            this.mnuHoaDon.Text = "Hóa đơn bán hàng";
            // 
            // mnuHoaDonNhap
            // 
            this.mnuHoaDonNhap.Name = "mnuHoaDonNhap";
            this.mnuHoaDonNhap.Size = new System.Drawing.Size(200, 22);
            this.mnuHoaDonNhap.Text = "Hóa đơn nhập hàng";
            // 
            // mnuBan
            // 
            this.mnuBan.Name = "mnuBan";
            this.mnuBan.Size = new System.Drawing.Size(200, 22);
            this.mnuBan.Text = "Bàn";
            // 
            // mnuMon
            // 
            this.mnuMon.Name = "mnuMon";
            this.mnuMon.Size = new System.Drawing.Size(200, 22);
            this.mnuMon.Text = "Món ăn/ Đồ uống";
            this.mnuMon.Click += new System.EventHandler(this.mnuMon_Click);
            // 
            // mnuNhanVien
            // 
            this.mnuNhanVien.Name = "mnuNhanVien";
            this.mnuNhanVien.Size = new System.Drawing.Size(200, 22);
            this.mnuNhanVien.Text = "Thông tin nhân viên";
            this.mnuNhanVien.Click += new System.EventHandler(this.mnuNhanVien_Click);
            // 
            // mnuNhaCungCap
            // 
            this.mnuNhaCungCap.Name = "mnuNhaCungCap";
            this.mnuNhaCungCap.Size = new System.Drawing.Size(200, 22);
            this.mnuNhaCungCap.Text = "Thông tin nhà cung cấp";
            // 
            // mnuThongTinTaiKhoan
            // 
            this.mnuThongTinTaiKhoan.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.mnuThongTinCaNhan,
            this.mnuDangXuat});
            this.mnuThongTinTaiKhoan.Name = "mnuThongTinTaiKhoan";
            this.mnuThongTinTaiKhoan.Size = new System.Drawing.Size(122, 20);
            this.mnuThongTinTaiKhoan.Text = "Thông tin tài khoản";
            // 
            // mnuThongTinCaNhan
            // 
            this.mnuThongTinCaNhan.Name = "mnuThongTinCaNhan";
            this.mnuThongTinCaNhan.Size = new System.Drawing.Size(180, 22);
            this.mnuThongTinCaNhan.Text = "Thông tin cá nhân";
            this.mnuThongTinCaNhan.Click += new System.EventHandler(this.mnuThongTinCaNhan_Click);
            // 
            // mnuDangXuat
            // 
            this.mnuDangXuat.Name = "mnuDangXuat";
            this.mnuDangXuat.Size = new System.Drawing.Size(180, 22);
            this.mnuDangXuat.Text = "Đăng xuất";
            // 
            // mnuThoat
            // 
            this.mnuThoat.Name = "mnuThoat";
            this.mnuThoat.Size = new System.Drawing.Size(49, 20);
            this.mnuThoat.Text = "Thoát";
            this.mnuThoat.Click += new System.EventHandler(this.mnuThoat_Click);
            // 
            // panel2
            // 
            this.panel2.Controls.Add(this.listViewHoaDon);
            this.panel2.Location = new System.Drawing.Point(382, 90);
            this.panel2.Name = "panel2";
            this.panel2.Size = new System.Drawing.Size(334, 303);
            this.panel2.TabIndex = 2;
            // 
            // listViewHoaDon
            // 
            this.listViewHoaDon.HideSelection = false;
            this.listViewHoaDon.Location = new System.Drawing.Point(3, 3);
            this.listViewHoaDon.Name = "listViewHoaDon";
            this.listViewHoaDon.Size = new System.Drawing.Size(328, 297);
            this.listViewHoaDon.TabIndex = 0;
            this.listViewHoaDon.UseCompatibleStateImageBehavior = false;
            // 
            // panel3
            // 
            this.panel3.Controls.Add(this.numericUpDown3);
            this.panel3.Controls.Add(this.numericUpDown2);
            this.panel3.Controls.Add(this.button3);
            this.panel3.Controls.Add(this.button2);
            this.panel3.Controls.Add(this.button1);
            this.panel3.Location = new System.Drawing.Point(382, 399);
            this.panel3.Name = "panel3";
            this.panel3.Size = new System.Drawing.Size(331, 80);
            this.panel3.TabIndex = 3;
            // 
            // numericUpDown3
            // 
            this.numericUpDown3.Location = new System.Drawing.Point(129, 57);
            this.numericUpDown3.Name = "numericUpDown3";
            this.numericUpDown3.Size = new System.Drawing.Size(71, 20);
            this.numericUpDown3.TabIndex = 6;
            // 
            // numericUpDown2
            // 
            this.numericUpDown2.Location = new System.Drawing.Point(3, 57);
            this.numericUpDown2.Name = "numericUpDown2";
            this.numericUpDown2.Size = new System.Drawing.Size(68, 20);
            this.numericUpDown2.TabIndex = 4;
            // 
            // button3
            // 
            this.button3.Location = new System.Drawing.Point(129, 3);
            this.button3.Name = "button3";
            this.button3.Size = new System.Drawing.Size(71, 48);
            this.button3.TabIndex = 5;
            this.button3.Text = "Giảm giá";
            this.button3.UseVisualStyleBackColor = true;
            // 
            // button2
            // 
            this.button2.Location = new System.Drawing.Point(0, 3);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(71, 48);
            this.button2.TabIndex = 4;
            this.button2.Text = "Chuyển bàn";
            this.button2.UseVisualStyleBackColor = true;
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(249, 3);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(81, 74);
            this.button1.TabIndex = 4;
            this.button1.Text = "Thanh toán";
            this.button1.UseVisualStyleBackColor = true;
            // 
            // panel4
            // 
            this.panel4.Controls.Add(this.numericUpDown1);
            this.panel4.Controls.Add(this.btnThemMon);
            this.panel4.Controls.Add(this.cbx2);
            this.panel4.Controls.Add(this.cbx1);
            this.panel4.Location = new System.Drawing.Point(382, 27);
            this.panel4.Name = "panel4";
            this.panel4.Size = new System.Drawing.Size(334, 57);
            this.panel4.TabIndex = 4;
            // 
            // numericUpDown1
            // 
            this.numericUpDown1.Location = new System.Drawing.Point(272, 19);
            this.numericUpDown1.Name = "numericUpDown1";
            this.numericUpDown1.Size = new System.Drawing.Size(58, 20);
            this.numericUpDown1.TabIndex = 3;
            // 
            // btnThemMon
            // 
            this.btnThemMon.Location = new System.Drawing.Point(195, 3);
            this.btnThemMon.Name = "btnThemMon";
            this.btnThemMon.Size = new System.Drawing.Size(71, 48);
            this.btnThemMon.TabIndex = 2;
            this.btnThemMon.Text = "Thêm món";
            this.btnThemMon.UseVisualStyleBackColor = true;
            // 
            // cbx2
            // 
            this.cbx2.FormattingEnabled = true;
            this.cbx2.Location = new System.Drawing.Point(3, 29);
            this.cbx2.Name = "cbx2";
            this.cbx2.Size = new System.Drawing.Size(177, 21);
            this.cbx2.TabIndex = 1;
            // 
            // cbx1
            // 
            this.cbx1.FormattingEnabled = true;
            this.cbx1.Location = new System.Drawing.Point(3, 3);
            this.cbx1.Name = "cbx1";
            this.cbx1.Size = new System.Drawing.Size(177, 21);
            this.cbx1.TabIndex = 0;
            // 
            // flowLayoutPanel1
            // 
            this.flowLayoutPanel1.Location = new System.Drawing.Point(12, 27);
            this.flowLayoutPanel1.Name = "flowLayoutPanel1";
            this.flowLayoutPanel1.Size = new System.Drawing.Size(364, 452);
            this.flowLayoutPanel1.TabIndex = 5;
            // 
            // frmMain
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(724, 493);
            this.Controls.Add(this.flowLayoutPanel1);
            this.Controls.Add(this.panel4);
            this.Controls.Add(this.panel3);
            this.Controls.Add(this.panel2);
            this.Controls.Add(this.menuStrip1);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MainMenuStrip = this.menuStrip1;
            this.Name = "frmMain";
            this.Text = "Quản lý quán cà phê";
            this.menuStrip1.ResumeLayout(false);
            this.menuStrip1.PerformLayout();
            this.panel2.ResumeLayout(false);
            this.panel3.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.numericUpDown3)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.numericUpDown2)).EndInit();
            this.panel4.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.numericUpDown1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.MenuStrip menuStrip1;
        private System.Windows.Forms.ToolStripMenuItem mnuDanhMuc;
        private System.Windows.Forms.ToolStripMenuItem mnuThongTinTaiKhoan;
        private System.Windows.Forms.ToolStripMenuItem mnuThongTinCaNhan;
        private System.Windows.Forms.ToolStripMenuItem mnuDangXuat;
        private System.Windows.Forms.Panel panel2;
        private System.Windows.Forms.ListView listViewHoaDon;
        private System.Windows.Forms.Panel panel3;
        private System.Windows.Forms.NumericUpDown numericUpDown3;
        private System.Windows.Forms.NumericUpDown numericUpDown2;
        private System.Windows.Forms.Button button3;
        private System.Windows.Forms.Button button2;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Panel panel4;
        private System.Windows.Forms.NumericUpDown numericUpDown1;
        private System.Windows.Forms.Button btnThemMon;
        private System.Windows.Forms.ComboBox cbx2;
        private System.Windows.Forms.ComboBox cbx1;
        private System.Windows.Forms.FlowLayoutPanel flowLayoutPanel1;
        private System.Windows.Forms.ToolStripMenuItem mnuHoaDon;
        private System.Windows.Forms.ToolStripMenuItem mnuHoaDonNhap;
        private System.Windows.Forms.ToolStripMenuItem mnuBan;
        private System.Windows.Forms.ToolStripMenuItem mnuMon;
        private System.Windows.Forms.ToolStripMenuItem mnuNhanVien;
        private System.Windows.Forms.ToolStripMenuItem mnuNhaCungCap;
        private System.Windows.Forms.ToolStripMenuItem mnuThoat;
    }
}