USE SuperStoreDB;

DROP VIEW IF EXISTS DimDate_V

CREATE VIEW DimDate_V 
AS
	SELECT
		T.DateKey		AS DateKey,
		T.[DayOfMonth]	AS [DayOfMonth],
		T.MonthOfYear	AS MonthOfYear,
		T.[Year]		AS [Year],
		T.[DayOfWeek]	AS [DayOfWeek],
		T.WeekOfYear	AS WeekOfYear,
		T.[DayOfYear]	AS [DayOfYear],
		T.[MonthName]	AS [MonthName],
		T.[Quarter]		AS [Quarter],
		T.QuarterName	AS QuarterName
	FROM DimDate_T		AS T;