CREATE PROCEDURE [dbo].[DW_MergeDimBook]
AS
BEGIN
        SET NOCOUNT ON;

        MERGE [dbo].[DimBook] AS target
        USING (
                SELECT [BookID]
                      ,[Title]
                      ,[ISBN13]
                      ,[LanguageID]
                      ,[LanguageCode]
                      ,[LanguageName]
                      ,[NumberOfPages]
                      ,[PublicationDate]
                      ,[PublisherID]
                      ,[PublisherName]
                FROM [staging].[DimBook]
        ) AS source
                ON target.[BookID] = source.[BookID]
        WHEN MATCHED THEN
                UPDATE SET [Title]            = source.[Title]
                         ,[ISBN13]           = source.[ISBN13]
                         ,[LanguageID]       = source.[LanguageID]
                         ,[LanguageCode]     = source.[LanguageCode]
                         ,[LanguageName]     = source.[LanguageName]
                         ,[NumberOfPages]    = source.[NumberOfPages]
                         ,[PublicationDate]  = source.[PublicationDate]
                         ,[PublisherID]      = source.[PublisherID]
                         ,[PublisherName]    = source.[PublisherName]
        WHEN NOT MATCHED THEN
                INSERT (
                        [BookID]
                       ,[Title]
                       ,[ISBN13]
                       ,[LanguageID]
                       ,[LanguageCode]
                       ,[LanguageName]
                       ,[NumberOfPages]
                       ,[PublicationDate]
                       ,[PublisherID]
                       ,[PublisherName]
                )
                VALUES (
                        source.[BookID]
                       ,source.[Title]
                       ,source.[ISBN13]
                       ,source.[LanguageID]
                       ,source.[LanguageCode]
                       ,source.[LanguageName]
                       ,source.[NumberOfPages]
                       ,source.[PublicationDate]
                       ,source.[PublisherID]
                       ,source.[PublisherName]
                );
END
GO
