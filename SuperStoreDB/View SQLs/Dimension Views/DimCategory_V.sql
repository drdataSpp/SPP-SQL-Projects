USE SuperStoreDB;

DROP VIEW IF EXISTS DimCategory_V;

CREATE VIEW DimCategory_V
AS
SELECT	
	T.CategoryID	AS CategoryID,
	T.Category_Name	AS Category_Name
FROM DimCategory_T AS T
;