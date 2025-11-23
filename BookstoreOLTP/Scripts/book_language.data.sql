PRINT 'Populating book_language table';
IF EXISTS (SELECT 1 FROM dbo.book_language)
BEGIN
    PRINT 'Skipping book_language inserts because table already contains data.';
END
ELSE
BEGIN
    INSERT INTO dbo.book_language (language_id, language_code, language_name) VALUES
        (1, 'es', 'Spanish'),
        (2, 'en', 'English'),
        (3, 'fr', 'French');
END
GO
