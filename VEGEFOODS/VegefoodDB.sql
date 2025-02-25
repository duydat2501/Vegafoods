USE [master]
GO
/****** Object:  Database [VegeFood]    Script Date: 14/07/2024 1:29:35 CH ******/
CREATE DATABASE [VegeFood]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'VegeFood', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\VegeFood.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'VegeFood_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\VegeFood_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [VegeFood] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [VegeFood].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [VegeFood] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [VegeFood] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [VegeFood] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [VegeFood] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [VegeFood] SET ARITHABORT OFF 
GO
ALTER DATABASE [VegeFood] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [VegeFood] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [VegeFood] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [VegeFood] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [VegeFood] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [VegeFood] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [VegeFood] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [VegeFood] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [VegeFood] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [VegeFood] SET  DISABLE_BROKER 
GO
ALTER DATABASE [VegeFood] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [VegeFood] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [VegeFood] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [VegeFood] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [VegeFood] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [VegeFood] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [VegeFood] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [VegeFood] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [VegeFood] SET  MULTI_USER 
GO
ALTER DATABASE [VegeFood] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [VegeFood] SET DB_CHAINING OFF 
GO
ALTER DATABASE [VegeFood] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [VegeFood] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [VegeFood] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [VegeFood] SET QUERY_STORE = OFF
GO
USE [VegeFood]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 14/07/2024 1:29:36 CH ******/
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
/****** Object:  Table [dbo].[Banners]    Script Date: 14/07/2024 1:29:36 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Banners](
	[BAN_ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Image] [nvarchar](max) NULL,
	[Url] [nvarchar](max) NULL,
	[DisplayOrder] [int] NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NOT NULL,
	[UpdatedBy] [int] NOT NULL,
 CONSTRAINT [PK_Banners] PRIMARY KEY CLUSTERED 
(
	[BAN_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CartDetails]    Script Date: 14/07/2024 1:29:36 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartDetails](
	[CARD_ID] [int] IDENTITY(1,1) NOT NULL,
	[CAR_ID] [int] NOT NULL,
	[PRO_ID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[DiscountPrice] [decimal](18, 2) NULL,
 CONSTRAINT [PK_CartDetails] PRIMARY KEY CLUSTERED 
(
	[CARD_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Carts]    Script Date: 14/07/2024 1:29:36 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carts](
	[CAR_ID] [int] IDENTITY(1,1) NOT NULL,
	[USE_ID] [int] NOT NULL,
	[MEM_ID] [int] NOT NULL,
	[CartDate] [datetime2](7) NOT NULL,
	[CustomerName] [nvarchar](max) NULL,
	[Phone] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[TotalPrice] [decimal](18, 2) NULL,
	[Discount] [float] NULL,
	[PaymentMethod] [nvarchar](max) NULL,
	[Note] [nvarchar](max) NULL,
	[Status] [int] NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NOT NULL,
	[UpdatedBy] [int] NOT NULL,
 CONSTRAINT [PK_Carts] PRIMARY KEY CLUSTERED 
(
	[CAR_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 14/07/2024 1:29:36 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CAT_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[DisplayOrder] [int] NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NOT NULL,
	[UpdatedBy] [int] NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CAT_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeliveryPersonnel]    Script Date: 14/07/2024 1:29:36 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeliveryPersonnel](
	[DEL_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Phone] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NOT NULL,
	[UpdatedBy] [int] NOT NULL,
 CONSTRAINT [PK_DeliveryPersonnel] PRIMARY KEY CLUSTERED 
(
	[DEL_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Members]    Script Date: 14/07/2024 1:29:36 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Members](
	[MEM_ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[LastName] [nvarchar](max) NULL,
	[FirstName] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[Phone] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NOT NULL,
	[UpdatedBy] [int] NOT NULL,
 CONSTRAINT [PK_Members] PRIMARY KEY CLUSTERED 
(
	[MEM_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menus]    Script Date: 14/07/2024 1:29:36 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menus](
	[MEN_ID] [int] IDENTITY(1,1) NOT NULL,
	[PARENT_ID] [int] NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Url] [nvarchar](max) NULL,
	[DisplayOrder] [int] NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NOT NULL,
	[UpdatedBy] [int] NOT NULL,
 CONSTRAINT [PK_Menus] PRIMARY KEY CLUSTERED 
(
	[MEN_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 14/07/2024 1:29:36 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[ORDD_ID] [int] IDENTITY(1,1) NOT NULL,
	[ORD_ID] [int] NOT NULL,
	[PRO_ID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[DiscountPrice] [decimal](18, 2) NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NOT NULL,
	[UpdatedBy] [int] NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[ORDD_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 14/07/2024 1:29:36 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[ORD_ID] [int] IDENTITY(1,1) NOT NULL,
	[USE_ID] [int] NOT NULL,
	[MEM_ID] [int] NOT NULL,
	[SHIP_ID] [int] NOT NULL,
	[DEL_ID] [int] NOT NULL,
	[OrderDate] [datetime2](7) NOT NULL,
	[CustomerLastName] [nvarchar](max) NULL,
	[CustomerFirstName] [nvarchar](max) NULL,
	[Phone] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[TotalPrice] [decimal](18, 2) NULL,
	[Discount] [float] NULL,
	[PaymentMethod] [nvarchar](max) NULL,
	[IsPaid] [bit] NULL,
	[Status] [int] NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NOT NULL,
	[UpdatedBy] [int] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[ORD_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 14/07/2024 1:29:36 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[PRO_ID] [int] IDENTITY(1,1) NOT NULL,
	[CAT_ID] [int] NOT NULL,
	[Avatar] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Intro] [nvarchar](max) NULL,
	[Price] [decimal](18, 2) NULL,
	[DiscountPrice] [decimal](18, 2) NULL,
	[Unit] [nvarchar](max) NULL,
	[Rate] [real] NULL,
	[Description] [nvarchar](max) NULL,
	[Details] [nvarchar](max) NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NOT NULL,
	[UpdatedBy] [int] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[PRO_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoleClaims]    Script Date: 14/07/2024 1:29:36 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_RoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 14/07/2024 1:29:36 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Settings]    Script Date: 14/07/2024 1:29:36 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Settings](
	[SET_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Value] [nvarchar](max) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NOT NULL,
	[UpdatedBy] [int] NOT NULL,
 CONSTRAINT [PK_Settings] PRIMARY KEY CLUSTERED 
(
	[SET_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shipping]    Script Date: 14/07/2024 1:29:36 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipping](
	[SHIP_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Phone] [nvarchar](max) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NOT NULL,
	[UpdatedBy] [int] NOT NULL,
 CONSTRAINT [PK_Shipping] PRIMARY KEY CLUSTERED 
(
	[SHIP_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserClaims]    Script Date: 14/07/2024 1:29:36 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_UserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserLogins]    Script Date: 14/07/2024 1:29:36 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_UserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRoles]    Script Date: 14/07/2024 1:29:36 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 14/07/2024 1:29:36 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserTokens]    Script Date: 14/07/2024 1:29:36 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_UserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240711122441_Init', N'8.0.6')
GO
SET IDENTITY_INSERT [dbo].[Banners] ON 

INSERT [dbo].[Banners] ([BAN_ID], [Title], [Image], [Url], [DisplayOrder], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, N'bg1', N'133651770007326500_bg1.jpg', N'a', 1, CAST(N'2024-07-11T20:10:00.7153972' AS DateTime2), 0, CAST(N'2024-07-11T20:10:00.7153977' AS DateTime2), 0)
INSERT [dbo].[Banners] ([BAN_ID], [Title], [Image], [Url], [DisplayOrder], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (2, N'bg2', N'133651778546968097_bg_1.jpg', N'a', 2, CAST(N'2024-07-11T20:10:12.8534357' AS DateTime2), 0, CAST(N'2024-07-11T20:10:12.8534366' AS DateTime2), 0)
INSERT [dbo].[Banners] ([BAN_ID], [Title], [Image], [Url], [DisplayOrder], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (3, N'bg3', N'133651778730512239_bg_2.jpg', N'a', 3, CAST(N'2024-07-11T20:10:22.4995507' AS DateTime2), 0, CAST(N'2024-07-11T20:10:22.4995519' AS DateTime2), 0)
SET IDENTITY_INSERT [dbo].[Banners] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CAT_ID], [Name], [DisplayOrder], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, N'Trái cây', 1, CAST(N'2024-07-11T19:31:23.1531681' AS DateTime2), 0, CAST(N'2024-07-11T19:31:23.1533263' AS DateTime2), 0)
INSERT [dbo].[Categories] ([CAT_ID], [Name], [DisplayOrder], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (2, N'Đồ uống', 2, CAST(N'2024-07-11T19:31:28.8416976' AS DateTime2), 0, CAST(N'2024-07-11T19:31:28.8416992' AS DateTime2), 0)
INSERT [dbo].[Categories] ([CAT_ID], [Name], [DisplayOrder], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (3, N'Rau củ', 3, CAST(N'2024-07-11T19:31:35.2485147' AS DateTime2), 0, CAST(N'2024-07-11T19:31:35.2485162' AS DateTime2), 0)
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Menus] ON 

INSERT [dbo].[Menus] ([MEN_ID], [PARENT_ID], [Title], [Url], [DisplayOrder], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, NULL, N'Trang chủ', N'', 1, CAST(N'2024-07-11T19:29:15.0709002' AS DateTime2), 1, CAST(N'2024-07-11T19:29:15.0736830' AS DateTime2), 1)
INSERT [dbo].[Menus] ([MEN_ID], [PARENT_ID], [Title], [Url], [DisplayOrder], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (2, NULL, N'Giới thiệu', N'', 1, CAST(N'2024-07-11T19:29:15.0744598' AS DateTime2), 1, CAST(N'2024-07-11T19:29:15.0744615' AS DateTime2), 1)
INSERT [dbo].[Menus] ([MEN_ID], [PARENT_ID], [Title], [Url], [DisplayOrder], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (3, NULL, N'Liên hệ', N'', 1, CAST(N'2024-07-11T19:29:15.0744623' AS DateTime2), 1, CAST(N'2024-07-11T19:29:15.0744624' AS DateTime2), 1)
SET IDENTITY_INSERT [dbo].[Menus] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([PRO_ID], [CAT_ID], [Avatar], [Name], [Intro], [Price], [DiscountPrice], [Unit], [Rate], [Description], [Details], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, 1, N'133651750791981647_cam.webp', N'Cam', N'Cam sành hữu cơ', CAST(30000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'kg', NULL, N'Cam sành hữu cơ là loại cam quen thuộc của vùng nhiệt đới Việt Nam.', N'Quả cam sành rất dễ nhận ra nhờ lớp vỏ dày, sần sùi giống bề mặt mảnh sành, và thường có màu lục nhạt (khi chín có sắc cam), các múi thịt có màu cam. Cam sành tại Organic được chọn lựa kỹ càng từ chính nông trại của Organic được chứng nhận USDA, Organic E', CAST(N'2024-07-11T19:37:59.1857330' AS DateTime2), 0, CAST(N'2024-07-11T19:37:59.1857338' AS DateTime2), 0)
INSERT [dbo].[Products] ([PRO_ID], [CAT_ID], [Avatar], [Name], [Intro], [Price], [DiscountPrice], [Unit], [Rate], [Description], [Details], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (2, 1, N'133651751721891363_dudu.webp', N'Đu đủ', N'Đu đủ ruột vàng', CAST(20000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'kg', NULL, N'Đu đủ có thể ăn trực tiếp, nấu canh với sườn, làm sinh tố,...', N'Đu đủ có ruột vàng, ăn có vị ngọt thanh. Ngoài ra, đu đủ có chứa chất chống oxy hóa tốt cho cơ thể là carotenoid, nhất là lycopene, giúp cơ thể hấp thụ tốt hơn các chất chống oxy hóa trong các loại trái cây và rau quả khác. Vitamin C và lycopene có trong ', CAST(N'2024-07-11T19:39:32.1887441' AS DateTime2), 0, CAST(N'2024-07-11T19:39:32.1887446' AS DateTime2), 0)
INSERT [dbo].[Products] ([PRO_ID], [CAT_ID], [Avatar], [Name], [Intro], [Price], [DiscountPrice], [Unit], [Rate], [Description], [Details], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (3, 1, N'133651752786021146_saurieng.webp', N'Sầu riêng', N'Sầu Riêng Hữu Cơ', CAST(120000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'kg', NULL, N'SẦU RIÊNG HỮU CƠ ĐẠT CHỨNG NHẬN HỮU CƠ LIÊN MINH CHÂU ÂU', N'Sầu riêng, được mệnh danh là "vua của các loại trái cây", không chỉ nổi tiếng bởi hương vị đặc trưng mà còn bởi giá trị dinh dưỡng phong phú. Sầu riêng hữu cơ, với quy trình trồng trọt an toàn và không sử dụng hóa chất, đang trở thành lựa chọn ưu tiên của', CAST(N'2024-07-11T19:41:18.6017019' AS DateTime2), 0, CAST(N'2024-07-11T19:41:18.6017024' AS DateTime2), 0)
INSERT [dbo].[Products] ([PRO_ID], [CAT_ID], [Avatar], [Name], [Intro], [Price], [DiscountPrice], [Unit], [Rate], [Description], [Details], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (4, 1, N'133651753670806708_mangcut.webp', N'Măng Cụt', N'Măng Cụt Canh Tác Vi Sinh', CAST(22000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'kg', NULL, N'Quả Măng Cụt Canh Tác Vi Sinh: Sự Lựa Chọn Tối Ưu Cho Sức Khỏe', N'Quả măng cụt, được mệnh danh là "nữ hoàng của các loại trái cây nhiệt đới", không chỉ nổi tiếng bởi hương vị thơm ngon mà còn bởi giá trị dinh dưỡng vượt trội. Đặc biệt, măng cụt canh tác vi sinh đang trở thành xu hướng được nhiều người tiêu dùng ưu chuộn', CAST(N'2024-07-11T19:42:47.0805147' AS DateTime2), 0, CAST(N'2024-07-11T19:42:47.0805154' AS DateTime2), 0)
INSERT [dbo].[Products] ([PRO_ID], [CAT_ID], [Avatar], [Name], [Intro], [Price], [DiscountPrice], [Unit], [Rate], [Description], [Details], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (5, 3, N'133651754611924213_cachua.webp', N'Cà chua', N'Cà chua bee ngọt hữu cơ ', CAST(15000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'kg', NULL, N'Cà chua bi rất giàu vitamin C, vitamin A và canxi. ', N'Những lợi ích sức khỏe của chúng là chất chống oxy hóa đáng chú ý và phòng chống ung thư. Theo WHFoods, trong một nghiên cứu 14 tháng,trên Tạp chí của Viện Ung thư Quốc gia tìm thấy cà chua đóng một vai t', CAST(N'2024-07-11T19:44:21.1919974' AS DateTime2), 0, CAST(N'2024-07-11T19:44:21.1919986' AS DateTime2), 0)
INSERT [dbo].[Products] ([PRO_ID], [CAT_ID], [Avatar], [Name], [Intro], [Price], [DiscountPrice], [Unit], [Rate], [Description], [Details], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (6, 3, N'133651755680346748_toi.webp', N'Tỏi', N'Tỏi tép hữu cơ', CAST(35000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'kg', NULL, N'Tỏi tép hữu cơ', N'1 năm nông dân trồng măng tây và đan xen 2 vụ đậu phộng và 1 vụ tỏi. Việc đan xen này cũng giúp cho đất tốt hơn, đỡ bệnh cho cây. Trang trại sử dụng năng lượng mặt trời toàn bộ cho hệ thống farm, đã được chứng nhận hữu cơ theo tiêu chuẩn USDA organic.', CAST(N'2024-07-11T19:46:08.0337312' AS DateTime2), 0, CAST(N'2024-07-11T19:46:08.0337338' AS DateTime2), 0)
INSERT [dbo].[Products] ([PRO_ID], [CAT_ID], [Avatar], [Name], [Intro], [Price], [DiscountPrice], [Unit], [Rate], [Description], [Details], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (7, 1, N'133651756777847817_susu.webp', N'Su su', N'Su su hữu cơ', CAST(32000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'kg', NULL, N'Ngọn su su hợp nhất là xào tỏi chứ không mấy khi luộc hoặc nấu canh', N'Chỉ đơn giản ra giàn su su và chọn cắt vài đọt su su ở nhánh lá thứ hai kể từ ngọn vì đó là phần mềm và ngọt nhất. Sau đó, tước bỏ lớp xơ bên ngoài và bẻ thành những đoạn ngắn rồi rửa sạch và để ráo nước. Khi chế biến, trước tiên cho một ít dầu ăn vào chả', CAST(N'2024-07-11T19:47:57.7845874' AS DateTime2), 0, CAST(N'2024-07-11T19:47:57.7845878' AS DateTime2), 0)
INSERT [dbo].[Products] ([PRO_ID], [CAT_ID], [Avatar], [Name], [Intro], [Price], [DiscountPrice], [Unit], [Rate], [Description], [Details], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (8, 2, N'133651757938396042_nuocanhdaoden.webp', N'Nước anh đào đen', N'Nước anh đào đen hữu cơ hiệu Georgia''s Natural', CAST(95000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'Chai', NULL, N'Sản phẩm nước ép từ Georgia''s Natural sử dụng 100% trái cây tươi được trồng và sản xuất theo tiêu chuẩn châu Âu, được chứng nhận USDA ORGANIC.', N'Sử dụng công nghệ ép lạnh (Cold-Pressed) hiện đại giúp giữ nguyên dưỡng chất từ rau củ hữu cơ và trái cây tươi sạch mà không làm mất đi các enzim và dưỡng chất. Công nghệ ép lạnh hạn chế tối đa quá trình oxy hoá, không làm giảm ', CAST(N'2024-07-11T19:49:53.8393731' AS DateTime2), 0, CAST(N'2024-07-11T19:49:53.8393742' AS DateTime2), 0)
INSERT [dbo].[Products] ([PRO_ID], [CAT_ID], [Avatar], [Name], [Intro], [Price], [DiscountPrice], [Unit], [Rate], [Description], [Details], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (9, 2, N'133651759104272050_cotra.jpg', N'Cúc Cổ Trà ', N'Cúc Cổ Trà Hữu Cơ Karose', CAST(200000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'Túi', NULL, N'Cúc cổ trà là loại cúc cổ có trong vườn Karose từ hàng chục năm nay được nhân giống rộng', N'Cúc cổ Karose là giống cúc thơm không ngái, vị ngọt không hề nhân nhận đắng, giúp ngủ tốt và vô cùng ngon miệng. Kể cảm người ghét cúc cỡ nào cũng bất ngờ vì mùi thơm và vị ngon của nó.
 ', CAST(N'2024-07-11T19:51:50.4270190' AS DateTime2), 0, CAST(N'2024-07-11T19:51:50.4270197' AS DateTime2), 0)
INSERT [dbo].[Products] ([PRO_ID], [CAT_ID], [Avatar], [Name], [Intro], [Price], [DiscountPrice], [Unit], [Rate], [Description], [Details], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (10, 2, N'133651760235190758_tracacao.jpeg', N'Trà cacao', N'Trà cacao hữu cơ ', CAST(68000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'gam', NULL, N'Ca cao rất giàu polyphenol, có lợi ích sức khỏe đáng kể, bao gồm giảm viêm và cải thiện mức cholesterol, giảm stress', N'Trà cacao là một loại trà được làm từ lớp vỏ lụa mịn của hạt cacao đã rang, lớp vỏ hạt cacao sau khi rang được sàng lọc kỹ lưỡng chỉ lấy phần vỏ lụa mịn, sau đó đem phối trộn cùng với hạt cacao ngòi (cacao nibs) đã đập vụn để tạo thành trà. Trà cacao có v', CAST(N'2024-07-11T19:53:43.5189288' AS DateTime2), 0, CAST(N'2024-07-11T19:53:43.5189292' AS DateTime2), 0)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
INSERT [dbo].[Roles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'9a13d08c-fffa-47f8-a384-c5952a310ff8', N'NormalUser', N'NORMALUSER', NULL)
INSERT [dbo].[Roles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'9c04d429-5d02-489b-a9c2-04e361649ea6', N'Administrator', N'ADMINISTRATOR', NULL)
GO
INSERT [dbo].[UserRoles] ([UserId], [RoleId]) VALUES (N'f5e14bec-1fa9-413a-81b8-8c74ab074f0b', N'9c04d429-5d02-489b-a9c2-04e361649ea6')
GO
INSERT [dbo].[Users] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'f5e14bec-1fa9-413a-81b8-8c74ab074f0b', N'admin', N'ADMIN', N'admin444@gmail.com', N'ADMIN444@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEIoIO+z4jRoKquMmB6RjuHaUC94Fma+fYJDU5Yydy+C+D88x0yEIs9UDxuDzIz96vw==', N'KFNOERKPOSVCAARXK7Q564T7BTWU23V2', N'cf7694bc-027f-4d0d-b62d-62230ae4c361', NULL, 0, 0, NULL, 1, 0)
GO
/****** Object:  Index [IX_CartDetails_CAR_ID]    Script Date: 14/07/2024 1:29:36 CH ******/
CREATE NONCLUSTERED INDEX [IX_CartDetails_CAR_ID] ON [dbo].[CartDetails]
(
	[CAR_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CartDetails_PRO_ID]    Script Date: 14/07/2024 1:29:36 CH ******/
CREATE NONCLUSTERED INDEX [IX_CartDetails_PRO_ID] ON [dbo].[CartDetails]
(
	[PRO_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Carts_MEM_ID]    Script Date: 14/07/2024 1:29:36 CH ******/
CREATE NONCLUSTERED INDEX [IX_Carts_MEM_ID] ON [dbo].[Carts]
(
	[MEM_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Menus_PARENT_ID]    Script Date: 14/07/2024 1:29:36 CH ******/
CREATE NONCLUSTERED INDEX [IX_Menus_PARENT_ID] ON [dbo].[Menus]
(
	[PARENT_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderDetails_ORD_ID]    Script Date: 14/07/2024 1:29:36 CH ******/
CREATE NONCLUSTERED INDEX [IX_OrderDetails_ORD_ID] ON [dbo].[OrderDetails]
(
	[ORD_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderDetails_PRO_ID]    Script Date: 14/07/2024 1:29:36 CH ******/
CREATE NONCLUSTERED INDEX [IX_OrderDetails_PRO_ID] ON [dbo].[OrderDetails]
(
	[PRO_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Orders_DEL_ID]    Script Date: 14/07/2024 1:29:36 CH ******/
CREATE NONCLUSTERED INDEX [IX_Orders_DEL_ID] ON [dbo].[Orders]
(
	[DEL_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Orders_MEM_ID]    Script Date: 14/07/2024 1:29:36 CH ******/
CREATE NONCLUSTERED INDEX [IX_Orders_MEM_ID] ON [dbo].[Orders]
(
	[MEM_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Orders_SHIP_ID]    Script Date: 14/07/2024 1:29:36 CH ******/
CREATE NONCLUSTERED INDEX [IX_Orders_SHIP_ID] ON [dbo].[Orders]
(
	[SHIP_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Products_CAT_ID]    Script Date: 14/07/2024 1:29:36 CH ******/
CREATE NONCLUSTERED INDEX [IX_Products_CAT_ID] ON [dbo].[Products]
(
	[CAT_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_RoleClaims_RoleId]    Script Date: 14/07/2024 1:29:36 CH ******/
CREATE NONCLUSTERED INDEX [IX_RoleClaims_RoleId] ON [dbo].[RoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 14/07/2024 1:29:36 CH ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[Roles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserClaims_UserId]    Script Date: 14/07/2024 1:29:36 CH ******/
CREATE NONCLUSTERED INDEX [IX_UserClaims_UserId] ON [dbo].[UserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserLogins_UserId]    Script Date: 14/07/2024 1:29:36 CH ******/
CREATE NONCLUSTERED INDEX [IX_UserLogins_UserId] ON [dbo].[UserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserRoles_RoleId]    Script Date: 14/07/2024 1:29:36 CH ******/
CREATE NONCLUSTERED INDEX [IX_UserRoles_RoleId] ON [dbo].[UserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 14/07/2024 1:29:36 CH ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[Users]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 14/07/2024 1:29:36 CH ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[Users]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CartDetails]  WITH CHECK ADD  CONSTRAINT [FK_CartDetails_Carts_CAR_ID] FOREIGN KEY([CAR_ID])
REFERENCES [dbo].[Carts] ([CAR_ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CartDetails] CHECK CONSTRAINT [FK_CartDetails_Carts_CAR_ID]
GO
ALTER TABLE [dbo].[CartDetails]  WITH CHECK ADD  CONSTRAINT [FK_CartDetails_Products_PRO_ID] FOREIGN KEY([PRO_ID])
REFERENCES [dbo].[Products] ([PRO_ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CartDetails] CHECK CONSTRAINT [FK_CartDetails_Products_PRO_ID]
GO
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD  CONSTRAINT [FK_Carts_Members_MEM_ID] FOREIGN KEY([MEM_ID])
REFERENCES [dbo].[Members] ([MEM_ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Carts] CHECK CONSTRAINT [FK_Carts_Members_MEM_ID]
GO
ALTER TABLE [dbo].[Menus]  WITH CHECK ADD  CONSTRAINT [FK_Menus_Menus_PARENT_ID] FOREIGN KEY([PARENT_ID])
REFERENCES [dbo].[Menus] ([MEN_ID])
GO
ALTER TABLE [dbo].[Menus] CHECK CONSTRAINT [FK_Menus_Menus_PARENT_ID]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders_ORD_ID] FOREIGN KEY([ORD_ID])
REFERENCES [dbo].[Orders] ([ORD_ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders_ORD_ID]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products_PRO_ID] FOREIGN KEY([PRO_ID])
REFERENCES [dbo].[Products] ([PRO_ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products_PRO_ID]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_DeliveryPersonnel_DEL_ID] FOREIGN KEY([DEL_ID])
REFERENCES [dbo].[DeliveryPersonnel] ([DEL_ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_DeliveryPersonnel_DEL_ID]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Members_MEM_ID] FOREIGN KEY([MEM_ID])
REFERENCES [dbo].[Members] ([MEM_ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Members_MEM_ID]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Shipping_SHIP_ID] FOREIGN KEY([SHIP_ID])
REFERENCES [dbo].[Shipping] ([SHIP_ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Shipping_SHIP_ID]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories_CAT_ID] FOREIGN KEY([CAT_ID])
REFERENCES [dbo].[Categories] ([CAT_ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories_CAT_ID]
GO
ALTER TABLE [dbo].[RoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_RoleClaims_Roles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RoleClaims] CHECK CONSTRAINT [FK_RoleClaims_Roles_RoleId]
GO
ALTER TABLE [dbo].[UserClaims]  WITH CHECK ADD  CONSTRAINT [FK_UserClaims_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserClaims] CHECK CONSTRAINT [FK_UserClaims_Users_UserId]
GO
ALTER TABLE [dbo].[UserLogins]  WITH CHECK ADD  CONSTRAINT [FK_UserLogins_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserLogins] CHECK CONSTRAINT [FK_UserLogins_Users_UserId]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Roles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_Roles_RoleId]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_Users_UserId]
GO
ALTER TABLE [dbo].[UserTokens]  WITH CHECK ADD  CONSTRAINT [FK_UserTokens_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserTokens] CHECK CONSTRAINT [FK_UserTokens_Users_UserId]
GO
USE [master]
GO
ALTER DATABASE [VegeFood] SET  READ_WRITE 
GO
