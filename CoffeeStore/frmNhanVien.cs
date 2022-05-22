using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace CoffeeStore
{
    public partial class frmNhanVien : Form
    {
        //datatable chinh 1 la the hien cua dataset. dataset chua cac datatable
        DataTable tblNhanVien = new DataTable();
        public frmNhanVien()
        {
            InitializeComponent();
        }

        private void frmNhanVien_Load(object sender, EventArgs e)
        {
            txtMaNhanVien.Enabled = false;
            btnLuu.Enabled = false;
            btnBoQua.Enabled = false;
            Load_DataGridView();
        }

        private void Load_DataGridView()
        {
            string sql;
            sql = "SELECT * FROM NhanVien";
            tblNhanVien = DAO.LoadDataToTable(sql);
            dataGridView.DataSource = tblNhanVien;
            dataGridView.Columns[1].Width = 200;
            dataGridView.Columns[3].Width = 150;
        }

        private void dataGridView_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            txtMaNhanVien.Text = dataGridView.CurrentRow.Cells[0].Value.ToString();
            txtHoTen.Text = dataGridView.CurrentRow.Cells[1].Value.ToString();
            dtpNgaySinh.Text = dataGridView.CurrentRow.Cells[2].Value.ToString();
            txtDiaChi.Text = dataGridView.CurrentRow.Cells[3].Value.ToString();
            txtSoDienThoai.Text = dataGridView.CurrentRow.Cells[4].Value.ToString();
            txtHoatDong.Text = dataGridView.CurrentRow.Cells[5].Value.ToString();
            txtBoPhan.Text = dataGridView.CurrentRow.Cells[6].Value.ToString();
            txtLuong.Text = dataGridView.CurrentRow.Cells[7].Value.ToString();
        }

        private void btnDong_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            btnSua.Enabled = false;
            btnXoa.Enabled = false;
            btnBoQua.Enabled = true;
            btnLuu.Enabled = true;
            btnThem.Enabled = false;
            txtMaNhanVien.Enabled = true;
            ResetValues(); 
            txtMaNhanVien.Focus();
        }

        private void ResetValues()
        {
            txtMaNhanVien.Text = "";
            txtHoTen.Text = "";
            dtpNgaySinh.Text = "";
            txtDiaChi.Text = "";
            txtSoDienThoai.Text = "";
            txtHoatDong.Text = "";
            txtBoPhan.Text = "";
            txtLuong.Text = "";
        }

        private void btnLuu_Click(object sender, EventArgs e)
        {
            string sql;
            if (txtMaNhanVien.Text.Trim().Length == 0)
            {
                MessageBox.Show("Bạn phải nhập mã nhân viên", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                txtMaNhanVien.Focus();
                return;
            }
            if (txtHoTen.Text.Trim().Length == 0)
            {
                MessageBox.Show("Bạn phải nhập họ tên", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                txtHoTen.Focus();
                return;
            }
            sql = "SELECT MaNV FROM NhanVien WHERE MaNV =N'" + txtMaNhanVien.Text.Trim() + "'";
            if (DAO.CheckKey(sql))
            {
                MessageBox.Show("Mã nhân viên này đã có, bạn phải nhập mã khác", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                txtMaNhanVien.Focus();
                txtMaNhanVien.Text = "";
                return;
            }
            sql = "SET IDENTITY_INSERT NHANVIEN ON";
            DAO.RunSql(sql);
            sql = "INSERT INTO NhanVien(MaNV,TenNV, NgaySinh, DiaChi, SDT, HoatDong, BoPhan, Luong) VALUES(N'" + txtMaNhanVien.Text + "',N'" + txtHoTen.Text + "',N'" + dtpNgaySinh.Text + "',N'" 
                + txtDiaChi.Text + "',N'" + txtSoDienThoai.Text + "',N'" + txtHoatDong.Text + "',N'" + txtBoPhan.Text + "', '" + txtLuong.Text + "')";
            DAO.RunSql(sql);
            Load_DataGridView();
            sql = "SET IDENTITY_INSERT NHANVIEN OFF";
            DAO.RunSql(sql);
            ResetValues();
            btnXoa.Enabled = true;
            btnThem.Enabled = true;
            btnSua.Enabled = true;
            btnBoQua.Enabled = false;
            btnLuu.Enabled = false;
            txtMaNhanVien.Enabled = false;
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            string sql;
            if (tblNhanVien.Rows.Count == 0)
            {
                MessageBox.Show("Không còn dữ liệu!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }
            if (txtMaNhanVien.Text == "")
            {
                MessageBox.Show("Bạn chưa chọn bản ghi nào", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }
            if (MessageBox.Show("Bạn có muốn xóa không?", "Thông báo", MessageBoxButtons.OKCancel, MessageBoxIcon.Question) == DialogResult.OK)
            {
                sql = "DELETE NhanVien WHERE MaNhanVien= N'" + txtMaNhanVien.Text + "'";
                DAO.RunSqlDel(sql);
                Load_DataGridView();
                ResetValues();
            }
        }

        private void btnBoQua_Click(object sender, EventArgs e)
        {
            ResetValues();
            btnBoQua.Enabled = false;
            btnThem.Enabled = true;
            btnXoa.Enabled = true;
            btnSua.Enabled = true;
            btnLuu.Enabled = false;
            txtMaNhanVien.Enabled = false;
        }
    }
}
