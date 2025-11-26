CREATE PROCEDURE [dbo].[DW_MergeDimAddress]
AS
BEGIN
         UPDATE da
        SET [StreetNumber]    = sa.[StreetNumber]
           ,[StreetName]      = sa.[StreetName]
           ,[City]            = sa.[City]
           ,[CountryID]       = sa.[CountryID]
           ,[CountryName]     = sa.[CountryName]
           ,[AddressStatusID] = sa.[AddressStatusID]
           ,[AddressStatus]   = sa.[AddressStatus]
        FROM [dbo].[DimAddress]        AS da
        INNER JOIN [staging].[DimAddress] AS sa
                ON da.[AddressID] = sa.[AddressID];
END
GO
