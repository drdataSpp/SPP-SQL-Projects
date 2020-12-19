-----------------------------------
--Programmer: Sooorya Parthiban
--Reference: SQL GitHub Project 3
--Wine Database Management 
-----------------------------------

--Creating the Wine Database
CREATE DATABASE WineDatabase
GO

--Creating a wine table
USE WineDatabase
GO

CREATE TABLE WineList (
WineID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
WineName VARCHAR(155) NOT NULL,
WineCategory VARCHAR(50) NOT NULL,
WinePrice DECIMAL NOT NULL,
WineAlcoholContent FLOAT NOT NULL,
WineQuality INT NOT NULL
);

--Inserting values into the wine table.

--Inserting Champagne & Sparkling category wine data.
INSERT INTO WineList (WineName, WineCategory, WinePrice, WineAlcoholContent, WineQuality)
VALUES 
	('Jacobs Creek$', 'Champagne/Sparkling Wine', 9.79, 10, 7),
	('Brown Brothers$', 'Champagne/Sparkling Wine', 12.79, 12, 7),
	('Henkell Dry-Sec$', 'Champagne/Sparkling Wine', 19.89, 12, 7),
	('Veuve Du Vernay Rose$', 'Champagne/Sparkling Wine', 14.79, 12, 9),
	('Petit Cordon$', 'Champagne/Sparkling Wine', 34.79, 12.5, 9),
	('Drappier Carte Brut Champagne$', 'Champagne/Sparkling Wine', 49.79, 12.5, 9),
	('Mumm Cordon Rouge Champagne$', 'Champagne/Sparkling Wine', 49.79, 14, 9),
	('Moet & Chandon Imperial Brut$', 'Champagne/Sparkling Wine', 54.99, 12.5, 9);

--Inserting Red Wine category wine data.
INSERT INTO WineList (WineName, WineCategory, WinePrice, WineAlcoholContent, WineQuality)
VALUES 
	('McGuigan Black Label Red$', 'Red Wine', 8.79, 12, 8),
	('Ormond Rich Ruby$', 'Red Wine', 10.79, 12, 7),
	('Riunite Lambrusco Reggiano$', 'Red Wine', 11.79, 12, 9),
	('Pasqua Montepulciano$', 'Red Wine', 19.99, 12, 9),
	('Taylors Promised Land Shiraz Cabernet$', 'Red Wine', 10.79, 12, 8),
	('Music Bay Merlot$', 'Red Wine', 11.79, 12.5, 9),
	('Barossa Valley Estate Cabernet Sauvignon$', 'Red Wine', 17.79, 12.5, 9);

--Inserting Chardonnay category wine data.
INSERT INTO WineList (WineName, WineCategory, WinePrice, WineAlcoholContent, WineQuality)
VALUES 
	('Cleanskin Chardonnay$', 'Chardonnay', 6.89, 12, 7),
	('Whitecliff Chardonnay$', 'Chardonnay', 8.79, 11, 7),
	('Riverstone Chardonnay$', 'Chardonnay', 9.79, 11, 7),
	('Brancott Estate Chardonnay$', 'Chardonnay', 10.79, 12.5, 8),
	('Selaks Reserve Chardonnay$', 'Chardonnay', 11.79, 12, 8),
	('Mission Estate Winery Hawkes Bay Chardonnay$', 'Chardonnay', 12.79, 12.5, 9),
	('Yealands Reserve Chardonnay$', 'Chardonnay', 13.79, 12, 8),
	('Oyster Bay Chardonnay$', 'Chardonnay', 13.89, 12, 9),
	('Mission Estate Winery Reserve Chardonnay$', 'Chardonnay', 19.79, 12.5, 9);

