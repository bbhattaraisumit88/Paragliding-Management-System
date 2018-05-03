/****** Object:  StoredProcedure [dbo].[Booking_GetAllByStaffID]    Script Date: 5/3/2018 4:10:48 PM ******/
DROP PROCEDURE [dbo].[Booking_GetAllByStaffID]
GO
/****** Object:  StoredProcedure [dbo].[Booking_GetAll]    Script Date: 5/3/2018 4:10:48 PM ******/
DROP PROCEDURE [dbo].[Booking_GetAll]
GO
/****** Object:  StoredProcedure [dbo].[Booking_CheckAvailability]    Script Date: 5/3/2018 4:10:48 PM ******/
DROP PROCEDURE [dbo].[Booking_CheckAvailability]
GO
/****** Object:  StoredProcedure [dbo].[Booking_Cancel]    Script Date: 5/3/2018 4:10:48 PM ******/
DROP PROCEDURE [dbo].[Booking_Cancel]
GO
/****** Object:  StoredProcedure [dbo].[Booking_AddUpdate]    Script Date: 5/3/2018 4:10:48 PM ******/
DROP PROCEDURE [dbo].[Booking_AddUpdate]
GO
ALTER TABLE [dbo].[Booking] DROP CONSTRAINT [df_DefCanc]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 5/3/2018 4:10:48 PM ******/
DROP TABLE [dbo].[Users]
GO
/****** Object:  Table [dbo].[Staffs]    Script Date: 5/3/2018 4:10:48 PM ******/
DROP TABLE [dbo].[Staffs]
GO
/****** Object:  Table [dbo].[BookingPilotMapping]    Script Date: 5/3/2018 4:10:48 PM ******/
DROP TABLE [dbo].[BookingPilotMapping]
GO
/****** Object:  Table [dbo].[Booking]    Script Date: 5/3/2018 4:10:48 PM ******/
DROP TABLE [dbo].[Booking]
GO
/****** Object:  Table [dbo].[Booking]    Script Date: 5/3/2018 4:10:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Booking](
	[BookID] [int] IDENTITY(1,1) NOT NULL,
	[BookedOn] [datetime] NOT NULL,
	[BookedFor] [datetime] NOT NULL,
	[IsCanceled] [bit] NOT NULL,
	[CanceledOn] [datetime] NULL,
	[BookedBy] [int] NOT NULL,
 CONSTRAINT [PK_Booking] PRIMARY KEY CLUSTERED 
(
	[BookID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)

GO
/****** Object:  Table [dbo].[BookingPilotMapping]    Script Date: 5/3/2018 4:10:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookingPilotMapping](
	[BookPilotMappingID] [int] IDENTITY(1,1) NOT NULL,
	[BookID] [int] NOT NULL,
	[StaffID] [int] NOT NULL,
 CONSTRAINT [PK_BookingPilotMapping] PRIMARY KEY CLUSTERED 
(
	[BookPilotMappingID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)

GO
/****** Object:  Table [dbo].[Staffs]    Script Date: 5/3/2018 4:10:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staffs](
	[StaffID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
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
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)

GO
/****** Object:  Table [dbo].[Users]    Script Date: 5/3/2018 4:10:49 PM ******/
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
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)

GO
SET IDENTITY_INSERT [dbo].[Booking] ON 

INSERT [dbo].[Booking] ([BookID], [BookedOn], [BookedFor], [IsCanceled], [CanceledOn], [BookedBy]) VALUES (1, CAST(N'2018-05-01 16:13:05.857' AS DateTime), CAST(N'2018-05-05 00:00:00.000' AS DateTime), 0, CAST(N'2018-05-01 16:15:58.330' AS DateTime), 2)
INSERT [dbo].[Booking] ([BookID], [BookedOn], [BookedFor], [IsCanceled], [CanceledOn], [BookedBy]) VALUES (2, CAST(N'2018-05-01 16:13:05.857' AS DateTime), CAST(N'2018-05-05 00:00:00.000' AS DateTime), 0, NULL, 2)
INSERT [dbo].[Booking] ([BookID], [BookedOn], [BookedFor], [IsCanceled], [CanceledOn], [BookedBy]) VALUES (3, CAST(N'2018-05-01 16:13:05.857' AS DateTime), CAST(N'2018-05-05 00:00:00.000' AS DateTime), 0, NULL, 2)
INSERT [dbo].[Booking] ([BookID], [BookedOn], [BookedFor], [IsCanceled], [CanceledOn], [BookedBy]) VALUES (4, CAST(N'2018-05-01 16:13:05.857' AS DateTime), CAST(N'2018-05-05 00:00:00.000' AS DateTime), 0, NULL, 2)
SET IDENTITY_INSERT [dbo].[Booking] OFF
SET IDENTITY_INSERT [dbo].[BookingPilotMapping] ON 

