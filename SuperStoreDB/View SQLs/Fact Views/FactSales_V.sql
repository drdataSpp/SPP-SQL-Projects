USE SuperStoreDB;

DROP VIEW IF EXISTS FactSales_V;

CREATE VIEW FactSales_V
AS
SELECT
	T.SaleID				AS SaleID,
	T.OrderID				AS OrderID,
	T.OrderDate				AS OrderDate,
	T.ShipDate				AS ShipDate,
	T.ProductID				AS ProductID,
	T.Sales					AS Sales,
	T.Quantity				AS Quantity,
	T.Discount				AS Discount,
	T.Profit				AS Profit,
	T.Shipping_Cost			AS Shipping_Cost,
	T.ShipModeID			AS ShipModeID,
	T.CustomerID			AS CustomerID,
	T.SegmentID				AS SegmentID,
	T.StateID				AS StateID,
	T.MarketID				AS MarketID,
	T.OrderPriorityID		AS OrderPriorityID
FROM FactSales_T			AS T
;