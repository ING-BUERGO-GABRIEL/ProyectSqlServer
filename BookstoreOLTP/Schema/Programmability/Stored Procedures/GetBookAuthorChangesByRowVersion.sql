CREATE PROCEDURE [dbo].[GetBookAuthorChangesByRowVersion]
(
   @startRow BIGINT
   ,@endRow  BIGINT
)
AS
BEGIN
        SELECT [book_id]
                  ,[author_id]
          FROM [dbo].[book_author]
          WHERE [rowversion] > CONVERT(ROWVERSION,@startRow)
          AND [rowversion] <= CONVERT(ROWVERSION,@endRow)
END
GO
