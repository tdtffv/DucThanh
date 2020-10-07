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
    public partial class Form7 : Form
    {
        public Form7()
        {
            InitializeComponent();
        }

        //Tạo procedure tạo user

        //Tạo user
        private void button4_Click(object sender, EventArgs e)
        { 
            if(textBox1.Text==""||textBox2.Text=="")
            {
                MessageBox.Show("Please fill all fields");
                return;
            }
            //connect
            OracleConnection conn = BienToanCuc.GetConnect(BienToanCuc.Username, BienToanCuc.Password);
            try
            {
                OracleCommand cmd = new OracleCommand("ADMIN1.sp_create_user", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.BindByName = true;
                cmd.Parameters.Add("user_name", OracleDbType.Varchar2).Value = textBox1.Text;
                cmd.Parameters.Add("u_password", OracleDbType.Varchar2).Value = textBox2.Text;
                conn.Open();
                int data=cmd.ExecuteNonQuery();
                MessageBox.Show("Successful user creation");
                conn.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show("## ERROR: " + ex.Message);
                return;
            }
        }

        //Xoá user
        private void button1_Click(object sender, EventArgs e)
        {
            if (textBox1.Text == "")
            {
                MessageBox.Show("Please fill in Username");
                return;
            }
            //connect
            OracleConnection conn = BienToanCuc.GetConnect(BienToanCuc.Username, BienToanCuc.Password);
            try
            {
                OracleCommand cmd = new OracleCommand("ADMIN1.sp_drop_user", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.BindByName = true;
                cmd.Parameters.Add("user_name", OracleDbType.Varchar2).Value = textBox1.Text;
                conn.Open();
                int data = cmd.ExecuteNonQuery();
                MessageBox.Show("Delete user successfully");
                conn.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show("## ERROR: " + ex.Message);
                return;
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Dispose();
        }

        //Sửa user
        private void button6_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form8 SuaUser = new Form8();
            SuaUser.ShowDialog();
            this.Dispose();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            //không làm gì
        }
    }
}
