-- Populating Data Into DimMarket_T Table
USE SuperStoreDB;

DROP PROCEDURE IF EXISTS sp_InsertDimMarket_T;

CREATE PROCEDURE sp_InsertDimMarket_T
AS
INSERT INTO [dbo].[DimMarket_T] ([Market_Name])
SELECT DISTINCT([MARKET]) FROM [dbo].[Staging_SuperStoreSource_V] AS SRC
WHERE NOT EXISTS 
	(
		SELECT MARKET FROM DimMarket_V AS TGT
		WHERE TGT.Market_Name = SRC.MARKET
	)
GO

--TRIGGERING THE PROCESS TO POPULATE THE DATA
EXEC sp_InsertDimMarket_T;

--Checking data in DimMarket_V View
SELECT * FROM DimMarket_V;