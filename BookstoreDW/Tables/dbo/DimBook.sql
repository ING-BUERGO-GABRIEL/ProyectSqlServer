CREATE TABLE [dbo].[DimBook]
(
        [BookKey] [int] IDENTITY(1,1) NOT NULL CONSTRAINT PK_DimBook PRIMARY KEY,
        [BookID] [int] NOT NULL,
        [Title] [varchar](400) NULL,
        [ISBN13] [varchar](13) NULL,
        [LanguageID] [int] NULL,
        [LanguageCode] [varchar](8) NULL,
        [LanguageName] [varchar](50) NULL,
        [NumberOfPages] [int] NULL,
        [PublicationDate] [date] NULL,
        [PublisherID] [int] NULL,
        [PublisherName] [varchar](400) NULL
);
GO
