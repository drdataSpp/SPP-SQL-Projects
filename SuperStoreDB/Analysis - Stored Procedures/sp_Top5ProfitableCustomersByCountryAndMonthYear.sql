USE SuperStoreDB;

DROP PROCEDURE IF EXISTS sp_Top5ProfitableCustomersByCountryAndMonthYear;

CREATE PROCEDURE sp_Top5ProfitableCustomersByCountryAndMonthYear 
	--Parameters for sp_Top5ProfitableCustomersByCountryAndMonthYear
	@Country VARCHAR(255),
	@Month INT,
	@Year INT
AS 

SELECT TOP 5 CUST.Customer_Name	AS CUSTOMER_NAME,
		CNTRY.Country_Name		AS COUNTRY_NAME,
		SUM(FACT.Profit)		AS TOTAL_PROFIT
	   
FROM [dbo].[FactSales_V] AS FACT

INNER JOIN [dbo].[DimCustomer_V] AS CUST
	ON CUST.CustomerID = FACT.CustomerID

INNER JOIN [dbo].[DimState_V] AS STAT
	ON STAT.StateID = FACT.StateID

INNER JOIN [dbo].[DimCountry_V] AS CNTRY
	ON CNTRY.CountryID = STAT.CountryID

INNER JOIN [dbo].[DimDate_V] AS DT
	ON DT.DateKey = FACT.OrderDate

WHERE CNTRY.Country_Name = @Country
	AND DT.MonthOfYear = @Month
	AND DT.Year = @Year

GROUP BY CUSTOMER_NAME, COUNTRY_NAME
ORDER BY TOTAL_PROFIT DESC

GO

-- EXECUTING THE ABOVE STORED PROCEDURE

--- Parameters to pass: Country Name

-- Example of checking the top 5 profitable customers on 2011 Christmas period
EXEC sp_Top5ProfitableCustomersByCountryAndMonthYear 'New Zealand', 12, 2011;

--Result set:

/*
Xylona Preis		New Zealand	355.86
Victoria Wilson		New Zealand	78.9
Tim Taslimi	New		Zealand	43.92
Alejandro Savely	New Zealand	9.06
Michael Dominguez	New Zealand	1.032
*/

-- Example of checking the top 5 profitable customers on 2012 Easter period
EXEC sp_Top5ProfitableCustomersByCountryAndMonthYear 'New Zealand', 4, 2012;

--Result set:

/*
Mick Brown		New Zealand	1992.96
Mike Kennedy	New Zealand	127.26
Troy Blackwell	New Zealand	23.76
Craig Leslie	New Zealand	-327.924
*/