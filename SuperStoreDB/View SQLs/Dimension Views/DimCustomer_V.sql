USE SuperStoreDB;

DROP VIEW IF EXISTS DimCustomer_V;

CREATE VIEW DimCustomer_V
AS
SELECT
	T.CustomerID			AS CustomerID,
	T.Customer_Name			AS Customer_Name
FROM DimCustomer_T			AS T
;
