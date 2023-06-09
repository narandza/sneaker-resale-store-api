USE [master]
GO
/****** Object:  Database [SneakerResaleStore]    Script Date: 8.6.2023. 18:10:47 ******/
CREATE DATABASE [SneakerResaleStore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SneakerResaleStore', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\SneakerResaleStore.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SneakerResaleStore_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\SneakerResaleStore_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [SneakerResaleStore] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SneakerResaleStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SneakerResaleStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SneakerResaleStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SneakerResaleStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SneakerResaleStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SneakerResaleStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [SneakerResaleStore] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SneakerResaleStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SneakerResaleStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SneakerResaleStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SneakerResaleStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SneakerResaleStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SneakerResaleStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SneakerResaleStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SneakerResaleStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SneakerResaleStore] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SneakerResaleStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SneakerResaleStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SneakerResaleStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SneakerResaleStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SneakerResaleStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SneakerResaleStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SneakerResaleStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SneakerResaleStore] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SneakerResaleStore] SET  MULTI_USER 
GO
ALTER DATABASE [SneakerResaleStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SneakerResaleStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SneakerResaleStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SneakerResaleStore] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SneakerResaleStore] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SneakerResaleStore] SET QUERY_STORE = OFF
GO
USE [SneakerResaleStore]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 8.6.2023. 18:10:47 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Addresses]    Script Date: 8.6.2023. 18:10:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Addresses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StreetAddress] [nvarchar](max) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[PostalCode] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[DeletedAt] [datetime2](7) NULL,
	[DeletedBy] [nvarchar](max) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Addresses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brands]    Script Date: 8.6.2023. 18:10:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brands](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[LogoId] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[DeletedAt] [datetime2](7) NULL,
	[DeletedBy] [nvarchar](max) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Brands] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Favorites]    Script Date: 8.6.2023. 18:10:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Favorites](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SneakerId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
	[DeletedBy] [nvarchar](max) NULL,
 CONSTRAINT [PK_Favorites] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Images]    Script Date: 8.6.2023. 18:10:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Images](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Path] [nvarchar](256) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[DeletedAt] [datetime2](7) NULL,
	[DeletedBy] [nvarchar](max) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Images] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LogEntries]    Script Date: 8.6.2023. 18:10:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogEntries](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Actor] [nvarchar](max) NULL,
	[ActorId] [int] NOT NULL,
	[UseCaseName] [nvarchar](max) NULL,
	[UseCaseData] [nvarchar](max) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
	[DeletedBy] [nvarchar](max) NULL,
 CONSTRAINT [PK_LogEntries] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItems]    Script Date: 8.6.2023. 18:10:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItems](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[SneakerId] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[DeletedAt] [datetime2](7) NULL,
	[DeletedBy] [nvarchar](max) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_OrderItems] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 8.6.2023. 18:10:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[DiscountCode] [nvarchar](max) NULL,
	[PaymentStatus] [int] NOT NULL,
	[PaymentMethod] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[DeletedAt] [datetime2](7) NULL,
	[DeletedBy] [nvarchar](max) NULL,
	[IsActive] [bit] NOT NULL,
	[OrderStatus] [int] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 8.6.2023. 18:10:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[DeletedAt] [datetime2](7) NULL,
	[DeletedBy] [nvarchar](max) NULL,
	[IsActive] [bit] NOT NULL,
	[IsDefault] [bit] NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoleUseCases]    Script Date: 8.6.2023. 18:10:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleUseCases](
	[RoleId] [int] NOT NULL,
	[UseCaseId] [int] NOT NULL,
 CONSTRAINT [PK_RoleUseCases] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC,
	[UseCaseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sizes]    Script Date: 8.6.2023. 18:10:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sizes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Number] [nvarchar](10) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[DeletedAt] [datetime2](7) NULL,
	[DeletedBy] [nvarchar](max) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Sizes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SneakerImages]    Script Date: 8.6.2023. 18:10:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SneakerImages](
	[SneakerId] [int] NOT NULL,
	[ImageId] [int] NOT NULL,
 CONSTRAINT [PK_SneakerImages] PRIMARY KEY CLUSTERED 
(
	[SneakerId] ASC,
	[ImageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sneakers]    Script Date: 8.6.2023. 18:10:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sneakers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Model] [nvarchar](128) NOT NULL,
	[Colorway] [nvarchar](128) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[ReleaseDate] [datetime2](7) NOT NULL,
	[BrandId] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[DeletedAt] [datetime2](7) NULL,
	[DeletedBy] [nvarchar](max) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Sneakers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SneakerSizes]    Script Date: 8.6.2023. 18:10:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SneakerSizes](
	[SneakerId] [int] NOT NULL,
	[SizeId] [int] NOT NULL,
 CONSTRAINT [PK_SneakerSizes] PRIMARY KEY CLUSTERED 
(
	[SneakerId] ASC,
	[SizeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TicketMessages]    Script Date: 8.6.2023. 18:10:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TicketMessages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TicketId] [int] NOT NULL,
	[Message] [nvarchar](max) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[DeletedAt] [datetime2](7) NULL,
	[DeletedBy] [nvarchar](max) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_TicketMessages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tickets]    Script Date: 8.6.2023. 18:10:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tickets](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Status] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[DeletedAt] [datetime2](7) NULL,
	[DeletedBy] [nvarchar](max) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Tickets] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 8.6.2023. 18:10:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[LastName] [nvarchar](100) NOT NULL,
	[RoleId] [int] NOT NULL,
	[AddressId] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[DeletedAt] [datetime2](7) NULL,
	[DeletedBy] [nvarchar](max) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230522175641_InitalMigration', N'5.0.17')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230522201304_TicketsUpdate', N'5.0.17')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230531115008_SnekaerSizeFix', N'5.0.17')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230531182749_RoleUseCases', N'5.0.17')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230531182922_namefix', N'5.0.17')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230604144607_LogEntries', N'5.0.17')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230605212106_roleusecase', N'5.0.17')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230607203759_orderStaus', N'5.0.17')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230608002631_default-role', N'5.0.17')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230608094525_userPassword', N'5.0.17')
GO
SET IDENTITY_INSERT [dbo].[Addresses] ON 

INSERT [dbo].[Addresses] ([Id], [StreetAddress], [City], [PostalCode], [CreatedAt], [ModifiedAt], [DeletedAt], [DeletedBy], [IsActive]) VALUES (1, N'Knjaza Milosa', N'Pirot', 18300, CAST(N'2023-06-02T19:52:49.5966667' AS DateTime2), CAST(N'2023-06-02T17:54:57.5084488' AS DateTime2), NULL, NULL, 1)
INSERT [dbo].[Addresses] ([Id], [StreetAddress], [City], [PostalCode], [CreatedAt], [ModifiedAt], [DeletedAt], [DeletedBy], [IsActive]) VALUES (2, N'Kraljice Marije 33', N'Beograd', 11000, CAST(N'2023-06-02T19:53:13.2833333' AS DateTime2), NULL, CAST(N'2023-06-02T17:55:04.0884366' AS DateTime2), NULL, 0)
INSERT [dbo].[Addresses] ([Id], [StreetAddress], [City], [PostalCode], [CreatedAt], [ModifiedAt], [DeletedAt], [DeletedBy], [IsActive]) VALUES (3, N'Ulica 21', N'Beograd', 11000, CAST(N'2023-06-05T19:31:03.2133333' AS DateTime2), NULL, NULL, NULL, 1)
INSERT [dbo].[Addresses] ([Id], [StreetAddress], [City], [PostalCode], [CreatedAt], [ModifiedAt], [DeletedAt], [DeletedBy], [IsActive]) VALUES (5, N'Ulica 213', N'Beograd', 11020, CAST(N'2023-06-08T11:46:51.9200000' AS DateTime2), NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Addresses] OFF
GO
SET IDENTITY_INSERT [dbo].[Brands] ON 

INSERT [dbo].[Brands] ([Id], [Name], [Description], [LogoId], [CreatedAt], [ModifiedAt], [DeletedAt], [DeletedBy], [IsActive]) VALUES (2, N'Nike', N'', 28, CAST(N'2023-05-31T00:06:26.6966667' AS DateTime2), NULL, NULL, NULL, 1)
INSERT [dbo].[Brands] ([Id], [Name], [Description], [LogoId], [CreatedAt], [ModifiedAt], [DeletedAt], [DeletedBy], [IsActive]) VALUES (6, N'Adidas', N'', 28, CAST(N'2023-05-31T14:14:20.6500000' AS DateTime2), NULL, NULL, NULL, 1)
INSERT [dbo].[Brands] ([Id], [Name], [Description], [LogoId], [CreatedAt], [ModifiedAt], [DeletedAt], [DeletedBy], [IsActive]) VALUES (7, N'New Balance', N'New Balance is an American sneaker brand', 29, CAST(N'2023-06-02T13:15:47.4833333' AS DateTime2), CAST(N'2023-06-02T14:08:03.1500437' AS DateTime2), CAST(N'2023-06-02T12:23:38.6614286' AS DateTime2), NULL, 0)
INSERT [dbo].[Brands] ([Id], [Name], [Description], [LogoId], [CreatedAt], [ModifiedAt], [DeletedAt], [DeletedBy], [IsActive]) VALUES (8, N'Asics', N'Asics is a japanese sportswear brand', 30, CAST(N'2023-06-04T22:58:34.1933333' AS DateTime2), NULL, NULL, NULL, 1)
INSERT [dbo].[Brands] ([Id], [Name], [Description], [LogoId], [CreatedAt], [ModifiedAt], [DeletedAt], [DeletedBy], [IsActive]) VALUES (9, N'Converse', N'Converse is an American sportswear brand.', 31, CAST(N'2023-06-08T05:33:02.4666667' AS DateTime2), NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Brands] OFF
GO
SET IDENTITY_INSERT [dbo].[Favorites] ON 

