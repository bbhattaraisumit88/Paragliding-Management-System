USE [master]
GO
/****** Object:  Database [ParaglidingMS]    Script Date: 25/4/2018 11:26:18 AM ******/
CREATE DATABASE [ParaglidingMS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ParaglidingMS', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\ParaglidingMS.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ParaglidingMS_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\ParaglidingMS_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ParaglidingMS] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ParaglidingMS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ParaglidingMS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ParaglidingMS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ParaglidingMS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ParaglidingMS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ParaglidingMS] SET ARITHABORT OFF 
GO
ALTER DATABASE [ParaglidingMS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ParaglidingMS] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [ParaglidingMS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ParaglidingMS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ParaglidingMS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ParaglidingMS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ParaglidingMS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ParaglidingMS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ParaglidingMS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ParaglidingMS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ParaglidingMS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ParaglidingMS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ParaglidingMS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ParaglidingMS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ParaglidingMS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ParaglidingMS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ParaglidingMS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ParaglidingMS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ParaglidingMS] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ParaglidingMS] SET  MULTI_USER 
GO
ALTER DATABASE [ParaglidingMS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ParaglidingMS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ParaglidingMS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ParaglidingMS] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [ParaglidingMS]
GO
/****** Object:  StoredProcedure [dbo].[AddUpdateStaff]    Script Date: 25/4/2018 11:26:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[AddUpdateStaff]
	@staffID INT,
	@firstName NVARCHAR(255),
	@lastName NVARCHAR(255),
	@address NVARCHAR(255),
	@phone NVARCHAR(255),
	@email NVARCHAR(255),
	@designation NVARCHAR(255),
	@status INT OUT
AS
BEGIN
	SET NOCOUNT ON;
	IF @staffID = 0
		IF EXISTS (SELECT COUNT(UserId) FROM Users WHERE Email = @email)
			BEGIN
				--- SET status 0 when staff already exists ---
				SET @status = 0
			END
		ELSE
			BEGIN
				INSERT INTO Staffs (FirstName, LastName, Address, Phone, Email, Designation, HireDate) 
				VALUES (@firstName, @lastName, @address,  @phone, @email, @designation, GETDATE())
				--- SET status 1 when staff added successfully. ---
				SET @status = 1;
			END
	ELSE
		BEGIN
			UPDATE Staffs
			SET FirstName = @firstName, LastName = @lastName, Address = @address, Phone = @phone, Email = @email, Designation = @designation WHERE StaffID = @staffID;
			--- SET status 2 when staff updated successfully. ---
			SET @status = 2;
		END
END
GO
/****** Object:  StoredProcedure [dbo].[AddUpdateUser]    Script Date: 25/4/2018 11:26:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[AddUpdateUser]
	@userID INT,
	@firstName NVARCHAR(255),
	@lastName NVARCHAR(255),
	@email NVARCHAR(255),
	@password NVARCHAR(255),
	@phone NVARCHAR(255),
	@roleType INT,
	@status INT OUT
AS
BEGIN
	SET NOCOUNT ON;
	IF @userID = 0
		IF EXISTS (SELECT COUNT(UserId) FROM Users WHERE Email = @email)
			BEGIN
				--- SET status 0 when user already exists ---
				SET @status = 0
			END
		ELSE
			BEGIN
				INSERT INTO Users (FirstName, LastName, Email, Password, Phone, RegisteredDate, RoleType) 
				VALUES (@firstName, @lastName, @email, @password, @phone, GETDATE(), @roleType)
				--- SET status 1 when user added successfully. ---
				SET @status = 1;
			END
	ELSE
		BEGIN
			UPDATE Users 
			SET FirstName = @firstName, LastName = @lastName, Email = @email, Phone = @phone WHERE UserID = @userID;
			--- SET status 2 when user updated successfully. ---
			SET @status = 2;
		END
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteStaff]    Script Date: 25/4/2018 11:26:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteStaff]
@StaffID int
AS
BEGIN
	SET NOCOUNT ON;
	UPDATE Staffs SET IsDeleted = 1, DeletedOn = GETDATE() WHERE StaffID = @StaffID;
END

GO
/****** Object:  StoredProcedure [dbo].[DeleteUser]    Script Date: 25/4/2018 11:26:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteUser]
@UserID int
AS
BEGIN
	SET NOCOUNT ON;
	UPDATE Users SET IsDeleted = 1, DeletedOn = GETDATE() WHERE UserID = @UserID;
END

GO
/****** Object:  StoredProcedure [dbo].[GetAllStaffs]    Script Date: 25/4/2018 11:26:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
-- EXEC GetAllStaffs 
CREATE PROCEDURE [dbo].[GetAllStaffs]
AS
BEGIN
	SET NOCOUNT ON;
	SELECT * FROM Staffs;
END

GO
/****** Object:  StoredProcedure [dbo].[GetAllUsers]    Script Date: 25/4/2018 11:26:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAllUsers]
AS
BEGIN
	SET NOCOUNT ON;
	SELECT * FROM Users;
END

GO
/****** Object:  StoredProcedure [dbo].[GetStaffById]    Script Date: 25/4/2018 11:26:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetStaffById]
@staffId INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT * FROM Staffs WHERE StaffID = @staffId
END

GO
/****** Object:  StoredProcedure [dbo].[GetUserById]    Script Date: 25/4/2018 11:26:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetUserById]
@userId INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT * FROM Users WHERE UserID = @userId
END

GO
/****** Object:  StoredProcedure [dbo].[SearchPilot]    Script Date: 25/4/2018 11:26:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
-- EXEC SearchPilot 0
CREATE PROCEDURE [dbo].[SearchPilot]
@dateTime DATE,
@offSet INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT * FROM Staffs WHERE Designation = 'Pilot'
	ORDER BY StaffID
	OFFSET @offSet * 10 ROWS
	FETCH NEXT 10 ROWS ONLY;
END

GO
/****** Object:  StoredProcedure [dbo].[UserDetails]    Script Date: 25/4/2018 11:26:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
-- EXEC UserDetails 'test1@outlook.com'
CREATE PROCEDURE [dbo].[UserDetails]
	@email NVARCHAR(255)
AS
BEGIN
	SET NOCOUNT ON;
	SELECT * FROM Users WHERE Email = @email AND IsDeleted = 0;
END

GO
/****** Object:  StoredProcedure [dbo].[UserLogin]    Script Date: 25/4/2018 11:26:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UserLogin]
	@email NVARCHAR(255),
	@password NVARCHAR(255)
AS
BEGIN
	SET NOCOUNT ON;
	SELECT COUNT(UserID) FROM Users WHERE Email = @email AND Password = @password AND IsDeleted = 0;
END

GO
/****** Object:  Table [dbo].[Booking]    Script Date: 25/4/2018 11:26:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Booking](
	[BookID] [int] NOT NULL,
	[BookedOn] [datetime] NOT NULL,
	[BookedFor] [datetime] NOT NULL,
	[TimeSlot] [nvarchar](255) NOT NULL,
	[IsCanceled] [bit] NOT NULL,
	[CanceledOn] [datetime] NULL,
	[BookedBy] [int] NOT NULL,
	[NoOfFlight] [int] NOT NULL,
 CONSTRAINT [PK_Booking] PRIMARY KEY CLUSTERED 
(
	[BookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BookingPilotMapping]    Script Date: 25/4/2018 11:26:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookingPilotMapping](
	[BookPilotMappingID] [int] NOT NULL,
	[BookID] [int] NOT NULL,
	[PilotID] [int] NOT NULL,
	[AssignedBy] [int] NOT NULL,
 CONSTRAINT [PK_BookingPilotMapping] PRIMARY KEY CLUSTERED 
(
	[BookPilotMappingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PilotStatus]    Script Date: 25/4/2018 11:26:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PilotStatus](
	[PilotStatusID] [int] NOT NULL,
	[PilotID] [int] NOT NULL,
	[TimeSlotID] [int] NOT NULL,
	[BookID] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Staffs]    Script Date: 25/4/2018 11:26:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staffs](
	[StaffID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](255) NOT NULL,
	[LastName] [nvarchar](255) NOT NULL,
	[Address] [nvarchar](255) NOT NULL,
	[Phone] [nvarchar](255) NOT NULL,
	[Email] [nvarchar](255) NOT NULL,
	[Designation] [nvarchar](255) NOT NULL,
	[HireDate] [datetime] NOT NULL,
	[IsDeleted] [bit] NULL,
	[DeletedOn] [datetime] NULL,
	[Photo] [nvarchar](255) NULL,
 CONSTRAINT [PK_Staffs] PRIMARY KEY CLUSTERED 
(
	[StaffID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 25/4/2018 11:26:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](255) NOT NULL,
	[LastName] [nvarchar](255) NOT NULL,
	[Email] [nvarchar](255) NOT NULL,
	[Password] [nvarchar](255) NOT NULL,
	[Phone] [nvarchar](255) NOT NULL,
	[RoleType] [int] NOT NULL,
	[RegisteredDate] [datetime] NOT NULL,
	[IsDeleted] [bit] NULL,
	[DeletedOn] [datetime] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Staffs] ON 

INSERT [dbo].[Staffs] ([StaffID], [FirstName], [LastName], [Address], [Phone], [Email], [Designation], [HireDate], [IsDeleted], [DeletedOn], [Photo]) VALUES (1, N'Karan', N'Shahi', N'Pokhara', N'9234', N'kiran.shahi@gmail.com', N'Pilot', CAST(0x0000A8BB016C2278 AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Staffs] ([StaffID], [FirstName], [LastName], [Address], [Phone], [Email], [Designation], [HireDate], [IsDeleted], [DeletedOn], [Photo]) VALUES (2, N'Diran', N'Shahi', N'Pokhara', N'9234', N'kiran.shahi@gmail.com', N'Pilot', CAST(0x0000A8BB016D9793 AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Staffs] ([StaffID], [FirstName], [LastName], [Address], [Phone], [Email], [Designation], [HireDate], [IsDeleted], [DeletedOn], [Photo]) VALUES (3, N'Kiran', N'Shahi', N'Pokhara', N'9234', N'kiran.shahi@gmail.com', N'Operation', CAST(0x0000A8BB016E5E4B AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Staffs] ([StaffID], [FirstName], [LastName], [Address], [Phone], [Email], [Designation], [HireDate], [IsDeleted], [DeletedOn], [Photo]) VALUES (4, N'Kiran', N'Shahi', N'Pokhara', N'9234', N'kiran.shahi@gmail.com', N'Operation', CAST(0x0000A8BB0171928B AS DateTime), NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Staffs] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [Email], [Password], [Phone], [RoleType], [RegisteredDate], [IsDeleted], [DeletedOn]) VALUES (1, N'Supreuser', N'Superuser', N'superuser', N'superuser', N'superuer', 1, CAST(0x0000A8B9017004CA AS DateTime), 0, NULL)
INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [Email], [Password], [Phone], [RoleType], [RegisteredDate], [IsDeleted], [DeletedOn]) VALUES (2, N'Kiran', N'Shahi', N'kiran.shahi.c3@gmail.com', N'kiran', N'44235', 3, CAST(0x0000A8BB00BA42A9 AS DateTime), 0, NULL)
INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [Email], [Password], [Phone], [RoleType], [RegisteredDate], [IsDeleted], [DeletedOn]) VALUES (3, N'test', N'test', N'test@gmail.com', N'test', N'98989', 3, CAST(0x0000A8BB00BB7324 AS DateTime), 0, NULL)
INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [Email], [Password], [Phone], [RoleType], [RegisteredDate], [IsDeleted], [DeletedOn]) VALUES (4, N'test1', N'test1', N'test1@outlook.com', N'test1', N'test1', 3, CAST(0x0000A8BB00BBB94E AS DateTime), 0, NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
USE [master]
GO
ALTER DATABASE [ParaglidingMS] SET  READ_WRITE 
GO
