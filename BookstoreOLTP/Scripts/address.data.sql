PRINT 'Populating address table';
IF EXISTS (SELECT 1 FROM dbo.address)
BEGIN
    PRINT 'Skipping address inserts because table already contains data.';
END
ELSE
BEGIN
    INSERT INTO dbo.address (address_id, street_number, street_name, city, country_id) VALUES
        (1, '123', 'Avenida Reforma', 'Mexico City', 1),
        (2, '742', 'Evergreen Terrace', 'Springfield', 2),
        (3, '45', 'Gran Via', 'Madrid', 3);
END
GO
