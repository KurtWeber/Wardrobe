USE [WardrobeDB]
GO

/****** Object:  Table [dbo].[tblOutfit]    Script Date: 10/17/2016 10:52:09 PM ******/
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

