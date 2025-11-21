CREATE PROCEDURE [dbo].[GetAddressStatusChangesByRowVersion]
(
   @startRow BIGINT
   ,@endRow  BIGINT
)
AS
BEGIN
        SELECT [status_id]
                  ,[address_status]
          FROM [dbo].[address_status]
          WHERE [rowversion] > CONVERT(ROWVERSION,@startRow)
          AND [rowversion] <= CONVERT(ROWVERSION,@endRow)
END
GO
