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
          CAST(NULL AS INT)                AS [CustomerKey],
          c.[customer_id]                  AS [CustomerID],
          COALESCE(c.[first_name], '')     AS [FirstName],
          COALESCE(c.[last_name], '')      AS [LastName],
          COALESCE(c.[email], '')          AS [Email],
          COALESCE(ca.[address_id], 0)     AS [AddressID],
          COALESCE(ca.[status_id], 0)      AS [AddressStatusID],
          COALESCE(a.[street_number], '')  AS [StreetNumber],
          COALESCE(a.[street_name], '')    AS [StreetName],
          COALESCE(a.[city], '')           AS [City],
          COALESCE(co.[country_name], '')  AS [CountryName],
          COALESCE(ads.[address_status], '') AS [AddressStatus],
          CAST(1 AS BIT)                   AS [IsCurrent],
          CAST(SYSUTCDATETIME() AS DATETIME2(0)) AS [EffectiveStartDate],
          CAST(NULL AS DATETIME2(0))       AS [EffectiveEndDate]
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
