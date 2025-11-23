PRINT 'Populating customer table';
IF EXISTS (SELECT 1 FROM dbo.customer)
BEGIN
    PRINT 'Skipping customer inserts because table already contains data.';
END
ELSE
BEGIN
    INSERT INTO dbo.customer (customer_id, first_name, last_name, email) VALUES
        (1, 'Ana', 'Lopez', 'ana.lopez@example.com'),
        (2, 'John', 'Doe', 'john.doe@example.com'),
        (3, 'Maria', 'Garcia', 'maria.garcia@example.com');
END
GO
