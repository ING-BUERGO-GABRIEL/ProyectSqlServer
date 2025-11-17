CREATE TABLE [dbo].[DimShippingMethod]
(
        [ShippingMethodSK] INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_DimShippingMethod PRIMARY KEY,
        [MethodID] INT NOT NULL,
        [MethodName] VARCHAR(100) NULL,
        [Cost] DECIMAL(6, 2) NULL
);
GO
