using Dapper;

using System.Data;
using System.Data.SqlClient;

namespace SSquredDataProvider
{
    public class EmployeeProvider : IEmployeeProvider
    {
        private string _ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;

        public async Task<bool> AddEmployee(EmployeeRoles employeeRoles)
        {
            bool iSSuccess = false;

            try
            {
                using (var connection = new SqlConnection(_ConnectionString))
                {
                    var queryParameters = new DynamicParameters();
                    queryParameters.Add("@FirstName", employeeRoles.Employee.FirstName);
                    queryParameters.Add("@LastName", employeeRoles.Employee.LastName);
                    queryParameters.Add("@ManagerId", employeeRoles.Employee.ManagerId);
                    queryParameters.Add("@RoleList", CreateRoleTable(employeeRoles.Roles).AsTableValuedParameter());

                    queryParameters.Add("@AffectedRows", dbType: DbType.Int32, direction: ParameterDirection.Output);

                    var results = await connection
                        .QueryAsync(StoreProcCostants.SP_ADD_EMPLOYEE_ROLES,
                                                queryParameters,
                                                commandType: CommandType.StoredProcedure);

                    var affectedRows = queryParameters.Get<int>("@AffectedRows");

                    if (affectedRows > 0)
                    {
                        iSSuccess = true;
                    }


                }
            }
            catch (Exception)
            {
                iSSuccess = false;
            }

            return iSSuccess;
        }

        private DataTable CreateRoleTable(List<Role> Roles)
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("Id", typeof(Int32));
            dt.Columns.Add("Name", typeof(string));

            foreach(var role in Roles)
            {
                dt.Rows.Add(role.Id, role.Name);
            }

            return dt;
        }

        public async Task<List<Employee>> GetAllEmployees()
        {            
            using (var connection = new SqlConnection(_ConnectionString))
            {             

                var results = await connection
                    .QueryAsync<Employee>(StoreProcCostants.SP_GETALL_EMPLOYEES,
                                            commandType: CommandType.StoredProcedure);

                return (List<Employee>)results;
            }           
        }

        public async Task<List<Employee>> GetAllEmployeesByManagerId(long managerId)
        {
            using (var connection = new SqlConnection(_ConnectionString))
            {
                var queryParameters = new DynamicParameters();
                queryParameters.Add("@ManagerId", managerId);

                var results = await connection
                    .QueryAsync<Employee>(StoreProcCostants.SP_GETALL_EMPLOYEE_BY_MANAGER_ID,
                                            queryParameters,
                                            commandType: CommandType.StoredProcedure);

                return (List<Employee>)results;
            }
        }

        public async Task<List<Role>> GetAllRoles()
        {
            using (var connection = new SqlConnection(_ConnectionString))
            {

                var results = await connection
                    .QueryAsync<Role>(StoreProcCostants.SP_GETALL_ROLES,
                                            commandType: CommandType.StoredProcedure);

                return (List<Role>)results;
            }
        }
    }
}
