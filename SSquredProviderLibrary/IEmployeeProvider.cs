using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SSquredDataProvider
{
    public interface IEmployeeProvider
    {
        Task<List<Employee>> GetAllEmployees();

        Task<List<Employee>> GetAllEmployeesByManagerId(long managerId);

        Task<bool> AddEmployee(EmployeeRoles employeeRoles);

        Task<List<Role>> GetAllRoles();

    }
}
