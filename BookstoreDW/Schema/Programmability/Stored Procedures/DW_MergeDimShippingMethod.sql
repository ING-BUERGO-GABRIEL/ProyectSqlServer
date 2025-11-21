CREATE PROCEDURE [dbo].[DW_MergeDimShippingMethod]
AS
BEGIN
        SET NOCOUNT ON;

        MERGE [dbo].[DimShippingMethod] AS target
        USING (
                SELECT [MethodID]
                      ,[MethodName]
                      ,[BaseCost]
                FROM [staging].[DimShippingMethod]
        ) AS source
                ON target.[MethodID] = source.[MethodID]
        WHEN MATCHED THEN
                UPDATE SET [MethodName] = source.[MethodName]
                         ,[BaseCost]   = source.[BaseCost]
        WHEN NOT MATCHED THEN
                INSERT (
                        [MethodID]
                       ,[MethodName]
                       ,[BaseCost]
                )
                VALUES (
                        source.[MethodID]
                       ,source.[MethodName]
                       ,source.[BaseCost]
                );
END
GO
