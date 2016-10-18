USE [WardrobeDB]
GO

/****** Object:  Table [dbo].[tblWardrobe]    Script Date: 10/17/2016 10:52:58 PM ******/
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

