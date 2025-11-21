CREATE PROCEDURE [dbo].[DW_MergeDimAddress]
AS
BEGIN
        SET NOCOUNT ON;

        MERGE [dbo].[DimAddress] AS target
        USING (
                SELECT [AddressID]
                      ,[StreetNumber]
                      ,[StreetName]
                      ,[City]
                      ,[CountryID]
                      ,[CountryName]
                      ,[AddressStatusID]
                      ,[AddressStatus]
                FROM [staging].[DimAddress]
        ) AS source
                ON target.[AddressID] = source.[AddressID]
        WHEN MATCHED THEN
                UPDATE SET [StreetNumber]     = source.[StreetNumber]
                         ,[StreetName]       = source.[StreetName]
                         ,[City]             = source.[City]
                         ,[CountryID]        = source.[CountryID]
                         ,[CountryName]      = source.[CountryName]
                         ,[AddressStatusID]  = source.[AddressStatusID]
                         ,[AddressStatus]    = source.[AddressStatus]
        WHEN NOT MATCHED THEN
                INSERT (
                        [AddressID]
                       ,[StreetNumber]
                       ,[StreetName]
                       ,[City]
                       ,[CountryID]
                       ,[CountryName]
                       ,[AddressStatusID]
                       ,[AddressStatus]
                )
                VALUES (
                        source.[AddressID]
                       ,source.[StreetNumber]
                       ,source.[StreetName]
                       ,source.[City]
                       ,source.[CountryID]
                       ,source.[CountryName]
                       ,source.[AddressStatusID]
                       ,source.[AddressStatus]
                );
END
GO
