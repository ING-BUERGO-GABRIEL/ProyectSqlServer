CREATE TABLE [dbo].[DimOrderStatus]
(
        [OrderStatusSK] INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_DimOrderStatus PRIMARY KEY,
        [StatusID] INT NOT NULL,
        [StatusValue] VARCHAR(20) NULL
);
GO
