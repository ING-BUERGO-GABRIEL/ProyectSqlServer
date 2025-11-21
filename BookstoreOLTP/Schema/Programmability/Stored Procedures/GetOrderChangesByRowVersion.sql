CREATE PROCEDURE [dbo].[GetOrderChangesByRowVersion]
(
   @startRow BIGINT
   ,@endRow  BIGINT
)
AS
BEGIN
        SELECT [order_id]
                  ,[order_date]
                  ,[customer_id]
                  ,[shipping_method_id]
                  ,[dest_address_id]
          FROM [dbo].[cust_order]
          WHERE [rowversion] > CONVERT(ROWVERSION,@startRow)
          AND [rowversion] <= CONVERT(ROWVERSION,@endRow)
END
GO