INSERT [dbo].[Favorites] ([Id], [SneakerId], [UserId], [CreatedAt], [ModifiedAt], [DeletedAt], [IsActive], [DeletedBy]) VALUES (7, 7, 1, CAST(N'2023-06-06T00:00:00.0000000' AS DateTime2), NULL, NULL, 1, NULL)
INSERT [dbo].[Favorites] ([Id], [SneakerId], [UserId], [CreatedAt], [ModifiedAt], [DeletedAt], [IsActive], [DeletedBy]) VALUES (8, 8, 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, NULL)
SET IDENTITY_INSERT [dbo].[Favorites] OFF
GO
SET IDENTITY_INSERT [dbo].[Images] ON 

INSERT [dbo].[Images] ([Id], [Path], [CreatedAt], [ModifiedAt], [DeletedAt], [DeletedBy], [IsActive]) VALUES (1, N'image.jpg', CAST(N'2023-05-31T00:05:43.9466667' AS DateTime2), NULL, NULL, NULL, 1)
INSERT [dbo].[Images] ([Id], [Path], [CreatedAt], [ModifiedAt], [DeletedAt], [DeletedBy], [IsActive]) VALUES (2, N'image1.jpg', CAST(N'2023-05-31T17:55:20.7266667' AS DateTime2), NULL, NULL, NULL, 1)
INSERT [dbo].[Images] ([Id], [Path], [CreatedAt], [ModifiedAt], [DeletedAt], [DeletedBy], [IsActive]) VALUES (3, N'image2.jpg', CAST(N'2023-05-31T17:55:20.7266667' AS DateTime2), NULL, NULL, NULL, 1)
INSERT [dbo].[Images] ([Id], [Path], [CreatedAt], [ModifiedAt], [DeletedAt], [DeletedBy], [IsActive]) VALUES (4, N'image3.jpg', CAST(N'2023-05-31T17:55:20.7266667' AS DateTime2), NULL, NULL, NULL, 1)
INSERT [dbo].[Images] ([Id], [Path], [CreatedAt], [ModifiedAt], [DeletedAt], [DeletedBy], [IsActive]) VALUES (9, N'image4.jpg', CAST(N'2023-06-01T18:46:03.8800000' AS DateTime2), NULL, NULL, NULL, 1)
INSERT [dbo].[Images] ([Id], [Path], [CreatedAt], [ModifiedAt], [DeletedAt], [DeletedBy], [IsActive]) VALUES (10, N'image1.jpg', CAST(N'2023-06-02T00:49:03.1566667' AS DateTime2), NULL, NULL, NULL, 1)
INSERT [dbo].[Images] ([Id], [Path], [CreatedAt], [ModifiedAt], [DeletedAt], [DeletedBy], [IsActive]) VALUES (11, N'image3.jpg', CAST(N'2023-06-02T00:49:03.1566667' AS DateTime2), NULL, NULL, NULL, 1)
INSERT [dbo].[Images] ([Id], [Path], [CreatedAt], [ModifiedAt], [DeletedAt], [DeletedBy], [IsActive]) VALUES (12, N'image4.jpg', CAST(N'2023-06-02T00:49:03.1566667' AS DateTime2), NULL, NULL, NULL, 1)
INSERT [dbo].[Images] ([Id], [Path], [CreatedAt], [ModifiedAt], [DeletedAt], [DeletedBy], [IsActive]) VALUES (13, N'image1.jpg', CAST(N'2023-06-02T01:04:40.2866667' AS DateTime2), NULL, NULL, NULL, 1)
INSERT [dbo].[Images] ([Id], [Path], [CreatedAt], [ModifiedAt], [DeletedAt], [DeletedBy], [IsActive]) VALUES (14, N'image3.jpg', CAST(N'2023-06-02T01:04:40.2866667' AS DateTime2), NULL, NULL, NULL, 1)
INSERT [dbo].[Images] ([Id], [Path], [CreatedAt], [ModifiedAt], [DeletedAt], [DeletedBy], [IsActive]) VALUES (15, N'image4.jpg', CAST(N'2023-06-02T01:04:40.2866667' AS DateTime2), NULL, NULL, NULL, 1)
INSERT [dbo].[Images] ([Id], [Path], [CreatedAt], [ModifiedAt], [DeletedAt], [DeletedBy], [IsActive]) VALUES (16, N'image1.jpg', CAST(N'2023-06-02T01:11:12.6700000' AS DateTime2), NULL, NULL, NULL, 1)
INSERT [dbo].[Images] ([Id], [Path], [CreatedAt], [ModifiedAt], [DeletedAt], [DeletedBy], [IsActive]) VALUES (17, N'image3.jpg', CAST(N'2023-06-02T01:11:12.6700000' AS DateTime2), NULL, NULL, NULL, 1)
INSERT [dbo].[Images] ([Id], [Path], [CreatedAt], [ModifiedAt], [DeletedAt], [DeletedBy], [IsActive]) VALUES (18, N'image4.jpg', CAST(N'2023-06-02T01:11:12.6700000' AS DateTime2), NULL, NULL, NULL, 1)
INSERT [dbo].[Images] ([Id], [Path], [CreatedAt], [ModifiedAt], [DeletedAt], [DeletedBy], [IsActive]) VALUES (19, N'image1.jpg', CAST(N'2023-06-02T01:16:44.8333333' AS DateTime2), NULL, NULL, NULL, 1)
INSERT [dbo].[Images] ([Id], [Path], [CreatedAt], [ModifiedAt], [DeletedAt], [DeletedBy], [IsActive]) VALUES (20, N'image3.jpg', CAST(N'2023-06-02T01:16:44.8333333' AS DateTime2), NULL, NULL, NULL, 1)
INSERT [dbo].[Images] ([Id], [Path], [CreatedAt], [ModifiedAt], [DeletedAt], [DeletedBy], [IsActive]) VALUES (21, N'image4.jpg', CAST(N'2023-06-02T01:16:44.8333333' AS DateTime2), NULL, NULL, NULL, 1)
INSERT [dbo].[Images] ([Id], [Path], [CreatedAt], [ModifiedAt], [DeletedAt], [DeletedBy], [IsActive]) VALUES (22, N'image1.jpg', CAST(N'2023-06-02T01:19:32.9466667' AS DateTime2), NULL, NULL, NULL, 1)
INSERT [dbo].[Images] ([Id], [Path], [CreatedAt], [ModifiedAt], [DeletedAt], [DeletedBy], [IsActive]) VALUES (23, N'image3.jpg', CAST(N'2023-06-02T01:19:32.9466667' AS DateTime2), NULL, NULL, NULL, 1)
INSERT [dbo].[Images] ([Id], [Path], [CreatedAt], [ModifiedAt], [DeletedAt], [DeletedBy], [IsActive]) VALUES (24, N'image4.jpg', CAST(N'2023-06-02T01:19:32.9466667' AS DateTime2), NULL, NULL, NULL, 1)
INSERT [dbo].[Images] ([Id], [Path], [CreatedAt], [ModifiedAt], [DeletedAt], [DeletedBy], [IsActive]) VALUES (25, N'image1.jpg', CAST(N'2023-06-02T01:28:35.8133333' AS DateTime2), NULL, NULL, NULL, 1)
INSERT [dbo].[Images] ([Id], [Path], [CreatedAt], [ModifiedAt], [DeletedAt], [DeletedBy], [IsActive]) VALUES (26, N'image3.jpg', CAST(N'2023-06-02T01:28:35.8133333' AS DateTime2), NULL, NULL, NULL, 1)
INSERT [dbo].[Images] ([Id], [Path], [CreatedAt], [ModifiedAt], [DeletedAt], [DeletedBy], [IsActive]) VALUES (27, N'image4.jpg', CAST(N'2023-06-02T01:28:35.8133333' AS DateTime2), NULL, NULL, NULL, 1)
INSERT [dbo].[Images] ([Id], [Path], [CreatedAt], [ModifiedAt], [DeletedAt], [DeletedBy], [IsActive]) VALUES (28, N'logo.png', CAST(N'2023-06-02T02:21:06.1166667' AS DateTime2), NULL, NULL, NULL, 1)
INSERT [dbo].[Images] ([Id], [Path], [CreatedAt], [ModifiedAt], [DeletedAt], [DeletedBy], [IsActive]) VALUES (29, N'nblogo.jpg', CAST(N'2023-06-02T13:15:47.4000000' AS DateTime2), NULL, NULL, NULL, 1)
INSERT [dbo].[Images] ([Id], [Path], [CreatedAt], [ModifiedAt], [DeletedAt], [DeletedBy], [IsActive]) VALUES (30, N'asicslogo.png', CAST(N'2023-06-04T22:58:34.1700000' AS DateTime2), NULL, NULL, NULL, 1)
INSERT [dbo].[Images] ([Id], [Path], [CreatedAt], [ModifiedAt], [DeletedAt], [DeletedBy], [IsActive]) VALUES (31, N'wwwroot\images\brands\0aba7a6c-2de1-40f9-9f93-44dd0a725be2.png', CAST(N'2023-06-08T05:33:02.3666667' AS DateTime2), NULL, NULL, NULL, 1)
INSERT [dbo].[Images] ([Id], [Path], [CreatedAt], [ModifiedAt], [DeletedAt], [DeletedBy], [IsActive]) VALUES (35, N'wwwroot\images\sneakers\c07b1c7b-3fcd-4db5-96d9-9aaa0e6ac86a.jpg', CAST(N'2023-06-08T11:39:08.0266667' AS DateTime2), NULL, NULL, NULL, 1)
INSERT [dbo].[Images] ([Id], [Path], [CreatedAt], [ModifiedAt], [DeletedAt], [DeletedBy], [IsActive]) VALUES (36, N'wwwroot\images\sneakers\5ecd8c78-67fa-4d70-8be9-6ba7b2ab8c2a.jpg', CAST(N'2023-06-08T11:39:08.0266667' AS DateTime2), NULL, NULL, NULL, 1)
INSERT [dbo].[Images] ([Id], [Path], [CreatedAt], [ModifiedAt], [DeletedAt], [DeletedBy], [IsActive]) VALUES (37, N'wwwroot\images\sneakers\3842fcc2-7ce3-42e9-8a47-aa1231831671.jpg', CAST(N'2023-06-08T11:39:08.0266667' AS DateTime2), NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Images] OFF
GO
SET IDENTITY_INSERT [dbo].[LogEntries] ON 

INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [IsActive], [DeletedBy]) VALUES (1, N'dimitrije.jovanovic.35.19@ict.edu.rs', 1, N'Search users', N'{"Page":10,"PerPage":1}', CAST(N'2023-06-04T15:11:59.8789771' AS DateTime2), NULL, NULL, 0, NULL)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [IsActive], [DeletedBy]) VALUES (2, N'dimitrije.jovanovic.35.19@ict.edu.rs', 1, N'Search users', N'{"Page":10,"PerPage":1}', CAST(N'2023-06-04T15:13:39.7058921' AS DateTime2), NULL, NULL, 0, NULL)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [IsActive], [DeletedBy]) VALUES (3, N'dimitrije.jovanovic.35.19@ict.edu.rs', 1, N'Search users', N'{"Page":10,"PerPage":1}', CAST(N'2023-06-04T15:17:37.0792758' AS DateTime2), NULL, NULL, 0, NULL)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [IsActive], [DeletedBy]) VALUES (4, N'dimitrije.jovanovic.35.19@ict.edu.rs', 1, N'Search users', N'{"Page":10,"PerPage":1}', CAST(N'2023-06-04T15:23:03.6824903' AS DateTime2), NULL, NULL, 0, NULL)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [IsActive], [DeletedBy]) VALUES (5, N'dimitrije.jovanovic.35.19@ict.edu.rs', 1, N'Search users', N'{"Page":1,"PerPage":10}', CAST(N'2023-06-04T15:24:50.5483614' AS DateTime2), NULL, NULL, 0, NULL)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [IsActive], [DeletedBy]) VALUES (6, N'dimitrije.jovanovic.35.19@ict.edu.rs', 1, N'Search users', N'{"Page":1,"PerPage":10}', CAST(N'2023-06-04T16:45:15.3972002' AS DateTime2), NULL, NULL, 0, NULL)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [IsActive], [DeletedBy]) VALUES (7, N'dimitrije.jovanovic.35.19@ict.edu.rs', 1, N'Sneaker search', N'{"Brand":null,"PriceFrom":null,"PriceTo":null,"ReleaseDateFrom":null,"ReleaseDateTo":null,"Model":null,"Colorway":null,"Sizes":null}', CAST(N'2023-06-04T16:47:32.1849771' AS DateTime2), NULL, NULL, 0, NULL)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [IsActive], [DeletedBy]) VALUES (8, N'dimitrije.jovanovic.35.19@ict.edu.rs', 1, N'Search Brands', N'{"Name":null}', CAST(N'2023-06-04T20:28:28.8676741' AS DateTime2), NULL, NULL, 0, NULL)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [IsActive], [DeletedBy]) VALUES (9, N'dimitrije.jovanovic.35.19@ict.edu.rs', 1, N'Search Brands', N'{"Name":null}', CAST(N'2023-06-04T20:57:19.9982309' AS DateTime2), NULL, NULL, 0, NULL)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [IsActive], [DeletedBy]) VALUES (10, N'dimitrije.jovanovic.35.19@ict.edu.rs', 1, N'Search sneakers', N'{"Brand":null,"PriceFrom":null,"PriceTo":null,"ReleaseDateFrom":null,"ReleaseDateTo":null,"Model":null,"Colorway":null,"Sizes":null,"Page":1,"PerPage":10}', CAST(N'2023-06-05T12:43:39.4068195' AS DateTime2), NULL, NULL, 0, NULL)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [IsActive], [DeletedBy]) VALUES (11, N'dimitrije.jovanovic.35.19@ict.edu.rs', 1, N'Search Brands', N'{"Name":null}', CAST(N'2023-06-05T12:44:14.6829556' AS DateTime2), NULL, NULL, 0, NULL)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [IsActive], [DeletedBy]) VALUES (12, N'dimitrije.jovanovic.35.19@ict.edu.rs', 1, N'Addresses search', N'{"StreetAddress":null,"City":null,"PostalCode":0}', CAST(N'2023-06-05T12:44:23.0309049' AS DateTime2), NULL, NULL, 0, NULL)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [IsActive], [DeletedBy]) VALUES (13, N'dimitrije.jovanovic.35.19@ict.edu.rs', 1, N'Addresses search', N'{"StreetAddress":null,"City":null,"PostalCode":0,"Page":1,"PerPage":10}', CAST(N'2023-06-05T12:53:58.5287682' AS DateTime2), NULL, NULL, 0, NULL)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [IsActive], [DeletedBy]) VALUES (14, N'dimitrije.jovanovic.35.19@ict.edu.rs', 1, N'Search Brands', N'{"Name":null,"Page":1,"PerPage":10}', CAST(N'2023-06-05T12:54:47.8362572' AS DateTime2), NULL, NULL, 0, NULL)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [IsActive], [DeletedBy]) VALUES (15, N'dimitrije.jovanovic.35.19@ict.edu.rs', 1, N'Search Brands', N'{"Name":"a","Page":1,"PerPage":10}', CAST(N'2023-06-05T12:55:00.7945487' AS DateTime2), NULL, NULL, 0, NULL)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [IsActive], [DeletedBy]) VALUES (16, N'dimitrije.jovanovic.35.19@ict.edu.rs', 1, N'Find a user', N'2', CAST(N'2023-06-05T17:37:12.9896974' AS DateTime2), NULL, NULL, 0, NULL)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [IsActive], [DeletedBy]) VALUES (17, N'dimitrije.jovanovic.35.19@ict.edu.rs', 1, N'Search roles', N'{"Name":null,"Id":0,"UseCaseId":0,"UserEmail":null,"Page":1,"PerPage":10}', CAST(N'2023-06-05T21:52:30.1274261' AS DateTime2), NULL, NULL, 0, NULL)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [IsActive], [DeletedBy]) VALUES (18, N'dimitrije.jovanovic.35.19@ict.edu.rs', 1, N'Find a role', N'1', CAST(N'2023-06-05T22:07:06.5341855' AS DateTime2), NULL, NULL, 0, NULL)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [IsActive], [DeletedBy]) VALUES (19, N'dimitrije.jovanovic.35.19@ict.edu.rs', 1, N'Search favorite sneakers.', N'{"Page":1,"PerPage":10}', CAST(N'2023-06-06T17:47:28.6665514' AS DateTime2), NULL, NULL, 0, NULL)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [IsActive], [DeletedBy]) VALUES (20, N'dimitrije.jovanovic.35.19@ict.edu.rs', 1, N'Search favorite sneakers.', N'{"Page":1,"PerPage":10}', CAST(N'2023-06-06T17:48:30.9320918' AS DateTime2), NULL, NULL, 0, NULL)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [IsActive], [DeletedBy]) VALUES (21, N'dimitrije.jovanovic.35.19@ict.edu.rs', 1, N'Search favorite sneakers.', N'{"Page":1,"PerPage":10}', CAST(N'2023-06-06T19:58:05.3655679' AS DateTime2), NULL, NULL, 0, NULL)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [IsActive], [DeletedBy]) VALUES (22, N'dimitrije.jovanovic.35.19@ict.edu.rs', 1, N'Search favorite sneakers.', N'{"Page":1,"PerPage":10}', CAST(N'2023-06-06T20:18:19.8910607' AS DateTime2), NULL, NULL, 0, NULL)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [IsActive], [DeletedBy]) VALUES (23, N'dimitrije.jovanovic.35.19@ict.edu.rs', 1, N'Search roles', N'{"Name":null,"Id":0,"UseCaseId":0,"UserEmail":null,"Page":1,"PerPage":10}', CAST(N'2023-06-06T23:40:15.2417027' AS DateTime2), NULL, NULL, 0, NULL)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [IsActive], [DeletedBy]) VALUES (24, N'dimitrije.jovanovic.35.19@ict.edu.rs', 1, N'Search orders', N'{"Email":null,"Name":null,"Address":null,"Sneaker":null,"PaymentMethod":null,"PaymentStatus":null,"CreatedFrom":null,"CreatedTo":null,"TotalPriceFrom":null,"TotalPriceTo":null,"Page":1,"PerPage":10}', CAST(N'2023-06-06T23:43:40.4633339' AS DateTime2), NULL, NULL, 0, NULL)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [IsActive], [DeletedBy]) VALUES (25, N'dimitrije.jovanovic.35.19@ict.edu.rs', 1, N'Find a order', N'1', CAST(N'2023-06-07T00:19:54.0709994' AS DateTime2), NULL, NULL, 0, NULL)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [IsActive], [DeletedBy]) VALUES (26, N'dimitrije.jovanovic.35.19@ict.edu.rs', 1, N'Search orders', N'{"Email":null,"Name":null,"Address":null,"Sneaker":null,"PaymentMethod":null,"PaymentStatus":null,"CreatedFrom":null,"CreatedTo":null,"TotalPriceFrom":null,"TotalPriceTo":null,"Page":1,"PerPage":10}', CAST(N'2023-06-07T17:00:31.4135701' AS DateTime2), NULL, NULL, 0, NULL)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [IsActive], [DeletedBy]) VALUES (27, N'dimitrije.jovanovic.35.19@ict.edu.rs', 1, N'Search orders', N'{"Email":null,"Name":null,"Address":null,"Sneaker":null,"PaymentMethod":null,"PaymentStatus":null,"CreatedFrom":null,"CreatedTo":null,"TotalPriceFrom":null,"TotalPriceTo":null,"Page":1,"PerPage":10}', CAST(N'2023-06-07T17:06:08.6566327' AS DateTime2), NULL, NULL, 0, NULL)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [IsActive], [DeletedBy]) VALUES (28, N'dimitrije.jovanovic.35.19@ict.edu.rs', 1, N'Search orders', N'{"Email":null,"Name":null,"Address":null,"Sneaker":null,"PaymentMethod":null,"PaymentStatus":null,"CreatedFrom":null,"CreatedTo":null,"TotalPriceFrom":null,"TotalPriceTo":null,"Page":1,"PerPage":10}', CAST(N'2023-06-07T18:18:49.9122002' AS DateTime2), NULL, NULL, 0, NULL)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [IsActive], [DeletedBy]) VALUES (29, N'dimitrije.jovanovic.35.19@ict.edu.rs', 1, N'Search orders', N'{"Email":null,"Name":null,"Address":null,"Sneaker":null,"PaymentMethod":null,"PaymentStatus":null,"CreatedFrom":null,"CreatedTo":null,"TotalPriceFrom":null,"TotalPriceTo":null,"Page":1,"PerPage":10}', CAST(N'2023-06-07T18:30:03.6224960' AS DateTime2), NULL, NULL, 0, NULL)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [IsActive], [DeletedBy]) VALUES (30, N'dimitrije.jovanovic.35.19@ict.edu.rs', 1, N'Search orders', N'{"Email":null,"Name":null,"Address":null,"Sneaker":null,"PaymentMethod":null,"PaymentStatus":null,"OrderStatus":null,"CreatedFrom":null,"CreatedTo":null,"TotalPriceFrom":null,"TotalPriceTo":null,"Page":1,"PerPage":10}', CAST(N'2023-06-07T20:33:30.4120661' AS DateTime2), NULL, NULL, 0, NULL)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [IsActive], [DeletedBy]) VALUES (31, N'dimitrije.jovanovic.35.19@ict.edu.rs', 1, N'Search orders', N'{"Email":null,"Name":null,"Address":null,"Sneaker":null,"PaymentMethod":null,"PaymentStatus":null,"OrderStatus":null,"CreatedFrom":null,"CreatedTo":null,"TotalPriceFrom":null,"TotalPriceTo":null,"Page":1,"PerPage":10}', CAST(N'2023-06-07T20:35:24.6653705' AS DateTime2), NULL, NULL, 0, NULL)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [IsActive], [DeletedBy]) VALUES (32, N'dimitrije.jovanovic.35.19@ict.edu.rs', 1, N'Search orders', N'{"Email":null,"Name":null,"Address":null,"Sneaker":null,"PaymentMethod":null,"PaymentStatus":null,"OrderStatus":null,"CreatedFrom":null,"CreatedTo":null,"TotalPriceFrom":null,"TotalPriceTo":null,"Page":1,"PerPage":10}', CAST(N'2023-06-07T20:39:32.9629891' AS DateTime2), NULL, NULL, 0, NULL)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [IsActive], [DeletedBy]) VALUES (33, N'dimitrije.jovanovic.35.19@ict.edu.rs', 1, N'Search orders', N'{"Email":null,"Name":null,"Address":null,"Sneaker":null,"PaymentMethod":null,"PaymentStatus":null,"OrderStatus":null,"CreatedFrom":null,"CreatedTo":null,"TotalPriceFrom":null,"TotalPriceTo":null,"Page":1,"PerPage":10}', CAST(N'2023-06-07T21:23:11.9531527' AS DateTime2), NULL, NULL, 0, NULL)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [IsActive], [DeletedBy]) VALUES (34, N'dimitrije.jovanovic.35.19@ict.edu.rs', 1, N'Search orders', N'{"Email":null,"Name":null,"Address":null,"Sneaker":null,"PaymentMethod":null,"PaymentStatus":null,"OrderStatus":null,"CreatedFrom":null,"CreatedTo":null,"TotalPriceFrom":null,"TotalPriceTo":null,"Page":1,"PerPage":10}', CAST(N'2023-06-07T21:23:59.8276281' AS DateTime2), NULL, NULL, 0, NULL)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [IsActive], [DeletedBy]) VALUES (35, N'dimitrije.jovanovic.35.19@ict.edu.rs', 1, N'Search orders', N'{"Email":null,"Name":null,"Address":null,"Sneaker":null,"PaymentMethod":null,"PaymentStatus":null,"OrderStatus":null,"CreatedFrom":null,"CreatedTo":null,"TotalPriceFrom":null,"TotalPriceTo":null,"Page":1,"PerPage":10}', CAST(N'2023-06-07T21:25:23.8016261' AS DateTime2), NULL, NULL, 0, NULL)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [IsActive], [DeletedBy]) VALUES (36, N'dimitrije.jovanovic.35.19@ict.edu.rs', 1, N'Search orders', N'{"Email":null,"Name":null,"Address":null,"Sneaker":null,"PaymentMethod":null,"PaymentStatus":null,"OrderStatus":null,"CreatedFrom":null,"CreatedTo":null,"TotalPriceFrom":null,"TotalPriceTo":null,"Page":1,"PerPage":10}', CAST(N'2023-06-07T21:55:38.3205642' AS DateTime2), NULL, NULL, 0, NULL)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [IsActive], [DeletedBy]) VALUES (37, N'dimitrije.jovanovic.35.19@ict.edu.rs', 1, N'Search orders', N'{"Email":null,"Name":null,"Address":null,"Sneaker":null,"PaymentMethod":null,"PaymentStatus":null,"OrderStatus":null,"CreatedFrom":null,"CreatedTo":null,"TotalPriceFrom":null,"TotalPriceTo":null,"Page":1,"PerPage":10}', CAST(N'2023-06-07T21:59:54.7819424' AS DateTime2), NULL, NULL, 0, NULL)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [IsActive], [DeletedBy]) VALUES (38, N'dimitrije.jovanovic.35.19@ict.edu.rs', 1, N'Search orders', N'{"Email":null,"Name":null,"Address":null,"Sneaker":null,"PaymentMethod":null,"PaymentStatus":null,"OrderStatus":null,"CreatedFrom":null,"CreatedTo":null,"TotalPriceFrom":null,"TotalPriceTo":null,"Page":1,"PerPage":10}', CAST(N'2023-06-07T22:01:21.1820898' AS DateTime2), NULL, NULL, 0, NULL)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [IsActive], [DeletedBy]) VALUES (39, N'dimitrije.jovanovic.35.19@ict.edu.rs', 1, N'Search orders', N'{"Email":null,"Name":null,"Address":null,"Sneaker":null,"PaymentMethod":null,"PaymentStatus":null,"OrderStatus":null,"CreatedFrom":null,"CreatedTo":null,"TotalPriceFrom":null,"TotalPriceTo":null,"Page":1,"PerPage":10}', CAST(N'2023-06-07T22:04:02.0675944' AS DateTime2), NULL, NULL, 0, NULL)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [IsActive], [DeletedBy]) VALUES (40, N'dimitrije.jovanovic.35.19@ict.edu.rs', 1, N'Search orders', N'{"Email":null,"Name":null,"Address":null,"Sneaker":null,"PaymentMethod":null,"PaymentStatus":null,"OrderStatus":null,"CreatedFrom":null,"CreatedTo":null,"TotalPriceFrom":null,"TotalPriceTo":null,"Page":1,"PerPage":10}', CAST(N'2023-06-07T22:44:46.2655217' AS DateTime2), NULL, NULL, 0, NULL)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [IsActive], [DeletedBy]) VALUES (41, N'dimitrije.jovanovic.35.19@ict.edu.rs', 1, N'Search orders', N'{"Email":null,"Name":null,"Address":null,"Sneaker":null,"PaymentMethod":null,"PaymentStatus":null,"OrderStatus":null,"CreatedFrom":null,"CreatedTo":null,"TotalPriceFrom":null,"TotalPriceTo":null,"Page":1,"PerPage":10}', CAST(N'2023-06-07T22:46:49.3643469' AS DateTime2), NULL, NULL, 0, NULL)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [IsActive], [DeletedBy]) VALUES (42, N'dimitrije.jovanovic.35.19@ict.edu.rs', 1, N'Search orders', N'{"Email":null,"Name":null,"Address":null,"Sneaker":null,"PaymentMethod":null,"PaymentStatus":null,"OrderStatus":null,"CreatedFrom":null,"CreatedTo":null,"TotalPriceFrom":null,"TotalPriceTo":null,"Page":1,"PerPage":10}', CAST(N'2023-06-07T22:52:24.6556003' AS DateTime2), NULL, NULL, 0, NULL)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [IsActive], [DeletedBy]) VALUES (43, N'dimitrije.jovanovic.35.19@ict.edu.rs', 1, N'Search orders', N'{"Email":null,"Name":null,"Address":null,"Sneaker":null,"PaymentMethod":null,"PaymentStatus":null,"OrderStatus":null,"CreatedFrom":null,"CreatedTo":null,"TotalPriceFrom":null,"TotalPriceTo":null,"Page":1,"PerPage":10}', CAST(N'2023-06-07T22:55:36.8306198' AS DateTime2), NULL, NULL, 0, NULL)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [IsActive], [DeletedBy]) VALUES (44, N'dimitrije.jovanovic.35.19@ict.edu.rs', 1, N'Search orders', N'{"Email":null,"Name":null,"Address":null,"Sneaker":null,"PaymentMethod":null,"PaymentStatus":null,"OrderStatus":null,"CreatedFrom":null,"CreatedTo":null,"TotalPriceFrom":null,"TotalPriceTo":null,"Page":1,"PerPage":10}', CAST(N'2023-06-07T23:01:33.0461468' AS DateTime2), NULL, NULL, 0, NULL)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [IsActive], [DeletedBy]) VALUES (45, N'dimitrije.jovanovic.35.19@ict.edu.rs', 1, N'Search orders', N'{"Email":null,"Name":null,"Address":null,"Sneaker":null,"PaymentMethod":null,"PaymentStatus":null,"OrderStatus":null,"CreatedFrom":null,"CreatedTo":null,"TotalPriceFrom":null,"TotalPriceTo":null,"Page":1,"PerPage":10}', CAST(N'2023-06-07T23:04:34.8757983' AS DateTime2), NULL, NULL, 0, NULL)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [IsActive], [DeletedBy]) VALUES (46, N'dimitrije.jovanovic.35.19@ict.edu.rs', 1, N'Search tickets', N'{"Title":null,"UserEmail":null,"UserName":null,"Status":null,"CreatedFrom":null,"CreatedTo":null,"Page":1,"PerPage":10}', CAST(N'2023-06-08T13:00:39.7076521' AS DateTime2), NULL, NULL, 0, NULL)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [IsActive], [DeletedBy]) VALUES (47, N'dimitrije.jovanovic.35.19@ict.edu.rs', 1, N'Search tickets', N'{"Title":null,"UserEmail":"di","UserName":null,"Status":null,"CreatedFrom":null,"CreatedTo":null,"Page":1,"PerPage":10}', CAST(N'2023-06-08T13:01:14.5580944' AS DateTime2), NULL, NULL, 0, NULL)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [IsActive], [DeletedBy]) VALUES (48, N'dimitrije.jovanovic.35.19@ict.edu.rs', 1, N'Search tickets', N'{"Title":null,"UserEmail":null,"UserName":null,"Status":null,"CreatedFrom":null,"CreatedTo":null,"Page":1,"PerPage":10}', CAST(N'2023-06-08T13:01:25.0008197' AS DateTime2), NULL, NULL, 0, NULL)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [IsActive], [DeletedBy]) VALUES (49, N'dimitrije.jovanovic.35.19@ict.edu.rs', 1, N'Search tickets', N'{"Title":"3","UserEmail":null,"UserName":null,"Status":null,"CreatedFrom":null,"CreatedTo":null,"Page":1,"PerPage":10}', CAST(N'2023-06-08T13:01:36.5469414' AS DateTime2), NULL, NULL, 0, NULL)
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [UseCaseName], [UseCaseData], [CreatedAt], [ModifiedAt], [DeletedAt], [IsActive], [DeletedBy]) VALUES (50, N'dimitrije.jovanovic.35.19@ict.edu.rs', 1, N'Find a ticket', N'2', CAST(N'2023-06-08T13:02:06.8572653' AS DateTime2), NULL, NULL, 0, NULL)
SET IDENTITY_INSERT [dbo].[LogEntries] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderItems] ON 

