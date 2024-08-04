USE SuperStoreDB;

DROP VIEW IF EXISTS ProfitsBySubCategory_V;

CREATE VIEW ProfitsBySubCategory_V AS
SELECT
	SUB.Sub_Category_Name, 
	ROUND(SUM(FCT.[Profit]), 2) AS TOTAL_PROFIT
FROM [dbo].[FactSales_V] AS FCT

INNER JOIN [dbo].[DimProduct_V] AS PROD ON
	PROD.[ProdID] = FCT.ProductID

INNER JOIN [dbo].[DimSubCategory_V] AS SUB ON
	SUB.SubCategoryID = PROD.SubCategoryID

GROUP BY SUB.Sub_Category_Name;

-- SELECTING FROM THE VIEW
SELECT * FROM ProfitsBySubCategory_V
ORDER BY TOTAL_PROFIT DESC; -- Copiers SUB-CATEGORY HAS MADE THE HIGHEST PROFIT & Tables SUB-CATEGORY HAS THE HIGHEST LOSS. 
