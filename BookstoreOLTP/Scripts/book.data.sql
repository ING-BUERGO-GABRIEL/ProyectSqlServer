PRINT 'Populating book table';
IF EXISTS (SELECT 1 FROM dbo.book)
BEGIN
    PRINT 'Skipping book inserts because table already contains data.';
END
ELSE
BEGIN
    INSERT INTO dbo.book (book_id, title, isbn13, language_id, num_pages, publication_date, publisher_id) VALUES
        (1, 'El Jardin Secreto', '9781234567890', 1, 320, '2021-03-15', 1),
        (2, 'Midnight Algorithms', '9780987654321', 2, 280, '2020-10-01', 2),
        (3, 'Cuentos del Alba', '9781112223334', 1, 210, '2019-05-20', 3);
END
GO
