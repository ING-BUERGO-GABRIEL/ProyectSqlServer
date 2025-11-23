PRINT 'Populating address_status table';
IF EXISTS (SELECT 1 FROM dbo.address_status)
BEGIN
    PRINT 'Skipping address_status inserts because table already contains data.';
END
ELSE
BEGIN
    INSERT INTO dbo.address_status (status_id, address_status) VALUES
        (1, 'Billing'),
        (2, 'Shipping'),
        (3, 'Primary');
END
GO
