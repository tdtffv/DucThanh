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
    public partial class Form8 : Form
    {
        public Form8()
        {
            InitializeComponent();
        }
        
        //Sửa user
        private void button7_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form7 ThemXoaUser = new Form7();
            ThemXoaUser.ShowDialog();
            this.Dispose();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Dispose();
        }

        //Đổi mật khẩu
        private void button4_Click(object sender, EventArgs e)
        {
            if(textBox1.Text==""|| textBox2.Text == "")
            {
                MessageBox.Show("Please fill all fields");
                return;
            }
            //connect
            OracleConnection conn = BienToanCuc.GetConnect(BienToanCuc.Username, BienToanCuc.Password);
            try
            {
                OracleCommand cmd = new OracleCommand("sp_alterpass_user", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.BindByName = true;
                cmd.Parameters.Add("user_name", OracleDbType.Varchar2).Value = textBox1.Text;
                cmd.Parameters.Add("u_password", OracleDbType.Varchar2).Value = textBox2.Text;
                conn.Open();
                int data = cmd.ExecuteNonQuery();
                MessageBox.Show("Password changed successfully");
                conn.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show("## ERROR: " + ex.Message);
                return;
            }
        }
        //lock user
        private void button1_Click(object sender, EventArgs e)
        {
            if(textBox1.Text=="")
            {
                MessageBox.Show("Please enter user_name");
                return;
            }
            //connect
            OracleConnection conn = BienToanCuc.GetConnect(BienToanCuc.Username, BienToanCuc.Password);
            try
            {
                OracleCommand cmd = new OracleCommand("sp_alterlock_user", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.BindByName = true;
                cmd.Parameters.Add("user_name", OracleDbType.Varchar2).Value = textBox1.Text;
                conn.Open();
                int data = cmd.ExecuteNonQuery();
                MessageBox.Show("User is locked successfully");
                conn.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show("## ERROR: " + ex.Message);
                return;
            }
            
        }

        //unlock
        private void button5_Click(object sender, EventArgs e)
        {
            if (textBox1.Text == "")
            {
                MessageBox.Show("Please enter user_name");
                return;
            }
            //connect
            OracleConnection conn = BienToanCuc.GetConnect(BienToanCuc.Username, BienToanCuc.Password);
            try
            {
                OracleCommand cmd = new OracleCommand("sp_alterUnlock_user", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.BindByName = true;
                cmd.Parameters.Add("user_name", OracleDbType.Varchar2).Value = textBox1.Text;
                conn.Open();
                int data = cmd.ExecuteNonQuery();
                MessageBox.Show("User is unlocked successfully");
                conn.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show("## ERROR: " + ex.Message);
                return;
            }
        }

        private void Form8_Load(object sender, EventArgs e)
        {
        }
    }
}
