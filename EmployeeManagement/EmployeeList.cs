//using SSquredDataProvider;
using SSquredDataProvider;
using System;
using System.Windows.Forms;

namespace EmployeeManagement
{
    public partial class EmployeeList : Form
    {
        private readonly EmployeeAdd _AddEmployee;
        private readonly IEmployeeProvider _EmployeeProvider;

        public EmployeeList(IEmployeeProvider employeeProvider)
        {
            InitializeComponent();           
            _EmployeeProvider = employeeProvider;
            _AddEmployee = new EmployeeAdd(_EmployeeProvider);
        }

        private async void buttonAddEmployee_Click(object sender, EventArgs e)
        {          
            _AddEmployee.ShowDialog();           

            LoadEmployeeData();
        }

        private async void EmployeeList_LoadAsync(object sender, EventArgs e)
        {
            LoadEmployeeData();
        }

        private async void LoadEmployeeData()
        {
            var result = await _EmployeeProvider.GetAllEmployees();

            BindManagerList(result);

            BindEmployeeList(result);
        }

        private void BindManagerList(List<Employee> result)
        {
            //Bind manager list           
            comboBoxManager.DisplayMember = "FullName";
            comboBoxManager.ValueMember = "EmployeeId";
            comboBoxManager.SelectedIndex = -1;
            comboBoxManager.DataSource = result;
        }

        private void BindEmployeeList(List<Employee> result)
        {
            //Bind Employee grid
            dataGridViewEmployee.DataSource = result;
            dataGridViewEmployee.Columns.Clear();

            DataGridViewColumn IdCol = new DataGridViewTextBoxColumn();
            IdCol.HeaderText = "Employee ID";
            IdCol.DataPropertyName = "EmployeeId";
            dataGridViewEmployee.Columns.Add(IdCol);

            DataGridViewColumn lastNameCol = new DataGridViewTextBoxColumn();
            lastNameCol.HeaderText = "Last Name";
            lastNameCol.DataPropertyName = "LastName";
            dataGridViewEmployee.Columns.Add(lastNameCol);

            DataGridViewColumn firstNameCol = new DataGridViewTextBoxColumn();
            firstNameCol.HeaderText = "Last Name";
            firstNameCol.DataPropertyName = "FirstName";
            dataGridViewEmployee.Columns.Add(firstNameCol);
        }

        private async void comboBoxManager_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (comboBoxManager.SelectedValue != null)
            {
                var selectedManagerId = long.Parse(comboBoxManager.SelectedValue.ToString());
                long managerId = selectedManagerId;
                var provider = new EmployeeProvider();
                var result = await provider.GetAllEmployeesByManagerId(managerId);
                BindEmployeeList(result);
            }
        }
    }
}
