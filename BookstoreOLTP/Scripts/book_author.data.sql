PRINT 'Populating book_author table';
IF EXISTS (SELECT 1 FROM dbo.book_author)
BEGIN
    PRINT 'Skipping book_author inserts because table already contains data.';
END
ELSE
BEGIN
    INSERT INTO dbo.book_author (book_id, author_id) VALUES
        (1, 1),
        (2, 3),
        (3, 2);
END
GO