--Inserting Pinot Noir category wine data.
INSERT INTO WineList (WineName, WineCategory, WinePrice, WineAlcoholContent, WineQuality)
VALUES 
	('Jacobs Creek Pinot Noir$', 'Pinot Noir', 8.79, 11, 7),
	('Ngatarawa Stables Pinot Noir$', 'Pinot Noir', 9.79, 12.5, 7),
	('Old Coach Road Pinot Noir$', 'Pinot Noir', 10.79, 12, 8),
	('Gunn Estate Pinot Noir$', 'Pinot Noir', 11.79, 11, 8),
	('Arrogant Frog Lily Pad Pinot Noir$', 'Pinot Noir', 12.79, 12, 8),
	('Ngatarawa Stables Reserve Pinot Noir$', 'Pinot Noir', 13.79, 12, 8),
	('Taylors Pinot Noir$', 'Pinot Noir', 14.79, 11.5, 8),
	('Oyster Bay Pinot Noir$', 'Pinot Noir', 17.79, 12.5, 9),
	('Villa Maria Cellar Selection$', 'Pinot Noir', 19.79, 12.5, 9),
	('Rabbit Ranch Pinot Noir$', 'Pinot Noir', 23.79, 12, 9),
	('Rockburn Pinot Noir$', 'Pinot Noir', 39.79, 12.5, 9);

--Inserting Sauvignon Blanc category wine data.
INSERT INTO WineList (WineName, WineCategory, WinePrice, WineAlcoholContent, WineQuality)
VALUES 
	('Jacobs Creek Sauvignon Blanc$', 'Sauvignon Blanc', 8.79, 11, 7),
	('Ngatarawa Stables Sauvignon Blanc$', 'Sauvignon Blanc', 9.79, 11.5, 8),
	('Clearwater Cove Sauvignon Blanc$', 'Sauvignon Blanc', 10.79, 11, 8),
	('Brown Brothers Moscato Sauvignon Blanc$', 'Sauvignon Blanc', 12.79, 11.5, 8),
	('Graham Nortons Own Sauvignon Blanc$', 'Sauvignon Blanc', 13.79, 11, 8),
	('Seifried Sauvignon Blanc$', 'Sauvignon Blanc', 13.79, 11.5, 9),
	('Villa Maria Cellar Selection$', 'Sauvignon Blanc', 14.79, 12.5, 9),
	('Rapaura Springs Reserve Sauvignon Blanc$', 'Sauvignon Blanc', 14.79, 12, 9);

--Checking the data in the 'WineTable'
SELECT * 
FROM WineList; --43 Rows returned.

--------
--VIEWS
--------

--Creating views to display the Champagne And Sparkling Wines
USE WineDatabase
GO

DROP VIEW IF EXISTS vChampagneAndSparklingWines
GO

CREATE VIEW vChampagneAndSparklingWines
AS
	SELECT WineList.WineName, WineList.WineCategory, WineList.WinePrice,
		WineList.WineAlcoholContent, WineList.WineQuality
	FROM WineList
	WHERE WineList.WineCategory = 'Champagne/Sparkling Wine'
GO

SELECT * FROM vChampagneAndSparklingWines; --8 Rows Returned.


--Creating views to display the Red Wines
USE WineDatabase
GO

DROP VIEW IF EXISTS vRedWines
GO

CREATE VIEW vRedWines
AS
	SELECT WineList.WineName, WineList.WineCategory, WineList.WinePrice,
		WineList.WineAlcoholContent, WineList.WineQuality
	FROM WineList
	WHERE WineList.WineCategory = 'Red Wine'
GO

SELECT * FROM vRedWines; --7 Rows Returned.


--Creating views to display the Chardonnay Wines
USE WineDatabase
GO

DROP VIEW IF EXISTS vChardonnayWines
GO

CREATE VIEW vChardonnayWines
AS
	SELECT WineList.WineName, WineList.WineCategory, WineList.WinePrice,
		WineList.WineAlcoholContent, WineList.WineQuality
	FROM WineList
	WHERE WineList.WineCategory = 'Chardonnay'
GO

SELECT * FROM vChardonnayWines; --9 Rows Returned.


--Creating views to display the Pinot Noir Wines
USE WineDatabase
GO

DROP VIEW IF EXISTS vPinotNoirWines
GO


CREATE VIEW vPinotNoirWines
AS
	SELECT WineList.WineName, WineList.WineCategory, WineList.WinePrice,
		WineList.WineAlcoholContent, WineList.WineQuality
	FROM WineList
	WHERE WineList.WineCategory = 'Pinot Noir'
GO

