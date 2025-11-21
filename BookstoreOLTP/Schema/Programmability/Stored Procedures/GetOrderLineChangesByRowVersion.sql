CREATE PROCEDURE [dbo].[GetOrderLineChangesByRowVersion]
(
   @startRow BIGINT
   ,@endRow  BIGINT
)
AS
BEGIN
        SELECT [line_id]
                  ,[order_id]
                  ,[book_id]
                  ,[price]
          FROM [dbo].[order_line]
          WHERE [rowversion] > CONVERT(ROWVERSION,@startRow)
          AND [rowversion] <= CONVERT(ROWVERSION,@endRow)
END
GO
