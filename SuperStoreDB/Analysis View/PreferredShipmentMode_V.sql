USE SuperStoreDB;

-- Which is the Preferred Ship Mode?

DROP VIEW IF EXISTS PreferredShipmentMode_V;

CREATE VIEW PreferredShipmentMode_V AS
SELECT
	SHIP.Ship_Mode,
	COUNT(FCT.OrderID) AS MODE_COUNT
FROM [dbo].[FactSales_V] AS FCT

INNER JOIN [dbo].[DimShipMode_V] AS SHIP ON
	SHIP.ShipModeID = FCT.ShipModeID

GROUP BY SHIP.Ship_Mode;

-- SELECTING FROM THE VIEW
SELECT * FROM PreferredShipmentMode_V
ORDER BY MODE_COUNT DESC; -- 'STANDARD CLASS' IS THE MOST USED SHIPMENT MODE. 
