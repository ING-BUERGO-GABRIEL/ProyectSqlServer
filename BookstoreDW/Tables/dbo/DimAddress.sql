CREATE TABLE [dbo].[DimAddress]
(
        [AddressKey] [int] IDENTITY(1,1) NOT NULL CONSTRAINT PK_DimAddress PRIMARY KEY,
        [AddressID] [int] NULL,
        [StreetNumber] [varchar](10) NULL,
        [StreetName] [varchar](200) NULL,
        [City] [varchar](100) NULL,
        [CountryID] [int] NULL,
        [CountryName] [varchar](200) NULL,
        [AddressStatusID] [int] NULL,
        [AddressStatus] [varchar](30) NULL
);
GO
