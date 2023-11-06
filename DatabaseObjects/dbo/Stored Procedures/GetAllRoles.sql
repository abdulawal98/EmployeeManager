-- =============================================
-- Author:		MD Awal
-- Create date: 11/05/2023
-- Description:	Retrieves all Roles
-- =============================================
CREATE PROCEDURE [dbo].[GetAllRoles] 	
 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
   
	     SELECT
			 [Id]
			,[Name]
		FROM [EmployeeDB].[dbo].[Role]

END