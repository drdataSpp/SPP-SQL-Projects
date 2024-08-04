USE SuperStoreDB;

-- Top 10 Loss by Sub-Category.

DROP VIEW IF EXISTS Top10LossBySubCategory_V;

CREATE VIEW Top10LossBySubCategory_V AS
SELECT
	SUB.Sub_Category_Name,
	ROUND(SUM(FCT.[Sales]), 2)	AS TOTAL_SALES,
	ROUND(SUM(FCT.[Profit]), 2) AS TOTAL_LOSS,
	SUM(FCT.[Quantity])			AS TOTAL_QUANTITY_SOLD
FROM [dbo].[FactSales_V] AS FCT

INNER JOIN [dbo].[DimProduct_V] AS PROD ON
	PROD.[ProdID] = FCT.ProductID

INNER JOIN [dbo].[DimSubCategory_V] AS SUB ON
	SUB.SubCategoryID = PROD.SubCategoryID

GROUP BY SUB.Sub_Category_Name
HAVING ROUND(SUM(FCT.[Profit]), 2) < 0;

-- SELECTING FROM THE VIEW
SELECT TOP 10 * FROM Top10LossBySubCategory_V
ORDER BY TOTAL_LOSS DESC; -- 'Tables' SUB-CATEGORY HAS MADE THE HIGHEST LOSS. 