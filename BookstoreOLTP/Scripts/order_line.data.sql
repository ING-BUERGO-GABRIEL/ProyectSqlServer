PRINT 'Populating order_line table';
IF EXISTS (SELECT 1 FROM dbo.order_line)
BEGIN
    PRINT 'Skipping order_line inserts because table already contains data.';
END
ELSE
BEGIN
    SET IDENTITY_INSERT dbo.order_line ON;
    INSERT INTO dbo.order_line (line_id, order_id, book_id, price) VALUES
        (1, 1, 1, 18.99),
        (2, 2, 2, 24.50),
        (3, 3, 3, 15.25);
    SET IDENTITY_INSERT dbo.order_line OFF;
END
GO
