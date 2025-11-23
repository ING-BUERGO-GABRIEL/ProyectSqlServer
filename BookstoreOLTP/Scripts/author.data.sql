PRINT 'Populating author table';
IF EXISTS (SELECT 1 FROM dbo.author)
BEGIN
    PRINT 'Skipping author inserts because table already contains data.';
END
ELSE
BEGIN
    INSERT INTO dbo.author (author_id, author_name) VALUES
        (1, 'Gabriel Rivera'),
        (2, 'Elena Soto'),
        (3, 'Daniel Parker');
END
GO
