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

namespace ATBM_CK
{
    public partial class Form12 : Form
    {
        public Form12()
        {
            InitializeComponent();
        }

        //Load from 11
        private void button3_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form11 HieuChinh = new Form11();
            HieuChinh.ShowDialog();
            this.Dispose();
        }
        //Xem tất cả các quyền
        private void button6_Click(object sender, EventArgs e)
        {
            //connect
            OracleConnection conn = BienToanCuc.GetConnect(BienToanCuc.Username, BienToanCuc.Password);
            //LOAD
            //MỞ KẾT NỐI
            string lenh = "SELECT*FROM user_tab_privs where OWNER='ADMIN1'";
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
                    listView1.Items[rows].SubItems.Add(ds.Tables[0].Rows[rows].ItemArray[2].ToString());
                    listView1.Items[rows].SubItems.Add(ds.Tables[0].Rows[rows].ItemArray[4].ToString());
                    listView1.Items[rows].SubItems.Add(ds.Tables[0].Rows[rows].ItemArray[8].ToString());
                }
                //đỗ dữ liệu
            }
            catch (Exception)
            {
                MessageBox.Show("There is a problem with the system, please choose later");
            }
        }

        private void Form12_Load(object sender, EventArgs e)
        {
            BienToanCuc.Username = "ADMIN1";
            BienToanCuc.Password = "admin1";
        }

        //Xem theo tên user
        private void button7_Click(object sender, EventArgs e)
        {
            if(textBox1.Text=="")
            {
                MessageBox.Show("Please enter user_name");
                return;
            }
            //connect
            OracleConnection conn = BienToanCuc.GetConnect(BienToanCuc.Username, BienToanCuc.Password);
            //LOAD
            //MỞ KẾT NỐI
            string lenh = "SELECT * FROM user_tab_privs WHERE GRANTEE = '"+textBox1.Text+"'";
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
                    listView1.Items[rows].SubItems.Add(ds.Tables[0].Rows[rows].ItemArray[2].ToString());
                    listView1.Items[rows].SubItems.Add(ds.Tables[0].Rows[rows].ItemArray[4].ToString());
                    listView1.Items[rows].SubItems.Add(ds.Tables[0].Rows[rows].ItemArray[8].ToString());
                }
                //đỗ dữ liệu
            }
            catch (Exception)
            {
                MessageBox.Show("There is a problem with the system, please choose later");
            }
        }

        //Danh sách đối tượng
        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form3 ThongTinQuyen = new Form3();
            ThongTinQuyen.ShowDialog();
            this.Dispose();
        }

        //Thông tin quyền
        private void button8_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form3 ThongTinQuyen = new Form3();
            ThongTinQuyen.ShowDialog();
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

        private void button4_Click(object sender, EventArgs e)
        {
            this.Dispose();
        }
    }
}
