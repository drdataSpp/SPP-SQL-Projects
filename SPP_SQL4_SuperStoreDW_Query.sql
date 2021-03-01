-- 1.Creating view to show top 5 states by sales.

USE SuperShopDB
GO

DROP VIEW IF EXISTS vTop5StatesAndSales
GO

CREATE VIEW vTop5StatesAndSales 
AS
	SELECT TOP 5 [State], [Sales]
	FROM [dbo].[SuperShop ]
	ORDER BY [Sales] DESC
GO

SELECT * FROM vTop5StatesAndSales;
-------------------------------------------------------------------------------------

-- 2. Creating view to show last 5 states by sales.

USE SuperShopDB
GO

DROP VIEW IF EXISTS vLast5StatesAndSales
GO

CREATE VIEW vLast5StatesAndSales 
AS
	SELECT TOP 5 [State], [Sales]
	FROM [dbo].[SuperShop ]
	ORDER BY [Sales] ASC
GO

SELECT * FROM vLast5StatesAndSales;
-------------------------------------------------------------------------------------

-- 3.Creating view to show top 5 City by sales.

USE SuperShopDB
GO

DROP VIEW IF EXISTS vTop5CityAndSales
GO

CREATE VIEW vTop5CityAndSales 
AS
	SELECT TOP 5 [City], [Sales]
	FROM [dbo].[SuperShop ]
	ORDER BY [Sales] DESC
GO

SELECT * FROM vTop5CityAndSales;
-------------------------------------------------------------------------------------

-- 4.Creating view to show last 5 City by sales.

USE SuperShopDB
GO

DROP VIEW IF EXISTS vLast5CityAndSales
GO

CREATE VIEW vLast5CityAndSales 
AS
	SELECT TOP 5 [City], [Sales]
	FROM [dbo].[SuperShop ]
	ORDER BY [Sales] ASC
GO

SELECT * FROM vLast5CityAndSales;
-------------------------------------------------------------------------------------

-- 5. Average Sales By Post Code
USE SuperShopDB
GO

DROP PROCEDURE IF EXISTS spAverageSalesByPostCode
GO

CREATE PROCEDURE spAverageSalesByPostCode (@PostCode INT)
AS
	SELECT [Postal_Code], ROUND(AVG([Sales]), 2) AS 'Average Sales by Postcode'
	FROM [dbo].[SuperShop ]
	WHERE [Postal_Code] = @PostCode
	GROUP BY [Postal_Code] 
GO

EXEC spAverageSalesByPostCode 77041;
-------------------------------------------------------------------------------------

-- 6. Top 5 Products by Profit and Year

Use SuperShopDB
GO

DROP PROCEDURE IF EXISTS spTop5ProductsByYearAndProfit
GO

CREATE PROCEDURE spTop5ProductsByYearAndProfit (@Year INT)
AS
	SELECT TOP 5 [Product_Name], [Profit] 
	FROM [dbo].[SuperShop]
	WHERE YEAR([Order_Date]) = @Year
	ORDER BY [Profit] DESC
GO

EXEC spTop5ProductsByYearAndProfit 2014;
-------------------------------------------------------------------------------------

-- 7. Top 5 Products by Sales and Year

USE SuperShopDB
GO

DROP PROCEDURE IF EXISTS spTop5ProductsByYearAndSale
GO

CREATE PROCEDURE spTop5ProductsByYearAndSales (@Year INT)
AS
	SELECT TOP 5 [Product_Name], [Sales] 
	FROM [dbo].[SuperShop]
	WHERE YEAR([Order_Date]) = @Year
	ORDER BY [Sales] DESC
GO

EXEC spTop5ProductsByYearAndSales 2014;

-------------------------------------------------------------------------------------

-- 8. Top 10 Products by Total Orders, Year and State

USE SuperShopDB
GO

DROP PROCEDURE IF EXISTS spTop10ProductsByYearAndState 
GO

CREATE PROCEDURE spTop10ProductsByYearAndState (@YEAR INT, @STATE VARCHAR(50))
AS
	SELECT TOP 10 [Product_Name], COUNT([Order_ID]) AS 'TOTAL ORDERS'
	FROM [dbo].[SuperShop]
	WHERE YEAR([Order_Date]) = @YEAR AND [State] = @STATE
	GROUP BY [Product_Name]
	ORDER BY COUNT([Order_ID]) DESC
GO

EXEC spTop10ProductsByYearAndState 2014, 'California';

-------------------------------------------------------------------------------------

-- 9. Top 10 Products by Total Orders, Year and City

USE SuperShopDB
GO

DROP PROCEDURE IF EXISTS spTop10ProductsByYearAndCity
GO

CREATE PROCEDURE spTop10ProductsByYearAndCity (@YEAR INT, @CITY VARCHAR(50))
AS
	SELECT TOP 10 [Product_Name], COUNT([Order_ID]) AS 'TOTAL ORDERS'
	FROM [dbo].[SuperShop]
	WHERE YEAR([Order_Date]) = @YEAR AND [City] = @CITY
	GROUP BY [Product_Name]
	ORDER BY COUNT([Order_ID]) DESC
GO

EXEC spTop10ProductsByYearAndCity 2014, 'Los Angeles';

-------------------------------------------------------------------------------------

-- 10. Highest Profit by Consumer Segment

USE SuperShopDB
GO

DROP PROCEDURE IF EXISTS spTopProfitConsumerByYear
GO

CREATE PROCEDURE spTopProfitConsumerByYear (@YEAR INT)
AS
	SELECT TOP 1 [Segment], [Profit]
	FROM [dbo].[SuperShop]
	WHERE YEAR([Order_Date]) = @YEAR
	ORDER BY [Profit] DESC
GO

EXEC spTopProfitConsumerByYear 2017;

-------------------------------------------------------------------------------------

-- 11. Select Products by Discount Rate

USE SuperShopDB
GO

DROP PROCEDURE IF EXISTS spSelectProductsByDiscountRate
GO

CREATE PROCEDURE spSelectProductsByDiscountRate (@DISCOUNT DECIMAL)
AS
	SELECT [Product_Name], [Discount] 
	FROM [dbo].[SuperShop]
	WHERE [Discount] <= @DISCOUNT
	ORDER BY [Discount] DESC 
GO

EXEC spSelectProductsByDiscountRate 0.4;

-------------------------------------------------------------------------------------

-- 12. Total Customers by City

USE SuperShopDB
GO

SELECT [City], COUNT([Customer_ID]) AS 'Total Customers'
FROM [dbo].[SuperShop]
GROUP BY [City]
ORDER BY COUNT([Customer_ID]) DESC

-------------------------------------------------------------------------------------

-- 13. Total Customers by State

USE SuperShopDB
GO

SELECT [State], COUNT([Customer_ID]) AS 'Total Customers'
FROM [dbo].[SuperShop]
GROUP BY [State]
ORDER BY COUNT([Customer_ID]) DESC

-------------------------------------------------------------------------------------
-- THE END
-------------------------------------------------------------------------------------


