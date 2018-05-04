/****** Object:  StoredProcedure [dbo].[Booking_GetAllByStaffID]    Script Date: 5/4/2018 5:55:26 PM ******/
DROP PROCEDURE [dbo].[Booking_GetAllByStaffID]
GO
/****** Object:  StoredProcedure [dbo].[Booking_GetAll]    Script Date: 5/4/2018 5:55:26 PM ******/
DROP PROCEDURE [dbo].[Booking_GetAll]
GO
/****** Object:  StoredProcedure [dbo].[Booking_CheckAvailability]    Script Date: 5/4/2018 5:55:26 PM ******/
DROP PROCEDURE [dbo].[Booking_CheckAvailability]
GO
/****** Object:  StoredProcedure [dbo].[Booking_Cancel]    Script Date: 5/4/2018 5:55:26 PM ******/
DROP PROCEDURE [dbo].[Booking_Cancel]
GO
/****** Object:  StoredProcedure [dbo].[Booking_AddUpdate]    Script Date: 5/4/2018 5:55:26 PM ******/
DROP PROCEDURE [dbo].[Booking_AddUpdate]
GO
ALTER TABLE [dbo].[AspNetUserTokens] DROP CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserLogins] DROP CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserClaims] DROP CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetRoleClaims] DROP CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[Booking] DROP CONSTRAINT [df_DefCanc]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 5/4/2018 5:55:26 PM ******/
DROP TABLE [dbo].[Users]
GO
/****** Object:  Table [dbo].[Staffs]    Script Date: 5/4/2018 5:55:26 PM ******/
DROP TABLE [dbo].[Staffs]
GO
/****** Object:  Table [dbo].[BookingPilotMapping]    Script Date: 5/4/2018 5:55:26 PM ******/
DROP TABLE [dbo].[BookingPilotMapping]
GO
/****** Object:  Table [dbo].[Booking]    Script Date: 5/4/2018 5:55:26 PM ******/
DROP TABLE [dbo].[Booking]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 5/4/2018 5:55:26 PM ******/
DROP TABLE [dbo].[AspNetUserTokens]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 5/4/2018 5:55:26 PM ******/
DROP TABLE [dbo].[AspNetUsers]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 5/4/2018 5:55:26 PM ******/
DROP TABLE [dbo].[AspNetUserRoles]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 5/4/2018 5:55:26 PM ******/
DROP TABLE [dbo].[AspNetUserLogins]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 5/4/2018 5:55:26 PM ******/
DROP TABLE [dbo].[AspNetUserClaims]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 5/4/2018 5:55:26 PM ******/
DROP TABLE [dbo].[AspNetRoles]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 5/4/2018 5:55:26 PM ******/
DROP TABLE [dbo].[AspNetRoleClaims]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 5/4/2018 5:55:26 PM ******/
DROP TABLE [dbo].[__EFMigrationsHistory]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 5/4/2018 5:55:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)

GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 5/4/2018 5:55:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)

GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 5/4/2018 5:55:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 5/4/2018 5:55:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)

GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 5/4/2018 5:55:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)

GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 5/4/2018 5:55:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)

GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 5/4/2018 5:55:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[DeletedOn] [datetime2](7) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[FirstName] [nvarchar](max) NULL,
	[IsDeleted] [bit] NOT NULL,
	[LastName] [nvarchar](max) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[RegisteredDate] [datetime2](7) NOT NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[UserName] [nvarchar](256) NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)

GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 5/4/2018 5:55:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)

GO
/****** Object:  Table [dbo].[Booking]    Script Date: 5/4/2018 5:55:26 PM ******/
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
/****** Object:  Table [dbo].[BookingPilotMapping]    Script Date: 5/4/2018 5:55:26 PM ******/
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
/****** Object:  Table [dbo].[Staffs]    Script Date: 5/4/2018 5:55:26 PM ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 5/4/2018 5:55:26 PM ******/
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
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20180504105950_InitialUser', N'2.0.2-rtm-10011')
INSERT [dbo].[AspNetRoles] ([Id], [ConcurrencyStamp], [Name], [NormalizedName]) VALUES (N'1678a681-deaa-40c1-9503-6e66db764627', N'50f07df6-34b7-4711-ab93-ee028288d6ed', N'Client', N'CLIENT')
INSERT [dbo].[AspNetRoles] ([Id], [ConcurrencyStamp], [Name], [NormalizedName]) VALUES (N'4bf436c6-ecc0-426a-9b3a-10d3abd3b9d9', N'0b614292-e7c6-4503-9f74-91b020295fc9', N'Staff', N'STAFF')
INSERT [dbo].[AspNetRoles] ([Id], [ConcurrencyStamp], [Name], [NormalizedName]) VALUES (N'98af9590-4ab2-48ee-bf19-e86d95ba16b5', N'c6e68da0-a2a5-481d-b002-29d6f0ad1bd6', N'Superuser', N'SUPERUSER')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'6845ed3f-6b20-45ce-937c-0c53f34edfad', N'98af9590-4ab2-48ee-bf19-e86d95ba16b5')
INSERT [dbo].[AspNetUsers] ([Id], [AccessFailedCount], [ConcurrencyStamp], [DeletedOn], [Email], [EmailConfirmed], [FirstName], [IsDeleted], [LastName], [LockoutEnabled], [LockoutEnd], [NormalizedEmail], [NormalizedUserName], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [RegisteredDate], [SecurityStamp], [TwoFactorEnabled], [UserName]) VALUES (N'6845ed3f-6b20-45ce-937c-0c53f34edfad', 0, N'5134c944-b86d-4d87-8a61-88e6b89e18d9', CAST(N'0001-01-01 00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0, NULL, 1, NULL, NULL, N'SUPERUSER', N'AQAAAAEAACcQAAAAEKYIaCCWpic7MQ6ONkO8h7EPGo0Yr1ua7oLvoRHT8FiCVgsbr2k64vXiieB2Wdtb0A==', NULL, 0, CAST(N'0001-01-01 00:00:00.0000000' AS DateTime2), N'd33d249d-45d1-4dbe-82d5-c8149d0ae67a', 0, N'superuser')
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
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
/****** Object:  StoredProcedure [dbo].[Booking_AddUpdate]    Script Date: 5/4/2018 5:55:27 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Booking_Cancel]    Script Date: 5/4/2018 5:55:27 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Booking_CheckAvailability]    Script Date: 5/4/2018 5:55:27 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Booking_GetAll]    Script Date: 5/4/2018 5:55:27 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Booking_GetAllByStaffID]    Script Date: 5/4/2018 5:55:27 PM ******/
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
