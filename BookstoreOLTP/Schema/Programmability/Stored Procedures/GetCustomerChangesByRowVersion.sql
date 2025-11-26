CREATE PROCEDURE [dbo].[GetCustomerChangesByRowVersion]
(
   @startRow BIGINT
   ,@endRow  BIGINT
)
AS
BEGIN
      SET NOCOUNT ON;

    /*
        Returns customer and address attributes for rows whose rowversion changed
        in customer, customer_address, address, country, or address_status.
        Designed to feed BookstoreDW staging.DimCustomer.
    */
    SELECT DISTINCT
           c.[customer_id]          AS [CustomerID],
           c.[first_name]           AS [FirstName],
           c.[last_name]            AS [LastName],
           c.[email]                AS [Email],
           ca.[address_id]          AS [AddressID],
           ca.[status_id]           AS [AddressStatusID],
           a.[street_number]        AS [StreetNumber],
           a.[street_name]          AS [StreetName],
           a.[city]                 AS [City],
           co.[country_name]        AS [CountryName],
           ads.[address_status]     AS [AddressStatus]
    FROM [dbo].[customer] c
    LEFT JOIN [dbo].[customer_address] ca
        ON ca.[customer_id] = c.[customer_id]
    LEFT JOIN [dbo].[address] a
        ON a.[address_id] = ca.[address_id]
    LEFT JOIN [dbo].[country] co
        ON co.[country_id] = a.[country_id]
    LEFT JOIN [dbo].[address_status] ads
        ON ads.[status_id] = ca.[status_id]
    WHERE
        (c.[rowversion]  > CONVERT(ROWVERSION, @startRow) AND c.[rowversion]  <= CONVERT(ROWVERSION, @endRow)) OR
        (ca.[rowversion] > CONVERT(ROWVERSION, @startRow) AND ca.[rowversion] <= CONVERT(ROWVERSION, @endRow)) OR
        (a.[rowversion]  > CONVERT(ROWVERSION, @startRow) AND a.[rowversion]  <= CONVERT(ROWVERSION, @endRow)) OR
        (co.[rowversion] > CONVERT(ROWVERSION, @startRow) AND co.[rowversion] <= CONVERT(ROWVERSION, @endRow)) OR
        (ads.[rowversion]> CONVERT(ROWVERSION, @startRow) AND ads.[rowversion]<= CONVERT(ROWVERSION, @endRow));
END
GO
