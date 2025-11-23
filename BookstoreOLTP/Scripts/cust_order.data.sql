PRINT 'Populating cust_order table';
IF EXISTS (SELECT 1 FROM dbo.cust_order)
BEGIN
    PRINT 'Skipping cust_order inserts because table already contains data.';
END
ELSE
BEGIN
    SET IDENTITY_INSERT dbo.cust_order ON;
    INSERT INTO dbo.cust_order (order_id, order_date, customer_id, shipping_method_id, dest_address_id) VALUES
        (1, '2024-01-05T10:15:00', 1, 1, 1),
        (2, '2024-02-12T14:30:00', 2, 2, 2),
        (3, '2024-03-22T09:45:00', 3, 3, 3);
    SET IDENTITY_INSERT dbo.cust_order OFF;
END
GO
