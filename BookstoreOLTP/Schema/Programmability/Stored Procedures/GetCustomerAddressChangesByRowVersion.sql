CREATE PROCEDURE [dbo].[GetCustomerAddressChangesByRowVersion]
(
   @startRow BIGINT
   ,@endRow  BIGINT
)
AS
BEGIN
        SELECT [customer_id]
                  ,[address_id]
                  ,[status_id]
          FROM [dbo].[customer_address]
          WHERE [rowversion] > CONVERT(ROWVERSION,@startRow)
          AND [rowversion] <= CONVERT(ROWVERSION,@endRow)
END
GO
