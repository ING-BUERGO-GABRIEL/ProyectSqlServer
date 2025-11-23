PRINT 'Populating book_language table';
IF EXISTS (SELECT 1 FROM dbo.book_language)
BEGIN
    PRINT 'Skipping book_language inserts because table already contains data.';
END
ELSE
BEGIN
INSERT [dbo].[book_language] ([language_id], [language_code], [language_name]) VALUES (1, NULL, N'English')
INSERT [dbo].[book_language] ([language_id], [language_code], [language_name]) VALUES (2, NULL, N'United States English')
INSERT [dbo].[book_language] ([language_id], [language_code], [language_name]) VALUES (3, NULL, N'French')
INSERT [dbo].[book_language] ([language_id], [language_code], [language_name]) VALUES (4, NULL, N'Spanish')
INSERT [dbo].[book_language] ([language_id], [language_code], [language_name]) VALUES (5, NULL, N'British English')
INSERT [dbo].[book_language] ([language_id], [language_code], [language_name]) VALUES (6, NULL, N'Multiple Languages')
INSERT [dbo].[book_language] ([language_id], [language_code], [language_name]) VALUES (7, NULL, N'Greek')
INSERT [dbo].[book_language] ([language_id], [language_code], [language_name]) VALUES (8, NULL, N'Middle English')
INSERT [dbo].[book_language] ([language_id], [language_code], [language_name]) VALUES (9, NULL, N'Canadian English')
INSERT [dbo].[book_language] ([language_id], [language_code], [language_name]) VALUES (10, NULL, N'German')
INSERT [dbo].[book_language] ([language_id], [language_code], [language_name]) VALUES (11, NULL, N'Japanese')
INSERT [dbo].[book_language] ([language_id], [language_code], [language_name]) VALUES (12, NULL, N'Arabic')
INSERT [dbo].[book_language] ([language_id], [language_code], [language_name]) VALUES (13, NULL, N'Dutch')
INSERT [dbo].[book_language] ([language_id], [language_code], [language_name]) VALUES (14, NULL, N'Chinese')
INSERT [dbo].[book_language] ([language_id], [language_code], [language_name]) VALUES (15, NULL, N'Latin')
INSERT [dbo].[book_language] ([language_id], [language_code], [language_name]) VALUES (16, NULL, N'Portuguese')
INSERT [dbo].[book_language] ([language_id], [language_code], [language_name]) VALUES (17, NULL, N'Serbian')
INSERT [dbo].[book_language] ([language_id], [language_code], [language_name]) VALUES (18, NULL, N'Italian')
INSERT [dbo].[book_language] ([language_id], [language_code], [language_name]) VALUES (19, NULL, N'Russian')
INSERT [dbo].[book_language] ([language_id], [language_code], [language_name]) VALUES (20, NULL, N'Malaysian')
INSERT [dbo].[book_language] ([language_id], [language_code], [language_name]) VALUES (21, NULL, N'Galician')
INSERT [dbo].[book_language] ([language_id], [language_code], [language_name]) VALUES (22, NULL, N'Welsh')
INSERT [dbo].[book_language] ([language_id], [language_code], [language_name]) VALUES (23, NULL, N'Swedish')
INSERT [dbo].[book_language] ([language_id], [language_code], [language_name]) VALUES (24, NULL, N'Norwegian')
INSERT [dbo].[book_language] ([language_id], [language_code], [language_name]) VALUES (25, NULL, N'Turkish')
INSERT [dbo].[book_language] ([language_id], [language_code], [language_name]) VALUES (26, NULL, N'Gaelic')
INSERT [dbo].[book_language] ([language_id], [language_code], [language_name]) VALUES (27, NULL, N'Aleut')


END
GO