SELECT * FROM vPinotNoirWines; --11 Rows Returned.


--Creating views to display the Sauvignon Blanc Wines
USE WineDatabase
GO

DROP VIEW IF EXISTS vSauvignonBlancWines
GO


CREATE VIEW vSauvignonBlancWines
AS
	SELECT WineList.WineName, WineList.WineCategory, WineList.WinePrice,
		WineList.WineAlcoholContent, WineList.WineQuality
	FROM WineList
	WHERE WineList.WineCategory = 'Sauvignon Blanc'
GO

SELECT * FROM vSauvignonBlancWines; --8 Rows Returned.


-------------------
--STORED PROCEDURES
-------------------

--Creating a stored procedure to choose wines based on wine quality.

USE WineDatabase
GO

DROP PROCEDURE IF EXISTS spSelectWineQuality
GO

CREATE PROCEDURE spSelectWineQuality (@WineQuality INT)
AS
	SELECT WineList.WineName, WineList.WineCategory, WineList.WinePrice, 
		WineList.WineAlcoholContent, WineList.WineQuality
	FROM WineList
	WHERE WineList.WineQuality >= @WineQuality
	ORDER BY WineList.WineQuality ASC
GO

--I want wines of 8 or above quality.
EXEC spSelectWineQuality 8; --33 Rows Returned.

--Creating a stored procedure to choose wines based on category and price.
USE WineDatabase
GO

DROP PROCEDURE IF EXISTS spSelectWineTypeAndPrice
GO

CREATE PROCEDURE spSelectWineTypeAndPrice (@WineType VARCHAR(50), @WineCost INT)
AS
	SELECT WineList.WineName, WineList.WineCategory, WineList.WinePrice, 
		WineList.WineAlcoholContent, WineList.WineQuality
	FROM WineList
	WHERE WineList.WineCategory = @WineType AND WineList.WinePrice <= @WineCost
	ORDER BY WineList.WinePrice ASC
GO

--I want a red wine that is below 15 dollars.
EXEC spSelectWineTypeAndPrice 'Red Wine', 15; --5 Rows Returned


--Creating a stored procedure to choose wines based on wine's alcohol content and type.
USE WineDatabase
GO

DROP PROCEDURE IF EXISTS spSelectWineTypeAndAlcoholPercent
GO

CREATE PROCEDURE spSelectWineTypeAndAlcoholPercent (@WineType varchar(50), @WineAlcoholContent INT)
AS
	SELECT WineList.WineName, WineList.WineCategory, WineList.WinePrice, 
		WineList.WineAlcoholContent, WineList.WineQuality
	FROM WineList
	WHERE WineList.WineCategory = @WineType AND WineList.WineAlcoholContent >= @WineAlcoholContent
	ORDER BY WineList.WineAlcoholContent ASC
GO

--I want Pinot Noir type wines that have an alcohol content of 12 or above.
EXEC spSelectWineTypeAndAlcoholPercent 'Pinot Noir', 12; --8 Rows Returned.


--Creating a stored procedure to choose wines based on wine's quality and type.
USE WineDatabase
GO

DROP PROCEDURE IF EXISTS spSelectWineTypeAndQuality
GO

CREATE PROCEDURE spSelectWineTypeAndQuality (@WineType varchar(50), @WineQuality INT)
AS
	SELECT WineList.WineName, WineList.WineCategory, WineList.WinePrice, 
		WineList.WineAlcoholContent, WineList.WineQuality
	FROM WineList
	WHERE WineList.WineCategory = @WineType AND WineList.WineQuality >= @WineQuality
	ORDER BY WineList.WineQuality ASC
GO

--I want Pinot Noir type wines that have an quality of 8 or above.
EXEC spSelectWineTypeAndQuality 'Pinot Noir', 8 ; --9 Rows Returned.

--Creating a CASE statement to categorize wines based on the quality
SELECT WineList.WineQuality,
CASE
    WHEN WineList.WineQuality = 9 THEN 'BEST'
    WHEN WineList.WineQuality = 8 THEN 'GOOD'
    ELSE 'AVERAGE'
END AS WineQualityCategory
FROM WineList;

----------
--THE END
----------
