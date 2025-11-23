PRINT 'Populating customer_address table';
IF EXISTS (SELECT 1 FROM dbo.customer_address)
BEGIN
    PRINT 'Skipping customer_address inserts because table already contains data.';
END
ELSE
BEGIN
    INSERT INTO dbo.customer_address (customer_id, address_id, status_id) VALUES
        (1, 1, 3),
        (2, 2, 1),
        (3, 3, 2);
END
GO
