-- Populating Data Into DimSubCategory_T Table
USE SuperStoreDB;

DROP PROCEDURE IF EXISTS sp_InsertDimSubCategory_T;

CREATE PROCEDURE sp_InsertDimSubCategory_T
AS
INSERT INTO [dbo].[DimSubCategory_T] ([Sub_Category_Name],[CategoryID])
SELECT DISTINCT(SRC.[SUB_CATEGORY]),
	   C.[CategoryID]
FROM [dbo].[Staging_SuperStoreSource_V] AS SRC
INNER JOIN [dbo].[DimCategory_V] AS C ON
C.[Category_Name] = SRC.[CATEGORY]
WHERE NOT EXISTS 
	(
		SELECT Category_Name FROM DimSubCategory_V AS TGT
		WHERE TGT.Sub_Category_Name = SRC.SUB_CATEGORY
	)
GO

--TRIGGERING THE PROCESS TO POPULATE THE DATA
EXEC sp_InsertDimSubCategory_T;

--Checking data in DimSubCategory_V View
SELECT * FROM DimSubCategory_V;