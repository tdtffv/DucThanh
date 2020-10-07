using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ATBM_CK
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        //Danh sách đối tượng
        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form4 DSDT = new Form4();
            DSDT.ShowDialog();
            this.Show();
        }

        //Thông tin về quyền
        private void button3_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form3 DSDT = new Form3();
            DSDT.ShowDialog();
            this.Show();
        }

        //Hiệu chỉnh quyền
        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form6 DSDT = new Form6();
            DSDT.ShowDialog();
            this.Show();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form11 DSDT = new Form11();
            DSDT.ShowDialog();
            this.Show();
        }

        //Đăng xuất
        private void button5_Click(object sender, EventArgs e)
        {
            BienToanCuc.Username = BienToanCuc.Password="";
            this.Dispose();
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }
    }
}
