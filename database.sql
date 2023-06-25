USE [Housing]
GO

/****** Object:  Table [Province]    ******/
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


/****** Object:  Table [HouseType]     ******/


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

/****** Object:  Table [HousePrices]     ******/


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [HousePrices](
	[HousePriceID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [DATE],
	[HouseType] [int] NOT NULL,
	[Province] [int] NOT NULL,
	[BenchMarkPrice] [money] NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_HousePrices_HousePriceID] PRIMARY KEY CLUSTERED
 (
 [HousePriceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO



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


/****** Object:  Table [CanadaGDP]     ******/


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [CanadaGDP](
	[GdpID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [DATE],
	[GDP] [money] NULL,
	[PerCapita] [money] NULL,
	[Growth] [decimal] NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_CanadaGDP_GdpID] PRIMARY KEY CLUSTERED
 (
 [GdpID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [CanadaGDP] ADD  CONSTRAINT [DF_Date] UNIQUE(Date)

ALTER TABLE [CanadaGDP] ADD  CONSTRAINT [DF_CanadaGDP_rowguid]  DEFAULT (newid()) FOR [rowguid]
GO

ALTER TABLE [CanadaGDP] ADD  CONSTRAINT [DF_CanadaGDP_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO

/****** Object:  Table [Population]     ******/


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [Population](
	[PopulationID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [DATE],
	[Province] [int] NOT NULL,
	[Population] [int] NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Population_PopulationID] PRIMARY KEY CLUSTERED
 (
 [PopulationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


ALTER TABLE [Population] ADD  CONSTRAINT [DF_Population_rowguid]  DEFAULT (newid()) FOR [rowguid]
GO

ALTER TABLE [Population] ADD  CONSTRAINT [DF_Population_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO


ALTER TABLE [Population]  WITH CHECK ADD  CONSTRAINT [FK_Population_Province_ProvinceID] FOREIGN KEY([Province])
REFERENCES [Province] ([ProvinceID])
GO


/****** Object:  Table [Inflation]    Script Date: 6/23/2023 9:43:15 PM ******/


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [Inflation](
	[InflationID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [DATE],
	[Rate] [decimal] NOT NULL,
	[AnnualChange] [decimal] NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Inflation_InflationID] PRIMARY KEY CLUSTERED
 (
 [InflationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


ALTER TABLE [Inflation] ADD  CONSTRAINT [DF_Inflation_rowguid]  DEFAULT (newid()) FOR [rowguid]
GO

ALTER TABLE [Inflation] ADD  CONSTRAINT [DF_Inflation_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO


/****** Object:  Table [MortgageRateTypes]    Script Date: 6/23/2023 9:43:15 PM ******/


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [MortgageRateTypes](
	[RateTypeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_MortgageRateTypes_RateTypeID] PRIMARY KEY CLUSTERED
 (
 [RateTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


ALTER TABLE [MortgageRateTypes] ADD  CONSTRAINT [DF_MortgageRateTypes_rowguid]  DEFAULT (newid()) FOR [rowguid]
GO

ALTER TABLE [MortgageRateTypes] ADD  CONSTRAINT [DF_MortgageRateTypes_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO


/****** Object:  Table [Inflation]    Script Date: 6/23/2023 9:43:15 PM ******/


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [MortgageRates](
	[MortgageRateID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [DATE],
	[RateType] [int] NULL,
	[Rate] [decimal] NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_MortgageRates_MortgageRate] PRIMARY KEY CLUSTERED
 (
 [MortgageRateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


ALTER TABLE [MortgageRates] ADD  CONSTRAINT [DF_MortgageRates_rowguid]  DEFAULT (newid()) FOR [rowguid]
GO

ALTER TABLE [MortgageRates] ADD  CONSTRAINT [DF_MortgageRates_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO

ALTER TABLE [MortgageRates]  WITH CHECK ADD  CONSTRAINT [FK_MortgageRates_MortgageRateTypes_RateTypeID] FOREIGN KEY([RateType])
REFERENCES [MortgageRateTypes] ([RateTypeID])
GO

