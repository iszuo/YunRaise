USE [master]
GO
/****** Object:  Database [Yun]    Script Date: 2022/05/02 08:05:54 ******/
CREATE DATABASE [Yun]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Yun', FILENAME = N'E:\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Yun.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Yun_log', FILENAME = N'E:\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Yun_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Yun] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Yun].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Yun] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Yun] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Yun] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Yun] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Yun] SET ARITHABORT OFF 
GO
ALTER DATABASE [Yun] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Yun] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Yun] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Yun] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Yun] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Yun] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Yun] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Yun] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Yun] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Yun] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Yun] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Yun] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Yun] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Yun] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Yun] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Yun] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Yun] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Yun] SET RECOVERY FULL 
GO
ALTER DATABASE [Yun] SET  MULTI_USER 
GO
ALTER DATABASE [Yun] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Yun] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Yun] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Yun] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Yun] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Yun] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Yun', N'ON'
GO
ALTER DATABASE [Yun] SET QUERY_STORE = OFF
GO
USE [Yun]
GO
/****** Object:  Table [dbo].[Donate]    Script Date: 2022/05/02 08:05:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Donate](
	[DonId] [int] IDENTITY(1,1) NOT NULL,
	[UsersID] [int] NOT NULL,
	[ProID] [int] NOT NULL,
	[Donprice] [decimal](8, 2) NOT NULL,
	[Dontime] [nchar](10) NULL,
	[Donphone] [nvarchar](11) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Message]    Script Date: 2022/05/02 08:05:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Message](
	[MessId] [int] IDENTITY(1,1) NOT NULL,
	[usersID] [int] NOT NULL,
	[Messname] [nvarchar](20) NOT NULL,
	[Messaddress] [nvarchar](100) NOT NULL,
	[Messphone] [nvarchar](11) NOT NULL,
	[Bankname] [nvarchar](50) NOT NULL,
	[Bankcard] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MessId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Project]    Script Date: 2022/05/02 08:05:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Project](
	[ProID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[Proname] [nvarchar](20) NOT NULL,
	[Amount] [decimal](8, 2) NOT NULL,
	[Prodays] [nvarchar](50) NOT NULL,
	[Type] [nvarchar](20) NULL,
	[Proaddress] [nvarchar](50) NULL,
	[Proimg] [nvarchar](100) NULL,
	[Protext] [nvarchar](4000) NULL,
	[State] [nvarchar](150) NOT NULL,
	[Prophone] [nvarchar](11) NOT NULL,
	[Donprice] [decimal](8, 2) NULL,
	[StartTime] [nchar](10) NOT NULL,
	[EndTime] [nchar](10) NULL,
	[Percentage] [nvarchar](50) NULL,
 CONSTRAINT [PK__Project__620295F09F28E5F6] PRIMARY KEY CLUSTERED 
(
	[ProID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2022/05/02 08:05:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Phone] [nvarchar](11) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Username] [nvarchar](50) NULL,
	[Sex] [nvarchar](2) NULL,
	[Address] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Usertext] [nvarchar](150) NULL,
	[Portrait] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_Users] UNIQUE NONCLUSTERED 
(
	[Phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Project] ADD  CONSTRAINT [DF_Project_State_1]  DEFAULT (N'众筹中') FOR [State]
GO
ALTER TABLE [dbo].[Project] ADD  CONSTRAINT [DF_Project_StartTime]  DEFAULT (getdate()) FOR [StartTime]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ('User-000001') FOR [Username]
GO
ALTER TABLE [dbo].[Donate]  WITH CHECK ADD  CONSTRAINT [FK__Donate__ProID__2B3F6F97] FOREIGN KEY([ProID])
REFERENCES [dbo].[Project] ([ProID])
GO
ALTER TABLE [dbo].[Donate] CHECK CONSTRAINT [FK__Donate__ProID__2B3F6F97]
GO
ALTER TABLE [dbo].[Donate]  WITH CHECK ADD FOREIGN KEY([UsersID])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Message]  WITH CHECK ADD FOREIGN KEY([usersID])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Project]  WITH CHECK ADD  CONSTRAINT [FK__Project__UserID__276EDEB3] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Project] CHECK CONSTRAINT [FK__Project__UserID__276EDEB3]
GO
USE [master]
GO
ALTER DATABASE [Yun] SET  READ_WRITE 
GO
