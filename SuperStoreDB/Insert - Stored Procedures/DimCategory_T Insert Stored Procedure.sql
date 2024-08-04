-- Populating Data Into DimCategory_T Table
USE SuperStoreDB;

DROP PROCEDURE IF EXISTS sp_InsertDimCategory_T;

CREATE PROCEDURE sp_InsertDimCategory_T
AS
INSERT INTO [dbo].[DimCategory_T] ([Category_Name])
SELECT DISTINCT([CATEGORY]) FROM [dbo].[Staging_SuperStoreSource_V] AS SRC
WHERE NOT EXISTS 
	(
		SELECT Category_Name FROM DimCategory_V AS TGT
		WHERE TGT.Category_Name = SRC.CATEGORY
	)
GO

--TRIGGERING THE PROCESS TO POPULATE THE DATA
EXEC sp_InsertDimCategory_T;

--Checking data in DimCategory_V View
SELECT * FROM DimCategory_V;