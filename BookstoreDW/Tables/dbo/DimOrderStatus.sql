CREATE TABLE [dbo].[DimOrderStatus]
(
        [OrderStatusKey] [int] IDENTITY(1,1) NOT NULL CONSTRAINT PK_DimOrderStatus PRIMARY KEY,
        [StatusID] [int] NOT NULL,
        [StatusValue] [varchar](20) NULL
);
GO
