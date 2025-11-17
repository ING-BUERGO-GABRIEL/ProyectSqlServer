CREATE TABLE [dbo].[FactProcurementOrders]
(
        [ProcurementOrderSK]        BIGINT        IDENTITY(1,1) NOT NULL CONSTRAINT PK_FactProcurementOrders PRIMARY KEY,
        [SupplierSK]                INT           NOT NULL,
        [ProductSK]                 INT           NOT NULL,
        [WarehouseSK]               INT           NOT NULL,
        [ShippingMethodSK]          INT           NOT NULL,
        [OrderDateSK]               INT           NOT NULL,
        [ExpectedDeliveryDateSK]    INT           NOT NULL,
        [ActualDeliveryDateSK]      INT           NULL,
        [PurchaseOrderNumber]       VARCHAR(50)   NOT NULL,
        [PurchaseOrderLineNumber]   SMALLINT      NOT NULL,
        [OrderStatus]               VARCHAR(25)   NOT NULL,
        [OrderedQuantity]           INT           NOT NULL,
        [ReceivedQuantity]          INT           NULL,
        [UnitCost]                  MONEY         NOT NULL,
        [FreightCost]               MONEY         NULL,
        [DiscountAmount]            MONEY         NULL,
        [DamageUnits]               INT           NULL,
        [LeadTimeDays]              INT           NULL,
        [ConformanceScore]          DECIMAL(5,2)  NULL,
        [CreatedOn]                 DATETIME2(2)  NOT NULL CONSTRAINT DF_FactProcurementOrders_CreatedOn DEFAULT (SYSUTCDATETIME()),
        CONSTRAINT FK_FactProcurementOrders_DimSupplier           FOREIGN KEY ([SupplierSK])           REFERENCES [dbo].[DimSupplier]([SupplierSK]),
        CONSTRAINT FK_FactProcurementOrders_DimProcurementProduct FOREIGN KEY ([ProductSK])            REFERENCES [dbo].[DimProcurementProduct]([ProductSK]),
        CONSTRAINT FK_FactProcurementOrders_DimWarehouse          FOREIGN KEY ([WarehouseSK])          REFERENCES [dbo].[DimWarehouse]([WarehouseSK]),
        CONSTRAINT FK_FactProcurementOrders_DimShippingMethod     FOREIGN KEY ([ShippingMethodSK])     REFERENCES [dbo].[DimShippingMethod]([ShippingMethodSK]),
        CONSTRAINT FK_FactProcurementOrders_OrderDate             FOREIGN KEY ([OrderDateSK])          REFERENCES [dbo].[DimDate]([DateSK]),
        CONSTRAINT FK_FactProcurementOrders_ExpectedDeliveryDate  FOREIGN KEY ([ExpectedDeliveryDateSK]) REFERENCES [dbo].[DimDate]([DateSK]),
        CONSTRAINT FK_FactProcurementOrders_ActualDeliveryDate    FOREIGN KEY ([ActualDeliveryDateSK]) REFERENCES [dbo].[DimDate]([DateSK])
);
GO

CREATE UNIQUE NONCLUSTERED INDEX IX_FactProcurementOrders_UQ
        ON [dbo].[FactProcurementOrders] ([PurchaseOrderNumber], [PurchaseOrderLineNumber])
        INCLUDE ([SupplierSK], [ProductSK], [OrderDateSK]);
