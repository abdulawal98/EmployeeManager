-- =============================================
-- Author:		MD Awal
-- Create date: 11/05/2023
-- Description:	Retrieves all employee
-- =============================================
CREATE PROCEDURE [dbo].[GetAllEmployeesByManagerId] 	
 @ManagerId bigint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
   
	SELECT TOP (1000) [EmployeeId]
      ,[FirstName]
      ,[LastName]
      ,[ManagerId]
    FROM [EmployeeDB].[dbo].[Employee]
	WHERE ManagerId = @ManagerId

END