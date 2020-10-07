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
    public partial class Form11 : Form
    {
        public Form11()
        {
            InitializeComponent();
        }

        //Danh sách đối tượng
        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form3 ThongTinQuyen = new Form3();
            ThongTinQuyen.ShowDialog();
            this.Dispose();
        }

        //Cấp quyền cho user/role
        private void button3_Click(object sender, EventArgs e)
        {
            string option = "";
            if (textBox1.Text == "" || textBox2.Text == "")
            {
                MessageBox.Show("Please fill all fields");
                return;
            }
            if(checkBox1.Checked==true)
            {
                option = "1";
            }
            else
            {
                option = "0";
            }
            //connect
            OracleConnection conn = BienToanCuc.GetConnect(BienToanCuc.Username, BienToanCuc.Password);
            try
            {
                OracleCommand cmd = new OracleCommand("sp_GrantPriRole", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.BindByName = true;
                cmd.Parameters.Add("user_pri", OracleDbType.Varchar2).Value = textBox2.Text;
                cmd.Parameters.Add("user_name", OracleDbType.Varchar2).Value = textBox1.Text;
                cmd.Parameters.Add("user_wgo", OracleDbType.Decimal).Value = option;
                conn.Open();
                int data = cmd.ExecuteNonQuery();
                MessageBox.Show("Grant is successful");
                conn.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show("## ERROR: " + ex.Message);
                return;
            }
        }

        private void Form11_Load(object sender, EventArgs e)
        {
            BienToanCuc.Username = "ADMIN1";
            BienToanCuc.Password = "admin1";
        }

        //Cấp role cho user
        private void button9_Click(object sender, EventArgs e)
        {
            if (textBox10.Text == "" || textBox11.Text == "")
            {
                MessageBox.Show("Please fill all fields");
                return;
            }
            //connect
            OracleConnection conn = BienToanCuc.GetConnect(BienToanCuc.Username, BienToanCuc.Password);
            try
            {
                OracleCommand cmd = new OracleCommand("sp_GrantPriRole", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.BindByName = true;
                cmd.Parameters.Add("user_pri", OracleDbType.Varchar2).Value = textBox10.Text;
                cmd.Parameters.Add("user_name", OracleDbType.Varchar2).Value = textBox11.Text;
                cmd.Parameters.Add("user_wgo", OracleDbType.Decimal).Value = 0;
                conn.Open();
                int data = cmd.ExecuteNonQuery();
                MessageBox.Show("Grant is successful");
                conn.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show("## ERROR: " + ex.Message);
                return;
            }
        }

        //Cấp quyền cho user/role
        private void button6_Click(object sender, EventArgs e)
        {
            if (textBox3.Text == "" || textBox6.Text == "")
            {
                MessageBox.Show("Please enter 'Tên quyền' and 'Tên user/role'");
                return;
            }
            //connect
            OracleConnection conn = BienToanCuc.GetConnect(BienToanCuc.Username, BienToanCuc.Password);
            try
            {
                OracleCommand cmd = new OracleCommand("sp_GrantPri", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.BindByName = true;
                cmd.Parameters.Add("user_pri", OracleDbType.Varchar2).Value = textBox3.Text;
                cmd.Parameters.Add("user_col", OracleDbType.Varchar2).Value = textBox4.Text;
                cmd.Parameters.Add("user_obj", OracleDbType.Varchar2).Value = textBox5.Text;
                cmd.Parameters.Add("user_name", OracleDbType.Varchar2).Value = textBox6.Text;
                conn.Open();
                int data = cmd.ExecuteNonQuery();
                MessageBox.Show("Grant is successful");
                conn.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show("## ERROR: " + ex.Message);
                return;
            }
        }

        //Thu hồi quyền
        private void button7_Click(object sender, EventArgs e)
        {
            if (textBox8.Text == "" || textBox9.Text == "")
            {
                MessageBox.Show("Please enter 'Tên quyền' and 'Tên user/role'");
                return;
            }
            //connect
            OracleConnection conn = BienToanCuc.GetConnect(BienToanCuc.Username, BienToanCuc.Password);
            try
            {
                OracleCommand cmd = new OracleCommand("sp_RevokePri", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.BindByName = true;
                cmd.Parameters.Add("user_pri", OracleDbType.Varchar2).Value = textBox8.Text;
                cmd.Parameters.Add("user_obj", OracleDbType.Varchar2).Value = textBox7.Text;
                cmd.Parameters.Add("user_name", OracleDbType.Varchar2).Value = textBox9.Text;
                conn.Open();
                int data = cmd.ExecuteNonQuery();
                MessageBox.Show("REVOKE is successful");
                conn.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show("## ERROR: " + ex.Message);
                return;
            }
        }
        //thông tin về quyền
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
