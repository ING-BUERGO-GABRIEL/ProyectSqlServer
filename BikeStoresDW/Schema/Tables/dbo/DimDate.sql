CREATE TABLE [dbo].[DimDate]
(
        [DateSK]            INT           NOT NULL CONSTRAINT PK_DimDate PRIMARY KEY,
        [Date]              DATE          NOT NULL,
        [FullDateLabel]     VARCHAR(50)   NOT NULL,
        [DayNumberOfWeek]   TINYINT       NOT NULL,
        [DayNameOfWeek]     VARCHAR(20)   NOT NULL,
        [DayNumberOfMonth]  TINYINT       NOT NULL,
        [DayNumberOfYear]   SMALLINT      NOT NULL,
        [WeekNumberOfYear]  TINYINT       NOT NULL,
        [MonthNumber]       TINYINT       NOT NULL,
        [MonthName]         VARCHAR(20)   NOT NULL,
        [QuarterNumber]     TINYINT       NOT NULL,
        [QuarterLabel]      VARCHAR(6)    NOT NULL,
        [YearNumber]        SMALLINT      NOT NULL,
        [FiscalMonthNumber] TINYINT       NOT NULL,
        [FiscalQuarter]     VARCHAR(6)    NOT NULL,
        [FiscalYear]        SMALLINT      NOT NULL,
        [IsWeekend]         BIT           NOT NULL CONSTRAINT DF_DimDate_IsWeekend DEFAULT (0),
        [IsHoliday]         BIT           NOT NULL CONSTRAINT DF_DimDate_IsHoliday DEFAULT (0),
        [HolidayName]       VARCHAR(50)   NULL
);
