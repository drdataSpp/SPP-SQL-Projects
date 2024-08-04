USE SuperStoreDB;

DROP PROCEDURE IF EXISTS sp_Top5ProfitableCitiesByCountry;

CREATE PROCEDURE sp_Top5ProfitableCitiesByCountry @Country VARCHAR(255)
AS 

SELECT TOP 5 STAT.State_Name	AS STATE_NAME,
		SUM(FACT.Profit)		AS TOTAL_PROFIT
	   
FROM [dbo].[FactSales_V] AS FACT

INNER JOIN [dbo].[DimState_V] AS STAT
	ON STAT.StateID = FACT.StateID

INNER JOIN [dbo].[DimCountry_V] AS CNTRY
	ON CNTRY.CountryID = STAT.CountryID

WHERE CNTRY.Country_Name = @Country

GROUP BY STATE_NAME
ORDER BY TOTAL_PROFIT DESC

GO

-- EXECUTING THE ABOVE STORED PROCEDURE

--- Parameters to pass: Country Name

EXEC sp_Top5ProfitableCitiesByCountry 'New Zealand';

--- Result Set:
/*
STATE_NAME		TOTAL_PROFIT
Wellington		10096.59
Waikato			5522.46
Canterbury		3750.27
Bay of Plenty	3592.83
Northland		2454.33
*/