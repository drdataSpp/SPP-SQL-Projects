-- Populating Data Into DimOrderPriority_T Table
USE SuperStoreDB;

DROP PROCEDURE IF EXISTS sp_InsertDimOrderPriority_T;

CREATE PROCEDURE sp_InsertDimOrderPriority_T
AS
INSERT INTO [dbo].[DimOrderPriority_T] ([Order_Priority])
SELECT DISTINCT([ORDER_PRIORITY]) FROM [dbo].[Staging_SuperStoreSource_V] AS SRC
WHERE NOT EXISTS 
	(
		SELECT Order_Priority FROM DimOrderPriority_V AS TGT
		WHERE TGT.Order_Priority = SRC.ORDER_PRIORITY
	)
GO

--TRIGGERING THE PROCESS TO POPULATE THE DATA
EXEC sp_InsertDimOrderPriority_T;

--Checking data in DimOrderPriority_V View
SELECT * FROM DimOrderPriority_V;