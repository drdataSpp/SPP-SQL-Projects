USE SuperStoreDB;

-- Which Customer Segment is Most Profitable?

DROP VIEW IF EXISTS ProfitBySegment_V;

CREATE VIEW ProfitBySegment_V AS
SELECT
	SEG.Segment_Name,
	ROUND(SUM(FCT.[Profit]), 2) AS TOTAL_PROFIT_MADE
FROM [dbo].[FactSales_V] AS FCT

INNER JOIN [dbo].[DimSegment_V] AS SEG ON
	SEG.SegmentID = FCT.SegmentID

GROUP BY SEG.Segment_Name;

-- SELECTING FROM THE VIEW
SELECT * FROM ProfitBySegment_V
ORDER BY TOTAL_PROFIT_MADE DESC; --CONSUMER SEGMENT HAS MADE THE HIGHEST PROFIT. 