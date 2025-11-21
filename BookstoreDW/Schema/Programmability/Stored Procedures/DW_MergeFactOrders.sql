CREATE PROCEDURE [dbo].[DW_MergeFactOrders]
AS
BEGIN
        SET NOCOUNT ON;

        MERGE [dbo].[FactOrders] AS target
        USING (
                SELECT [OrderID]
                      ,[OrderLineID]
                      ,[CustomerKey]
                      ,[BookKey]
                      ,[OrderDateKey]
                      ,[ShipDateKey]
                      ,[DestinationAddressKey]
                      ,[ShippingMethodKey]
                      ,[OrderStatusKey]
                      ,[Quantity]
                      ,[UnitPrice]
                FROM [staging].[FactOrders]
        ) AS source
                ON target.[OrderID] = source.[OrderID]
               AND target.[OrderLineID] = source.[OrderLineID]
        WHEN MATCHED THEN
                UPDATE SET [CustomerKey]          = source.[CustomerKey]
                         ,[BookKey]              = source.[BookKey]
                         ,[OrderDateKey]         = source.[OrderDateKey]
                         ,[ShipDateKey]          = source.[ShipDateKey]
                         ,[DestinationAddressKey]= source.[DestinationAddressKey]
                         ,[ShippingMethodKey]    = source.[ShippingMethodKey]
                         ,[OrderStatusKey]       = source.[OrderStatusKey]
                         ,[Quantity]             = source.[Quantity]
                         ,[UnitPrice]            = source.[UnitPrice]
        WHEN NOT MATCHED THEN
                INSERT (
                        [OrderID]
                       ,[OrderLineID]
                       ,[CustomerKey]
                       ,[BookKey]
                       ,[OrderDateKey]
                       ,[ShipDateKey]
                       ,[DestinationAddressKey]
                       ,[ShippingMethodKey]
                       ,[OrderStatusKey]
                       ,[Quantity]
                       ,[UnitPrice]
                )
                VALUES (
                        source.[OrderID]
                       ,source.[OrderLineID]
                       ,source.[CustomerKey]
                       ,source.[BookKey]
                       ,source.[OrderDateKey]
                       ,source.[ShipDateKey]
                       ,source.[DestinationAddressKey]
                       ,source.[ShippingMethodKey]
                       ,source.[OrderStatusKey]
                       ,source.[Quantity]
                       ,source.[UnitPrice]
                );
END
GO
