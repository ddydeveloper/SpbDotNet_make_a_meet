USE [master]
GO

-- MeetingsDB
CREATE DATABASE [Meetings]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Meetings', FILENAME = N'/var/opt/mssql/data/Meetings.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Meetings_log', FILENAME = N'/var/opt/mssql/data/Meetings_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Meetings] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Meetings].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Meetings] SET ANSI_NULL_DEFAULT ON 
GO
ALTER DATABASE [Meetings] SET ANSI_NULLS ON 
GO
ALTER DATABASE [Meetings] SET ANSI_PADDING ON 
GO
ALTER DATABASE [Meetings] SET ANSI_WARNINGS ON 
GO
ALTER DATABASE [Meetings] SET ARITHABORT ON 
GO
ALTER DATABASE [Meetings] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Meetings] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Meetings] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Meetings] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Meetings] SET CURSOR_DEFAULT  LOCAL 
GO
ALTER DATABASE [Meetings] SET CONCAT_NULL_YIELDS_NULL ON 
GO
ALTER DATABASE [Meetings] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Meetings] SET QUOTED_IDENTIFIER ON 
GO
ALTER DATABASE [Meetings] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Meetings] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Meetings] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Meetings] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Meetings] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Meetings] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Meetings] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Meetings] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Meetings] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Meetings] SET RECOVERY FULL 
GO
ALTER DATABASE [Meetings] SET  MULTI_USER 
GO
ALTER DATABASE [Meetings] SET PAGE_VERIFY NONE  
GO
ALTER DATABASE [Meetings] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Meetings] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Meetings] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Meetings] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Meetings', N'ON'
GO
ALTER DATABASE [Meetings] SET QUERY_STORE = OFF
GO

