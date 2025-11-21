CREATE PROCEDURE [dbo].[GetAddressChangesByRowVersion]
(
   @startRow BIGINT
   ,@endRow  BIGINT
)
AS
BEGIN
        SELECT [address_id]
                  ,[street_number]
                  ,[street_name]
                  ,[city]
                  ,[country_id]
          FROM [dbo].[address]
          WHERE [rowversion] > CONVERT(ROWVERSION,@startRow)
          AND [rowversion] <= CONVERT(ROWVERSION,@endRow)
END
GO
