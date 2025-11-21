CREATE PROCEDURE [dbo].[GetPublisherChangesByRowVersion]
(
   @startRow BIGINT
   ,@endRow  BIGINT
)
AS
BEGIN
        SELECT [publisher_id]
                  ,[publisher_name]
          FROM [dbo].[publisher]
          WHERE [rowversion] > CONVERT(ROWVERSION,@startRow)
          AND [rowversion] <= CONVERT(ROWVERSION,@endRow)
END
GO
