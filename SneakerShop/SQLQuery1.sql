USE [master]
GO
/****** Object:  Database [PROJECTWEB_SneakerShop]    Script Date: 1/5/2020 8:59:28 PM ******/
CREATE DATABASE [PROJECTWEB_SneakerShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PROJECTWEB_SneakerShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\PROJECTWEB_SneakerShop.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'PROJECTWEB_SneakerShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\PROJECTWEB_SneakerShop_log.ldf' , SIZE = 816KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [PROJECTWEB_SneakerShop] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PROJECTWEB_SneakerShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PROJECTWEB_SneakerShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PROJECTWEB_SneakerShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PROJECTWEB_SneakerShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PROJECTWEB_SneakerShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PROJECTWEB_SneakerShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [PROJECTWEB_SneakerShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PROJECTWEB_SneakerShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PROJECTWEB_SneakerShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PROJECTWEB_SneakerShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PROJECTWEB_SneakerShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PROJECTWEB_SneakerShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PROJECTWEB_SneakerShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PROJECTWEB_SneakerShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PROJECTWEB_SneakerShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PROJECTWEB_SneakerShop] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PROJECTWEB_SneakerShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PROJECTWEB_SneakerShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PROJECTWEB_SneakerShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PROJECTWEB_SneakerShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PROJECTWEB_SneakerShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PROJECTWEB_SneakerShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PROJECTWEB_SneakerShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PROJECTWEB_SneakerShop] SET RECOVERY FULL 
GO
ALTER DATABASE [PROJECTWEB_SneakerShop] SET  MULTI_USER 
GO
ALTER DATABASE [PROJECTWEB_SneakerShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PROJECTWEB_SneakerShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PROJECTWEB_SneakerShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PROJECTWEB_SneakerShop] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [PROJECTWEB_SneakerShop] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'PROJECTWEB_SneakerShop', N'ON'
GO
USE [PROJECTWEB_SneakerShop]
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 1/5/2020 8:59:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Brand](
	[BrandID] [int] NOT NULL,
	[BrandName] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Brand] PRIMARY KEY CLUSTERED 
