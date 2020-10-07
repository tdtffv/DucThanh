using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Oracle.ManagedDataAccess.Client;
using Oracle.ManagedDataAccess.EntityFramework;

namespace ATBM_CK
{
    public partial class Form4 : Form
    {
        public Form4()
        {
            InitializeComponent();
        }
        
        //User
        private void button6_Click(object sender, EventArgs e)
        {
            //connect
            OracleConnection conn = BienToanCuc.GetConnect(BienToanCuc.Username, BienToanCuc.Password);
            //LOAD
            //MỞ KẾT NỐI
            string lenh = "select username from dba_users";
            DataSet ds = new DataSet();
            try
            {
                conn.Open();// mở kết nối
                OracleDataAdapter da = new OracleDataAdapter(lenh, conn);
                da.Fill(ds);
                conn.Close();
                listView1.Items.Clear();
                for (int rows = 0; rows < ds.Tables[0].Rows.Count; rows++)
                {
                    listView1.Items.Add("");
                    listView1.Items[rows].SubItems.Add("");
                    listView1.Items[rows].SubItems.Add(ds.Tables[0].Rows[rows].ItemArray[0].ToString());
                    
                }
                //đỗ dữ liệu
            }
            catch (Exception)
            {
                MessageBox.Show("There is a problem with the system, please choose later");
            }
        }

        //Xem tất cả các bảng mà user đã tạo
        private void button7_Click(object sender, EventArgs e)
        {
            //connect
            OracleConnection conn = BienToanCuc.GetConnect(BienToanCuc.Username, BienToanCuc.Password);
            //LOAD
            //MỞ KẾT NỐI
            string lenh = "SELECT table_name FROM user_tables";
            DataSet ds = new DataSet();
            try
            {
                conn.Open();// mở kết nối
                OracleDataAdapter da = new OracleDataAdapter(lenh, conn);
                da.Fill(ds);
                conn.Close();
                listView1.Items.Clear();
                for (int rows = 0; rows < ds.Tables[0].Rows.Count; rows++)
                {
                    listView1.Items.Add(ds.Tables[0].Rows[rows].ItemArray[0].ToString());
                }
                //đỗ dữ liệu
            }
            catch (Exception)
            {
                MessageBox.Show("There is a problem with the system, please choose later");
            }
        }

        //view
        private void button8_Click(object sender, EventArgs e)
        {
            //connect
            OracleConnection conn = BienToanCuc.GetConnect(BienToanCuc.Username, BienToanCuc.Password);
            //LOAD
            //MỞ KẾT NỐI
            string lenh = "SELECT view_name FROM user_views";
            DataSet ds = new DataSet();
            try
            {
                conn.Open();// mở kết nối
                OracleDataAdapter da = new OracleDataAdapter(lenh, conn);
                da.Fill(ds);
                conn.Close();
                listView1.Items.Clear();
                for (int rows = 0; rows < ds.Tables[0].Rows.Count; rows++)
                {
                    listView1.Items.Add("");
                    listView1.Items[rows].SubItems.Add(ds.Tables[0].Rows[rows].ItemArray[0].ToString());
                }
                //đỗ dữ liệu
            }
            catch (Exception)
            {
                MessageBox.Show("There is a problem with the system, please choose later");
            }
        }

        private void Form4_Load(object sender, EventArgs e)
        {
            BienToanCuc.Username = "ADMIN1";
            BienToanCuc.Password = "admin1";
        }
        //Thông tin quyền
        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form3 ThongTinQuyen = new Form3();
            ThongTinQuyen.ShowDialog();
            this.Dispose();
        }

        //Hiệu chỉnh quyền
        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form11 HieuChinhQuyen = new Form11();
            HieuChinhQuyen.ShowDialog();
            this.Dispose();
        }
        //Trang chủ
        private void button4_Click(object sender, EventArgs e)
        {
            this.Dispose();
        }

        //Hiệu chỉnh role
        private void button5_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form6 HieuChinhRole = new Form6();
            HieuChinhRole.ShowDialog();
            this.Dispose();
        }
    }
}
