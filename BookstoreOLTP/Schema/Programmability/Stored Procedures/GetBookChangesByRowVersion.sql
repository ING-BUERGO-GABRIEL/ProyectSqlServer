CREATE PROCEDURE [dbo].[GetBookChangesByRowVersion]
(
   @startRow BIGINT
   ,@endRow  BIGINT
)
AS
BEGIN
SELECT b.[book_id]
          ,b.[title]
          ,b.[isbn13]
          ,b.[language_id]
          ,l.[language_code]
          ,l.[language_name]
          ,b.[num_pages]
          ,b.[publication_date]
          ,b.[publisher_id]
          ,p.[publisher_name]
  FROM [dbo].[book] b
  LEFT JOIN [dbo].[book_language] l
    ON l.[language_id] = b.[language_id]
  LEFT JOIN [dbo].[publisher] p
    ON p.[publisher_id] = b.[publisher_id]
  WHERE b.[rowversion] > CONVERT(ROWVERSION,@startRow)
  AND b.[rowversion] <= CONVERT(ROWVERSION,@endRow)
END
GO
