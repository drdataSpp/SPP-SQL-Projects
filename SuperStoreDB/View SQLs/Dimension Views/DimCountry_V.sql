USE SuperStoreDB;

DROP VIEW IF EXISTS DimCountry_V;

CREATE VIEW DimCountry_V
AS
SELECT
	T.CountryID				AS CountryID,
	T.Country_Name			AS Country_Name,
	T.RegionID				AS RegionID
FROM DimCountry_T			AS T
;