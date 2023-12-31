﻿
USE [master]
GO

ALTER DATABASE [EmployeeDB] SET COMPATIBILITY_LEVEL = 160
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EmployeeDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [EmployeeDB] SET ANSI_NULL_DEFAULT OFF
GO

ALTER DATABASE [EmployeeDB] SET ANSI_NULLS OFF
GO

ALTER DATABASE [EmployeeDB] SET ANSI_PADDING OFF
GO

ALTER DATABASE [EmployeeDB] SET ANSI_WARNINGS OFF
GO

ALTER DATABASE [EmployeeDB] SET ARITHABORT OFF
GO

ALTER DATABASE [EmployeeDB] SET AUTO_CLOSE OFF
GO

ALTER DATABASE [EmployeeDB] SET AUTO_SHRINK OFF
GO

ALTER DATABASE [EmployeeDB] SET AUTO_UPDATE_STATISTICS ON
GO

ALTER DATABASE [EmployeeDB] SET CURSOR_CLOSE_ON_COMMIT OFF
GO

ALTER DATABASE [EmployeeDB] SET CURSOR_DEFAULT  GLOBAL
GO

ALTER DATABASE [EmployeeDB] SET CONCAT_NULL_YIELDS_NULL OFF
GO

ALTER DATABASE [EmployeeDB] SET NUMERIC_ROUNDABORT OFF
GO

ALTER DATABASE [EmployeeDB] SET QUOTED_IDENTIFIER OFF
GO

ALTER DATABASE [EmployeeDB] SET RECURSIVE_TRIGGERS OFF
GO

ALTER DATABASE [EmployeeDB] SET  DISABLE_BROKER
GO

ALTER DATABASE [EmployeeDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO

ALTER DATABASE [EmployeeDB] SET DATE_CORRELATION_OPTIMIZATION OFF
GO

ALTER DATABASE [EmployeeDB] SET TRUSTWORTHY OFF
GO

ALTER DATABASE [EmployeeDB] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO

ALTER DATABASE [EmployeeDB] SET PARAMETERIZATION SIMPLE
GO

ALTER DATABASE [EmployeeDB] SET READ_COMMITTED_SNAPSHOT OFF
GO

ALTER DATABASE [EmployeeDB] SET HONOR_BROKER_PRIORITY OFF
GO

ALTER DATABASE [EmployeeDB] SET RECOVERY FULL
GO

ALTER DATABASE [EmployeeDB] SET  MULTI_USER
GO

ALTER DATABASE [EmployeeDB] SET PAGE_VERIFY CHECKSUM
GO

ALTER DATABASE [EmployeeDB] SET DB_CHAINING OFF
GO

ALTER DATABASE [EmployeeDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF )
GO

ALTER DATABASE [EmployeeDB] SET TARGET_RECOVERY_TIME = 60 SECONDS
GO

ALTER DATABASE [EmployeeDB] SET DELAYED_DURABILITY = DISABLED
GO

EXEC sys.sp_db_vardecimal_storage_format N'EmployeeDB', N'ON'
GO

ALTER DATABASE [EmployeeDB] SET QUERY_STORE = ON
GO

USE [EmployeeDB]
GO

/****** Object:  Table [dbo].[Employee]    Script Date: 11/6/2023 12:58:28 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[Employee_Role]    Script Date: 11/6/2023 12:58:28 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[Role]    Script Date: 11/6/2023 12:58:28 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[AddEmployee]    Script Date: 11/6/2023 12:58:28 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[GetAllEmployees]    Script Date: 11/6/2023 12:58:28 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[GetAllEmployeesByManagerId]    Script Date: 11/6/2023 12:58:28 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[GetAllRoles]    Script Date: 11/6/2023 12:58:28 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

USE [master]
GO

ALTER DATABASE [EmployeeDB] SET  READ_WRITE
GO

/****** Object:  Database [EmployeeDB]    Script Date: 11/6/2023 12:58:28 AM ******/
CREATE DATABASE [EmployeeDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EmployeeDataSystem', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\EmployeeDataSystem.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EmployeeDataSystem_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\EmployeeDataSystem_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF

GO

--Syntax Error: Expected DEFAULT_FULLTEXT_LANGUAGE but encountered CATALOG_COLLATION instead.
--/****** Object:  Database [EmployeeDB]    Script Date: 11/6/2023 12:58:28 AM ******/
--CREATE DATABASE [EmployeeDB]
-- CONTAINMENT = NONE
-- ON  PRIMARY 
--( NAME = N'EmployeeDataSystem', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\EmployeeDataSystem.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
-- LOG ON 
--( NAME = N'EmployeeDataSystem_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\EmployeeDataSystem_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
-- WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF

GO

ALTER DATABASE [EmployeeDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  

GO

--Syntax Error: Incorrect syntax near ACCELERATED_DATABASE_RECOVERY.
--ALTER DATABASE [EmployeeDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  

GO

ALTER DATABASE [EmployeeDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)

GO

--Syntax Error: Incorrect syntax near WAIT_STATS_CAPTURE_MODE.
--ALTER DATABASE [EmployeeDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)

GO

CREATE TABLE [dbo].[Employee](
	[EmployeeId] [bigint] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](100) NOT NULL,
	[LastName] [varchar](100) NOT NULL,
	[ManagerId] [bigint] NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO

--Syntax Error: Incorrect syntax near OPTIMIZE_FOR_SEQUENTIAL_KEY.
--CREATE TABLE [dbo].[Employee](
--	[EmployeeId] [bigint] IDENTITY(1,1) NOT NULL,
--	[FirstName] [varchar](100) NOT NULL,
--	[LastName] [varchar](100) NOT NULL,
--	[ManagerId] [bigint] NULL,
-- CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
--(
--	[EmployeeId] ASC
--)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
--) ON [PRIMARY]

GO

CREATE TABLE [dbo].[Role](
	[Id] [smallint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO

--Syntax Error: Incorrect syntax near OPTIMIZE_FOR_SEQUENTIAL_KEY.
--CREATE TABLE [dbo].[Role](
--	[Id] [smallint] IDENTITY(1,1) NOT NULL,
--	[Name] [varchar](100) NOT NULL,
-- CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
--(
--	[Id] ASC
--)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
--) ON [PRIMARY]



GO