INSERT [dbo].[OrderItems] ([Id], [OrderId], [SneakerId], [CreatedAt], [ModifiedAt], [DeletedAt], [DeletedBy], [IsActive]) VALUES (1, 1, 7, CAST(N'2023-06-07T01:34:15.1666667' AS DateTime2), NULL, NULL, NULL, 1)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [SneakerId], [CreatedAt], [ModifiedAt], [DeletedAt], [DeletedBy], [IsActive]) VALUES (3, 1, 4, CAST(N'2023-06-07T01:34:39.7100000' AS DateTime2), NULL, NULL, NULL, 1)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [SneakerId], [CreatedAt], [ModifiedAt], [DeletedAt], [DeletedBy], [IsActive]) VALUES (4, 2, 8, CAST(N'2023-06-07T19:06:01.1300000' AS DateTime2), NULL, NULL, NULL, 1)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [SneakerId], [CreatedAt], [ModifiedAt], [DeletedAt], [DeletedBy], [IsActive]) VALUES (5, 2, 9, CAST(N'2023-06-07T20:18:40.7733333' AS DateTime2), NULL, NULL, NULL, 1)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [SneakerId], [CreatedAt], [ModifiedAt], [DeletedAt], [DeletedBy], [IsActive]) VALUES (6, 1, 9, CAST(N'2023-06-07T23:23:01.8366667' AS DateTime2), NULL, NULL, NULL, 1)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [SneakerId], [CreatedAt], [ModifiedAt], [DeletedAt], [DeletedBy], [IsActive]) VALUES (7, 1, 10, CAST(N'2023-06-07T23:23:47.3066667' AS DateTime2), NULL, NULL, NULL, 1)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [SneakerId], [CreatedAt], [ModifiedAt], [DeletedAt], [DeletedBy], [IsActive]) VALUES (8, 2, 10, CAST(N'2023-06-07T23:25:17.1566667' AS DateTime2), NULL, NULL, NULL, 1)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [SneakerId], [CreatedAt], [ModifiedAt], [DeletedAt], [DeletedBy], [IsActive]) VALUES (9, 2, 8, CAST(N'2023-06-07T23:55:11.3933333' AS DateTime2), NULL, NULL, NULL, 1)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [SneakerId], [CreatedAt], [ModifiedAt], [DeletedAt], [DeletedBy], [IsActive]) VALUES (10, 2, 8, CAST(N'2023-06-07T23:59:43.0633333' AS DateTime2), NULL, NULL, NULL, 1)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [SneakerId], [CreatedAt], [ModifiedAt], [DeletedAt], [DeletedBy], [IsActive]) VALUES (11, 2, 8, CAST(N'2023-06-08T00:01:13.9033333' AS DateTime2), NULL, NULL, NULL, 1)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [SneakerId], [CreatedAt], [ModifiedAt], [DeletedAt], [DeletedBy], [IsActive]) VALUES (12, 3, 8, CAST(N'2023-06-08T00:03:51.0866667' AS DateTime2), NULL, CAST(N'2023-06-07T22:52:11.0782201' AS DateTime2), NULL, 0)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [SneakerId], [CreatedAt], [ModifiedAt], [DeletedAt], [DeletedBy], [IsActive]) VALUES (13, 3, 4, CAST(N'2023-06-08T00:17:39.4166667' AS DateTime2), NULL, CAST(N'2023-06-07T22:44:34.6489769' AS DateTime2), NULL, 0)
SET IDENTITY_INSERT [dbo].[OrderItems] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [UserId], [DiscountCode], [PaymentStatus], [PaymentMethod], [CreatedAt], [ModifiedAt], [DeletedAt], [DeletedBy], [IsActive], [OrderStatus]) VALUES (1, 1, NULL, 1, 1, CAST(N'2023-06-07T01:33:44.0366667' AS DateTime2), NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Orders] ([Id], [UserId], [DiscountCode], [PaymentStatus], [PaymentMethod], [CreatedAt], [ModifiedAt], [DeletedAt], [DeletedBy], [IsActive], [OrderStatus]) VALUES (2, 1, NULL, 0, 0, CAST(N'2023-06-07T19:06:01.0600000' AS DateTime2), CAST(N'2023-06-07T18:18:40.3611028' AS DateTime2), CAST(N'2023-06-07T18:29:53.1037395' AS DateTime2), NULL, 0, 1)
INSERT [dbo].[Orders] ([Id], [UserId], [DiscountCode], [PaymentStatus], [PaymentMethod], [CreatedAt], [ModifiedAt], [DeletedAt], [DeletedBy], [IsActive], [OrderStatus]) VALUES (3, 1, NULL, 0, 0, CAST(N'2023-06-08T00:03:51.0400000' AS DateTime2), NULL, NULL, NULL, 1, 0)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([Id], [Name], [CreatedAt], [ModifiedAt], [DeletedAt], [DeletedBy], [IsActive], [IsDefault]) VALUES (1, N'Admin', CAST(N'2023-06-03T01:31:26.3533333' AS DateTime2), CAST(N'2023-06-06T23:38:59.3754314' AS DateTime2), NULL, NULL, 1, 0)
INSERT [dbo].[Roles] ([Id], [Name], [CreatedAt], [ModifiedAt], [DeletedAt], [DeletedBy], [IsActive], [IsDefault]) VALUES (2, N'customer', CAST(N'2023-06-06T00:37:50.2433333' AS DateTime2), NULL, CAST(N'2023-06-05T23:06:57.0918702' AS DateTime2), NULL, 0, 1)
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
INSERT [dbo].[RoleUseCases] ([RoleId], [UseCaseId]) VALUES (1, 11)
INSERT [dbo].[RoleUseCases] ([RoleId], [UseCaseId]) VALUES (1, 12)
INSERT [dbo].[RoleUseCases] ([RoleId], [UseCaseId]) VALUES (1, 13)
INSERT [dbo].[RoleUseCases] ([RoleId], [UseCaseId]) VALUES (1, 14)
INSERT [dbo].[RoleUseCases] ([RoleId], [UseCaseId]) VALUES (1, 15)
INSERT [dbo].[RoleUseCases] ([RoleId], [UseCaseId]) VALUES (1, 21)
INSERT [dbo].[RoleUseCases] ([RoleId], [UseCaseId]) VALUES (1, 22)
INSERT [dbo].[RoleUseCases] ([RoleId], [UseCaseId]) VALUES (1, 23)
INSERT [dbo].[RoleUseCases] ([RoleId], [UseCaseId]) VALUES (1, 24)
INSERT [dbo].[RoleUseCases] ([RoleId], [UseCaseId]) VALUES (1, 25)
INSERT [dbo].[RoleUseCases] ([RoleId], [UseCaseId]) VALUES (1, 31)
INSERT [dbo].[RoleUseCases] ([RoleId], [UseCaseId]) VALUES (1, 32)
INSERT [dbo].[RoleUseCases] ([RoleId], [UseCaseId]) VALUES (1, 33)
INSERT [dbo].[RoleUseCases] ([RoleId], [UseCaseId]) VALUES (1, 34)
INSERT [dbo].[RoleUseCases] ([RoleId], [UseCaseId]) VALUES (1, 35)
INSERT [dbo].[RoleUseCases] ([RoleId], [UseCaseId]) VALUES (1, 41)
INSERT [dbo].[RoleUseCases] ([RoleId], [UseCaseId]) VALUES (1, 42)
INSERT [dbo].[RoleUseCases] ([RoleId], [UseCaseId]) VALUES (1, 43)
INSERT [dbo].[RoleUseCases] ([RoleId], [UseCaseId]) VALUES (1, 44)
INSERT [dbo].[RoleUseCases] ([RoleId], [UseCaseId]) VALUES (1, 45)
INSERT [dbo].[RoleUseCases] ([RoleId], [UseCaseId]) VALUES (1, 51)
INSERT [dbo].[RoleUseCases] ([RoleId], [UseCaseId]) VALUES (1, 52)
INSERT [dbo].[RoleUseCases] ([RoleId], [UseCaseId]) VALUES (1, 53)
INSERT [dbo].[RoleUseCases] ([RoleId], [UseCaseId]) VALUES (1, 54)
INSERT [dbo].[RoleUseCases] ([RoleId], [UseCaseId]) VALUES (1, 55)
INSERT [dbo].[RoleUseCases] ([RoleId], [UseCaseId]) VALUES (1, 61)
INSERT [dbo].[RoleUseCases] ([RoleId], [UseCaseId]) VALUES (1, 62)
INSERT [dbo].[RoleUseCases] ([RoleId], [UseCaseId]) VALUES (1, 63)
INSERT [dbo].[RoleUseCases] ([RoleId], [UseCaseId]) VALUES (1, 64)
INSERT [dbo].[RoleUseCases] ([RoleId], [UseCaseId]) VALUES (1, 65)
INSERT [dbo].[RoleUseCases] ([RoleId], [UseCaseId]) VALUES (1, 71)
INSERT [dbo].[RoleUseCases] ([RoleId], [UseCaseId]) VALUES (1, 72)
INSERT [dbo].[RoleUseCases] ([RoleId], [UseCaseId]) VALUES (1, 73)
INSERT [dbo].[RoleUseCases] ([RoleId], [UseCaseId]) VALUES (1, 74)
INSERT [dbo].[RoleUseCases] ([RoleId], [UseCaseId]) VALUES (1, 75)
INSERT [dbo].[RoleUseCases] ([RoleId], [UseCaseId]) VALUES (1, 81)
INSERT [dbo].[RoleUseCases] ([RoleId], [UseCaseId]) VALUES (1, 82)
INSERT [dbo].[RoleUseCases] ([RoleId], [UseCaseId]) VALUES (1, 83)
INSERT [dbo].[RoleUseCases] ([RoleId], [UseCaseId]) VALUES (1, 84)
INSERT [dbo].[RoleUseCases] ([RoleId], [UseCaseId]) VALUES (1, 85)
INSERT [dbo].[RoleUseCases] ([RoleId], [UseCaseId]) VALUES (1, 91)
INSERT [dbo].[RoleUseCases] ([RoleId], [UseCaseId]) VALUES (1, 92)
INSERT [dbo].[RoleUseCases] ([RoleId], [UseCaseId]) VALUES (1, 93)
INSERT [dbo].[RoleUseCases] ([RoleId], [UseCaseId]) VALUES (1, 95)
INSERT [dbo].[RoleUseCases] ([RoleId], [UseCaseId]) VALUES (2, 33)
INSERT [dbo].[RoleUseCases] ([RoleId], [UseCaseId]) VALUES (2, 34)
INSERT [dbo].[RoleUseCases] ([RoleId], [UseCaseId]) VALUES (2, 43)
INSERT [dbo].[RoleUseCases] ([RoleId], [UseCaseId]) VALUES (2, 44)
GO
SET IDENTITY_INSERT [dbo].[Sizes] ON 

