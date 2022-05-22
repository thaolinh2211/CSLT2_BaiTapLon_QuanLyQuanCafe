using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace CoffeeStore
{
    public class DAO
    {
        public static SqlConnection con;  //Khai báo đối tượng kết nối
        public static string conString = "Data Source=NGUYENCHOI\\SQLEXPRESS;" +
                     "Initial Catalog = QuanLyQuanCaPhe;" + "Integrated Security = True";  //Khai báo biến chứa chuỗi kết nối

        public static void Connect()
        {
            //Thiết lập giá trị cho chuỗi kết nối
            con = new SqlConnection();         		//Cấp phát đối tượng
            con.ConnectionString = conString; 		//Kết nối
            try
            {
                if(con.State == ConnectionState.Closed)
                {
                    con.Open();                             //Mở kết nối
                    MessageBox.Show("kết nối cơ sở dữ liệu thành công");
                }
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }

        public static void Disconnect()
        {
            try
            {
                if (con.State == ConnectionState.Open)
                {
                    con.Close();
                    con.Dispose();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


        public static DataTable LoadDataToTable(string sql)
        {
            //The hien so 2 cua SqlDataAdapter(<Tham so 1>, <Tham so 2>)
            SqlDataAdapter Myadapter = new SqlDataAdapter(sql, con);    // Khai báo
            DataTable table = new DataTable();    // Khai báo DataTable nhận dữ liệu trả về
            Myadapter.Fill(table);     //Thực hiện câu lệnh SELECT và đổ dữ liệu vào bảng table
            return table;
        }

        //CheckKey có tác dụng kiểm tra khóa chinh co trùng hay khong?
        public static bool CheckKey(string sql)
        {
            SqlDataAdapter Mydata = new SqlDataAdapter(sql, DAO.con);
            DataTable table = new DataTable();
            Mydata.Fill(table);
            if (table.Rows.Count > 0)
                return true;
            else
                return false;
        }

        //RunSql có tác dụng thực thi các câu lệnh SQL.
        public static void RunSql(string sql)
        {
            SqlCommand cmd;		                // Khai báo đối tượng SqlCommand
            cmd = new SqlCommand();	         // Khởi tạo đối tượng
            cmd.Connection = DAO.con;	  // Gán kết nối
            cmd.CommandText = sql;			  // Gán câu lệnh SQL
            try
            {
                cmd.ExecuteNonQuery();		  // Thực hiện câu lệnh SQL
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
            cmd.Dispose();    //Giai phong cmd
            cmd = null;
        }

        public static void RunSqlDel(string sql)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = DAO.con;
            cmd.CommandText = sql;
            try
            {
                cmd.ExecuteNonQuery();
            }
            catch (System.Exception)
            {
                MessageBox.Show("Dữ liệu đang được dùng, không thể xóa...", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Stop);
            }
            cmd.Dispose();
            cmd = null;
        }
        /*IsDate có tác dụng kiểm tra một biến có ở dạng ngày tháng không,
        ConvertDateTime có tác dụng đổi một chuỗi ngày tháng do người dùng nhập
        có dạng dd/mm/yyyy thành chuỗi ngày tháng có dạng mm/dd/yyyy để lưu vào CSDL.*/

        public static bool IsDate(string d)
        {
            string[] parts = d.Split('/');
            if ((Convert.ToInt32(parts[0]) >= 1) && (Convert.ToInt32(parts[0]) <= 31) &&
                (Convert.ToInt32(parts[1]) >= 1) && (Convert.ToInt32(parts[1]) <= 12) &&
                (Convert.ToInt32(parts[2]) >= 1900))
                return true;
            else
                return false;
        }

        public static string ConvertDateTime(string d)
        {
            string[] parts = d.Split('/');
            string dt = String.Format("{0}/{1}/{2}", parts[1], parts[0], parts[2]);
            return dt;
        }

        public static void FillCombo(string sql, ComboBox cbo, string ma, string ten)
        {
            SqlDataAdapter Mydata = new SqlDataAdapter(sql, DAO.con);
            DataTable table = new DataTable();
            Mydata.Fill(table);
            cbo.DataSource = table;
            cbo.ValueMember = ma;    // Truong gia tri
            cbo.DisplayMember = ten;    // Truong hien thi
        }

        /* GetFieldValues là một hàm toàn cục được viết trong Class Functions, 
        có tác dụng lấy dữ liệu từ một câu lệnh SQL.*/
        public static string GetFieldValues(string sql)
        {
            string ma = "";
            SqlCommand cmd = new SqlCommand(sql, DAO.con);
            SqlDataReader reader;
            reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                ma = reader.GetValue(0).ToString();
            }
            reader.Close();
            return ma;
        }



    }
}
