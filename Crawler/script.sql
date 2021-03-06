USE [master]
GO
/****** Object:  Database [Crawler]    Script Date: 12/1/2016 5:13:02 PM ******/
CREATE DATABASE [Crawler]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Crawler', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Crawler.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Crawler_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Crawler_log.ldf' , SIZE = 1536KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Crawler] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Crawler].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Crawler] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Crawler] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Crawler] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Crawler] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Crawler] SET ARITHABORT OFF 
GO
ALTER DATABASE [Crawler] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Crawler] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Crawler] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Crawler] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Crawler] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Crawler] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Crawler] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Crawler] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Crawler] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Crawler] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Crawler] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Crawler] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Crawler] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Crawler] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Crawler] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Crawler] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Crawler] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Crawler] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Crawler] SET RECOVERY FULL 
GO
ALTER DATABASE [Crawler] SET  MULTI_USER 
GO
ALTER DATABASE [Crawler] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Crawler] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Crawler] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Crawler] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Crawler', N'ON'
GO
USE [Crawler]
GO
/****** Object:  Table [dbo].[Contents]    Script Date: 12/1/2016 5:13:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Contents](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](200) NULL,
	[Description] [nvarchar](2000) NULL,
	[Content] [nvarchar](max) NULL,
	[Avatar] [varchar](2000) NULL,
	[Size] [nvarchar](2000) NULL,
	[Download] [nvarchar](2000) NULL,
	[LinkDownload] [varchar](2000) NULL,
	[AvatarBig] [varchar](2000) NULL,
	[ImageContent] [varchar](max) NULL,
	[DateSynced] [datetime] NULL,
	[DateModify] [datetime] NULL,
	[Link] [varchar](2000) NOT NULL,
	[LinkId] [int] NULL,
 CONSTRAINT [PK_Contents] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Links]    Script Date: 12/1/2016 5:13:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Links](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Link] [varchar](1000) NOT NULL,
	[SiteId] [int] NOT NULL,
	[Avatar] [varchar](2000) NULL,
	[Title] [nvarchar](2000) NULL,
	[Description] [nvarchar](2000) NULL,
	[DateCrawler] [datetime] NULL,
	[DateSynced] [datetime] NULL,
	[CountSynced] [int] NULL,
	[LinkType] [int] NULL,
	[LinkDownload] [varchar](2000) NULL,
	[GameType] [int] NULL,
 CONSTRAINT [PK_Links] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sites]    Script Date: 12/1/2016 5:13:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sites](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SiteUrl] [varchar](200) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Links] ADD  CONSTRAINT [DF_Links_SiteId]  DEFAULT ((1)) FOR [SiteId]
GO
ALTER TABLE [dbo].[Links] ADD  CONSTRAINT [DF_Links_DateCrawler]  DEFAULT (getdate()) FOR [DateCrawler]
GO
ALTER TABLE [dbo].[Links] ADD  CONSTRAINT [DF_Links_CountSynced]  DEFAULT ((0)) FOR [CountSynced]
GO
ALTER TABLE [dbo].[Links] ADD  CONSTRAINT [DF_Links_LinkType]  DEFAULT ((1)) FOR [LinkType]
GO
ALTER TABLE [dbo].[Links] ADD  CONSTRAINT [DF_Links_GameType]  DEFAULT ((1)) FOR [GameType]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1: Detail; 2: Cat' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Links', @level2type=N'COLUMN',@level2name=N'LinkType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0: Android; 1: iOS' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Links', @level2type=N'COLUMN',@level2name=N'GameType'
GO
USE [master]
GO
ALTER DATABASE [Crawler] SET  READ_WRITE 
GO
