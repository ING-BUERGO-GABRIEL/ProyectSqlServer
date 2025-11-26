CREATE PROCEDURE [dbo].[DW_MergeFactOrders]
AS
BEGIN
        UPDATE dc
        SET [CustomerKey]           = sc.[CustomerKey]
           ,[BookKey]               = sc.[BookKey]
           ,[OrderDateKey]          = sc.[OrderDateKey]
           ,[ShipDateKey]           = sc.[ShipDateKey]
           ,[DestinationAddressKey] = sc.[DestinationAddressKey]
           ,[ShippingMethodKey]     = sc.[ShippingMethodKey]
           ,[OrderStatusKey]        = sc.[OrderStatusKey]
           ,[Quantity]              = sc.[Quantity]
           ,[UnitPrice]             = sc.[UnitPrice]
        FROM [dbo].[FactOrders] dc
        INNER JOIN [staging].[FactOrders] sc ON (dc.[OrderID] = sc.[OrderID] AND dc.[OrderLineID] = sc.[OrderLineID])END
GO
