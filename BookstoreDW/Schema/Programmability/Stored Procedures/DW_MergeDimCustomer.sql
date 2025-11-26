CREATE PROCEDURE [dbo].[DW_MergeDimCustomer]
AS
BEGIN
        UPDATE dc
        SET [FirstName]       = sc.[FirstName]
           ,[LastName]        = sc.[LastName]
           ,[Email]           = sc.[Email]
           ,[AddressID]       = sc.[AddressID]
           ,[AddressStatusID] = sc.[AddressStatusID]
           ,[StreetNumber]    = sc.[StreetNumber]
           ,[StreetName]      = sc.[StreetName]
           ,[City]            = sc.[City]
           ,[CountryName]     = sc.[CountryName]
           ,[AddressStatus]   = sc.[AddressStatus]
        FROM [dbo].[DimCustomer] AS dc
        INNER JOIN [staging].[DimCustomer] AS sc
                ON dc.[CustomerID] = sc.[CustomerID];
END
GO
