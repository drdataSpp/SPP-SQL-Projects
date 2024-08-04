-- Populating Data Into DimShipMode_T Table
USE SuperStoreDB;

DROP PROCEDURE IF EXISTS sp_InsertDimShipMode_T;

CREATE PROCEDURE sp_InsertDimShipMode_T
AS
INSERT INTO [dbo].[DimShipMode_T] ([Ship_Mode])
SELECT DISTINCT([SHIP_MODE]) FROM [dbo].[Staging_SuperStoreSource_V] AS SRC
WHERE NOT EXISTS 
	(
		SELECT Ship_Mode FROM DimShipMode_V AS TGT
		WHERE TGT.Ship_Mode = SRC.SHIP_MODE
	)
GO

--TRIGGERING THE PROCESS TO POPULATE THE DATA
EXEC sp_InsertDimShipMode_T;

--Checking data in DimShipMode_V View
SELECT * FROM DimShipMode_V;