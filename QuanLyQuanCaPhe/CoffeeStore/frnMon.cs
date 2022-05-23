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
    public partial class frnMon : Form
    {
        DataTable tblMon = new DataTable();
        public frnMon()
        {
            InitializeComponent();
        }

        private void Load_DataGridView()
        {
            string sql;
            sql = "SELECT * FROM Mon";
            tblMon = DAO.LoadDataToTable(sql);
            dataGridView.DataSource = tblMon;
            dataGridView.Columns[0].Width = 70;
            dataGridView.Columns[1].Width = 150;
            dataGridView.Columns[2].Width = 80;
            dataGridView.Columns[3].Width = 100;
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
            txtMaMon.Enabled = true;
            ResetValues();
            txtMaMon.Focus();
        }

        private void ResetValues()
        {
            txtMaMon.Text = "";
            txtTenMon.Text = "";
            txtDonGia.Text = "";
            cbxLoaiMon.Text = "";
        }
        private void GetDataComboBox()
        {
            string query = "SELECT DISTINCT MaLoaiMon from MON";
            DataTable TempTable = new DataTable();
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(query, DAO.con);
            sqlDataAdapter.Fill(TempTable);
            foreach (DataRow row in TempTable.Rows)
            {
                cbxLoaiMon.Items.Add(row["maloaimon"].ToString());
            }
        }

        private void frnMon_Load(object sender, EventArgs e)
        {
            txtMaMon.Enabled = false;
            btnLuu.Enabled = false;
            btnBoQua.Enabled = false;
            GetDataComboBox();
            Load_DataGridView();
        }

        private void dataGridView_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            txtMaMon.Text = dataGridView.CurrentRow.Cells[0].Value.ToString();
            txtTenMon.Text = dataGridView.CurrentRow.Cells[1].Value.ToString();
            txtDonGia.Text = dataGridView.CurrentRow.Cells[2].Value.ToString();
            cbxLoaiMon.Text = dataGridView.CurrentRow.Cells[3].Value.ToString();
        }

        private void btnLuu_Click(object sender, EventArgs e)
        {
            string sql;
            if (txtMaMon.Text.Trim().Length == 0)
            {
                MessageBox.Show("Bạn phải nhập mã món", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                txtMaMon.Focus();
                return;
            }
            if (txtTenMon.Text.Trim().Length == 0)
            {
                MessageBox.Show("Bạn phải nhập họ tên", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                txtTenMon.Focus();
                return;
            }
            sql = "SELECT MaMon FROM Mon WHERE MaMon = N'" + txtMaMon.Text.Trim() + "'";
            if (DAO.CheckKey(sql))
            {
                MessageBox.Show("Mã nhân viên này đã có, bạn phải nhập mã khác", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                txtMaMon.Focus();
                txtMaMon.Text = "";
                return;
            }
            sql = "INSERT INTO MON(MaMon,TenMon, Gia, LoaiMon) VALUES(N'" + txtMaMon.Text + "',N'" + txtTenMon.Text + "',N'" + txtDonGia.Text + "',N'"+ cbxLoaiMon.Text + "')";
            DAO.RunSql(sql);
            Load_DataGridView();
            ResetValues();
            btnXoa.Enabled = true;
            btnThem.Enabled = true;
            btnSua.Enabled = true;
            btnBoQua.Enabled = false;
            btnLuu.Enabled = false;
            txtMaMon.Enabled = false;
        }

        private void btnBoQua_Click(object sender, EventArgs e)
        {
            ResetValues();
            btnBoQua.Enabled = false;
            btnThem.Enabled = true;
            btnXoa.Enabled = true;
            btnSua.Enabled = true;
            btnLuu.Enabled = false;
            txtMaMon.Enabled = false;
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            string sql;
            if (tblMon.Rows.Count == 0)
            {
                MessageBox.Show("Không còn dữ liệu!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }
            if (txtMaMon.Text == "")
            {
                MessageBox.Show("Bạn chưa chọn bản ghi nào", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }
            if (MessageBox.Show("Bạn có muốn xóa không?", "Thông báo", MessageBoxButtons.OKCancel, MessageBoxIcon.Question) == DialogResult.OK)
            {
                sql = "DELETE MON WHERE MaMon= N'" + txtMaMon.Text + "'";
                DAO.RunSqlDel(sql);
                Load_DataGridView();
                ResetValues();
            }
        }

        private void btnSua_Click(object sender, EventArgs e)
        {
            string sql;
            if (tblMon.Rows.Count == 0)
            {
                MessageBox.Show("Không còn dữ liệu!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }
            if (txtMaMon.Text == "")
            {
                MessageBox.Show("Bạn chưa chọn bản ghi nào", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }
            if (txtTenMon.Text.Trim().Length == 0)
            {
                MessageBox.Show("Bạn phải nhập tên món", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                txtTenMon.Focus();
                return;
            }
            sql = "UPDATE MON SET TenMon = N'" + txtTenMon.Text.ToString() + "' , Gia = '" + txtDonGia.Text.ToString()
                + "' , MaLoaiMon = N'" + cbxLoaiMon.Text.ToString() + "' WHERE MaMon = N'" + txtMaMon.Text + "'";
            DAO.RunSql(sql);
            Load_DataGridView();
            ResetValues();
            btnBoQua.Enabled = false;
        }

        private void btnTimKiem_Click(object sender, EventArgs e)
        {
            string sql;
            if (txtTimKiem.Text == "")
            {
                MessageBox.Show("Hãy nhập tên món tìm kiếm!!!", "Yêu cầu ...", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            sql = "SELECT * FROM MON WHERE 1=1";
            if (txtTimKiem.Text != "")
                sql = sql + " AND TenMon Like N'%" + txtTimKiem.Text + "%'";
            tblMon = DAO.LoadDataToTable(sql);
            if (tblMon.Rows.Count == 0)
                MessageBox.Show("Không có bản ghi thỏa mãn điều kiện!!!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            else
                MessageBox.Show("Có " + tblMon.Rows.Count + " bản ghi thỏa mãn điều kiện!!!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            dataGridView.DataSource = tblMon;
            ResetValues();

        }

        private void btnDanhSach_Click(object sender, EventArgs e)
        {
            Load_DataGridView();
        }
    }
}