INSERT [dbo].[BookingPilotMapping] ([BookPilotMappingID], [BookID], [StaffID]) VALUES (1, 1, 1)
INSERT [dbo].[BookingPilotMapping] ([BookPilotMappingID], [BookID], [StaffID]) VALUES (2, 1, 1)
INSERT [dbo].[BookingPilotMapping] ([BookPilotMappingID], [BookID], [StaffID]) VALUES (3, 1, 1)
INSERT [dbo].[BookingPilotMapping] ([BookPilotMappingID], [BookID], [StaffID]) VALUES (4, 1, 1)
SET IDENTITY_INSERT [dbo].[BookingPilotMapping] OFF
SET IDENTITY_INSERT [dbo].[Staffs] ON 

INSERT [dbo].[Staffs] ([StaffID], [UserID], [FirstName], [LastName], [Address], [Phone], [Email], [Designation], [HireDate], [IsDeleted], [DeletedOn], [Photo]) VALUES (1, 1, N'Karan', N'Shahi', N'Pokhara', N'9234', N'kiran.shahi@gmail.com', N'Pilot', CAST(N'2018-04-07 22:05:46.427' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Staffs] ([StaffID], [UserID], [FirstName], [LastName], [Address], [Phone], [Email], [Designation], [HireDate], [IsDeleted], [DeletedOn], [Photo]) VALUES (2, 2, N'Diran', N'Shahi', N'Pokhara', N'9234', N'kiran.shahi@gmail.com', N'Pilot', CAST(N'2018-04-07 22:11:04.810' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Staffs] ([StaffID], [UserID], [FirstName], [LastName], [Address], [Phone], [Email], [Designation], [HireDate], [IsDeleted], [DeletedOn], [Photo]) VALUES (3, 3, N'Kiran', N'Shahi', N'Pokhara', N'9234', N'kiran.shahi@gmail.com', N'Operation', CAST(N'2018-04-07 22:13:54.383' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Staffs] ([StaffID], [UserID], [FirstName], [LastName], [Address], [Phone], [Email], [Designation], [HireDate], [IsDeleted], [DeletedOn], [Photo]) VALUES (4, 4, N'Kiran', N'Shahi', N'Pokhara', N'9234', N'kiran.shahi@gmail.com', N'Operation', CAST(N'2018-04-07 22:25:34.330' AS DateTime), NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Staffs] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [Email], [Password], [Phone], [RoleType], [RegisteredDate], [IsDeleted], [DeletedOn]) VALUES (1, N'Supreuser', N'Superuser', N'superuser', N'superuser', N'superuer', 1, CAST(N'2018-04-05 22:19:54.913' AS DateTime), 0, NULL)
INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [Email], [Password], [Phone], [RoleType], [RegisteredDate], [IsDeleted], [DeletedOn]) VALUES (2, N'Kiran', N'Shahi', N'kiran.shahi.c3@gmail.com', N'kiran', N'44235', 3, CAST(N'2018-04-07 11:18:09.203' AS DateTime), 0, NULL)
INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [Email], [Password], [Phone], [RoleType], [RegisteredDate], [IsDeleted], [DeletedOn]) VALUES (3, N'test', N'test', N'test@gmail.com', N'test', N'98989', 3, CAST(N'2018-04-07 11:22:29.027' AS DateTime), 0, NULL)
INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [Email], [Password], [Phone], [RoleType], [RegisteredDate], [IsDeleted], [DeletedOn]) VALUES (4, N'test1', N'test1', N'test1@outlook.com', N'test1', N'test1', 3, CAST(N'2018-04-07 11:23:28.900' AS DateTime), 0, NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
ALTER TABLE [dbo].[Booking] ADD  CONSTRAINT [df_DefCanc]  DEFAULT ((0)) FOR [IsCanceled]
GO
/****** Object:  StoredProcedure [dbo].[Booking_AddUpdate]    Script Date: 5/3/2018 4:10:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Booking_AddUpdate](
@BookID INT,
@BookedFor DATE,
@BookedBy INT,
@StaffID INT,
@status INT OUT
)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @BookIDs INT, @BookStatus INT;
	IF @BookID = 0
	BEGIN
	BEGIN TRANSACTION
BEGIN TRY
SELECT @BookStatus = COUNT(StaffID) FROM [Booking] AS BK INNER JOIN [BookingPilotMapping] BPM ON BK.BookID = BPM.BookID WHERE BK.BookedFor = @BookedFor AND StaffID = @StaffID;
   IF @BookStatus = 0
   BEGIN
   INSERT INTO [dbo].[Booking]([BookedOn], [BookedFor], [BookedBy]) VALUES(GETDATE(), @BookedFor, @BookedBy);
   SELECT @BookIDs = SCOPE_IDENTITY();
   INSERT INTO [dbo].[BookingPilotMapping]([BookID], [StaffID]) VALUES(@BookIDs, @StaffID)
   SET @status = 0;
   END
   ELSE
   BEGIN
   SET @status = 1;
   END
 COMMIT TRANSACTION;
END TRY
BEGIN CATCH
   ROLLBACK TRANSACTION;
END CATCH;
	END
	ELSE
	BEGIN
	BEGIN TRANSACTION
	BEGIN TRY
	UPDATE [dbo].[Booking] SET [BookedOn] = GETDATE(), [BookedFor] = @BookedFor, [BookedBy] = @BookedBy;
    UPDATE [dbo].[BookingPilotMapping] SET [BookID] = @BookID, [StaffID] = @StaffID;
	SET @status = 2;
 COMMIT TRANSACTION;
END TRY
BEGIN CATCH
        ROLLBACK TRANSACTION;
END CATCH;	
	END
	END;    

GO
/****** Object:  StoredProcedure [dbo].[Booking_Cancel]    Script Date: 5/3/2018 4:10:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Booking_Cancel] (
@BookID INT
)
AS
BEGIN
	SET NOCOUNT ON;
	UPDATE [Booking] SET IsCanceled = 1, CanceledOn = GETDATE() WHERE BookID = @BookID;
END

GO
/****** Object:  StoredProcedure [dbo].[Booking_CheckAvailability]    Script Date: 5/3/2018 4:10:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Booking_CheckAvailability]
@BookedFor DATE,
@StaffID INT,
@status INT OUT
AS
BEGIN
Declare @BookStatus INT;
SELECT @BookStatus = COUNT(StaffID) FROM [Booking] AS BK INNER JOIN [BookingPilotMapping] BPM ON BK.BookID = BPM.BookID WHERE BK.BookedFor = @BookedFor AND StaffID = @StaffID;
IF @BookStatus = 0
BEGIN 
SET @status = 0;
END
ELSE
BEGIN
SET @status = 1;
END
END

GO
/****** Object:  StoredProcedure [dbo].[Booking_GetAll]    Script Date: 5/3/2018 4:10:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Booking_GetAll]	
AS
BEGIN
	SET NOCOUNT ON;
	SELECT St.UserID, BPM.StaffID, BPM.BookID, St.FirStName, St.LaStName, St.Email, Bk.BookedOn, Bk.BookedFor, Bk.IsCanceled, Bk.CanceledOn, Bk.BookedBy                   
FROM Staffs St INNER JOIN
BookingPilotMapping BPM ON St.StaffID = BPM.StaffID INNER JOIN
Booking Bk ON BPM.BookID = Bk.BookID WHERE Bk.IsCanceled = 0;
END

GO
/****** Object:  StoredProcedure [dbo].[Booking_GetAllByStaffID]    Script Date: 5/3/2018 4:10:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Booking_GetAllByStaffID]
(
@StaffID INT
)
AS
BEGIN
	SET NOCOUNT ON;
SELECT St.UserID, BPM.StaffID, BPM.BookID, St.FirStName, St.LaStName, St.Email, Bk.BookedOn, Bk.BookedFor, Bk.IsCanceled, Bk.CanceledOn, Bk.BookedBy                   
FROM Staffs St INNER JOIN
BookingPilotMapping BPM ON St.StaffID = BPM.StaffID INNER JOIN
Booking Bk ON BPM.BookID = Bk.BookID WHERE Bk.IsCanceled = 0 AND St.StaffID = @StaffID;
END

GO
