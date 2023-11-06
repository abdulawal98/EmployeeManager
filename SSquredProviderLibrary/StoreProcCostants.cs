using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SSquredDataProvider
{
    public class StoreProcCostants
    {
        public const string SP_GETALL_EMPLOYEES = "dbo.GetAllEmployees";

        public const string SP_GETALL_EMPLOYEE_BY_MANAGER_ID = "dbo.GetAllEmployeesByManagerId";

        public const string SP_GETALL_ROLES = "dbo.GetAllRoles";

        public const string SP_ADD_EMPLOYEE_ROLES = "dbo.AddEmployee";
    }
}
