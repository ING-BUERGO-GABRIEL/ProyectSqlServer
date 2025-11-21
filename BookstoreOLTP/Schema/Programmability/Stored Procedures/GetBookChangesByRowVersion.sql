CREATE PROCEDURE [dbo].[GetBookChangesByRowVersion]
(
   @startRow BIGINT
   ,@endRow  BIGINT
)
AS
BEGIN
        SELECT [book_id]
                  ,[title]
                  ,[isbn13]
                  ,[language_id]
                  ,[num_pages]
                  ,[publication_date]
                  ,[publisher_id]
          FROM [dbo].[book]
          WHERE [rowversion] > CONVERT(ROWVERSION,@startRow)
          AND [rowversion] <= CONVERT(ROWVERSION,@endRow)
END
GO
