-- Populating Data Into DimCustomer_T Table
USE SuperStoreDB;

DROP PROCEDURE IF EXISTS sp_InsertDimCustomer_T;

CREATE PROCEDURE sp_InsertDimCustomer_T
AS
INSERT INTO [dbo].[DimCustomer_T] ([Customer_Name])
SELECT DISTINCT(SRC.[Customer_Name])
FROM [dbo].[Staging_SuperStoreSource_V] AS SRC
WHERE NOT EXISTS 
	(
		SELECT Customer_Name FROM DimCustomer_V AS TGT
		WHERE TGT.Customer_Name = SRC.[Customer_Name]
	)
GO

--TRIGGERING THE PROCESS TO POPULATE THE DATA
EXEC sp_InsertDimCustomer_T;

--Checking data in DimCustomer_V View
SELECT * FROM DimCustomer_V;