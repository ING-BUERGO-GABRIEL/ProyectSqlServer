PRINT 'Populating order_status table';
IF EXISTS (SELECT 1 FROM dbo.order_status)
BEGIN
    PRINT 'Skipping order_status inserts because table already contains data.';
END
ELSE
BEGIN
INSERT [dbo].[order_status] ([status_id], [status_value]) VALUES (1, N'Order Received')
INSERT [dbo].[order_status] ([status_id], [status_value]) VALUES (2, N'Pending Delivery')
INSERT [dbo].[order_status] ([status_id], [status_value]) VALUES (3, N'Delivery In Progress')
INSERT [dbo].[order_status] ([status_id], [status_value]) VALUES (4, N'Delivered')
INSERT [dbo].[order_status] ([status_id], [status_value]) VALUES (5, N'Cancelled')
INSERT [dbo].[order_status] ([status_id], [status_value]) VALUES (6, N'Returned')

END
GO
