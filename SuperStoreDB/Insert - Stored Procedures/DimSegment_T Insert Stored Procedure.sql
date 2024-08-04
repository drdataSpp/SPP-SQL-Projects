-- Populating Data Into DimSegment_T Table
USE SuperStoreDB;

DROP PROCEDURE IF EXISTS sp_InsertDataDimSegment_T;

CREATE PROCEDURE sp_InsertDataDimSegment_T
AS
INSERT INTO [dbo].DimSegment_T ([Segment_Name])
SELECT DISTINCT([SEGMENT]) FROM [dbo].[Staging_SuperStoreSource_V] AS SRC
WHERE NOT EXISTS 
	(
		SELECT Segment_Name FROM DimSegment_T AS TGT
		WHERE TGT.Segment_Name = SRC.SEGMENT
	)
GO

--TRIGGERING THE PROCESS TO POPULATE THE DATA
EXEC sp_InsertDataDimSegment_T;

--Checking data in DimSegment_V View
SELECT * FROM DimSegment_V;