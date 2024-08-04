USE SuperStoreDB;

DROP VIEW IF EXISTS DimOrderPriority_V;

CREATE VIEW DimOrderPriority_V
AS
SELECT	
	T.OrderPriorityID	AS OrderPriorityID,
	T.Order_Priority	AS Order_Priority
FROM DimOrderPriority_T AS T
;