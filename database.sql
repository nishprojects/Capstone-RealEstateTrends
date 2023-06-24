USE [Housing]
GO

/****** Object:  Table [Province]    Script Date: 6/23/2023 7:39:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [Province](
	[ProvinceID] [int] IDENTITY(1,1) NOT NULL,
	[ProvinceCode]  [nchar](3) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Province_ProvinceID] PRIMARY KEY CLUSTERED 
(
	[ProvinceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [Province] ADD  CONSTRAINT [DF_ProvinceCode] UNIQUE(ProvinceCode)

ALTER TABLE [Province] ADD  CONSTRAINT [DF_Province_rowguid]  DEFAULT (newid()) FOR [rowguid]
GO

ALTER TABLE [Province] ADD  CONSTRAINT [DF_Province_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO


/****** Object:  Table [HouseType]    Script Date: 6/23/2023 9:43:15 PM ******/


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [HouseType](
	[TypeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_HouseType_TypeID] PRIMARY KEY CLUSTERED
 (
 [TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [HouseType] ADD  CONSTRAINT [DF_Name] UNIQUE(Name)

ALTER TABLE [HouseType] ADD  CONSTRAINT [DF_HouseType_rowguid]  DEFAULT (newid()) FOR [rowguid]
GO

ALTER TABLE [HouseType] ADD  CONSTRAINT [DF_HouseType_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO

/****** Object:  Table [HousePrices]    Script Date: 6/23/2023 9:43:15 PM ******/


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [HousePrices](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [DATE],
	[HouseType] [smallint] NOT NULL,
	[Province] [smallint] NOT NULL,
	[BenchMarkPrice] [money] NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_HousePrices_ID] PRIMARY KEY CLUSTERED
 (
 [ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [HousePrices] ADD  CONSTRAINT [DF_Date] UNIQUE(Date)

ALTER TABLE [HousePrices] ADD  CONSTRAINT [DF_HousePrices_rowguid]  DEFAULT (newid()) FOR [rowguid]
GO

ALTER TABLE [HousePrices] ADD  CONSTRAINT [DF_HousePrices_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO

ALTER TABLE [HousePrices]  WITH CHECK ADD  CONSTRAINT [FK_HousePrices_HouseType_TypeID] FOREIGN KEY([HouseType])
REFERENCES [HouseType] ([TypeID])
GO

ALTER TABLE [HousePrices]  WITH CHECK ADD  CONSTRAINT [FK_HousePrices_Province_ProvinceID] FOREIGN KEY([Province])
REFERENCES [Province] ([ProvinceID])
GO