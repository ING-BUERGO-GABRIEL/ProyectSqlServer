PRINT 'Populating order_status table';
IF EXISTS (SELECT 1 FROM dbo.order_status)
BEGIN
    PRINT 'Skipping order_status inserts because table already contains data.';
END
ELSE
BEGIN
    INSERT INTO dbo.order_status (status_id, status_value) VALUES
        (1, 'Pending'),
        (2, 'Shipped'),
        (3, 'Delivered');
END
GO
