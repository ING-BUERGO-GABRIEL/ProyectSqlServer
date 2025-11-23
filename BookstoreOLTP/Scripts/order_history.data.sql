PRINT 'Populating order_history table';
IF EXISTS (SELECT 1 FROM dbo.order_history)
BEGIN
    PRINT 'Skipping order_history inserts because table already contains data.';
END
ELSE
BEGIN
    SET IDENTITY_INSERT dbo.order_history ON;
    INSERT INTO dbo.order_history (history_id, order_id, status_id, status_date) VALUES
        (1, 1, 1, '2024-01-05T11:00:00'),
        (2, 2, 2, '2024-02-13T09:00:00'),
        (3, 3, 3, '2024-03-25T16:20:00');
    SET IDENTITY_INSERT dbo.order_history OFF;
END
GO
