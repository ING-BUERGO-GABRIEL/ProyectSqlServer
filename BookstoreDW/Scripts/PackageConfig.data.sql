IF NOT EXISTS (SELECT TOP (1) 1
              FROM [dbo].[PackageConfig]
              WHERE [TableName] = 'address')
BEGIN
    INSERT [dbo].[PackageConfig] ([TableName], [LastRowVersion]) VALUES ('address', 0)
END
GO
IF NOT EXISTS (SELECT TOP (1) 1
              FROM [dbo].[PackageConfig]
              WHERE [TableName] = 'address_status')
BEGIN
    INSERT [dbo].[PackageConfig] ([TableName], [LastRowVersion]) VALUES ('address_status', 0)
END
GO
IF NOT EXISTS (SELECT TOP (1) 1
              FROM [dbo].[PackageConfig]
              WHERE [TableName] = 'author')
BEGIN
    INSERT [dbo].[PackageConfig] ([TableName], [LastRowVersion]) VALUES ('author', 0)
END
GO
IF NOT EXISTS (SELECT TOP (1) 1
              FROM [dbo].[PackageConfig]
              WHERE [TableName] = 'book')
BEGIN
    INSERT [dbo].[PackageConfig] ([TableName], [LastRowVersion]) VALUES ('book', 0)
END
GO
IF NOT EXISTS (SELECT TOP (1) 1
              FROM [dbo].[PackageConfig]
              WHERE [TableName] = 'book_author')
BEGIN
    INSERT [dbo].[PackageConfig] ([TableName], [LastRowVersion]) VALUES ('book_author', 0)
END
GO
IF NOT EXISTS (SELECT TOP (1) 1
              FROM [dbo].[PackageConfig]
              WHERE [TableName] = 'book_language')
BEGIN
    INSERT [dbo].[PackageConfig] ([TableName], [LastRowVersion]) VALUES ('book_language', 0)
END
GO
IF NOT EXISTS (SELECT TOP (1) 1
              FROM [dbo].[PackageConfig]
              WHERE [TableName] = 'country')
BEGIN
    INSERT [dbo].[PackageConfig] ([TableName], [LastRowVersion]) VALUES ('country', 0)
END
GO
IF NOT EXISTS (SELECT TOP (1) 1
              FROM [dbo].[PackageConfig]
              WHERE [TableName] = 'cust_order')
BEGIN
    INSERT [dbo].[PackageConfig] ([TableName], [LastRowVersion]) VALUES ('cust_order', 0)
END
GO
IF NOT EXISTS (SELECT TOP (1) 1
              FROM [dbo].[PackageConfig]
              WHERE [TableName] = 'customer')
BEGIN
    INSERT [dbo].[PackageConfig] ([TableName], [LastRowVersion]) VALUES ('customer', 0)
END
GO
IF NOT EXISTS (SELECT TOP (1) 1
              FROM [dbo].[PackageConfig]
              WHERE [TableName] = 'customer_address')
BEGIN
    INSERT [dbo].[PackageConfig] ([TableName], [LastRowVersion]) VALUES ('customer_address', 0)
END
GO
IF NOT EXISTS (SELECT TOP (1) 1
              FROM [dbo].[PackageConfig]
              WHERE [TableName] = 'order_history')
BEGIN
    INSERT [dbo].[PackageConfig] ([TableName], [LastRowVersion]) VALUES ('order_history', 0)
END
GO
IF NOT EXISTS (SELECT TOP (1) 1
              FROM [dbo].[PackageConfig]
              WHERE [TableName] = 'order_line')
BEGIN
    INSERT [dbo].[PackageConfig] ([TableName], [LastRowVersion]) VALUES ('order_line', 0)
END
GO
IF NOT EXISTS (SELECT TOP (1) 1
              FROM [dbo].[PackageConfig]
              WHERE [TableName] = 'order_status')
BEGIN
    INSERT [dbo].[PackageConfig] ([TableName], [LastRowVersion]) VALUES ('order_status', 0)
END
GO
IF NOT EXISTS (SELECT TOP (1) 1
              FROM [dbo].[PackageConfig]
              WHERE [TableName] = 'orders')
BEGIN
    INSERT [dbo].[PackageConfig] ([TableName], [LastRowVersion]) VALUES ('orders', 0)
END
GO
IF NOT EXISTS (SELECT TOP (1) 1
              FROM [dbo].[PackageConfig]
              WHERE [TableName] = 'publisher')
BEGIN
    INSERT [dbo].[PackageConfig] ([TableName], [LastRowVersion]) VALUES ('publisher', 0)
END
GO
IF NOT EXISTS (SELECT TOP (1) 1
              FROM [dbo].[PackageConfig]
              WHERE [TableName] = 'shipping_method')
BEGIN
    INSERT [dbo].[PackageConfig] ([TableName], [LastRowVersion]) VALUES ('shipping_method', 0)
END
GO
