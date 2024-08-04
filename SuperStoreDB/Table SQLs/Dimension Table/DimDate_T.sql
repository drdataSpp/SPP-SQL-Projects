USE SuperStoreDB;

DROP TABLE IF EXISTS DimDate_T 

CREATE TABLE DimDate_T(
	 DateKey int PRIMARY KEY NOT NULL
	,DayOfMonth tinyint NULL
	,MonthOfYear tinyint NULL
	,[Year] smallint NULL
	,[DayOfWeek] varchar(15) NULL
	,WeekOfYear tinyint NULL
	,[DayOfYear] smallint NULL
	,[MonthName] varchar(20) NULL
	,[Quarter] tinyint NULL
	,QuarterName varchar(20) NULL
);