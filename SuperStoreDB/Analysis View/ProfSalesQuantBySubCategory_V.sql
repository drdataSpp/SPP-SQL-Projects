USE SuperStoreDB;

-- What are the Best Selling and Most Profitable Sub-Category

DROP VIEW IF EXISTS ProfSalesQuantBySubCategory_V;

CREATE VIEW ProfSalesQuantBySubCategory_V AS
SELECT
	SUB.Sub_Category_Name,
	ROUND(SUM(FCT.[Sales]), 2)	AS TOTAL_SALES,
	ROUND(SUM(FCT.[Profit]), 2) AS TOTAL_PROFIT_MADE,
	SUM(FCT.[Quantity])			AS TOTAL_QUANTITY_SOLD
FROM [dbo].[FactSales_V] AS FCT

INNER JOIN [dbo].[DimProduct_V] AS PROD ON
	PROD.[ProdID] = FCT.ProductID

INNER JOIN [dbo].[DimSubCategory_V] AS SUB ON
	SUB.SubCategoryID = PROD.SubCategoryID

GROUP BY SUB.Sub_Category_Name;

-- SELECTING FROM THE VIEW
SELECT * FROM ProfSalesQuantBySubCategory_V
ORDER BY TOTAL_PROFIT_MADE DESC; -- COPIERS SUB-CATEGORY HAS MADE THE HIGHEST PROFIT. 

SELECT * FROM ProfSalesQuantBySubCategory_V
ORDER BY TOTAL_QUANTITY_SOLD DESC; -- BINDERS SUB-CATEGORY HAS SOLD THE MOST. 