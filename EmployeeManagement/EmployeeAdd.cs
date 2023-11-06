using SSquredDataProvider;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace EmployeeManagement
{
    public partial class EmployeeAdd : Form
    {
        private readonly IEmployeeProvider _EmployeeProvider;
        public EmployeeAdd(IEmployeeProvider employeeProvider)
        {
            InitializeComponent();
            _EmployeeProvider = employeeProvider;
        }

        private async void EmployeeAdd_Load(object sender, EventArgs e)
        {
            var result = await _EmployeeProvider.GetAllEmployees();

            BindManagerList(result);

            var roles = await _EmployeeProvider.GetAllRoles();

            BindRoles(roles);
        }

        private void BindManagerList(List<Employee> result)
        {
            //Bind manager list           
            comboBoxManager.DisplayMember = "FullName";
            comboBoxManager.ValueMember = "EmployeeId";
            comboBoxManager.SelectedIndex = -1;
            comboBoxManager.DataSource = result;
        }

        private void BindRoles(List<Role> result)
        {

            //listBoxRoles.DisplayMember = "Name";

            //Bind manager list           
            listBoxRoles.DisplayMember = "Name";
            listBoxRoles.ValueMember = "Id";
            //comboBoxManager.SelectedIndex = -1;
            listBoxRoles.DataSource = result;
        }

        private async void buttonSave_Click(object sender, EventArgs e)
        {
            var managerId = long.Parse( comboBoxManager.SelectedValue.ToString());
            var employee = new Employee
            {
                FirstName = textBoxFirstName.Text,
                LastName = textBoxLastName.Text,
                ManagerId = managerId
            };

            var roles = new List<Role>();

            foreach(var row in listBoxRoles.SelectedItems)
            {               
                var item = row as Role;
                if (item != null)
                {                 
                    roles.Add(item);
                }
            }

            var employeeRoles = new EmployeeRoles
            {
                Employee = employee,
                Roles = roles
            };

            var result = await _EmployeeProvider.AddEmployee(employeeRoles);

            this.Close();

        }

        private void buttonCancel_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
