PRINT 'Populating shipping_method table';
IF EXISTS (SELECT 1 FROM dbo.shipping_method)
BEGIN
    PRINT 'Skipping shipping_method inserts because table already contains data.';
END
ELSE
BEGIN
    INSERT INTO dbo.shipping_method (method_id, method_name, cost) VALUES
        (1, 'Standard Ground', 5.99),
        (2, 'Express Air', 12.50),
        (3, 'In-Store Pickup', 0.00);
END
GO
