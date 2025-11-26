CREATE PROCEDURE [dbo].[DW_MergeDimOrderStatus]
AS
BEGIN
        SET NOCOUNT ON;

        MERGE [dbo].[DimOrderStatus] AS target
        USING (
                SELECT [StatusID]
                      ,[StatusValue]
                FROM [staging].[DimOrderStatus]

                UNION ALL

                SELECT [StatusID] = 0
                      ,[StatusValue] = 'Unknown'
        ) AS source
                ON target.[StatusID] = source.[StatusID]
        WHEN MATCHED THEN
                UPDATE SET [StatusValue] = source.[StatusValue]
        WHEN NOT MATCHED THEN
                INSERT (
                        [StatusID]
                       ,[StatusValue]
                )
                VALUES (
                        source.[StatusID]
                       ,source.[StatusValue]
                );
END
GO
