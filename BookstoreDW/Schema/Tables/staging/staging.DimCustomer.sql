CREATE TABLE [staging].[DimCustomer]
(
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
        [AddressStatus] [varchar](30) NULL
);
GO
