CREATE PROCEDURE [dbo].[GetOrdersChangesByRowVersion]
(
   @startRow BIGINT
   ,@endRow  BIGINT
)
AS
BEGIN
        SET NOCOUNT ON;

        DECLARE @startVersion ROWVERSION = CONVERT(ROWVERSION,@startRow);
        DECLARE @endVersion   ROWVERSION = CONVERT(ROWVERSION,@endRow);

        WITH ChangedOrders AS (
                SELECT DISTINCT ord.[order_id]
                FROM [dbo].[cust_order] ord
                WHERE ord.[rowversion] > @startVersion
                  AND ord.[rowversion] <= @endVersion

                UNION

                SELECT DISTINCT ol.[order_id]
                FROM [dbo].[order_line] ol
                WHERE ol.[rowversion] > @startVersion
                  AND ol.[rowversion] <= @endVersion

                UNION

                SELECT DISTINCT oh.[order_id]
                FROM [dbo].[order_history] oh
                WHERE oh.[rowversion] > @startVersion
                  AND oh.[rowversion] <= @endVersion
        ), LatestStatus AS (
                SELECT oh.[order_id]
                      ,oh.[status_id]
                      ,oh.[status_date]
                      ,ROW_NUMBER() OVER(PARTITION BY oh.[order_id] ORDER BY oh.[status_date] DESC, oh.[history_id] DESC) AS rn
                FROM [dbo].[order_history] oh
        )
        SELECT ord.[order_id]
              ,ol.[line_id] AS [order_line_id]
              ,OrderDateKey = CASE
                                        WHEN ord.[order_date] IS NULL THEN NULL
                                        ELSE CONVERT(INT,
                                                        (CONVERT(CHAR(4),DATEPART(YEAR,ord.[order_date]))
                                                + CASE
                                                                WHEN DATEPART(MONTH,ord.[order_date]) < 10 THEN '0' + CONVERT(CHAR(1),DATEPART(MONTH,ord.[order_date]))
                                                                ELSE + CONVERT(CHAR(2),DATEPART(MONTH,ord.[order_date]))
                                                        END
                                                + CASE
                                                                WHEN DATEPART(DAY,ord.[order_date]) < 10 THEN '0' + CONVERT(CHAR(1),DATEPART(DAY,ord.[order_date]))
                                                                ELSE + CONVERT(CHAR(2),DATEPART(DAY,ord.[order_date]))
                                                        END))
                                END
              ,ShipDateKey = CASE
                                        WHEN ls.[status_date] IS NULL THEN NULL
                                        ELSE CONVERT(INT,
                                                        (CONVERT(CHAR(4),DATEPART(YEAR,ls.[status_date]))
                                                + CASE
                                                                WHEN DATEPART(MONTH,ls.[status_date]) < 10 THEN '0' + CONVERT(CHAR(1),DATEPART(MONTH,ls.[status_date]))
                                                                ELSE + CONVERT(CHAR(2),DATEPART(MONTH,ls.[status_date]))
                                                        END
                                                + CASE
                                                                WHEN DATEPART(DAY,ls.[status_date]) < 10 THEN '0' + CONVERT(CHAR(1),DATEPART(DAY,ls.[status_date]))
                                                                ELSE + CONVERT(CHAR(2),DATEPART(DAY,ls.[status_date]))
                                                        END))
                                END
              ,ord.[customer_id]
              ,ord.[shipping_method_id]
              ,ord.[dest_address_id]
              ,ls.[status_id]
              ,ol.[book_id]
              ,Quantity = 1
              ,UnitPrice = ISNULL(ol.[price], 0)
              ,ord.[order_date]
              ,ShipDate = ls.[status_date]
        FROM ChangedOrders co
        INNER JOIN [dbo].[cust_order] ord
                ON ord.[order_id] = co.[order_id]
        INNER JOIN [dbo].[order_line] ol
                ON ord.[order_id] = ol.[order_id]
        LEFT JOIN LatestStatus ls
                ON ord.[order_id] = ls.[order_id]
               AND ls.rn = 1
        WHERE ord.[rowversion] <= @endVersion
          AND ol.[rowversion] <= @endVersion;
END
GO
