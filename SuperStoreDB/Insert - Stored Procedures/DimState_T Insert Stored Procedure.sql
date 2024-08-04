-- Populating Data Into DimState_T Table
USE SuperStoreDB;

DROP PROCEDURE IF EXISTS sp_InsertDimState_T;

CREATE PROCEDURE sp_InsertDimState_T
AS
INSERT INTO [dbo].[DimState_T] ([State_Name], [CountryID])
SELECT DISTINCT(SRC.[STATE]),
				Country.[CountryID]
FROM [dbo].[Staging_SuperStoreSource_V] AS SRC
INNER JOIN [dbo].[DimCountry_V] AS Country ON
Country.[Country_Name] = SRC.[Country]
WHERE NOT EXISTS 
	(
		SELECT State_Name FROM DimState_V AS TGT
		WHERE TGT.State_Name = SRC.[State]
	)
GO

--TRIGGERING THE PROCESS TO POPULATE THE DATA
EXEC sp_InsertDimState_T;

--Checking data in DimState_V View
SELECT * FROM DimState_V;