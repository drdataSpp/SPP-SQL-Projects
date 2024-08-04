USE SuperStoreDB;

DROP VIEW IF EXISTS DimProduct_V;

CREATE VIEW DimProduct_V
AS
SELECT
	T.ProdID			AS ProdID,
	T.ProductID			AS ProductID,
	T.ProductName		AS ProductName,
	T.SubCategoryID		AS SubCategoryID
FROM DimProduct_T		AS T
;