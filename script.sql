USE [master]
GO
/****** Object:  Database [DBProject2]    Script Date: 24/10/2023 9:30:24 pm ******/
CREATE DATABASE [DBProject2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DBProject2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\DBProject2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DBProject2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\DBProject2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [DBProject2] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBProject2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBProject2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBProject2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBProject2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBProject2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBProject2] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBProject2] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [DBProject2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBProject2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBProject2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBProject2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBProject2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBProject2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBProject2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBProject2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBProject2] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DBProject2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBProject2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBProject2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBProject2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBProject2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBProject2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DBProject2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBProject2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DBProject2] SET  MULTI_USER 
GO
ALTER DATABASE [DBProject2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBProject2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBProject2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBProject2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DBProject2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DBProject2] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [DBProject2] SET QUERY_STORE = ON
GO
ALTER DATABASE [DBProject2] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [DBProject2]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 24/10/2023 9:30:24 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[user_id] [uniqueidentifier] NOT NULL,
	[gender_name] [nvarchar](100) NULL,
	[role_name] [nvarchar](100) NULL,
	[user_name] [varchar](max) NULL,
	[login_id] [varchar](max) NOT NULL,
	[password] [varchar](max) NOT NULL,
	[birth_date] [date] NULL,
	[mail_address] [nvarchar](30) NULL,
	[tel_no] [int] NULL,
	[address] [nvarchar](max) NULL,
	[Filter] [nvarchar](max) NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK__Account__B9BE370F1FEE6395] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 24/10/2023 9:30:24 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[brand_id] [nvarchar](100) NOT NULL,
	[brand_name] [nvarchar](100) NOT NULL,
	[Filter] [nvarchar](max) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Brand] PRIMARY KEY CLUSTERED 
