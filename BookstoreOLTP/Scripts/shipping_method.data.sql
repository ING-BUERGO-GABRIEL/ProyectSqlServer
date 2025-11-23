PRINT 'Populating shipping_method table';
IF EXISTS (SELECT 1 FROM dbo.shipping_method)
BEGIN
    PRINT 'Skipping shipping_method inserts because table already contains data.';
END
ELSE
BEGIN
INSERT [dbo].[shipping_method] ([method_id], [method_name], [cost]) VALUES (1, N'Standard', CAST(5.90 AS Decimal(6, 2)))
INSERT [dbo].[shipping_method] ([method_id], [method_name], [cost]) VALUES (2, N'Priority', CAST(8.90 AS Decimal(6, 2)))
INSERT [dbo].[shipping_method] ([method_id], [method_name], [cost]) VALUES (3, N'Express', CAST(11.90 AS Decimal(6, 2)))
INSERT [dbo].[shipping_method] ([method_id], [method_name], [cost]) VALUES (4, N'International', CAST(24.50 AS Decimal(6, 2)))
END
GO