USE [Meetings]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Meetings](
	[Id] [int] IDENTITY(0,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[Created] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CompanyId] [int] NOT NULL,
	[StartDate] [datetime] NULL,
	[StartTimeMinutes] [smallint] NOT NULL,
	[DurationMinutes] [int] NOT NULL,
	[Days] [nvarchar](15) NULL,
	[Active] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Participants](
	[Id] [int] IDENTITY(0,1) NOT NULL,
	[MeetingId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[Created] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Meetings] ON 
GO
INSERT [dbo].[Meetings] ([Id], [Name], [Description], [Created], [CreatedBy], [CompanyId], [StartDate], [StartTimeMinutes], [DurationMinutes], [Days], [Active]) VALUES (0, N'Samsung customer meeting', NULL, CAST(N'2019-03-12T14:41:16.407' AS DateTime), 0, 0, CAST(N'2018-12-10T00:00:00.000' AS DateTime), 660, 60, NULL, 1)
GO
INSERT [dbo].[Meetings] ([Id], [Name], [Description], [Created], [CreatedBy], [CompanyId], [StartDate], [StartTimeMinutes], [DurationMinutes], [Days], [Active]) VALUES (1, N'Samsung customer meeting', NULL, CAST(N'2019-03-12T14:41:16.407' AS DateTime), 0, 0, CAST(N'2018-12-14T00:00:00.000' AS DateTime), 840, 45, NULL, 1)
GO
INSERT [dbo].[Meetings] ([Id], [Name], [Description], [Created], [CreatedBy], [CompanyId], [StartDate], [StartTimeMinutes], [DurationMinutes], [Days], [Active]) VALUES (2, N'Samsung customer meeting', NULL, CAST(N'2019-03-12T14:41:16.407' AS DateTime), 0, 0, CAST(N'2018-12-16T00:00:00.000' AS DateTime), 720, 60, NULL, 1)
GO
INSERT [dbo].[Meetings] ([Id], [Name], [Description], [Created], [CreatedBy], [CompanyId], [StartDate], [StartTimeMinutes], [DurationMinutes], [Days], [Active]) VALUES (3, N'Samsung customer meeting', NULL, CAST(N'2019-03-12T14:41:16.407' AS DateTime), 0, 0, CAST(N'2018-12-20T00:00:00.000' AS DateTime), 615, 45, NULL, 1)
GO
INSERT [dbo].[Meetings] ([Id], [Name], [Description], [Created], [CreatedBy], [CompanyId], [StartDate], [StartTimeMinutes], [DurationMinutes], [Days], [Active]) VALUES (4, N'Samsung team Daily SU', NULL, CAST(N'2019-03-12T14:41:16.407' AS DateTime), 0, 0, NULL, 585, 15, N'1,2,3,4,5', 1)
GO
INSERT [dbo].[Meetings] ([Id], [Name], [Description], [Created], [CreatedBy], [CompanyId], [StartDate], [StartTimeMinutes], [DurationMinutes], [Days], [Active]) VALUES (5, N'Xaomi customer meeting', NULL, CAST(N'2019-03-12T14:41:16.407' AS DateTime), 8, 1, CAST(N'2018-12-10T00:00:00.000' AS DateTime), 660, 60, NULL, 1)
GO
INSERT [dbo].[Meetings] ([Id], [Name], [Description], [Created], [CreatedBy], [CompanyId], [StartDate], [StartTimeMinutes], [DurationMinutes], [Days], [Active]) VALUES (6, N'Xaomi tech talks', NULL, CAST(N'2019-03-12T14:41:16.407' AS DateTime), 8, 1, CAST(N'2018-12-10T00:00:00.000' AS DateTime), 810, 30, NULL, 1)
GO
INSERT [dbo].[Meetings] ([Id], [Name], [Description], [Created], [CreatedBy], [CompanyId], [StartDate], [StartTimeMinutes], [DurationMinutes], [Days], [Active]) VALUES (7, N'Xaomi employee introduction', NULL, CAST(N'2019-03-12T14:41:16.407' AS DateTime), 8, 1, CAST(N'2018-12-11T00:00:00.000' AS DateTime), 960, 15, NULL, 1)
GO
INSERT [dbo].[Meetings] ([Id], [Name], [Description], [Created], [CreatedBy], [CompanyId], [StartDate], [StartTimeMinutes], [DurationMinutes], [Days], [Active]) VALUES (8, N'Xaomi customer demo', NULL, CAST(N'2019-03-12T14:41:16.407' AS DateTime), 8, 1, CAST(N'2018-12-12T00:00:00.000' AS DateTime), 1020, 30, NULL, 1)
GO
INSERT [dbo].[Meetings] ([Id], [Name], [Description], [Created], [CreatedBy], [CompanyId], [StartDate], [StartTimeMinutes], [DurationMinutes], [Days], [Active]) VALUES (9, N'Xaomi team Daily SU', NULL, CAST(N'2019-03-12T14:41:16.407' AS DateTime), 8, 1, NULL, 585, 15, N'1,2,3,4,5', 1)
GO
SET IDENTITY_INSERT [dbo].[Meetings] OFF
GO
SET IDENTITY_INSERT [dbo].[Participants] ON 
GO
INSERT [dbo].[Participants] ([Id], [MeetingId], [UserId], [Created]) VALUES (0, 0, 0, CAST(N'2019-03-12T14:41:16.413' AS DateTime))
GO
INSERT [dbo].[Participants] ([Id], [MeetingId], [UserId], [Created]) VALUES (1, 0, 1, CAST(N'2019-03-12T14:41:16.413' AS DateTime))
GO
INSERT [dbo].[Participants] ([Id], [MeetingId], [UserId], [Created]) VALUES (2, 0, 2, CAST(N'2019-03-12T14:41:16.413' AS DateTime))
GO
INSERT [dbo].[Participants] ([Id], [MeetingId], [UserId], [Created]) VALUES (3, 0, 3, CAST(N'2019-03-12T14:41:16.413' AS DateTime))
GO
INSERT [dbo].[Participants] ([Id], [MeetingId], [UserId], [Created]) VALUES (4, 0, 7, CAST(N'2019-03-12T14:41:16.413' AS DateTime))
GO
INSERT [dbo].[Participants] ([Id], [MeetingId], [UserId], [Created]) VALUES (5, 1, 0, CAST(N'2019-03-12T14:41:16.413' AS DateTime))
GO
INSERT [dbo].[Participants] ([Id], [MeetingId], [UserId], [Created]) VALUES (6, 1, 1, CAST(N'2019-03-12T14:41:16.413' AS DateTime))
GO
INSERT [dbo].[Participants] ([Id], [MeetingId], [UserId], [Created]) VALUES (7, 1, 2, CAST(N'2019-03-12T14:41:16.413' AS DateTime))
GO
INSERT [dbo].[Participants] ([Id], [MeetingId], [UserId], [Created]) VALUES (8, 1, 3, CAST(N'2019-03-12T14:41:16.413' AS DateTime))
GO
INSERT [dbo].[Participants] ([Id], [MeetingId], [UserId], [Created]) VALUES (9, 1, 7, CAST(N'2019-03-12T14:41:16.413' AS DateTime))
GO
INSERT [dbo].[Participants] ([Id], [MeetingId], [UserId], [Created]) VALUES (10, 2, 0, CAST(N'2019-03-12T14:41:16.413' AS DateTime))
GO
INSERT [dbo].[Participants] ([Id], [MeetingId], [UserId], [Created]) VALUES (11, 2, 1, CAST(N'2019-03-12T14:41:16.413' AS DateTime))
GO
INSERT [dbo].[Participants] ([Id], [MeetingId], [UserId], [Created]) VALUES (12, 2, 2, CAST(N'2019-03-12T14:41:16.413' AS DateTime))
GO
INSERT [dbo].[Participants] ([Id], [MeetingId], [UserId], [Created]) VALUES (13, 2, 3, CAST(N'2019-03-12T14:41:16.413' AS DateTime))
GO
INSERT [dbo].[Participants] ([Id], [MeetingId], [UserId], [Created]) VALUES (14, 2, 4, CAST(N'2019-03-12T14:41:16.413' AS DateTime))
GO
INSERT [dbo].[Participants] ([Id], [MeetingId], [UserId], [Created]) VALUES (15, 2, 5, CAST(N'2019-03-12T14:41:16.413' AS DateTime))
GO
INSERT [dbo].[Participants] ([Id], [MeetingId], [UserId], [Created]) VALUES (16, 2, 6, CAST(N'2019-03-12T14:41:16.413' AS DateTime))
GO
INSERT [dbo].[Participants] ([Id], [MeetingId], [UserId], [Created]) VALUES (17, 2, 7, CAST(N'2019-03-12T14:41:16.413' AS DateTime))
GO
INSERT [dbo].[Participants] ([Id], [MeetingId], [UserId], [Created]) VALUES (18, 3, 0, CAST(N'2019-03-12T14:41:16.413' AS DateTime))
GO
INSERT [dbo].[Participants] ([Id], [MeetingId], [UserId], [Created]) VALUES (19, 3, 1, CAST(N'2019-03-12T14:41:16.413' AS DateTime))
GO
INSERT [dbo].[Participants] ([Id], [MeetingId], [UserId], [Created]) VALUES (20, 3, 2, CAST(N'2019-03-12T14:41:16.413' AS DateTime))
GO
INSERT [dbo].[Participants] ([Id], [MeetingId], [UserId], [Created]) VALUES (21, 3, 3, CAST(N'2019-03-12T14:41:16.413' AS DateTime))
GO
INSERT [dbo].[Participants] ([Id], [MeetingId], [UserId], [Created]) VALUES (22, 3, 4, CAST(N'2019-03-12T14:41:16.413' AS DateTime))
GO
INSERT [dbo].[Participants] ([Id], [MeetingId], [UserId], [Created]) VALUES (23, 3, 5, CAST(N'2019-03-12T14:41:16.413' AS DateTime))
GO
INSERT [dbo].[Participants] ([Id], [MeetingId], [UserId], [Created]) VALUES (24, 3, 6, CAST(N'2019-03-12T14:41:16.413' AS DateTime))
GO
INSERT [dbo].[Participants] ([Id], [MeetingId], [UserId], [Created]) VALUES (25, 3, 7, CAST(N'2019-03-12T14:41:16.413' AS DateTime))
GO
INSERT [dbo].[Participants] ([Id], [MeetingId], [UserId], [Created]) VALUES (26, 4, 0, CAST(N'2019-03-12T14:41:16.413' AS DateTime))
GO
INSERT [dbo].[Participants] ([Id], [MeetingId], [UserId], [Created]) VALUES (27, 4, 1, CAST(N'2019-03-12T14:41:16.413' AS DateTime))
GO
INSERT [dbo].[Participants] ([Id], [MeetingId], [UserId], [Created]) VALUES (28, 4, 2, CAST(N'2019-03-12T14:41:16.413' AS DateTime))
GO
INSERT [dbo].[Participants] ([Id], [MeetingId], [UserId], [Created]) VALUES (29, 4, 3, CAST(N'2019-03-12T14:41:16.413' AS DateTime))
GO
INSERT [dbo].[Participants] ([Id], [MeetingId], [UserId], [Created]) VALUES (30, 4, 4, CAST(N'2019-03-12T14:41:16.413' AS DateTime))
GO
INSERT [dbo].[Participants] ([Id], [MeetingId], [UserId], [Created]) VALUES (31, 4, 5, CAST(N'2019-03-12T14:41:16.413' AS DateTime))
GO
INSERT [dbo].[Participants] ([Id], [MeetingId], [UserId], [Created]) VALUES (32, 4, 6, CAST(N'2019-03-12T14:41:16.413' AS DateTime))
GO
INSERT [dbo].[Participants] ([Id], [MeetingId], [UserId], [Created]) VALUES (33, 4, 7, CAST(N'2019-03-12T14:41:16.413' AS DateTime))
GO
INSERT [dbo].[Participants] ([Id], [MeetingId], [UserId], [Created]) VALUES (34, 5, 8, CAST(N'2019-03-12T14:41:16.413' AS DateTime))
GO
INSERT [dbo].[Participants] ([Id], [MeetingId], [UserId], [Created]) VALUES (35, 5, 9, CAST(N'2019-03-12T14:41:16.413' AS DateTime))
GO
INSERT [dbo].[Participants] ([Id], [MeetingId], [UserId], [Created]) VALUES (36, 5, 10, CAST(N'2019-03-12T14:41:16.413' AS DateTime))
GO
INSERT [dbo].[Participants] ([Id], [MeetingId], [UserId], [Created]) VALUES (37, 5, 11, CAST(N'2019-03-12T14:41:16.413' AS DateTime))
GO
INSERT [dbo].[Participants] ([Id], [MeetingId], [UserId], [Created]) VALUES (38, 5, 12, CAST(N'2019-03-12T14:41:16.413' AS DateTime))
GO
INSERT [dbo].[Participants] ([Id], [MeetingId], [UserId], [Created]) VALUES (39, 6, 10, CAST(N'2019-03-12T14:41:16.413' AS DateTime))
GO
INSERT [dbo].[Participants] ([Id], [MeetingId], [UserId], [Created]) VALUES (40, 6, 11, CAST(N'2019-03-12T14:41:16.413' AS DateTime))
GO
INSERT [dbo].[Participants] ([Id], [MeetingId], [UserId], [Created]) VALUES (41, 6, 12, CAST(N'2019-03-12T14:41:16.413' AS DateTime))
GO
INSERT [dbo].[Participants] ([Id], [MeetingId], [UserId], [Created]) VALUES (42, 7, 8, CAST(N'2019-03-12T14:41:16.413' AS DateTime))
GO
INSERT [dbo].[Participants] ([Id], [MeetingId], [UserId], [Created]) VALUES (43, 7, 9, CAST(N'2019-03-12T14:41:16.413' AS DateTime))
GO
INSERT [dbo].[Participants] ([Id], [MeetingId], [UserId], [Created]) VALUES (44, 7, 12, CAST(N'2019-03-12T14:41:16.413' AS DateTime))
GO
INSERT [dbo].[Participants] ([Id], [MeetingId], [UserId], [Created]) VALUES (45, 8, 8, CAST(N'2019-03-12T14:41:16.413' AS DateTime))
GO
INSERT [dbo].[Participants] ([Id], [MeetingId], [UserId], [Created]) VALUES (46, 8, 9, CAST(N'2019-03-12T14:41:16.413' AS DateTime))
GO
INSERT [dbo].[Participants] ([Id], [MeetingId], [UserId], [Created]) VALUES (47, 8, 10, CAST(N'2019-03-12T14:41:16.413' AS DateTime))
GO
INSERT [dbo].[Participants] ([Id], [MeetingId], [UserId], [Created]) VALUES (48, 8, 11, CAST(N'2019-03-12T14:41:16.413' AS DateTime))
GO
INSERT [dbo].[Participants] ([Id], [MeetingId], [UserId], [Created]) VALUES (49, 8, 12, CAST(N'2019-03-12T14:41:16.413' AS DateTime))
GO
INSERT [dbo].[Participants] ([Id], [MeetingId], [UserId], [Created]) VALUES (50, 9, 8, CAST(N'2019-03-12T14:41:16.413' AS DateTime))
GO
INSERT [dbo].[Participants] ([Id], [MeetingId], [UserId], [Created]) VALUES (51, 9, 9, CAST(N'2019-03-12T14:41:16.413' AS DateTime))
GO
INSERT [dbo].[Participants] ([Id], [MeetingId], [UserId], [Created]) VALUES (52, 9, 10, CAST(N'2019-03-12T14:41:16.413' AS DateTime))
GO
INSERT [dbo].[Participants] ([Id], [MeetingId], [UserId], [Created]) VALUES (53, 9, 11, CAST(N'2019-03-12T14:41:16.413' AS DateTime))
GO
INSERT [dbo].[Participants] ([Id], [MeetingId], [UserId], [Created]) VALUES (54, 9, 12, CAST(N'2019-03-12T14:41:16.413' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Participants] OFF
GO
ALTER TABLE [dbo].[Meetings] ADD  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[Meetings] ADD  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[Participants] ADD  DEFAULT (sysdatetimeoffset()) FOR [Created]
GO
USE [master]
GO
ALTER DATABASE [Meetings] SET READ_WRITE 
GO

-- Users DB
CREATE DATABASE [Users]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Users', FILENAME = N'/var/opt/mssql/data/Users.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Users_log', FILENAME = N'/var/opt/mssql/data/Users_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Users] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Users].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Users] SET ANSI_NULL_DEFAULT ON 
GO
ALTER DATABASE [Users] SET ANSI_NULLS ON 
GO
ALTER DATABASE [Users] SET ANSI_PADDING ON 
GO
ALTER DATABASE [Users] SET ANSI_WARNINGS ON 
GO
ALTER DATABASE [Users] SET ARITHABORT ON 
GO
ALTER DATABASE [Users] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Users] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Users] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Users] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Users] SET CURSOR_DEFAULT  LOCAL 
GO
ALTER DATABASE [Users] SET CONCAT_NULL_YIELDS_NULL ON 
GO
ALTER DATABASE [Users] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Users] SET QUOTED_IDENTIFIER ON 
GO
ALTER DATABASE [Users] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Users] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Users] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Users] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Users] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Users] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Users] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Users] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Users] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Users] SET RECOVERY FULL 
GO
ALTER DATABASE [Users] SET  MULTI_USER 
GO
ALTER DATABASE [Users] SET PAGE_VERIFY NONE  
GO
ALTER DATABASE [Users] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Users] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Users] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Users] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Users', N'ON'
GO
ALTER DATABASE [Users] SET QUERY_STORE = OFF
GO
USE [Users]
GO
/****** Object:  Table [dbo].[Companies]    Script Date: 13.03.2019 23:17:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Companies](
	[Id] [int] IDENTITY(0,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[Created] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Positions](
	[Id] [int] IDENTITY(0,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[Created] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(0,1) NOT NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[LastName] [nvarchar](100) NOT NULL,
	[TimeZoneId] [nvarchar](500) NOT NULL,
	[Created] [datetime] NOT NULL,
	[CompanyId] [int] NOT NULL,
	[PositionId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Companies] ON 
GO
INSERT [dbo].[Companies] ([Id], [Name], [Description], [Created]) VALUES (0, N'Samsung', NULL, CAST(N'2019-03-12T14:45:30.007' AS DateTime))
GO
INSERT [dbo].[Companies] ([Id], [Name], [Description], [Created]) VALUES (1, N'Xaomi', NULL, CAST(N'2019-03-12T14:45:30.007' AS DateTime))
GO
INSERT [dbo].[Companies] ([Id], [Name], [Description], [Created]) VALUES (2, N'Huawei', NULL, CAST(N'2019-03-12T14:45:30.007' AS DateTime))
GO
INSERT [dbo].[Companies] ([Id], [Name], [Description], [Created]) VALUES (3, N'Apple', NULL, CAST(N'2019-03-12T14:45:30.007' AS DateTime))
GO
INSERT [dbo].[Companies] ([Id], [Name], [Description], [Created]) VALUES (4, N'Meizu', NULL, CAST(N'2019-03-12T14:45:30.007' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Companies] OFF
GO
SET IDENTITY_INSERT [dbo].[Positions] ON 
GO
INSERT [dbo].[Positions] ([Id], [Name], [Description], [Created]) VALUES (0, N'CEO', NULL, CAST(N'2019-03-12T14:45:30.010' AS DateTime))
GO
INSERT [dbo].[Positions] ([Id], [Name], [Description], [Created]) VALUES (1, N'CTO', NULL, CAST(N'2019-03-12T14:45:30.010' AS DateTime))
GO
INSERT [dbo].[Positions] ([Id], [Name], [Description], [Created]) VALUES (2, N'QA engeneer', NULL, CAST(N'2019-03-12T14:45:30.010' AS DateTime))
GO
INSERT [dbo].[Positions] ([Id], [Name], [Description], [Created]) VALUES (3, N'Developer', NULL, CAST(N'2019-03-12T14:45:30.010' AS DateTime))
GO
INSERT [dbo].[Positions] ([Id], [Name], [Description], [Created]) VALUES (4, N'Lead developer', NULL, CAST(N'2019-03-12T14:45:30.010' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Positions] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 
GO
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [TimeZoneId], [Created], [CompanyId], [PositionId]) VALUES (0, N'Nathan', N'Fillion', N'UTC', CAST(N'2019-03-12T14:45:30.013' AS DateTime), 0, 0)
GO
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [TimeZoneId], [Created], [CompanyId], [PositionId]) VALUES (1, N'Dan', N'Khomyakov', N'UTC', CAST(N'2019-03-12T14:45:30.013' AS DateTime), 0, 1)
GO
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [TimeZoneId], [Created], [CompanyId], [PositionId]) VALUES (2, N'Artur', N'Kosarev', N'UTC', CAST(N'2019-03-12T14:45:30.013' AS DateTime), 0, 2)
GO
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [TimeZoneId], [Created], [CompanyId], [PositionId]) VALUES (3, N'William', N'Redcliff', N'UTC', CAST(N'2019-03-12T14:45:30.013' AS DateTime), 0, 2)
GO
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [TimeZoneId], [Created], [CompanyId], [PositionId]) VALUES (4, N'Naomi', N'Swift', N'UTC', CAST(N'2019-03-12T14:45:30.013' AS DateTime), 0, 3)
GO
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [TimeZoneId], [Created], [CompanyId], [PositionId]) VALUES (5, N'Jeremy', N'Carry', N'UTC', CAST(N'2019-03-12T14:45:30.013' AS DateTime), 0, 3)
GO
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [TimeZoneId], [Created], [CompanyId], [PositionId]) VALUES (6, N'Deontei', N'Kuznetsov', N'UTC', CAST(N'2019-03-12T14:45:30.013' AS DateTime), 0, 3)
GO
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [TimeZoneId], [Created], [CompanyId], [PositionId]) VALUES (7, N'Garry', N'Carrager', N'UTC', CAST(N'2019-03-12T14:45:30.013' AS DateTime), 0, 4)
GO
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [TimeZoneId], [Created], [CompanyId], [PositionId]) VALUES (8, N'Philipp', N'Morrisson', N'UTC', CAST(N'2019-03-12T14:45:30.013' AS DateTime), 1, 0)
GO
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [TimeZoneId], [Created], [CompanyId], [PositionId]) VALUES (9, N'Danny', N'Marko', N'UTC', CAST(N'2019-03-12T14:45:30.013' AS DateTime), 1, 2)
GO
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [TimeZoneId], [Created], [CompanyId], [PositionId]) VALUES (10, N'Christian', N'Whittaker', N'UTC', CAST(N'2019-03-12T14:45:30.013' AS DateTime), 1, 3)
GO
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [TimeZoneId], [Created], [CompanyId], [PositionId]) VALUES (11, N'Yoel', N'Ortega', N'UTC', CAST(N'2019-03-12T14:45:30.013' AS DateTime), 1, 3)
GO
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [TimeZoneId], [Created], [CompanyId], [PositionId]) VALUES (12, N'Chris', N'Cyborg', N'UTC', CAST(N'2019-03-12T14:45:30.013' AS DateTime), 1, 4)
GO
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [TimeZoneId], [Created], [CompanyId], [PositionId]) VALUES (13, N'Neil', N'Lemon', N'UTC', CAST(N'2019-03-12T14:45:30.013' AS DateTime), 2, 0)
GO
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [TimeZoneId], [Created], [CompanyId], [PositionId]) VALUES (14, N'Luis', N'Armstrong', N'UTC', CAST(N'2019-03-12T14:45:30.013' AS DateTime), 2, 1)
GO
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [TimeZoneId], [Created], [CompanyId], [PositionId]) VALUES (15, N'David', N'Southerland', N'UTC', CAST(N'2019-03-12T14:45:30.013' AS DateTime), 2, 1)
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Companies] ADD  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[Positions] ADD  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (N'UTC') FOR [TimeZoneId]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Companies] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Companies] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Companies]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Positions] FOREIGN KEY([PositionId])
REFERENCES [dbo].[Positions] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Positions]
GO
USE [master]
GO
ALTER DATABASE [Users] SET  READ_WRITE 
GO
