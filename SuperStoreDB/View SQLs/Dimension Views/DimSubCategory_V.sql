USE SuperStoreDB;

DROP VIEW IF EXISTS DimSubCategory_V;

CREATE VIEW DimSubCategory_V
AS
SELECT
	T.SubCategoryID AS SubCategoryID,
	T.CategoryID	AS CategoryID,
	T.Sub_Category_Name	AS Sub_Category_Name
FROM DimSubCategory_T AS T
;