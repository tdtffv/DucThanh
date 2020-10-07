using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using ATBM_CK;
using Oracle.ManagedDataAccess.Client;
using Oracle.ManagedDataAccess.EntityFramework;

namespace GDPhanHe2
{
    public partial class Form2 : Form
    {
        public Form2()
        {
            InitializeComponent();
        }
        
        //Đăng nhập
        private void button1_Click(object sender, EventArgs e)
        {
            //LOAD
            //MỞ KẾT NỐI
            OracleConnection conn = BienToanCuc.GetConnect(textBox1.Text,textBox2.Text);
            try
            {
                conn.Open();
                MessageBox.Show("Successful Connection");
                BienToanCuc.Username = textBox1.Text;
                BienToanCuc.Password = textBox2.Text;
                textBox1.Text = textBox2.Text = "";
                conn.Close();
                //load from trang chủ
                this.Hide();
                Form1 TranhChu = new Form1();
                TranhChu.ShowDialog();
                this.Show();
            }
            catch (Exception ex)
            {
                MessageBox.Show("## ERROR: " + ex.Message);
                return;
            }
        }

        private void Form2_Load(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Dispose();
        }
    }
}
