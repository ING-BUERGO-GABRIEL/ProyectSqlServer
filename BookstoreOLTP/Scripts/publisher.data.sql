PRINT 'Populating publisher table';
IF EXISTS (SELECT 1 FROM dbo.publisher)
BEGIN
    PRINT 'Skipping publisher inserts because table already contains data.';
END
ELSE
BEGIN
    INSERT INTO dbo.publisher (publisher_id, publisher_name) VALUES
        (1, 'Azalea Press'),
        (2, 'Northwind Books'),
        (3, 'Solaris Publishing');
END
GO
