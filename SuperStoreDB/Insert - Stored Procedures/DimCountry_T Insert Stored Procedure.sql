-- Populating Data Into DimCountry_T Table
USE SuperStoreDB;

DROP PROCEDURE IF EXISTS sp_InsertDimCountry_T;

CREATE PROCEDURE sp_InsertDimCountry_T
AS
INSERT INTO [dbo].[DimCountry_T] ([Country_Name], [RegionID])
SELECT DISTINCT(SRC.[COUNTRY]),
				RG.[RegionID]
FROM [dbo].[Staging_SuperStoreSource_V] AS SRC
INNER JOIN [dbo].[DimRegion_V] AS RG ON
RG.[Region_Name] = SRC.[REGION]
WHERE NOT EXISTS 
	(
		SELECT Country_Name FROM DimCountry_V AS TGT
		WHERE TGT.Country_Name = SRC.[COUNTRY]
	)
GO

--TRIGGERING THE PROCESS TO POPULATE THE DATA
EXEC sp_InsertDimCountry_T;

--Checking data in DimCountry_V View
SELECT * FROM DimCountry_V;