INSERT [dbo].[Sizes] ([Id], [Number], [CreatedAt], [ModifiedAt], [DeletedAt], [DeletedBy], [IsActive]) VALUES (1, N'10', CAST(N'2023-05-31T14:08:50.7366667' AS DateTime2), NULL, NULL, NULL, 1)
INSERT [dbo].[Sizes] ([Id], [Number], [CreatedAt], [ModifiedAt], [DeletedAt], [DeletedBy], [IsActive]) VALUES (2, N'5.5', CAST(N'2023-05-31T14:11:57.8966667' AS DateTime2), NULL, NULL, NULL, 1)
INSERT [dbo].[Sizes] ([Id], [Number], [CreatedAt], [ModifiedAt], [DeletedAt], [DeletedBy], [IsActive]) VALUES (3, N'10.5', CAST(N'2023-05-31T17:55:20.7533333' AS DateTime2), NULL, NULL, NULL, 1)
INSERT [dbo].[Sizes] ([Id], [Number], [CreatedAt], [ModifiedAt], [DeletedAt], [DeletedBy], [IsActive]) VALUES (5, N'11', CAST(N'2023-06-01T18:48:25.1466667' AS DateTime2), NULL, NULL, NULL, 1)
INSERT [dbo].[Sizes] ([Id], [Number], [CreatedAt], [ModifiedAt], [DeletedAt], [DeletedBy], [IsActive]) VALUES (6, N'14', CAST(N'2023-06-02T01:04:40.3266667' AS DateTime2), NULL, NULL, NULL, 1)
INSERT [dbo].[Sizes] ([Id], [Number], [CreatedAt], [ModifiedAt], [DeletedAt], [DeletedBy], [IsActive]) VALUES (7, N'8', CAST(N'2023-06-02T01:16:44.8800000' AS DateTime2), NULL, NULL, NULL, 1)
INSERT [dbo].[Sizes] ([Id], [Number], [CreatedAt], [ModifiedAt], [DeletedAt], [DeletedBy], [IsActive]) VALUES (8, N'9', CAST(N'2023-06-02T01:19:32.9666667' AS DateTime2), NULL, NULL, NULL, 1)
INSERT [dbo].[Sizes] ([Id], [Number], [CreatedAt], [ModifiedAt], [DeletedAt], [DeletedBy], [IsActive]) VALUES (9, N'9.5', CAST(N'2023-06-02T01:28:36.3400000' AS DateTime2), NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Sizes] OFF
GO
INSERT [dbo].[SneakerImages] ([SneakerId], [ImageId]) VALUES (8, 2)
INSERT [dbo].[SneakerImages] ([SneakerId], [ImageId]) VALUES (14, 2)
INSERT [dbo].[SneakerImages] ([SneakerId], [ImageId]) VALUES (8, 4)
INSERT [dbo].[SneakerImages] ([SneakerId], [ImageId]) VALUES (14, 4)
INSERT [dbo].[SneakerImages] ([SneakerId], [ImageId]) VALUES (8, 9)
INSERT [dbo].[SneakerImages] ([SneakerId], [ImageId]) VALUES (14, 9)
INSERT [dbo].[SneakerImages] ([SneakerId], [ImageId]) VALUES (9, 10)
INSERT [dbo].[SneakerImages] ([SneakerId], [ImageId]) VALUES (9, 11)
INSERT [dbo].[SneakerImages] ([SneakerId], [ImageId]) VALUES (9, 12)
INSERT [dbo].[SneakerImages] ([SneakerId], [ImageId]) VALUES (10, 13)
INSERT [dbo].[SneakerImages] ([SneakerId], [ImageId]) VALUES (10, 14)
INSERT [dbo].[SneakerImages] ([SneakerId], [ImageId]) VALUES (10, 15)
INSERT [dbo].[SneakerImages] ([SneakerId], [ImageId]) VALUES (11, 16)
INSERT [dbo].[SneakerImages] ([SneakerId], [ImageId]) VALUES (11, 17)
INSERT [dbo].[SneakerImages] ([SneakerId], [ImageId]) VALUES (11, 18)
INSERT [dbo].[SneakerImages] ([SneakerId], [ImageId]) VALUES (12, 19)
INSERT [dbo].[SneakerImages] ([SneakerId], [ImageId]) VALUES (12, 20)
INSERT [dbo].[SneakerImages] ([SneakerId], [ImageId]) VALUES (12, 21)
INSERT [dbo].[SneakerImages] ([SneakerId], [ImageId]) VALUES (13, 22)
INSERT [dbo].[SneakerImages] ([SneakerId], [ImageId]) VALUES (13, 23)
INSERT [dbo].[SneakerImages] ([SneakerId], [ImageId]) VALUES (13, 24)
INSERT [dbo].[SneakerImages] ([SneakerId], [ImageId]) VALUES (16, 35)
INSERT [dbo].[SneakerImages] ([SneakerId], [ImageId]) VALUES (16, 36)
INSERT [dbo].[SneakerImages] ([SneakerId], [ImageId]) VALUES (16, 37)
GO
SET IDENTITY_INSERT [dbo].[Sneakers] ON 

