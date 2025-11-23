PRINT 'Populating address_status table';
IF EXISTS (SELECT 1 FROM dbo.address_status)
BEGIN
    PRINT 'Skipping address_status inserts because table already contains data.';
END
ELSE
BEGIN
    INSERT [dbo].[address_status] ([status_id], [address_status]) VALUES (1, N'Active')
    INSERT [dbo].[address_status] ([status_id], [address_status]) VALUES (2, N'Inactive')
END
GO
