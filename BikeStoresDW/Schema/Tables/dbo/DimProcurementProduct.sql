CREATE TABLE [dbo].[DimProcurementProduct]
(
        [ProductSK]            INT            IDENTITY(1,1) NOT NULL CONSTRAINT PK_DimProcurementProduct PRIMARY KEY,
        [ProductID]            INT            NULL,
        [ProductName]          VARCHAR(255)   NOT NULL,
        [BrandName]            VARCHAR(255)   NOT NULL,
        [CategoryName]         VARCHAR(255)   NOT NULL,
        [SubcategoryName]      VARCHAR(255)   NULL,
        [SKU]                  VARCHAR(50)    NULL,
        [UnitOfMeasure]        VARCHAR(50)    NOT NULL,
        [LifecycleStatus]      VARCHAR(25)    NOT NULL CONSTRAINT DF_DimProcurementProduct_LifecycleStatus DEFAULT ('Active'),
        [SafetyStockLevel]     INT            NULL,
        [ReorderPoint]         INT            NULL,
        [StandardCost]         MONEY          NULL,
        [WeightClass]          VARCHAR(25)    NULL,
        [IsHazardous]          BIT            NOT NULL CONSTRAINT DF_DimProcurementProduct_IsHazardous DEFAULT (0),
        [RequiresColdChain]    BIT            NOT NULL CONSTRAINT DF_DimProcurementProduct_RequiresColdChain DEFAULT (0),
        [EffectiveStartDate]   DATE           NOT NULL,
        [EffectiveEndDate]     DATE           NULL
);
