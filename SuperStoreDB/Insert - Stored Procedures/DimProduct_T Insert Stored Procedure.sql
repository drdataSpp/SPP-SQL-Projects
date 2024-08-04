-- Populating Data Into DimProduct_T Table
USE SuperStoreDB;

DROP PROCEDURE IF EXISTS sp_InsertDimProduct_T;

CREATE PROCEDURE sp_InsertDimProduct_T
AS
INSERT INTO [dbo].[DimProduct_T] ([ProductName],[ProductID],[SubCategoryID])
SELECT DISTINCT(SRC.[PRODUCT_NAME]),
	   SRC.[PRODUCT_ID],
	   SC.[SubCategoryID]
FROM [dbo].[Staging_SuperStoreSource_V] AS SRC
INNER JOIN [dbo].[DimSubCategory_V] AS SC ON
SC.[Sub_Category_Name] = SRC.[SUB_CATEGORY]
WHERE NOT EXISTS 
	(
		SELECT ProductName FROM DimProduct_V AS TGT
		WHERE TGT.ProductName = SRC.PRODUCT_NAME
	)
GO

--TRIGGERING THE PROCESS TO POPULATE THE DATA
EXEC sp_InsertDimProduct_T;

--Checking data in DimProduct_V View
SELECT * FROM DimProduct_V;