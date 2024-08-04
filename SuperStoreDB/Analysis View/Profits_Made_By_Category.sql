USE SuperStoreDB;

DROP VIEW IF EXISTS ProfitsByCategory_V;

CREATE VIEW ProfitsByCategory_V AS
SELECT
	CAT.Category_Name, 
	ROUND(SUM(FCT.[Profit]), 2) AS TOTAL_PROFIT
FROM [dbo].[FactSales_V] AS FCT

INNER JOIN [dbo].[DimProduct_V] AS PROD ON
	PROD.[ProdID] = FCT.ProductID

INNER JOIN [dbo].[DimSubCategory_V] AS SUB ON
	SUB.SubCategoryID = PROD.SubCategoryID

INNER JOIN [dbo].[DimCategory_V] AS CAT ON 
	CAT.CategoryID = SUB.CategoryID

GROUP BY CAT.Category_Name;

-- SELECTING FROM THE VIEW
SELECT * FROM ProfitsByCategory_V
ORDER BY TOTAL_PROFIT DESC; -- TECHNOLOGY CATEGORY HAS MADE THE HIGHEST PROFIT. 
