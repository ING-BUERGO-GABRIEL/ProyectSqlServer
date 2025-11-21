CREATE PROCEDURE [dbo].[GetBookLanguageChangesByRowVersion]
(
   @startRow BIGINT
   ,@endRow  BIGINT
)
AS
BEGIN
        SELECT [language_id]
                  ,[language_code]
                  ,[language_name]
          FROM [dbo].[book_language]
          WHERE [rowversion] > CONVERT(ROWVERSION,@startRow)
          AND [rowversion] <= CONVERT(ROWVERSION,@endRow)
END
GO
