CREATE TABLE [dbo].[DimBook]
(
        [BookSK] INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_DimBook PRIMARY KEY,
        [BookID] INT NOT NULL,
        [Title] VARCHAR(400) NULL,
        [ISBN13] VARCHAR(13) NULL,
        [LanguageID] INT NULL,
        [LanguageCode] VARCHAR(8) NULL,
        [LanguageName] VARCHAR(50) NULL,
        [NumPages] INT NULL,
        [PublicationDate] DATE NULL,
        [PublisherID] INT NULL,
        [PublisherName] VARCHAR(400) NULL
);
GO