(
	[brand_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 24/10/2023 9:30:24 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender](
	[gender_id] [nvarchar](100) NOT NULL,
	[gender_name] [nvarchar](100) NOT NULL,
	[Filter] [varchar](max) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Gender] PRIMARY KEY CLUSTERED 
(
	[gender_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 24/10/2023 9:30:24 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[order_id] [uniqueidentifier] NOT NULL,
	[user_id] [uniqueidentifier] NULL,
	[product_id] [uniqueidentifier] NULL,
	[product_count] [int] NULL,
	[order_price] [decimal](18, 3) NULL,
	[shipping_id] [nvarchar](100) NULL,
	[payment_id] [nvarchar](100) NULL,
	[Filter] [nvarchar](max) NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK__Order__4659622934014D54] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 24/10/2023 9:30:24 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[payment_id] [nvarchar](100) NOT NULL,
	[payment_name] [nvarchar](max) NOT NULL,
	[Filter] [nvarchar](max) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Payment] PRIMARY KEY CLUSTERED 
(
	[payment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 24/10/2023 9:30:24 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[product_id] [uniqueidentifier] NOT NULL,
	[product_name] [nvarchar](max) NOT NULL,
	[brand_name] [nvarchar](100) NULL,
	[price] [decimal](18, 3) NOT NULL,
	[stock] [int] NULL,
	[shipping_id] [nvarchar](100) NULL,
	[payment_id] [nvarchar](100) NULL,
	[manufacturing_date] [date] NULL,
	[expiry_date] [date] NULL,
	[icon] [nvarchar](max) NULL,
	[icon1] [nvarchar](max) NULL,
	[icon2] [nvarchar](max) NULL,
	[icon3] [nvarchar](max) NULL,
	[icon4] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[Filter] [nvarchar](max) NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK__Product__47027DF5F3C6A64F] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 24/10/2023 9:30:24 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[role_id] [nvarchar](100) NOT NULL,
	[role_name] [nvarchar](100) NOT NULL,
	[Filter] [nvarchar](max) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[role_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shipping]    Script Date: 24/10/2023 9:30:24 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipping](
	[shipping_id] [nvarchar](100) NOT NULL,
	[shipping_name] [nvarchar](max) NOT NULL,
	[Filter] [nvarchar](max) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Shipping] PRIMARY KEY CLUSTERED 
(
	[shipping_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Account] ([user_id], [gender_name], [role_name], [user_name], [login_id], [password], [birth_date], [mail_address], [tel_no], [address], [Filter], [IsActive]) VALUES (N'119c50e8-2e7a-4e6a-9f66-167aff4e63d5', NULL, NULL, NULL, N'b', N'b', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Account] ([user_id], [gender_name], [role_name], [user_name], [login_id], [password], [birth_date], [mail_address], [tel_no], [address], [Filter], [IsActive]) VALUES (N'7df11e83-064c-4567-8cf4-199c2a01be39', N'Nam', N'Customer', N'a', N'a', N'a', CAST(N'1998-05-23' AS Date), N'a.@gmail.com', 675856481, N'America', NULL, 1)
INSERT [dbo].[Account] ([user_id], [gender_name], [role_name], [user_name], [login_id], [password], [birth_date], [mail_address], [tel_no], [address], [Filter], [IsActive]) VALUES (N'f627b6de-1d29-4ccd-9bd8-5381804fc338', N'Nữ ', N'Customer', N'b', N'b', N'b', CAST(N'1997-06-30' AS Date), N'b.@gmail.com', 238148177, N'Japan', NULL, 1)
INSERT [dbo].[Account] ([user_id], [gender_name], [role_name], [user_name], [login_id], [password], [birth_date], [mail_address], [tel_no], [address], [Filter], [IsActive]) VALUES (N'891591ad-ae8e-441d-9586-5c52f18070c2', N'Nam', N'Customer', N'd', N'd', N'd', CAST(N'1995-07-25' AS Date), N'd@gmail.com', 286384682, N'France', NULL, 1)
INSERT [dbo].[Account] ([user_id], [gender_name], [role_name], [user_name], [login_id], [password], [birth_date], [mail_address], [tel_no], [address], [Filter], [IsActive]) VALUES (N'4d0f8ade-b46f-496d-b171-80ef2a2985da', N'Nữ ', N'Customer', N'c', N'c', N'c', CAST(N'1996-08-17' AS Date), N'c@gmail.com', 327492649, N'Spain', NULL, 1)
INSERT [dbo].[Account] ([user_id], [gender_name], [role_name], [user_name], [login_id], [password], [birth_date], [mail_address], [tel_no], [address], [Filter], [IsActive]) VALUES (N'64cc9ab1-8e4c-46ae-93e3-cdbb480c7745', N'Nam', N'Staff', N'huy', N'huy', N'huy', CAST(N'1999-03-15' AS Date), N'huy.@gmail.com', 764506315, N'Vietnam', NULL, 1)
GO
INSERT [dbo].[Brand] ([brand_id], [brand_name], [Filter], [IsActive]) VALUES (N'4    ', N'BioTech', NULL, 1)
INSERT [dbo].[Brand] ([brand_id], [brand_name], [Filter], [IsActive]) VALUES (N'3    ', N'BPI Sport', NULL, 1)
INSERT [dbo].[Brand] ([brand_id], [brand_name], [Filter], [IsActive]) VALUES (N'5    ', N'Mutant', NULL, 1)
INSERT [dbo].[Brand] ([brand_id], [brand_name], [Filter], [IsActive]) VALUES (N'2    ', N'OstroVit', NULL, 1)
INSERT [dbo].[Brand] ([brand_id], [brand_name], [Filter], [IsActive]) VALUES (N'1    ', N'Rule 1', NULL, 1)
GO
INSERT [dbo].[Gender] ([gender_id], [gender_name], [Filter], [IsActive]) VALUES (N'3    ', N'Khác', NULL, 1)
INSERT [dbo].[Gender] ([gender_id], [gender_name], [Filter], [IsActive]) VALUES (N'1    ', N'Nam', NULL, 1)
INSERT [dbo].[Gender] ([gender_id], [gender_name], [Filter], [IsActive]) VALUES (N'2    ', N'Nữ', NULL, 1)
GO
INSERT [dbo].[Payment] ([payment_id], [payment_name], [Filter], [IsActive]) VALUES (N'1         ', N'Transfer', NULL, 1)
INSERT [dbo].[Payment] ([payment_id], [payment_name], [Filter], [IsActive]) VALUES (N'2         ', N'Cash', NULL, 1)
GO
INSERT [dbo].[Product] ([product_id], [product_name], [brand_name], [price], [stock], [shipping_id], [payment_id], [manufacturing_date], [expiry_date], [icon], [icon1], [icon2], [icon3], [icon4], [description], [Filter], [IsActive]) VALUES (N'293698de-add5-4b9b-bbe4-358ac837aa62', N'tan', NULL, CAST(123123.000 AS Decimal(18, 3)), NULL, NULL, NULL, NULL, NULL, N'[{"Url":"http://localhost:5179//img/dbe792df-5f8c-462e-ba9b-551e5af5d013_iso-hd.jpg","Position":1}]', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([product_id], [product_name], [brand_name], [price], [stock], [shipping_id], [payment_id], [manufacturing_date], [expiry_date], [icon], [icon1], [icon2], [icon3], [icon4], [description], [Filter], [IsActive]) VALUES (N'8951ef26-0f8a-4141-9a38-d5d562d3a7df', N'test', NULL, CAST(12345.000 AS Decimal(18, 3)), NULL, NULL, NULL, NULL, NULL, N'[{"Url":"http://localhost:5179//img/4edb60b7-4b41-4889-90db-9bd72f567445_The Curse.jpg","Position":1}]', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([product_id], [product_name], [brand_name], [price], [stock], [shipping_id], [payment_id], [manufacturing_date], [expiry_date], [icon], [icon1], [icon2], [icon3], [icon4], [description], [Filter], [IsActive]) VALUES (N'067a064c-4675-4fde-9592-d7967e8adc29', N'test1', NULL, CAST(123456.000 AS Decimal(18, 3)), NULL, NULL, NULL, NULL, NULL, N'[{"Url":"http://localhost:5179//img/5884812e-1587-4d9d-a931-97d52fe37217_Creatine Monohydrate.jpg","Position":1},{"Url":"http://localhost:5179//img/6954f8d5-9ffb-46bf-bb5b-f55d81df730b_hydro-whey-zero.jpg","Position":1}]', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Role] ([role_id], [role_name], [Filter], [IsActive]) VALUES (N'2', N'Customer', NULL, 1)
INSERT [dbo].[Role] ([role_id], [role_name], [Filter], [IsActive]) VALUES (N'1', N'Staff', NULL, 1)
GO
INSERT [dbo].[Shipping] ([shipping_id], [shipping_name], [Filter], [IsActive]) VALUES (N'1         ', N'Yamato', NULL, 1)
INSERT [dbo].[Shipping] ([shipping_id], [shipping_name], [Filter], [IsActive]) VALUES (N'2         ', N'Grab', NULL, 1)
GO
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [DF__Account__user_id__49C3F6B7]  DEFAULT (newid()) FOR [user_id]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF__Order__order_id__1B0907CE]  DEFAULT (newid()) FOR [order_id]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF__Product__product__5441852A]  DEFAULT (newid()) FOR [product_id]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Gender] FOREIGN KEY([gender_name])
REFERENCES [dbo].[Gender] ([gender_name])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Gender]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Role] FOREIGN KEY([role_name])
REFERENCES [dbo].[Role] ([role_name])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Role]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK__Order__product_i__1CF15040] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([product_id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK__Order__product_i__1CF15040]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK__Order__user_id__1BFD2C07] FOREIGN KEY([user_id])
REFERENCES [dbo].[Account] ([user_id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK__Order__user_id__1BFD2C07]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Payment] FOREIGN KEY([payment_id])
REFERENCES [dbo].[Payment] ([payment_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Payment]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Shipping] FOREIGN KEY([shipping_id])
REFERENCES [dbo].[Shipping] ([shipping_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Shipping]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Brand] FOREIGN KEY([brand_name])
REFERENCES [dbo].[Brand] ([brand_name])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Brand]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Payment] FOREIGN KEY([payment_id])
REFERENCES [dbo].[Payment] ([payment_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Payment]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Shipping] FOREIGN KEY([shipping_id])
REFERENCES [dbo].[Shipping] ([shipping_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Shipping]
GO
USE [master]
GO
ALTER DATABASE [DBProject2] SET  READ_WRITE 
GO
