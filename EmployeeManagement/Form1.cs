using SSquredDataProvider;

namespace EmployeeManagement
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_LoadAsync(object sender, EventArgs e)
        {
            

        }

        private async void button1_Click(object sender, EventArgs e)
        {
            var provider = new EmployeeProvider();

            var result = await provider.GetAllEmployees();
        }
    }
}