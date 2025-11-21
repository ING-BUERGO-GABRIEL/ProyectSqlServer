CREATE PROCEDURE [dbo].[GetOrderStatusChangesByRowVersion]
(
   @startRow BIGINT
   ,@endRow  BIGINT
)
AS
BEGIN
        SELECT [status_id]
                  ,[status_value]
          FROM [dbo].[order_status]
          WHERE [rowversion] > CONVERT(ROWVERSION,@startRow)
          AND [rowversion] <= CONVERT(ROWVERSION,@endRow)
END
GO
