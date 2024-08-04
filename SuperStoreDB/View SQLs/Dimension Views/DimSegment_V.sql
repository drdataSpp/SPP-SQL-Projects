USE SuperStoreDB;

DROP VIEW IF EXISTS DimSegment_V;

CREATE VIEW DimSegment_V
AS
SELECT	
	T.SegmentID		AS SegmentID,
	T.Segment_Name	AS Segment_Name
FROM DimSegment_T AS T
;