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
    public partial class Form9 : Form
    {
        public Form9()
        {
            InitializeComponent();
        }

        private void checkBox1_CheckedChanged(object sender, EventArgs e)
        {
            if(checkBox1.Checked==true)
            {
                checkBox2.Checked = false;
            }
        }

        private void checkBox2_CheckedChanged(object sender, EventArgs e)
        {
            if (checkBox2.Checked == true)
            {
                checkBox1.Checked = false;
            }
        }

        //tạo role
        private void button4_Click(object sender, EventArgs e)
        {
            if(checkBox1.Checked==false&&checkBox2.Checked==false)
            {
                MessageBox.Show("Please choose a form to create role");
                return;
            }
            //kiểm tra hình thức tạo
            if(checkBox1.Checked == true)//tạo role vs mật khẩu
            {
                if(textBox2.Text=="")
                {
                    MessageBox.Show("Please enter role_password");
                    return;
                }
                //connect
                OracleConnection conn = BienToanCuc.GetConnect(BienToanCuc.Username, BienToanCuc.Password);
                try
                {
                    OracleCommand cmd = new OracleCommand("sp_CreateRole_IDENTIFIED_user", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.BindByName = true;
                    cmd.Parameters.Add("role_name", OracleDbType.Varchar2).Value = textBox1.Text;
                    cmd.Parameters.Add("role_password", OracleDbType.Varchar2).Value = textBox2.Text;
                    conn.Open();
                    int data = cmd.ExecuteNonQuery();
                    MessageBox.Show("Successful role creation");
                    conn.Close();
                }
                catch (Exception ex)
                {
                    MessageBox.Show("## ERROR: " + ex.Message);
                    return;
                }
            }
            else//Tạo role ko cần mật khẩu
            {
                //connect
                OracleConnection conn = BienToanCuc.GetConnect(BienToanCuc.Username, BienToanCuc.Password);
                try
                {
                    OracleCommand cmd = new OracleCommand("sp_CreateRole_NOTIDENTIFIED_user", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.BindByName = true;
                    cmd.Parameters.Add("role_name", OracleDbType.Varchar2).Value = textBox1.Text;
                    conn.Open();
                    int data = cmd.ExecuteNonQuery();
                    MessageBox.Show("Successful role creation");
                    conn.Close();
                }
                catch (Exception ex)
                {
                    MessageBox.Show("## ERROR: " + ex.Message);
                    return;
                }
            }
        }

        private void button6_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form10 SuaRole = new Form10();
            SuaRole.ShowDialog();
            this.Dispose();
        }

        //Xoá role
        private void button1_Click(object sender, EventArgs e)
        {
            if(textBox1.Text=="")
            {
                MessageBox.Show("Please enter role_name");
                return;
            }
            //connect
            OracleConnection conn = BienToanCuc.GetConnect(BienToanCuc.Username, BienToanCuc.Password);
            try
            {
                OracleCommand cmd = new OracleCommand("sp_DropRole_user", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.BindByName = true;
                cmd.Parameters.Add("role_name", OracleDbType.Varchar2).Value = textBox1.Text;
                conn.Open();
                int data = cmd.ExecuteNonQuery();
                MessageBox.Show("Successfully deleted role");
                conn.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show("## ERROR: " + ex.Message);
                return;
            }
        }

        private void Form9_Load(object sender, EventArgs e)
        {
            BienToanCuc.Username = "ADMIN1";
            BienToanCuc.Password = "admin1";
        }
    }
}
