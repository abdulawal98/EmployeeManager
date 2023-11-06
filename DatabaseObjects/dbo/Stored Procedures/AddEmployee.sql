-- =============================================
-- Author:		MD Awal
-- Create date: 11/05/2023
-- Description:	Add new employee
-- =============================================
CREATE PROCEDURE [dbo].[AddEmployee] 	
 @FirstName varchar(100),
 @LastName varchar(100),
 @ManagerId bigint,
 @RoleList RoleData READONLY,
 @AffectedRows int output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
   
    BEGIN TRANSACTION [Tran1]

	   DECLARE @EmployeeId bigint;
	   SET @AffectedRows = 0;

	   --------Insert into employee------------

	   BEGIN TRY

			INSERT INTO [dbo].[Employee]
				   ([FirstName]
				   ,[LastName]
				   ,[ManagerId])
			 VALUES
				   (@FirstName
				   ,@LastName
				   ,@ManagerId)

                SET @AffectedRows = @@ROWCOUNT;

			  SET @EmployeeId = SCOPE_IDENTITY()

			   --------Insert into employee role ------------

			  INSERT INTO [dbo].[Employee_Role]
		  
			  SELECT @EmployeeId, Id FROM @RoleList

			  SET @AffectedRows = @AffectedRows + @@ROWCOUNT;
			  COMMIT TRANSACTION [Tran1]

		  END TRY

	BEGIN CATCH

      ROLLBACK TRANSACTION [Tran1]

	END CATCH  


		 
	  

END