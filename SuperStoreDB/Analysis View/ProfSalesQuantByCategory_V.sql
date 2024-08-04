USE SuperStoreDB;

-- Which Category is Best Selling and Most Profitable?

DROP VIEW IF EXISTS ProfSalesQuantByCategory_V;

CREATE VIEW ProfSalesQuantByCategory_V AS
SELECT
	CAT.Category_Name,
	ROUND(SUM(FCT.[Sales]), 2)	AS TOTAL_SALES,
	ROUND(SUM(FCT.[Profit]), 2) AS TOTAL_PROFIT_MADE,
	SUM(FCT.[Quantity])			AS TOTAL_QUANTITY_SOLD
FROM [dbo].[FactSales_V] AS FCT

INNER JOIN [dbo].[DimProduct_V] AS PROD ON
	PROD.[ProdID] = FCT.ProductID

INNER JOIN [dbo].[DimSubCategory_V] AS SUB ON
	SUB.SubCategoryID = PROD.SubCategoryID

INNER JOIN [dbo].[DimCategory_V] AS CAT ON 
	CAT.CategoryID = SUB.CategoryID

GROUP BY CAT.Category_Name;

-- SELECTING FROM THE VIEW
SELECT * FROM ProfSalesQuantByCategory_V
ORDER BY TOTAL_PROFIT_MADE DESC; -- TECHNOLOGY CATEGORY HAS MADE THE HIGHEST PROFIT & OFFICE SUPPLIES SOLD THE MOST. 