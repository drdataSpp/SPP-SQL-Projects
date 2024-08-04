--VERIFY TARGET RECORD COUNT TO MATCH WITH ETL ROWS
SELECT COUNT(*) AS TARGET_ROW_COUNT FROM Staging_SuperStoreSource_V;

--VERIFY NO NULL VALUES IN ORDER_ID COLUMN - TARGET VIEW /TABLE
SELECT  COUNT(*) AS NULL_VALUES_COUNT FROM Staging_SuperStoreSource_V
WHERE [ORDER_ID] IS NULL;

--VERIFY DISTINCT YEAR IN THE YEAR COLUMN - TARGET VIEW /TABLE
SELECT DISTINCT([YEAR]) FROM Staging_SuperStoreSource_V;