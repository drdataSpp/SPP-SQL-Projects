USE SuperStoreDB;

DROP VIEW IF EXISTS DimMarket_V;

CREATE VIEW DimMarket_V
AS
SELECT
	T.MarketID				AS MarketID,
	T.Market_Name			AS Market_Name
FROM DimMarket_T			AS T
;