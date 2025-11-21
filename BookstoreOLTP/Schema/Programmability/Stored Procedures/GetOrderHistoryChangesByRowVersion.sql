CREATE PROCEDURE [dbo].[GetOrderHistoryChangesByRowVersion]
(
   @startRow BIGINT
   ,@endRow  BIGINT
)
AS
BEGIN
        SELECT [history_id]
                  ,[order_id]
                  ,[status_id]
                  ,[status_date]
          FROM [dbo].[order_history]
          WHERE [rowversion] > CONVERT(ROWVERSION,@startRow)
          AND [rowversion] <= CONVERT(ROWVERSION,@endRow)
END
GO
