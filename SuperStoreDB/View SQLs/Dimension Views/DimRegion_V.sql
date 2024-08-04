USE SuperStoreDB;

DROP VIEW IF EXISTS DimRegion_V;

CREATE VIEW DimRegion_V
AS
SELECT
	T.RegionID				AS RegionID,
	T.Region_Name			AS Region_Name
FROM DimRegion_T			AS T
;