USE [Kutuphane]
GO
/****** Object:  Table [dbo].[Emanetler]    Script Date: 15.01.2025 10:29:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Emanetler](
	[EmanetNo] [int] IDENTITY(1,1) NOT NULL,
	[UyeNo] [int] NULL,
	[KitapNo] [int] NULL,
	[EmanetVermeTarih] [date] NULL,
	[EmanetGeriAlmaTarih] [date] NULL,
	[EmanetIslemTarih] [datetime] NULL,
	[EmanetNot] [nvarchar](255) NULL,
	[EmanetTeslimEdildi] [nvarchar](5) NULL,
 CONSTRAINT [PK_Emanetler] PRIMARY KEY CLUSTERED 
(
	[EmanetNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kitaplar]    Script Date: 15.01.2025 10:29:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kitaplar](
	[KitapNo] [int] IDENTITY(1,1) NOT NULL,
	[KitapAd] [nvarchar](150) NULL,
	[KitapYazari] [nvarchar](100) NULL,
	[KitapBaskiYil] [int] NULL,
	[KitapSayfaSayi] [int] NULL,
	[KitapDil] [nvarchar](20) NULL,
	[KitapYayinEvi] [nvarchar](100) NULL,
	[KitapAciklama] [text] NULL,
 CONSTRAINT [PK_Kitaplar] PRIMARY KEY CLUSTERED 
(
	[KitapNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Uyeler]    Script Date: 15.01.2025 10:29:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Uyeler](
	[UyeNo] [int] IDENTITY(1,1) NOT NULL,
	[UyeAd] [nvarchar](50) NULL,
	[UyeSoyad] [nvarchar](50) NULL,
	[UyeTelefon] [nvarchar](20) NULL,
	[UyeEposta] [nvarchar](100) NULL,
	[UyeAdres] [nvarchar](255) NULL,
 CONSTRAINT [PK_Uyeler] PRIMARY KEY CLUSTERED 
(
	[UyeNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Emanetler] ADD  CONSTRAINT [DF_Emanetler_EmanetTeslimEdildi]  DEFAULT (N'Hayır') FOR [EmanetTeslimEdildi]
GO
ALTER TABLE [dbo].[Emanetler]  WITH CHECK ADD  CONSTRAINT [FK_Emanetler_Kitaplar] FOREIGN KEY([KitapNo])
REFERENCES [dbo].[Kitaplar] ([KitapNo])
GO
ALTER TABLE [dbo].[Emanetler] CHECK CONSTRAINT [FK_Emanetler_Kitaplar]
GO
ALTER TABLE [dbo].[Emanetler]  WITH CHECK ADD  CONSTRAINT [FK_Emanetler_Uyeler] FOREIGN KEY([UyeNo])
REFERENCES [dbo].[Uyeler] ([UyeNo])
GO
ALTER TABLE [dbo].[Emanetler] CHECK CONSTRAINT [FK_Emanetler_Uyeler]
GO
