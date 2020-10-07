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
    public partial class Form10 : Form
    {
        public Form10()
        {
            InitializeComponent();
        }

        private void button6_Click(object sender, EventArgs e)
        {
            //ko lm gì
        }

        //Thêm role
        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form9 ThemXoaRole = new Form9();
            ThemXoaRole.ShowDialog();
            this.Dispose();
        }

        //Quay lại
        private void button3_Click(object sender, EventArgs e)
        {
            this.Dispose();
        }

        //Enable
        private void button5_Click(object sender, EventArgs e)
        {
            if (textBox1.Text == "")
            {
                MessageBox.Show("Please enter role_name");
                return;
            }
            //connect
            string sql = "SET ROLE " + textBox1.Text;
            OracleConnection conn = BienToanCuc.GetConnect(BienToanCuc.Username, BienToanCuc.Password);
            try
            {
                conn.Open();
                OracleCommand cmd = new OracleCommand(sql, conn);
                int data = cmd.ExecuteNonQuery();
                MessageBox.Show("Enable is successful");
                conn.Close();
            }
            catch (Exception)
            {
                MessageBox.Show("ERR");
                return;
            }
        }

        //Disable
        private void button1_Click(object sender, EventArgs e)
        {
            if (textBox1.Text == "")
            {
                MessageBox.Show("Please enter role_name");
                return;
            }
            //connect
            string sql = "SET ROLE " + textBox1.Text + " NONE";
            OracleConnection conn = BienToanCuc.GetConnect(BienToanCuc.Username, BienToanCuc.Password);
            try
            {
                conn.Open();
                OracleCommand cmd = new OracleCommand(sql, conn);
                int data = cmd.ExecuteNonQuery();
                MessageBox.Show("Disable is successful");
                conn.Close();
            }
            catch (Exception)
            {
                MessageBox.Show("ERR");
                return;
            }
        }

        private void Form10_Load(object sender, EventArgs e)
        {
            BienToanCuc.Username = "ADMIN1";
            BienToanCuc.Password = "admin1";
        }

        //Đổi mật khẩu
        private void button4_Click(object sender, EventArgs e)
        {
            if (textBox1.Text == "")
            {
                MessageBox.Show("Please enter role_name");
                return;
            }
            //connect
            string sql = "SET ROLE " + textBox1.Text + " IDENTIFIED BY "+textBox2.Text;
            OracleConnection conn = BienToanCuc.GetConnect(BienToanCuc.Username, BienToanCuc.Password);
            try
            {
                conn.Open();
                OracleCommand cmd = new OracleCommand(sql, conn);
                int data = cmd.ExecuteNonQuery();
                MessageBox.Show("Password changed successfully");
                conn.Close();
            }
            catch (Exception)
            {
                MessageBox.Show("ERR");
                return;
            }
        }

        private void checkBox1_CheckedChanged(object sender, EventArgs e)
        {
            if(checkBox1.Checked==true)
            {
                checkBox2.Checked = checkBox3.Checked = false;
            }
        }

        private void checkBox3_CheckedChanged(object sender, EventArgs e)
        {
            if (checkBox3.Checked == true)
            {
                checkBox2.Checked = checkBox1.Checked = false;
            }
        }

        private void checkBox2_CheckedChanged(object sender, EventArgs e)
        {
            if (checkBox2.Checked == true)
            {
                checkBox1.Checked = checkBox3.Checked = false;
            }
        }

        private void button7_Click(object sender, EventArgs e)
        {
            if (textBox3.Text == "")
            {
                MessageBox.Show("Please enter role_name");
                return;
            }
            string flag = "";
            if(checkBox1.Checked==false&& checkBox2.Checked == false&& checkBox3.Checked == false)
            {
                checkBox1.Checked = true;
                flag = "1";
            }
            else if(checkBox1.Checked == true)
            {
                flag = "1";
            }
            else if (checkBox3.Checked == true)
            {
                flag = "2";
            }
            else { flag = "3"; }
            //alter
            //connect
            OracleConnection conn = BienToanCuc.GetConnect(BienToanCuc.Username, BienToanCuc.Password);
            try
            {
                OracleCommand cmd = new OracleCommand("sp_AlterRole", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.BindByName = true;
                cmd.Parameters.Add("role_name", OracleDbType.Varchar2).Value = textBox1.Text;
                cmd.Parameters.Add("check_status", OracleDbType.Decimal).Value = flag;
                conn.Open();
                int data = cmd.ExecuteNonQuery();
                MessageBox.Show("Alter role successfully");
                conn.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show("## ERROR: " + ex.Message);
                return;
            }
        }

    }
}
