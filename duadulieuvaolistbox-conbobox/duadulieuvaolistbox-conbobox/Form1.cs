using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace duadulieuvaolistbox_conbobox
{
    public partial class Form1 : Form
    {
        string strConnectionString = "Data Source = DESKTOP-VUH1BB2; Initial Catalog = quanlideancongti; Integrated Security = True";
        SqlConnection conn = null;
        SqlDataAdapter dadiadiem = null;
        DataTable dtdiadiem = null;

        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            DialogResult rep;
            rep = MessageBox.Show("Are you sure?", "Warning", MessageBoxButtons.YesNo, MessageBoxIcon.Warning);
            if (rep == DialogResult.Yes)
                Application.Exit();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            try
            {
                conn=new SqlConnection(strConnectionString);
                dadiadiem=new SqlDataAdapter("select Diadiem.DIADIEM from Diadiem", conn);
                dtdiadiem=new DataTable();
                dtdiadiem.Clear();
                dadiadiem.Fill(dtdiadiem);
                this.comboBox1.DataSource = dtdiadiem;
                this.comboBox1.DisplayMember = "DIADIEM";
                this.comboBox1.ValueMember = "Diadiem";
            }
            catch (SqlException)
            {
                MessageBox.Show("Không tìm thấy dữ liệu trong bảng. Lỗi rồi!","Fail",MessageBoxButtons.OK, MessageBoxIcon.Error);
            }

        }

        private void Form1_FormClosing(object sender, FormClosingEventArgs e)
        {
            dtdiadiem.Dispose();
            dtdiadiem = null;
            conn = null;
        }
    }
}
