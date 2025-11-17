CREATE TABLE [dbo].[DimCustomer]
(
        [CustomerKey] [int] IDENTITY(1,1) NOT NULL CONSTRAINT PK_DimCustomer PRIMARY KEY,
        [CustomerID] [int] NOT NULL,
        [FirstName] [varchar](200) NULL,
        [LastName] [varchar](200) NULL,
        [Email] [varchar](350) NULL,
        [AddressID] [int] NULL,
        [AddressStatusID] [int] NULL,
        [StreetNumber] [varchar](10) NULL,
        [StreetName] [varchar](200) NULL,
        [City] [varchar](100) NULL,
        [CountryName] [varchar](200) NULL,
        [AddressStatus] [varchar](30) NULL,
        [IsCurrent] [bit] NOT NULL CONSTRAINT DF_DimCustomer_IsCurrent DEFAULT ((1)),
        [EffectiveStartDate] [datetime2](0) NOT NULL CONSTRAINT DF_DimCustomer_EffectiveStartDate DEFAULT (sysdatetime()),
        [EffectiveEndDate] [datetime2](0) NULL
);
GO
