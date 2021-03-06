USE [master]
GO
/****** Object:  Database [WardrobeDB]    Script Date: 10/21/2016 9:42:42 AM ******/
CREATE DATABASE [WardrobeDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WardrobeDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\WardrobeDB.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'WardrobeDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\WardrobeDB_0.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [WardrobeDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WardrobeDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WardrobeDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WardrobeDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WardrobeDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WardrobeDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WardrobeDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [WardrobeDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WardrobeDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WardrobeDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WardrobeDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WardrobeDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WardrobeDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WardrobeDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WardrobeDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WardrobeDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WardrobeDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WardrobeDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WardrobeDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WardrobeDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WardrobeDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WardrobeDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WardrobeDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WardrobeDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WardrobeDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [WardrobeDB] SET  MULTI_USER 
GO
ALTER DATABASE [WardrobeDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WardrobeDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WardrobeDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WardrobeDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [WardrobeDB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [WardrobeDB]
GO
/****** Object:  Table [dbo].[tblOccasion]    Script Date: 10/21/2016 9:42:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOccasion](
	[OccasionID] [int] IDENTITY(1,1) NOT NULL,
	[OccasionName] [nchar](10) NOT NULL,
 CONSTRAINT [PK_tblOccasion] PRIMARY KEY CLUSTERED 
(
	[OccasionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblOutfit]    Script Date: 10/21/2016 9:42:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOutfit](
	[OutfitID] [int] IDENTITY(1,1) NOT NULL,
	[OutfitName] [nvarchar](50) NOT NULL,
	[TypeID] [int] NOT NULL,
	[SeasonID] [int] NOT NULL,
	[OccasionID] [int] NOT NULL,
 CONSTRAINT [PK_tblOutfit] PRIMARY KEY CLUSTERED 
(
	[OutfitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblSeason]    Script Date: 10/21/2016 9:42:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSeason](
	[SeasonID] [int] IDENTITY(1,1) NOT NULL,
	[SeasonName] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_tblSeason] PRIMARY KEY CLUSTERED 
(
	[SeasonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblType]    Script Date: 10/21/2016 9:42:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblType](
	[TypeID] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblType] PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblWardrobe]    Script Date: 10/21/2016 9:42:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblWardrobe](
	[WardrobeID] [int] IDENTITY(1,1) NOT NULL,
	[ClothingName] [nvarchar](75) NULL,
	[PhotoLocaion] [nvarchar](100) NULL,
	[ClothingColor] [nvarchar](50) NOT NULL,
	[TypeID] [int] NOT NULL,
	[SeasonID] [int] NOT NULL,
	[OccasionID] [int] NOT NULL,
	[OutfitID] [int] NULL,
 CONSTRAINT [PK_tblWardrobe] PRIMARY KEY CLUSTERED 
(
	[WardrobeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[tblOccasion] ON 

INSERT [dbo].[tblOccasion] ([OccasionID], [OccasionName]) VALUES (1, N'Casual    ')
INSERT [dbo].[tblOccasion] ([OccasionID], [OccasionName]) VALUES (2, N'Formal    ')
INSERT [dbo].[tblOccasion] ([OccasionID], [OccasionName]) VALUES (3, N'Workout   ')
INSERT [dbo].[tblOccasion] ([OccasionID], [OccasionName]) VALUES (4, N'Work      ')
INSERT [dbo].[tblOccasion] ([OccasionID], [OccasionName]) VALUES (5, N'Uniform   ')
INSERT [dbo].[tblOccasion] ([OccasionID], [OccasionName]) VALUES (6, N'Other     ')
SET IDENTITY_INSERT [dbo].[tblOccasion] OFF
SET IDENTITY_INSERT [dbo].[tblSeason] ON 

INSERT [dbo].[tblSeason] ([SeasonID], [SeasonName]) VALUES (1, N'Winter')
INSERT [dbo].[tblSeason] ([SeasonID], [SeasonName]) VALUES (2, N'Spring')
INSERT [dbo].[tblSeason] ([SeasonID], [SeasonName]) VALUES (3, N'Summer')
INSERT [dbo].[tblSeason] ([SeasonID], [SeasonName]) VALUES (5, N'Fall')
INSERT [dbo].[tblSeason] ([SeasonID], [SeasonName]) VALUES (6, N'All Season')
SET IDENTITY_INSERT [dbo].[tblSeason] OFF
SET IDENTITY_INSERT [dbo].[tblType] ON 

INSERT [dbo].[tblType] ([TypeID], [TypeName]) VALUES (1, N'Tops')
INSERT [dbo].[tblType] ([TypeID], [TypeName]) VALUES (2, N'Bottoms')
INSERT [dbo].[tblType] ([TypeID], [TypeName]) VALUES (3, N'Shoes')
INSERT [dbo].[tblType] ([TypeID], [TypeName]) VALUES (4, N'Accessories')
SET IDENTITY_INSERT [dbo].[tblType] OFF
SET IDENTITY_INSERT [dbo].[tblWardrobe] ON 

INSERT [dbo].[tblWardrobe] ([WardrobeID], [ClothingName], [PhotoLocaion], [ClothingColor], [TypeID], [SeasonID], [OccasionID], [OutfitID]) VALUES (1, N'Favorite Jeans', N'../Images/BlueJeans.jpg', N'Blue', 2, 6, 6, NULL)
INSERT [dbo].[tblWardrobe] ([WardrobeID], [ClothingName], [PhotoLocaion], [ClothingColor], [TypeID], [SeasonID], [OccasionID], [OutfitID]) VALUES (2, N'Favorite Short Sleeve Shirt', N'../Images/BatmanTShirt.jpg', N'Grey', 1, 3, 1, NULL)
INSERT [dbo].[tblWardrobe] ([WardrobeID], [ClothingName], [PhotoLocaion], [ClothingColor], [TypeID], [SeasonID], [OccasionID], [OutfitID]) VALUES (3, N'Tuxedo Shirt', N'../Images/TuxedoShirt.jpg', N'White', 1, 6, 2, NULL)
INSERT [dbo].[tblWardrobe] ([WardrobeID], [ClothingName], [PhotoLocaion], [ClothingColor], [TypeID], [SeasonID], [OccasionID], [OutfitID]) VALUES (4, N'Tuxedo Jacket', N'../Images/TuxedoJacket.jpg', N'Black', 1, 6, 2, NULL)
INSERT [dbo].[tblWardrobe] ([WardrobeID], [ClothingName], [PhotoLocaion], [ClothingColor], [TypeID], [SeasonID], [OccasionID], [OutfitID]) VALUES (5, N'Tuxedo Pants', N'../Images/TuxedoPants.jpg', N'Black', 2, 6, 2, NULL)
INSERT [dbo].[tblWardrobe] ([WardrobeID], [ClothingName], [PhotoLocaion], [ClothingColor], [TypeID], [SeasonID], [OccasionID], [OutfitID]) VALUES (6, N'Tuxedo Cummerbund', N'../Images/cummberbund.jpg', N'Black', 4, 6, 2, NULL)
INSERT [dbo].[tblWardrobe] ([WardrobeID], [ClothingName], [PhotoLocaion], [ClothingColor], [TypeID], [SeasonID], [OccasionID], [OutfitID]) VALUES (7, N'Leather Shoes', N'../Images/TuxedoShoes.jpg', N'Black', 3, 6, 2, NULL)
INSERT [dbo].[tblWardrobe] ([WardrobeID], [ClothingName], [PhotoLocaion], [ClothingColor], [TypeID], [SeasonID], [OccasionID], [OutfitID]) VALUES (8, N'Bow tie', N'../Images/Bowtie.jpg', N'Black', 4, 6, 2, NULL)
INSERT [dbo].[tblWardrobe] ([WardrobeID], [ClothingName], [PhotoLocaion], [ClothingColor], [TypeID], [SeasonID], [OccasionID], [OutfitID]) VALUES (9, N'Sweat Pants', NULL, N'Red/Grey', 2, 6, 3, NULL)
INSERT [dbo].[tblWardrobe] ([WardrobeID], [ClothingName], [PhotoLocaion], [ClothingColor], [TypeID], [SeasonID], [OccasionID], [OutfitID]) VALUES (10, N'T-Shirt', N'../Images/RedTshirt.jpg', N'Red/Grey', 1, 6, 3, NULL)
INSERT [dbo].[tblWardrobe] ([WardrobeID], [ClothingName], [PhotoLocaion], [ClothingColor], [TypeID], [SeasonID], [OccasionID], [OutfitID]) VALUES (11, N'Dress Socks', N'../Images/Tuxedosocks.jpg', N'Black', 4, 6, 2, NULL)
INSERT [dbo].[tblWardrobe] ([WardrobeID], [ClothingName], [PhotoLocaion], [ClothingColor], [TypeID], [SeasonID], [OccasionID], [OutfitID]) VALUES (12, N'Tennis Shoes', N'../Images/RedGreyShoes.jpg', N'Red', 3, 6, 3, NULL)
INSERT [dbo].[tblWardrobe] ([WardrobeID], [ClothingName], [PhotoLocaion], [ClothingColor], [TypeID], [SeasonID], [OccasionID], [OutfitID]) VALUES (13, N'Socks', N'../Images/MenAnkleWhite.jpg', N'White', 4, 6, 3, NULL)
INSERT [dbo].[tblWardrobe] ([WardrobeID], [ClothingName], [PhotoLocaion], [ClothingColor], [TypeID], [SeasonID], [OccasionID], [OutfitID]) VALUES (14, N'Favorite Shorts', NULL, N'Khaki', 2, 3, 1, NULL)
SET IDENTITY_INSERT [dbo].[tblWardrobe] OFF
ALTER TABLE [dbo].[tblOutfit]  WITH CHECK ADD  CONSTRAINT [FK_tblOutfit_tblOccasion] FOREIGN KEY([OccasionID])
REFERENCES [dbo].[tblOccasion] ([OccasionID])
GO
ALTER TABLE [dbo].[tblOutfit] CHECK CONSTRAINT [FK_tblOutfit_tblOccasion]
GO
ALTER TABLE [dbo].[tblOutfit]  WITH CHECK ADD  CONSTRAINT [FK_tblOutfit_tblSeason] FOREIGN KEY([SeasonID])
REFERENCES [dbo].[tblSeason] ([SeasonID])
GO
ALTER TABLE [dbo].[tblOutfit] CHECK CONSTRAINT [FK_tblOutfit_tblSeason]
GO
ALTER TABLE [dbo].[tblOutfit]  WITH CHECK ADD  CONSTRAINT [FK_tblOutfit_tblType] FOREIGN KEY([TypeID])
REFERENCES [dbo].[tblType] ([TypeID])
GO
ALTER TABLE [dbo].[tblOutfit] CHECK CONSTRAINT [FK_tblOutfit_tblType]
GO
ALTER TABLE [dbo].[tblWardrobe]  WITH CHECK ADD  CONSTRAINT [FK_tblWardrobe_tblOccasion] FOREIGN KEY([OccasionID])
REFERENCES [dbo].[tblOccasion] ([OccasionID])
GO
ALTER TABLE [dbo].[tblWardrobe] CHECK CONSTRAINT [FK_tblWardrobe_tblOccasion]
GO
ALTER TABLE [dbo].[tblWardrobe]  WITH CHECK ADD  CONSTRAINT [FK_tblWardrobe_tblOutfit] FOREIGN KEY([OutfitID])
REFERENCES [dbo].[tblOutfit] ([OutfitID])
GO
ALTER TABLE [dbo].[tblWardrobe] CHECK CONSTRAINT [FK_tblWardrobe_tblOutfit]
GO
ALTER TABLE [dbo].[tblWardrobe]  WITH CHECK ADD  CONSTRAINT [FK_tblWardrobe_tblSeason] FOREIGN KEY([SeasonID])
REFERENCES [dbo].[tblSeason] ([SeasonID])
GO
ALTER TABLE [dbo].[tblWardrobe] CHECK CONSTRAINT [FK_tblWardrobe_tblSeason]
GO
ALTER TABLE [dbo].[tblWardrobe]  WITH CHECK ADD  CONSTRAINT [FK_tblWardrobe_tblType] FOREIGN KEY([TypeID])
REFERENCES [dbo].[tblType] ([TypeID])
GO
ALTER TABLE [dbo].[tblWardrobe] CHECK CONSTRAINT [FK_tblWardrobe_tblType]
GO
USE [master]
GO
ALTER DATABASE [WardrobeDB] SET  READ_WRITE 
GO
