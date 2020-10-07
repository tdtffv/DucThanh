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
    public partial class Form6 : Form
    {
        public Form6()
        {
            InitializeComponent();
        }

        //Thêm/ xóa user
        private void button3_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form7 TaoUser = new Form7();
            TaoUser.ShowDialog();
            this.Show();
        }

        //Thêm/ xoá role
        private void button11_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form9 TaoRole = new Form9();
            TaoRole.ShowDialog();
            this.Show();
        }

        //sửa user
        private void button6_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form8 SuaUser = new Form8();
            SuaUser.ShowDialog();
            this.Show();
        }

        //sửa role
        private void button10_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form10 SuaRole = new Form10();
            SuaRole.ShowDialog();
            this.Show();
        }

        //Hiệu chỉnh quyền
        private void button7_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form11 HieuChinhQuyen = new Form11();
            HieuChinhQuyen.ShowDialog();
            this.Dispose();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form3 ThongTinQuyen = new Form3();
            ThongTinQuyen.ShowDialog();
            this.Dispose();
        }

        //Danh sách đối tượng
        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form3 ThongTinQuyen = new Form3();
            ThongTinQuyen.ShowDialog();
            this.Dispose();
        }
        
        //Về trang chủ
        private void button4_Click(object sender, EventArgs e)
        {
            this.Dispose();
        }
    }
}
