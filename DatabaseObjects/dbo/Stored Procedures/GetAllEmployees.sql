-- =============================================
-- Author:		MD Awal
-- Create date: 11/05/2023
-- Description:	Retrieves all employees
-- =============================================
CREATE PROCEDURE [dbo].[GetAllEmployees] 	
 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
   
	SELECT [EmployeeId]
      ,[FirstName]
      ,[LastName]
      ,[ManagerId]
    FROM [EmployeeDB].[dbo].[Employee]	

END