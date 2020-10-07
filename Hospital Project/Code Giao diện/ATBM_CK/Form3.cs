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
    public partial class Form3 : Form
    {
        public Form3()
        {
            InitializeComponent();
        }

        //Các quyền trên cột
        private void button6_Click(object sender, EventArgs e)
        {
            //connect
            OracleConnection conn = BienToanCuc.GetConnect(BienToanCuc.Username, BienToanCuc.Password);
            //LOAD
            //MỞ KẾT NỐI
            string lenh = "SELECT GRANTEE, TABLE_NAME, COLUMN_NAME, PRIVILEGE" +
                " FROM DBA_COL_PRIVS WHERE OWNER = 'ADMIN1'";
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
                    listView1.Items[rows].SubItems.Add(ds.Tables[0].Rows[rows].ItemArray[1].ToString());
                    listView1.Items[rows].SubItems.Add(ds.Tables[0].Rows[rows].ItemArray[2].ToString());
                }
                //đỗ dữ liệu
            }
            catch (Exception)
            {
                MessageBox.Show("There is a problem with the system, please choose later");
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form11 HieuChinhQuyen = new Form11();
            HieuChinhQuyen.ShowDialog();
            this.Dispose();
        }

        private void Form3_Load(object sender, EventArgs e)
        {
            BienToanCuc.Username = "ADMIN1";
            BienToanCuc.Password = "admin1";
        }

        //Các quyền trên bảng
        private void button7_Click(object sender, EventArgs e)
        {
            //connect
            OracleConnection conn = BienToanCuc.GetConnect(BienToanCuc.Username, BienToanCuc.Password);
            //LOAD
            //MỞ KẾT NỐI
            string lenh = "SELECT GRANTEE, TABLE_NAME, PRIVILEGE" +
                " FROM USER_TAB_PRIVS WHERE OWNER = 'ADMIN1'";
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
                    listView1.Items[rows].SubItems.Add(ds.Tables[0].Rows[rows].ItemArray[1].ToString());
                    listView1.Items[rows].SubItems.Add("Full");
                }
                //đỗ dữ liệu
            }
            catch (Exception)
            {
                MessageBox.Show("There is a problem with the system, please choose later");
            }
        }

        //Quay về trang chủ
        private void button4_Click(object sender, EventArgs e)
        {
            this.Dispose();
        }

        //Danh sách đối tượng
        private void button1_Click(object sender, EventArgs e)
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
    }
}
