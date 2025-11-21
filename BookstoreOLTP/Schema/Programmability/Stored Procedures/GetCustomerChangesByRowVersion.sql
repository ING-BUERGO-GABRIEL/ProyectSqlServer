CREATE PROCEDURE [dbo].[GetCustomerChangesByRowVersion]
(
   @startRow BIGINT
   ,@endRow  BIGINT
)
AS
BEGIN
        SELECT [customer_id]
                  ,[first_name]
                  ,[last_name]
                  ,[email]
          FROM [dbo].[customer]
          WHERE [rowversion] > CONVERT(ROWVERSION,@startRow)
          AND [rowversion] <= CONVERT(ROWVERSION,@endRow)
END
GO
