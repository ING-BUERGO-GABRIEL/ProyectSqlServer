PRINT 'Populating country table';
IF EXISTS (SELECT 1 FROM dbo.country)
BEGIN
    PRINT 'Skipping country inserts because table already contains data.';
END
ELSE
BEGIN
    INSERT INTO dbo.country (country_id, country_name) VALUES
        (1, 'Mexico'),
        (2, 'United States'),
        (3, 'Spain');
END
GO
