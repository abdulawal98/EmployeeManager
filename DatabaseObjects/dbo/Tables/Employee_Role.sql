CREATE TABLE [dbo].[Employee_Role](
	[EmployeeId] [bigint] NOT NULL,
	[RoleId] [smallint] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Employee_Role]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Role_Employee] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([EmployeeId])
GO

ALTER TABLE [dbo].[Employee_Role] CHECK CONSTRAINT [FK_Employee_Role_Employee]
GO
ALTER TABLE [dbo].[Employee_Role]  WITH CHECK ADD  CONSTRAINT [FK_Role_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
GO

ALTER TABLE [dbo].[Employee_Role] CHECK CONSTRAINT [FK_Role_RoleId]