INSERT [dbo].[Sneakers] ([Id], [Model], [Colorway], [Price], [Description], [ReleaseDate], [BrandId], [CreatedAt], [ModifiedAt], [DeletedAt], [DeletedBy], [IsActive]) VALUES (2, N'Air Jordan 3', N'White Cement Reimagend', CAST(220.00 AS Decimal(18, 2)), N'kk', CAST(N'2022-12-12T00:00:00.0000000' AS DateTime2), 2, CAST(N'2023-05-31T00:10:05.2533333' AS DateTime2), NULL, NULL, NULL, 1)
INSERT [dbo].[Sneakers] ([Id], [Model], [Colorway], [Price], [Description], [ReleaseDate], [BrandId], [CreatedAt], [ModifiedAt], [DeletedAt], [DeletedBy], [IsActive]) VALUES (4, N'Air Jordan 4', N'Military Black', CAST(400.00 AS Decimal(18, 2)), N'aa', CAST(N'2022-05-20T00:00:00.0000000' AS DateTime2), 2, CAST(N'2023-05-31T14:08:21.1900000' AS DateTime2), NULL, NULL, NULL, 1)
INSERT [dbo].[Sneakers] ([Id], [Model], [Colorway], [Price], [Description], [ReleaseDate], [BrandId], [CreatedAt], [ModifiedAt], [DeletedAt], [DeletedBy], [IsActive]) VALUES (7, N'Yeezy 700 v3', N'Safflower', CAST(230.00 AS Decimal(18, 2)), N'd', CAST(N'2020-11-11T00:00:00.0000000' AS DateTime2), 6, CAST(N'2023-05-31T14:18:05.5700000' AS DateTime2), NULL, NULL, NULL, 1)
INSERT [dbo].[Sneakers] ([Id], [Model], [Colorway], [Price], [Description], [ReleaseDate], [BrandId], [CreatedAt], [ModifiedAt], [DeletedAt], [DeletedBy], [IsActive]) VALUES (8, N'Dunk Low', N'NBA 75th anniversary Chicago', CAST(180.00 AS Decimal(18, 2)), N'Dunk low celebratiny the Nba''s 75th year anniversary.', CAST(N'2022-06-11T00:00:00.0000000' AS DateTime2), 2, CAST(N'2023-05-31T17:55:20.7533333' AS DateTime2), NULL, CAST(N'2023-06-01T20:57:53.0836971' AS DateTime2), NULL, 0)
INSERT [dbo].[Sneakers] ([Id], [Model], [Colorway], [Price], [Description], [ReleaseDate], [BrandId], [CreatedAt], [ModifiedAt], [DeletedAt], [DeletedBy], [IsActive]) VALUES (9, N'Dunk Low SB', N'Green Apple', CAST(300.00 AS Decimal(18, 2)), N'Kkk', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 2, CAST(N'2023-06-02T00:49:03.1833333' AS DateTime2), NULL, NULL, NULL, 1)
INSERT [dbo].[Sneakers] ([Id], [Model], [Colorway], [Price], [Description], [ReleaseDate], [BrandId], [CreatedAt], [ModifiedAt], [DeletedAt], [DeletedBy], [IsActive]) VALUES (10, N'Air Max 1', N'Anniversay Orange', CAST(200.00 AS Decimal(18, 2)), N'Kkk', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 2, CAST(N'2023-06-02T01:04:40.3300000' AS DateTime2), NULL, NULL, NULL, 1)
INSERT [dbo].[Sneakers] ([Id], [Model], [Colorway], [Price], [Description], [ReleaseDate], [BrandId], [CreatedAt], [ModifiedAt], [DeletedAt], [DeletedBy], [IsActive]) VALUES (11, N'Air Max 1', N'Anniversay Orange', CAST(200.00 AS Decimal(18, 2)), N'Kkk', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 2, CAST(N'2023-06-02T01:11:12.9266667' AS DateTime2), NULL, NULL, NULL, 1)
INSERT [dbo].[Sneakers] ([Id], [Model], [Colorway], [Price], [Description], [ReleaseDate], [BrandId], [CreatedAt], [ModifiedAt], [DeletedAt], [DeletedBy], [IsActive]) VALUES (12, N'Air Max 1', N'Anniversay Orange', CAST(200.00 AS Decimal(18, 2)), N'Kkk', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 2, CAST(N'2023-06-02T01:16:44.8833333' AS DateTime2), NULL, NULL, NULL, 1)
INSERT [dbo].[Sneakers] ([Id], [Model], [Colorway], [Price], [Description], [ReleaseDate], [BrandId], [CreatedAt], [ModifiedAt], [DeletedAt], [DeletedBy], [IsActive]) VALUES (13, N'Air Max 1', N'Anniversay Orange', CAST(200.00 AS Decimal(18, 2)), N'Kkk', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 2, CAST(N'2023-06-02T01:19:32.9700000' AS DateTime2), NULL, NULL, NULL, 1)
INSERT [dbo].[Sneakers] ([Id], [Model], [Colorway], [Price], [Description], [ReleaseDate], [BrandId], [CreatedAt], [ModifiedAt], [DeletedAt], [DeletedBy], [IsActive]) VALUES (14, N'Jordan 12', N'Space Jam', CAST(400.00 AS Decimal(18, 2)), N'Kkk', CAST(N'2017-12-25T00:00:00.0000000' AS DateTime2), 2, CAST(N'2023-06-02T01:28:35.8300000' AS DateTime2), NULL, NULL, NULL, 1)
INSERT [dbo].[Sneakers] ([Id], [Model], [Colorway], [Price], [Description], [ReleaseDate], [BrandId], [CreatedAt], [ModifiedAt], [DeletedAt], [DeletedBy], [IsActive]) VALUES (16, N'2002r Refiend Future', N'Lunar New Year', CAST(230.00 AS Decimal(18, 2)), N'A special eddition of 2002r model celebrating Lunar New Year', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 7, CAST(N'2023-06-08T11:39:08.2733333' AS DateTime2), NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Sneakers] OFF
GO
INSERT [dbo].[SneakerSizes] ([SneakerId], [SizeId]) VALUES (4, 1)
INSERT [dbo].[SneakerSizes] ([SneakerId], [SizeId]) VALUES (7, 1)
INSERT [dbo].[SneakerSizes] ([SneakerId], [SizeId]) VALUES (8, 1)
INSERT [dbo].[SneakerSizes] ([SneakerId], [SizeId]) VALUES (14, 1)
INSERT [dbo].[SneakerSizes] ([SneakerId], [SizeId]) VALUES (16, 1)
INSERT [dbo].[SneakerSizes] ([SneakerId], [SizeId]) VALUES (2, 2)
INSERT [dbo].[SneakerSizes] ([SneakerId], [SizeId]) VALUES (8, 5)
INSERT [dbo].[SneakerSizes] ([SneakerId], [SizeId]) VALUES (14, 9)
GO
SET IDENTITY_INSERT [dbo].[Tickets] ON 

