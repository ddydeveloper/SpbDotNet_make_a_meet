USE [master]
GO
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
