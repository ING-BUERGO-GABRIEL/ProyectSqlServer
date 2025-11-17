CREATE TABLE [dbo].[DimWarehouse]
(
        [WarehouseSK]      INT            IDENTITY(1,1) NOT NULL CONSTRAINT PK_DimWarehouse PRIMARY KEY,
        [WarehouseID]      INT            NULL,
        [WarehouseName]    VARCHAR(255)   NOT NULL,
        [WarehouseType]    VARCHAR(50)    NOT NULL,
        [ManagerName]      VARCHAR(255)   NULL,
        [Phone]            VARCHAR(25)    NULL,
        [Email]            VARCHAR(255)   NULL,
        [Country]          VARCHAR(100)   NOT NULL,
        [StateProvince]    VARCHAR(100)   NULL,
        [City]             VARCHAR(100)   NULL,
        [StreetAddress]    VARCHAR(255)   NULL,
        [PostalCode]       VARCHAR(20)    NULL,
        [Latitude]         DECIMAL(9,6)   NULL,
        [Longitude]        DECIMAL(9,6)   NULL,
        [SquareMeters]     INT            NULL,
        [TemperatureClass] VARCHAR(25)    NULL,
        [Is3PL]            BIT            NOT NULL CONSTRAINT DF_DimWarehouse_Is3PL DEFAULT (0),
        [EffectiveStartDate] DATE         NOT NULL,
        [EffectiveEndDate]   DATE         NULL
);
