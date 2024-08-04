-- Populating Data Into DimRegion_T Table
USE SuperStoreDB;

DROP PROCEDURE IF EXISTS sp_InsertDimRegion_T;

CREATE PROCEDURE sp_InsertDimRegion_T
AS
INSERT INTO [dbo].[DimRegion_T] ([Region_Name])
SELECT DISTINCT(SRC.[REGION])
FROM [dbo].[Staging_SuperStoreSource_V] AS SRC
WHERE NOT EXISTS 
	(
		SELECT Region_Name FROM DimRegion_V AS TGT
		WHERE TGT.Region_Name = SRC.REGION
	)
GO

--TRIGGERING THE PROCESS TO POPULATE THE DATA
EXEC sp_InsertDimRegion_T;

--Checking data in DimRegion_V View
SELECT * FROM DimRegion_V;