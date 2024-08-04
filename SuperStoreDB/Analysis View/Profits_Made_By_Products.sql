USE SuperStoreDB;

DROP VIEW IF EXISTS ProfitsByProducts_V;

CREATE VIEW ProfitsByProducts_V AS
SELECT
	PROD.ProductName, 
	ROUND(SUM(FCT.[Profit]), 2) AS TOTAL_PROFIT
FROM [dbo].[FactSales_V] AS FCT

INNER JOIN [dbo].[DimProduct_V] AS PROD ON
	PROD.[ProdID] = FCT.ProductID

GROUP BY PROD.ProductName;

-- SELECTING FROM THE VIEW
SELECT * FROM ProfitsByProducts_V
ORDER BY TOTAL_PROFIT DESC; -- 'Canon imageCLASS 2200 Advanced Copier' HAS MADE THE HIGHEST PROFIT & 'Cubify CubeX 3D Printer Double Head Print' HAS THE HIGHEST LOSS. 
