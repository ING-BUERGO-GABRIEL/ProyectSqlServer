CREATE TABLE [dbo].[DimSupplier]
(
        [SupplierSK]            INT            IDENTITY(1,1) NOT NULL CONSTRAINT PK_DimSupplier PRIMARY KEY,
        [SupplierID]            INT            NULL,
        [SupplierName]          VARCHAR(255)   NOT NULL,
        [SupplierType]          VARCHAR(50)    NOT NULL,
        [ContactName]           VARCHAR(255)   NULL,
        [ContactEmail]          VARCHAR(255)   NULL,
        [ContactPhone]          VARCHAR(25)    NULL,
        [Country]               VARCHAR(100)   NOT NULL,
        [StateProvince]         VARCHAR(100)   NULL,
        [City]                  VARCHAR(100)   NULL,
        [StreetAddress]         VARCHAR(255)   NULL,
        [PostalCode]            VARCHAR(20)    NULL,
        [SupplierStatus]        VARCHAR(25)    NOT NULL CONSTRAINT DF_DimSupplier_SupplierStatus DEFAULT ('Active'),
        [PreferredCarrier]      VARCHAR(100)   NULL,
        [LeadTimeClass]         VARCHAR(25)    NULL,
        [OnTimeDeliveryScore]   DECIMAL(5,2)   NULL,
        [QualityRating]         DECIMAL(5,2)   NULL,
        [SustainabilityRating]  DECIMAL(5,2)   NULL,
        [EffectiveStartDate]    DATE           NOT NULL,
        [EffectiveEndDate]      DATE           NULL
);