INSERT [dbo].[Tickets] ([Id], [UserId], [Title], [Description], [Status], [CreatedAt], [ModifiedAt], [DeletedAt], [DeletedBy], [IsActive]) VALUES (2, 1, N'An Issue', N'Issue text ... ', 3, CAST(N'2023-06-08T14:52:22.4933333' AS DateTime2), NULL, CAST(N'2023-06-08T13:02:12.4611038' AS DateTime2), NULL, 0)
INSERT [dbo].[Tickets] ([Id], [UserId], [Title], [Description], [Status], [CreatedAt], [ModifiedAt], [DeletedAt], [DeletedBy], [IsActive]) VALUES (3, 1, N'An Issue 2', N'Issue text ... ', 0, CAST(N'2023-06-08T14:52:33.2933333' AS DateTime2), NULL, NULL, NULL, 1)
INSERT [dbo].[Tickets] ([Id], [UserId], [Title], [Description], [Status], [CreatedAt], [ModifiedAt], [DeletedAt], [DeletedBy], [IsActive]) VALUES (4, 1, N'An Issue 3', N'Issue text ... ', 0, CAST(N'2023-06-08T14:52:38.9066667' AS DateTime2), NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Tickets] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Email], [Password], [FirstName], [LastName], [RoleId], [AddressId], [CreatedAt], [ModifiedAt], [DeletedAt], [DeletedBy], [IsActive]) VALUES (1, N'dimitrije.jovanovic.35.19@ict.edu.rs', N'sifra1', N'Dimitrije', N'Jovanovic', 1, 1, CAST(N'2023-06-03T01:34:50.6900000' AS DateTime2), NULL, NULL, NULL, 1)
INSERT [dbo].[Users] ([Id], [Email], [Password], [FirstName], [LastName], [RoleId], [AddressId], [CreatedAt], [ModifiedAt], [DeletedAt], [DeletedBy], [IsActive]) VALUES (2, N'dimitrije@mail.com', N'Sifra123!', N'Dragan', N'Jovanovic', 1, 3, CAST(N'2023-06-05T19:31:03.2733333' AS DateTime2), CAST(N'2023-06-05T18:15:43.2841364' AS DateTime2), CAST(N'2023-06-05T20:04:51.4429622' AS DateTime2), NULL, 0)
INSERT [dbo].[Users] ([Id], [Email], [Password], [FirstName], [LastName], [RoleId], [AddressId], [CreatedAt], [ModifiedAt], [DeletedAt], [DeletedBy], [IsActive]) VALUES (4, N'mika@ict.edu.rs', N'$2a$10$zK5VT2r8Spk3NeeOAEeIGuT8yf12eyoO1A/kIv.XAFGBgj5wDgIBK', N'Mika', N'Mikic', 2, 5, CAST(N'2023-06-08T11:46:51.9900000' AS DateTime2), NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
/****** Object:  Index [IX_Brands_LogoId]    Script Date: 8.6.2023. 18:10:48 ******/
CREATE NONCLUSTERED INDEX [IX_Brands_LogoId] ON [dbo].[Brands]
(
	[LogoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Favorites_SneakerId]    Script Date: 8.6.2023. 18:10:48 ******/
CREATE NONCLUSTERED INDEX [IX_Favorites_SneakerId] ON [dbo].[Favorites]
(
	[SneakerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Favorites_UserId]    Script Date: 8.6.2023. 18:10:48 ******/
CREATE NONCLUSTERED INDEX [IX_Favorites_UserId] ON [dbo].[Favorites]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderItems_OrderId]    Script Date: 8.6.2023. 18:10:48 ******/
CREATE NONCLUSTERED INDEX [IX_OrderItems_OrderId] ON [dbo].[OrderItems]
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderItems_SneakerId]    Script Date: 8.6.2023. 18:10:48 ******/
CREATE NONCLUSTERED INDEX [IX_OrderItems_SneakerId] ON [dbo].[OrderItems]
(
	[SneakerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Orders_UserId]    Script Date: 8.6.2023. 18:10:48 ******/
CREATE NONCLUSTERED INDEX [IX_Orders_UserId] ON [dbo].[Orders]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Roles_Name]    Script Date: 8.6.2023. 18:10:48 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Roles_Name] ON [dbo].[Roles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Sizes_Number]    Script Date: 8.6.2023. 18:10:48 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Sizes_Number] ON [dbo].[Sizes]
(
	[Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SneakerImages_ImageId]    Script Date: 8.6.2023. 18:10:48 ******/
CREATE NONCLUSTERED INDEX [IX_SneakerImages_ImageId] ON [dbo].[SneakerImages]
(
	[ImageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Sneakers_BrandId]    Script Date: 8.6.2023. 18:10:48 ******/
CREATE NONCLUSTERED INDEX [IX_Sneakers_BrandId] ON [dbo].[Sneakers]
(
	[BrandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SneakerSizes_SizeId]    Script Date: 8.6.2023. 18:10:48 ******/
CREATE NONCLUSTERED INDEX [IX_SneakerSizes_SizeId] ON [dbo].[SneakerSizes]
(
	[SizeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_TicketMessages_TicketId]    Script Date: 8.6.2023. 18:10:48 ******/
CREATE NONCLUSTERED INDEX [IX_TicketMessages_TicketId] ON [dbo].[TicketMessages]
(
	[TicketId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Tickets_UserId]    Script Date: 8.6.2023. 18:10:48 ******/
CREATE NONCLUSTERED INDEX [IX_Tickets_UserId] ON [dbo].[Tickets]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Users_AddressId]    Script Date: 8.6.2023. 18:10:48 ******/
CREATE NONCLUSTERED INDEX [IX_Users_AddressId] ON [dbo].[Users]
(
	[AddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Users_Email]    Script Date: 8.6.2023. 18:10:48 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Users_Email] ON [dbo].[Users]
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Users_RoleId]    Script Date: 8.6.2023. 18:10:48 ******/
CREATE NONCLUSTERED INDEX [IX_Users_RoleId] ON [dbo].[Users]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Addresses] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Addresses] ADD  DEFAULT (CONVERT([bit],(1))) FOR [IsActive]
GO
ALTER TABLE [dbo].[Brands] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Brands] ADD  DEFAULT (CONVERT([bit],(1))) FOR [IsActive]
GO
ALTER TABLE [dbo].[Images] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Images] ADD  DEFAULT (CONVERT([bit],(1))) FOR [IsActive]
GO
ALTER TABLE [dbo].[OrderItems] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[OrderItems] ADD  DEFAULT (CONVERT([bit],(1))) FOR [IsActive]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT (CONVERT([bit],(1))) FOR [IsActive]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT ((0)) FOR [OrderStatus]
GO
ALTER TABLE [dbo].[Roles] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Roles] ADD  DEFAULT (CONVERT([bit],(1))) FOR [IsActive]
GO
ALTER TABLE [dbo].[Roles] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDefault]
GO
ALTER TABLE [dbo].[Sizes] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Sizes] ADD  DEFAULT (CONVERT([bit],(1))) FOR [IsActive]
GO
ALTER TABLE [dbo].[Sneakers] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Sneakers] ADD  DEFAULT (CONVERT([bit],(1))) FOR [IsActive]
GO
ALTER TABLE [dbo].[TicketMessages] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[TicketMessages] ADD  DEFAULT (CONVERT([bit],(1))) FOR [IsActive]
GO
ALTER TABLE [dbo].[Tickets] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Tickets] ADD  DEFAULT (CONVERT([bit],(1))) FOR [IsActive]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (CONVERT([bit],(1))) FOR [IsActive]
GO
ALTER TABLE [dbo].[Brands]  WITH CHECK ADD  CONSTRAINT [FK_Brands_Images_LogoId] FOREIGN KEY([LogoId])
REFERENCES [dbo].[Images] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Brands] CHECK CONSTRAINT [FK_Brands_Images_LogoId]
GO
ALTER TABLE [dbo].[Favorites]  WITH CHECK ADD  CONSTRAINT [FK_Favorites_Sneakers_SneakerId] FOREIGN KEY([SneakerId])
REFERENCES [dbo].[Sneakers] ([Id])
GO
ALTER TABLE [dbo].[Favorites] CHECK CONSTRAINT [FK_Favorites_Sneakers_SneakerId]
GO
ALTER TABLE [dbo].[Favorites]  WITH CHECK ADD  CONSTRAINT [FK_Favorites_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Favorites] CHECK CONSTRAINT [FK_Favorites_Users_UserId]
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD  CONSTRAINT [FK_OrderItems_Orders_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[OrderItems] CHECK CONSTRAINT [FK_OrderItems_Orders_OrderId]
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD  CONSTRAINT [FK_OrderItems_Sneakers_SneakerId] FOREIGN KEY([SneakerId])
REFERENCES [dbo].[Sneakers] ([Id])
GO
ALTER TABLE [dbo].[OrderItems] CHECK CONSTRAINT [FK_OrderItems_Sneakers_SneakerId]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Users_UserId]
GO
ALTER TABLE [dbo].[RoleUseCases]  WITH CHECK ADD  CONSTRAINT [FK_RoleUseCases_Roles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[RoleUseCases] CHECK CONSTRAINT [FK_RoleUseCases_Roles_RoleId]
GO
ALTER TABLE [dbo].[SneakerImages]  WITH CHECK ADD  CONSTRAINT [FK_SneakerImages_Images_ImageId] FOREIGN KEY([ImageId])
REFERENCES [dbo].[Images] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SneakerImages] CHECK CONSTRAINT [FK_SneakerImages_Images_ImageId]
GO
ALTER TABLE [dbo].[SneakerImages]  WITH CHECK ADD  CONSTRAINT [FK_SneakerImages_Sneakers_SneakerId] FOREIGN KEY([SneakerId])
REFERENCES [dbo].[Sneakers] ([Id])
GO
ALTER TABLE [dbo].[SneakerImages] CHECK CONSTRAINT [FK_SneakerImages_Sneakers_SneakerId]
GO
ALTER TABLE [dbo].[Sneakers]  WITH CHECK ADD  CONSTRAINT [FK_Sneakers_Brands_BrandId] FOREIGN KEY([BrandId])
REFERENCES [dbo].[Brands] ([Id])
GO
ALTER TABLE [dbo].[Sneakers] CHECK CONSTRAINT [FK_Sneakers_Brands_BrandId]
GO
ALTER TABLE [dbo].[SneakerSizes]  WITH CHECK ADD  CONSTRAINT [FK_SneakerSizes_Sizes_SizeId] FOREIGN KEY([SizeId])
REFERENCES [dbo].[Sizes] ([Id])
GO
ALTER TABLE [dbo].[SneakerSizes] CHECK CONSTRAINT [FK_SneakerSizes_Sizes_SizeId]
GO
ALTER TABLE [dbo].[SneakerSizes]  WITH CHECK ADD  CONSTRAINT [FK_SneakerSizes_Sneakers_SneakerId] FOREIGN KEY([SneakerId])
REFERENCES [dbo].[Sneakers] ([Id])
GO
ALTER TABLE [dbo].[SneakerSizes] CHECK CONSTRAINT [FK_SneakerSizes_Sneakers_SneakerId]
GO
ALTER TABLE [dbo].[TicketMessages]  WITH CHECK ADD  CONSTRAINT [FK_TicketMessages_Tickets_TicketId] FOREIGN KEY([TicketId])
REFERENCES [dbo].[Tickets] ([Id])
GO
ALTER TABLE [dbo].[TicketMessages] CHECK CONSTRAINT [FK_TicketMessages_Tickets_TicketId]
GO
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD  CONSTRAINT [FK_Tickets_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Tickets] CHECK CONSTRAINT [FK_Tickets_Users_UserId]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Addresses_AddressId] FOREIGN KEY([AddressId])
REFERENCES [dbo].[Addresses] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Addresses_AddressId]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles_RoleId]
GO
USE [master]
GO
ALTER DATABASE [SneakerResaleStore] SET  READ_WRITE 
GO
