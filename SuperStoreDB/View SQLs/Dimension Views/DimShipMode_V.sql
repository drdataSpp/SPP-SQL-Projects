USE SuperStoreDB;

DROP VIEW IF EXISTS DimShipMode_V;

CREATE VIEW DimShipMode_V 
AS
SELECT
	T.ShipModeID  AS ShipModeID,
	T.Ship_Mode	AS Ship_Mode
FROM DimShipMode_T AS T
;