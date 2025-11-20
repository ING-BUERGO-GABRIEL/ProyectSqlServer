CREATE TABLE [dbo].[FactOrders]
(
        [OrderKey] [int] IDENTITY(1,1) NOT NULL CONSTRAINT PK_FactSales PRIMARY KEY,
        [OrderID] [int] NOT NULL,
        [OrderLineID] [int] NOT NULL,
        [CustomerKey] [int] NOT NULL,
        [BookKey] [int] NOT NULL,
        [OrderDateKey] [int] NOT NULL,
        [ShipDateKey] [int] NULL,
        [DestinationAddressKey] [int] NULL,
        [ShippingMethodKey] [int] NULL,
        [OrderStatusKey] [int] NULL,
        [Quantity] [int] NOT NULL CONSTRAINT DF_FactSales_Quantity DEFAULT ((1)),
        [UnitPrice] [decimal](10, 2) NOT NULL,
        CONSTRAINT FK_FactSales_DimCustomer FOREIGN KEY ([CustomerKey]) REFERENCES [dbo].[DimCustomer]([CustomerKey]),
        CONSTRAINT FK_FactSales_DimBook FOREIGN KEY ([BookKey]) REFERENCES [dbo].[DimBook]([BookKey]),
        CONSTRAINT FK_FactSales_OrderDate FOREIGN KEY ([OrderDateKey]) REFERENCES [dbo].[DimDate]([DateKey]),
        CONSTRAINT FK_FactSales_ShipDate FOREIGN KEY ([ShipDateKey]) REFERENCES [dbo].[DimDate]([DateKey]),
        CONSTRAINT FK_FactSales_DestinationAddress FOREIGN KEY ([DestinationAddressKey]) REFERENCES [dbo].[DimAddress]([AddressKey]),
        CONSTRAINT FK_FactSales_ShippingMethod FOREIGN KEY ([ShippingMethodKey]) REFERENCES [dbo].[DimShippingMethod]([ShippingMethodKey]),
        CONSTRAINT FK_FactSales_OrderStatus FOREIGN KEY ([OrderStatusKey]) REFERENCES [dbo].[DimOrderStatus]([OrderStatusKey])
);
GO
