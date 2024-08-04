USE SuperStoreDB;

DROP VIEW IF EXISTS DimState_V;

CREATE VIEW DimState_V
AS
SELECT
	T.StateID				AS StateID,
	T.State_Name			AS State_Name,
	T.CountryID				AS CountryID
FROM DimState_T				AS T
;