CREATE TABLE [dbo].[DimShippingMethod]
(
        [ShippingMethodSK]    INT            IDENTITY(1,1) NOT NULL CONSTRAINT PK_DimShippingMethod PRIMARY KEY,
        [ShippingMethodID]    INT            NULL,
        [MethodName]          VARCHAR(255)   NOT NULL,
        [CarrierName]         VARCHAR(255)   NOT NULL,
        [TransportationMode]  VARCHAR(25)    NOT NULL,
        [ServiceLevel]        VARCHAR(25)    NOT NULL,
        [TemperatureControl]  BIT            NOT NULL CONSTRAINT DF_DimShippingMethod_TemperatureControl DEFAULT (0),
        [MaxWeightKg]         DECIMAL(10,2)  NULL,
        [AverageTransitDays]  DECIMAL(5,2)   NULL,
        [TrackingUrl]         VARCHAR(500)   NULL,
        [CarbonOffsetPartner] VARCHAR(255)   NULL,
        [EffectiveStartDate]  DATE           NOT NULL,
        [EffectiveEndDate]    DATE           NULL
);
