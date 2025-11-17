CREATE TABLE [dbo].[DimCustomer]
(
        [CustomerSK] INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_DimCustomer PRIMARY KEY,
        [CustomerID] INT NOT NULL,
        [FirstName] VARCHAR(200) NULL,
        [LastName] VARCHAR(200) NULL,
        [Email] VARCHAR(350) NULL,
        [StreetNumber] VARCHAR(10) NULL,
        [StreetName] VARCHAR(200) NULL,
        [City] VARCHAR(100) NULL,
        [CountryName] VARCHAR(200) NULL,
        [AddressStatus] VARCHAR(30) NULL
);
GO
