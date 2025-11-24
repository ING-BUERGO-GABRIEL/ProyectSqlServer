CREATE TABLE [staging].[FactOrders]
(
        [OrderID] [int] NOT NULL,
        [OrderLineID] [int] NOT NULL,
        [CustomerKey] [int] NOT NULL,
        [BookKey] [int] NOT NULL,
        [OrderDateKey] [int] NOT NULL,
        [ShipDateKey] [int] NULL,
        [DestinationAddressKey] [int] NULL,
        [ShippingMethodKey] [int] NULL,
        [OrderStatusKey] [int] NULL,
        [Quantity] [int] NOT NULL,
        [UnitPrice] [decimal](10, 2) NOT NULL
);
GO
