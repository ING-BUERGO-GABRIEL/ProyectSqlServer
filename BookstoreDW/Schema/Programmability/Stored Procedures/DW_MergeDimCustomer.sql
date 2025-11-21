CREATE PROCEDURE [dbo].[DW_MergeDimCustomer]
AS
BEGIN
        SET NOCOUNT ON;

        DECLARE @changeDate DATETIME2(0) = SYSDATETIME();

        UPDATE currentRows
        SET [IsCurrent] = 0
           ,[EffectiveEndDate] = @changeDate
        FROM [dbo].[DimCustomer] AS currentRows
        INNER JOIN [staging].[DimCustomer] AS source
                ON currentRows.[CustomerID] = source.[CustomerID]
        WHERE currentRows.[IsCurrent] = 1
          AND (
                ISNULL(currentRows.[FirstName], '')       <> ISNULL(source.[FirstName], '') OR
                ISNULL(currentRows.[LastName], '')        <> ISNULL(source.[LastName], '') OR
                ISNULL(currentRows.[Email], '')           <> ISNULL(source.[Email], '') OR
                ISNULL(currentRows.[AddressID], -1)       <> ISNULL(source.[AddressID], -1) OR
                ISNULL(currentRows.[AddressStatusID], -1) <> ISNULL(source.[AddressStatusID], -1) OR
                ISNULL(currentRows.[StreetNumber], '')    <> ISNULL(source.[StreetNumber], '') OR
                ISNULL(currentRows.[StreetName], '')      <> ISNULL(source.[StreetName], '') OR
                ISNULL(currentRows.[City], '')            <> ISNULL(source.[City], '') OR
                ISNULL(currentRows.[CountryName], '')     <> ISNULL(source.[CountryName], '') OR
                ISNULL(currentRows.[AddressStatus], '')   <> ISNULL(source.[AddressStatus], '')
          );

        INSERT INTO [dbo].[DimCustomer]
        (
                [CustomerID]
               ,[FirstName]
               ,[LastName]
               ,[Email]
               ,[AddressID]
               ,[AddressStatusID]
               ,[StreetNumber]
               ,[StreetName]
               ,[City]
               ,[CountryName]
               ,[AddressStatus]
               ,[IsCurrent]
               ,[EffectiveStartDate]
               ,[EffectiveEndDate]
        )
        SELECT source.[CustomerID]
              ,source.[FirstName]
              ,source.[LastName]
              ,source.[Email]
              ,source.[AddressID]
              ,source.[AddressStatusID]
              ,source.[StreetNumber]
              ,source.[StreetName]
              ,source.[City]
              ,source.[CountryName]
              ,source.[AddressStatus]
              ,1
              ,@changeDate
              ,NULL
        FROM [staging].[DimCustomer] AS source
        LEFT JOIN [dbo].[DimCustomer] AS currentRows
                ON currentRows.[CustomerID] = source.[CustomerID]
               AND currentRows.[IsCurrent] = 1
        WHERE currentRows.[CustomerID] IS NULL
           OR (
                ISNULL(currentRows.[FirstName], '')       <> ISNULL(source.[FirstName], '') OR
                ISNULL(currentRows.[LastName], '')        <> ISNULL(source.[LastName], '') OR
                ISNULL(currentRows.[Email], '')           <> ISNULL(source.[Email], '') OR
                ISNULL(currentRows.[AddressID], -1)       <> ISNULL(source.[AddressID], -1) OR
                ISNULL(currentRows.[AddressStatusID], -1) <> ISNULL(source.[AddressStatusID], -1) OR
                ISNULL(currentRows.[StreetNumber], '')    <> ISNULL(source.[StreetNumber], '') OR
                ISNULL(currentRows.[StreetName], '')      <> ISNULL(source.[StreetName], '') OR
                ISNULL(currentRows.[City], '')            <> ISNULL(source.[City], '') OR
                ISNULL(currentRows.[CountryName], '')     <> ISNULL(source.[CountryName], '') OR
                ISNULL(currentRows.[AddressStatus], '')   <> ISNULL(source.[AddressStatus], '')
           );
END
GO
