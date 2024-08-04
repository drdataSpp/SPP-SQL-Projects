-- Populating Data Into FactSales_T Table
USE SuperStoreDB;

DROP PROCEDURE IF EXISTS sp_InsertFactSales_T;

CREATE PROCEDURE sp_InsertFactSales_T
AS
INSERT INTO [dbo].[FactSales_T] (OrderID,OrderDate,ShipDate,ProductID,Sales,Quantity,Discount,Profit,Shipping_Cost,ShipModeID,CustomerID,SegmentID,StateID,MarketID,OrderPriorityID)
SELECT SRC.[ORDER_ID],
	   CAST(REPLACE(SRC.[ORDER_DATE], '-', '') AS INT)  AS ORDER_DATE,
	   CAST(REPLACE(SRC.[SHIP_DATE], '-', '') AS INT)   AS SHIP_DATE,
	   PROD.[ProdID]									AS ProductID,
	   CAST(SRC.[SALES] AS MONEY)						AS SALES,
	   CAST(SRC.[QUANTITY] AS INT)						AS QUANTITY,
	   CAST(SRC.[DISCOUNT] AS FLOAT)					AS DISCOUNT,
	   CAST(SRC.[PROFIT] AS FLOAT)						AS PROFIT,
	   CAST(SRC.[SHIPPING_COST] AS MONEY)				AS SHIPPING_COST,
	   SM.[ShipModeID],
	   CUST.[CustomerID],
	   SG.[SegmentID],
	   ST.[StateID],
	   MKT.[MarketID],
	   OP.[OrderPriorityID]
FROM [dbo].[Staging_SuperStoreSource_V] AS SRC

INNER JOIN [dbo].[DimProduct_V] AS PROD ON
PROD.[ProductID] = SRC.[PRODUCT_ID]

INNER JOIN [dbo].[DimShipMode_V] AS SM ON
SM.[Ship_Mode] = SRC.[SHIP_MODE]

INNER JOIN [dbo].[DimCustomer_V] AS CUST ON
CUST.[Customer_Name] = SRC.[CUSTOMER_NAME]

INNER JOIN [dbo].[DimSegment_V] AS SG ON
SG.[Segment_Name] = SRC.[SEGMENT]

INNER JOIN [dbo].[DimState_V] AS ST ON
ST.[State_Name] = SRC.[STATE]

INNER JOIN [dbo].[DimMarket_V] AS MKT ON
MKT.[Market_Name] = SRC.[MARKET]

INNER JOIN [dbo].[DimOrderPriority_V] AS OP ON
OP.[Order_Priority] = SRC.[ORDER_PRIORITY]

WHERE NOT EXISTS
(
	SELECT 1
	FROM [dbo].[FactSales_V] AS TGT
	WHERE TGT.[OrderID] = [ORDER_ID]
)
GO

--TRIGGERING THE PROCESS TO POPULATE THE DATA
EXEC sp_InsertFactSales_T;

--Checking data in FactSales_V View
SELECT * FROM FactSales_V;