(
	[BrandID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Order]    Script Date: 1/5/2020 8:59:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[OrderDate] [date] NOT NULL,
	[LoginName] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderLine]    Script Date: 1/5/2020 8:59:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OrderLine](
	[OrderID] [int] NOT NULL,
	[ShoeID] [varchar](50) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [float] NOT NULL,
 CONSTRAINT [PK_OrderLine] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ShoeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Shoe]    Script Date: 1/5/2020 8:59:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Shoe](
	[ShoeID] [varchar](50) NOT NULL,
	[ShoeName] [varchar](150) NOT NULL,
	[BrandID] [int] NOT NULL,
	[ReleaseDate] [date] NOT NULL,
	[IsTrend] [bit] NOT NULL,
	[Size] [float] NOT NULL,
	[Retail] [float] NOT NULL,
	[Price] [float] NOT NULL,
	[Sale] [bit] NOT NULL,
 CONSTRAINT [PK_Shoe] PRIMARY KEY CLUSTERED 
(
	[ShoeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[User]    Script Date: 1/5/2020 8:59:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[UserName] [nvarchar](150) NOT NULL,
	[LoginName] [varchar](150) NOT NULL,
	[Password] [varchar](150) NOT NULL,
	[Address] [nvarchar](150) NOT NULL,
	[PhoneNumber] [int] NOT NULL,
	[Email] [varchar](150) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[LoginName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Brand] ([BrandID], [BrandName]) VALUES (1, N'Nike')
GO
INSERT [dbo].[Brand] ([BrandID], [BrandName]) VALUES (2, N'Adidas')
GO
INSERT [dbo].[Brand] ([BrandID], [BrandName]) VALUES (3, N'Vans')
GO
INSERT [dbo].[Brand] ([BrandID], [BrandName]) VALUES (4, N'Jordan')
GO
INSERT [dbo].[Brand] ([BrandID], [BrandName]) VALUES (5, N'Yeezy')
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

GO
INSERT [dbo].[Order] ([OrderID], [OrderDate], [LoginName]) VALUES (1, CAST(N'2019-12-19' AS Date), N'anhnv')
GO
INSERT [dbo].[Order] ([OrderID], [OrderDate], [LoginName]) VALUES (2, CAST(N'2019-12-19' AS Date), N'anhnv')
GO
INSERT [dbo].[Order] ([OrderID], [OrderDate], [LoginName]) VALUES (3, CAST(N'2019-12-19' AS Date), N'anhnv')
GO
INSERT [dbo].[Order] ([OrderID], [OrderDate], [LoginName]) VALUES (4, CAST(N'2019-12-19' AS Date), N'anhnv')
GO
INSERT [dbo].[Order] ([OrderID], [OrderDate], [LoginName]) VALUES (5, CAST(N'2019-12-19' AS Date), N'anhnv')
GO
INSERT [dbo].[Order] ([OrderID], [OrderDate], [LoginName]) VALUES (6, CAST(N'2019-12-19' AS Date), N'anhnv')
GO
INSERT [dbo].[Order] ([OrderID], [OrderDate], [LoginName]) VALUES (7, CAST(N'2019-12-19' AS Date), N'anhnv')
GO
INSERT [dbo].[Order] ([OrderID], [OrderDate], [LoginName]) VALUES (8, CAST(N'2019-12-19' AS Date), N'anhnv')
GO
INSERT [dbo].[Order] ([OrderID], [OrderDate], [LoginName]) VALUES (9, CAST(N'2019-12-20' AS Date), N'anhnv')
GO
INSERT [dbo].[Order] ([OrderID], [OrderDate], [LoginName]) VALUES (10, CAST(N'2019-12-20' AS Date), N'anhnv')
GO
INSERT [dbo].[Order] ([OrderID], [OrderDate], [LoginName]) VALUES (11, CAST(N'2019-12-20' AS Date), N'anhnv')
GO
INSERT [dbo].[Order] ([OrderID], [OrderDate], [LoginName]) VALUES (12, CAST(N'2019-12-20' AS Date), N'anhnv')
GO
INSERT [dbo].[Order] ([OrderID], [OrderDate], [LoginName]) VALUES (13, CAST(N'2019-12-20' AS Date), N'anhnd')
GO
INSERT [dbo].[Order] ([OrderID], [OrderDate], [LoginName]) VALUES (14, CAST(N'2019-12-20' AS Date), N'tungtt')
GO
INSERT [dbo].[Order] ([OrderID], [OrderDate], [LoginName]) VALUES (15, CAST(N'2019-12-20' AS Date), N'anhnv')
GO
INSERT [dbo].[Order] ([OrderID], [OrderDate], [LoginName]) VALUES (16, CAST(N'2019-12-20' AS Date), N'thoaimk')
GO
INSERT [dbo].[Order] ([OrderID], [OrderDate], [LoginName]) VALUES (17, CAST(N'2019-12-20' AS Date), N'anhnv')
GO
INSERT [dbo].[Order] ([OrderID], [OrderDate], [LoginName]) VALUES (18, CAST(N'2019-12-20' AS Date), N'anhnd')
GO
INSERT [dbo].[Order] ([OrderID], [OrderDate], [LoginName]) VALUES (19, CAST(N'2019-12-20' AS Date), N'anhnd')
GO
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
INSERT [dbo].[OrderLine] ([OrderID], [ShoeID], [Quantity], [Price]) VALUES (1, N'AF1 ', 1, 88)
GO
INSERT [dbo].[OrderLine] ([OrderID], [ShoeID], [Quantity], [Price]) VALUES (2, N'JD6', 1, 1030)
GO
INSERT [dbo].[OrderLine] ([OrderID], [ShoeID], [Quantity], [Price]) VALUES (2, N'Y700', 1, 425)
GO
INSERT [dbo].[OrderLine] ([OrderID], [ShoeID], [Quantity], [Price]) VALUES (3, N'Y350', 1, 387)
GO
INSERT [dbo].[OrderLine] ([OrderID], [ShoeID], [Quantity], [Price]) VALUES (4, N'AF1 ', 1, 88)
GO
INSERT [dbo].[OrderLine] ([OrderID], [ShoeID], [Quantity], [Price]) VALUES (4, N'AM1', 1, 234)
GO
INSERT [dbo].[OrderLine] ([OrderID], [ShoeID], [Quantity], [Price]) VALUES (4, N'OS', 1, 50)
GO
INSERT [dbo].[OrderLine] ([OrderID], [ShoeID], [Quantity], [Price]) VALUES (5, N'AF1 ', 1, 88)
GO
INSERT [dbo].[OrderLine] ([OrderID], [ShoeID], [Quantity], [Price]) VALUES (5, N'AM1', 1, 234)
GO
INSERT [dbo].[OrderLine] ([OrderID], [ShoeID], [Quantity], [Price]) VALUES (5, N'OS', 1, 50)
GO
INSERT [dbo].[OrderLine] ([OrderID], [ShoeID], [Quantity], [Price]) VALUES (6, N'AF1 ', 1, 88)
GO
INSERT [dbo].[OrderLine] ([OrderID], [ShoeID], [Quantity], [Price]) VALUES (7, N'AF1 ', 1, 88)
GO
INSERT [dbo].[OrderLine] ([OrderID], [ShoeID], [Quantity], [Price]) VALUES (7, N'OS', 1, 50)
GO
INSERT [dbo].[OrderLine] ([OrderID], [ShoeID], [Quantity], [Price]) VALUES (8, N'AF1 ', 1, 88)
GO
INSERT [dbo].[OrderLine] ([OrderID], [ShoeID], [Quantity], [Price]) VALUES (9, N'AF1 ', 1, 88)
GO
INSERT [dbo].[OrderLine] ([OrderID], [ShoeID], [Quantity], [Price]) VALUES (10, N'AF1 ', 1, 88)
GO
INSERT [dbo].[OrderLine] ([OrderID], [ShoeID], [Quantity], [Price]) VALUES (10, N'UB19', 1, 220)
GO
INSERT [dbo].[OrderLine] ([OrderID], [ShoeID], [Quantity], [Price]) VALUES (11, N'OS', 1, 50)
GO
INSERT [dbo].[OrderLine] ([OrderID], [ShoeID], [Quantity], [Price]) VALUES (11, N'P6000', 1, 95)
GO
INSERT [dbo].[OrderLine] ([OrderID], [ShoeID], [Quantity], [Price]) VALUES (11, N'Y350', 1, 387)
GO
INSERT [dbo].[OrderLine] ([OrderID], [ShoeID], [Quantity], [Price]) VALUES (12, N'JD1', 1, 247)
GO
INSERT [dbo].[OrderLine] ([OrderID], [ShoeID], [Quantity], [Price]) VALUES (13, N'JD6', 1, 1030)
GO
INSERT [dbo].[OrderLine] ([OrderID], [ShoeID], [Quantity], [Price]) VALUES (14, N'AM1', 1, 234)
GO
INSERT [dbo].[OrderLine] ([OrderID], [ShoeID], [Quantity], [Price]) VALUES (14, N'OS', 1, 50)
GO
INSERT [dbo].[OrderLine] ([OrderID], [ShoeID], [Quantity], [Price]) VALUES (14, N'UB19', 1, 220)
GO
INSERT [dbo].[OrderLine] ([OrderID], [ShoeID], [Quantity], [Price]) VALUES (15, N'AM1', 1, 234)
GO
INSERT [dbo].[OrderLine] ([OrderID], [ShoeID], [Quantity], [Price]) VALUES (15, N'P6000', 1, 95)
GO
INSERT [dbo].[OrderLine] ([OrderID], [ShoeID], [Quantity], [Price]) VALUES (15, N'Y350', 1, 387)
GO
INSERT [dbo].[OrderLine] ([OrderID], [ShoeID], [Quantity], [Price]) VALUES (16, N'OS', 1, 50)
GO
INSERT [dbo].[OrderLine] ([OrderID], [ShoeID], [Quantity], [Price]) VALUES (16, N'P6000', 1, 95)
GO
INSERT [dbo].[OrderLine] ([OrderID], [ShoeID], [Quantity], [Price]) VALUES (16, N'UB19', 1, 220)
GO
INSERT [dbo].[OrderLine] ([OrderID], [ShoeID], [Quantity], [Price]) VALUES (16, N'Y350', 1, 387)
GO
INSERT [dbo].[OrderLine] ([OrderID], [ShoeID], [Quantity], [Price]) VALUES (17, N'AF1 ', 1, 88)
GO
INSERT [dbo].[OrderLine] ([OrderID], [ShoeID], [Quantity], [Price]) VALUES (18, N'JD6', 1, 1030)
GO
INSERT [dbo].[OrderLine] ([OrderID], [ShoeID], [Quantity], [Price]) VALUES (19, N'Y700', 1, 425)
GO
INSERT [dbo].[Shoe] ([ShoeID], [ShoeName], [BrandID], [ReleaseDate], [IsTrend], [Size], [Retail], [Price], [Sale]) VALUES (N'AF1 ', N'Nike Air Force 1 ', 1, CAST(N'2018-01-01' AS Date), 1, 7, 90, 88, 1)
GO
INSERT [dbo].[Shoe] ([ShoeID], [ShoeName], [BrandID], [ReleaseDate], [IsTrend], [Size], [Retail], [Price], [Sale]) VALUES (N'AM1', N'Nike Air Max 1 ', 1, CAST(N'2017-09-21' AS Date), 1, 8.5, 140, 234, 0)
GO
INSERT [dbo].[Shoe] ([ShoeID], [ShoeName], [BrandID], [ReleaseDate], [IsTrend], [Size], [Retail], [Price], [Sale]) VALUES (N'CON80', N'Adidas Continental 80', 2, CAST(N'2019-01-01' AS Date), 1, 7.5, 80, 70, 1)
GO
INSERT [dbo].[Shoe] ([ShoeID], [ShoeName], [BrandID], [ReleaseDate], [IsTrend], [Size], [Retail], [Price], [Sale]) VALUES (N'JD1', N'Jordan 1 Fearless UNC Chicago', 4, CAST(N'2019-11-02' AS Date), 0, 9, 160, 247, 0)
GO
INSERT [dbo].[Shoe] ([ShoeID], [ShoeName], [BrandID], [ReleaseDate], [IsTrend], [Size], [Retail], [Price], [Sale]) VALUES (N'JD6', N'Jordan 6 Retro Travis Scott', 4, CAST(N'2019-10-11' AS Date), 1, 7.5, 250, 1030, 0)
GO
INSERT [dbo].[Shoe] ([ShoeID], [ShoeName], [BrandID], [ReleaseDate], [IsTrend], [Size], [Retail], [Price], [Sale]) VALUES (N'OS', N'Vans Old Skool', 3, CAST(N'2017-01-01' AS Date), 1, 8, 60, 50, 1)
GO
INSERT [dbo].[Shoe] ([ShoeID], [ShoeName], [BrandID], [ReleaseDate], [IsTrend], [Size], [Retail], [Price], [Sale]) VALUES (N'P6000', N'Nike Wmns P-6000', 1, CAST(N'2019-05-02' AS Date), 0, 5.5, 100, 95, 1)
GO
INSERT [dbo].[Shoe] ([ShoeID], [ShoeName], [BrandID], [ReleaseDate], [IsTrend], [Size], [Retail], [Price], [Sale]) VALUES (N'UB19', N'Adidas Ultra Boost 2019', 2, CAST(N'2018-12-15' AS Date), 0, 8.5, 180, 220, 0)
GO
INSERT [dbo].[Shoe] ([ShoeID], [ShoeName], [BrandID], [ReleaseDate], [IsTrend], [Size], [Retail], [Price], [Sale]) VALUES (N'Y350', N'Adidas Yeezy Boost 350 v2 Black', 5, CAST(N'2019-06-07' AS Date), 1, 6, 220, 387, 0)
GO
INSERT [dbo].[Shoe] ([ShoeID], [ShoeName], [BrandID], [ReleaseDate], [IsTrend], [Size], [Retail], [Price], [Sale]) VALUES (N'Y700', N'Adidas Yeezy Boost 700 Wave Runner', 5, CAST(N'2017-11-01' AS Date), 1, 10, 300, 425, 0)
GO
INSERT [dbo].[User] ([UserName], [LoginName], [Password], [Address], [PhoneNumber], [Email]) VALUES (N'Nguyen Duc Anh', N'anhnd', N'ducanh', N'Sai Gon', 1682682375, N'ducanh@gmail.com')
GO
INSERT [dbo].[User] ([UserName], [LoginName], [Password], [Address], [PhoneNumber], [Email]) VALUES (N'Nguyễn Việt Anh', N'anhnv', N'vietanh', N'Thành phố Thái Bình', 854409404, N'vietanh@gmail.com')
GO
INSERT [dbo].[User] ([UserName], [LoginName], [Password], [Address], [PhoneNumber], [Email]) VALUES (N'Khieu Thi Minh Thoai', N'thoaimk', N'thoai', N'Thanh pho Thai Binh', 345676543, N'thoai@gmail.com')
GO
INSERT [dbo].[User] ([UserName], [LoginName], [Password], [Address], [PhoneNumber], [Email]) VALUES (N'Tran Thanh Tung', N'tungtt', N'tung', N'Ha Noi', 987654321, N'tung@gmail.com')
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User] FOREIGN KEY([LoginName])
REFERENCES [dbo].[User] ([LoginName])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User]
GO
ALTER TABLE [dbo].[OrderLine]  WITH CHECK ADD  CONSTRAINT [FK_OrderLine_Order] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OrderLine] CHECK CONSTRAINT [FK_OrderLine_Order]
GO
ALTER TABLE [dbo].[OrderLine]  WITH CHECK ADD  CONSTRAINT [FK_OrderLine_Shoe] FOREIGN KEY([ShoeID])
REFERENCES [dbo].[Shoe] ([ShoeID])
GO
ALTER TABLE [dbo].[OrderLine] CHECK CONSTRAINT [FK_OrderLine_Shoe]
GO
ALTER TABLE [dbo].[Shoe]  WITH CHECK ADD  CONSTRAINT [FK_Shoe_Brand] FOREIGN KEY([BrandID])
REFERENCES [dbo].[Brand] ([BrandID])
GO
ALTER TABLE [dbo].[Shoe] CHECK CONSTRAINT [FK_Shoe_Brand]
GO
USE [master]
GO
ALTER DATABASE [PROJECTWEB_SneakerShop] SET  READ_WRITE 
GO
