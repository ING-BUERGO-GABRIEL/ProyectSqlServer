CREATE PROCEDURE [dbo].[GetAddressChangesByRowVersion]
(
    @startRow BIGINT,
    @endRow   BIGINT
)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        a.[address_id],
        a.[street_number],
        a.[street_name],
        a.[city],
        a.[country_id],
        co.[country_name]           AS CountryName,
        ca.[customer_id],
        ca.[status_id]              AS AddressStatusID,
        ads.[address_status]        AS AddressStatus
    FROM [dbo].[address] a
    LEFT JOIN [dbo].[country] co 
        ON co.country_id = a.country_id
    LEFT JOIN [dbo].[customer_address] ca 
        ON ca.address_id = a.address_id
    LEFT JOIN [dbo].[address_status] ads 
        ON ads.status_id = ca.status_id
    WHERE
        (a.[rowversion] > CONVERT(ROWVERSION, @startRow) 
         AND a.[rowversion] <= CONVERT(ROWVERSION, @endRow))
    OR 
        (co.[rowversion] > CONVERT(ROWVERSION, @startRow) 
         AND co.[rowversion] <= CONVERT(ROWVERSION, @endRow))
    OR 
        (ca.[rowversion] > CONVERT(ROWVERSION, @startRow) 
         AND ca.[rowversion] <= CONVERT(ROWVERSION, @endRow))
    OR
        (ads.[rowversion] > CONVERT(ROWVERSION, @startRow) 
         AND ads.[rowversion] <= CONVERT(ROWVERSION, @endRow));
END
GO
