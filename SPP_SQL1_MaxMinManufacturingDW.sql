--Programmer: Sooorya Parthiban
--Reference: SQL GitHub Project 1

--Creating Views:
-----------------

--Creating View: vInventoryByType
USE MaxMinManufacturingDW
GO

DROP VIEW IF EXISTS vInventoryByType
GO

CREATE VIEW vInventoryByType AS 
SELECT DimProductType.ProductTypeName,
       DimProductSubtype.ProductSubtypeName,
       CAST (InventoryFact.DateOfInventory AS DATE) AS 'DateOfInventory',
       InventoryFact.InventoryLevel

FROM DimProductType
INNER JOIN DimProductSubtype ON
DimProductType.ProductTypeCode = DimProductSubtype.ProductTypeCode
INNER JOIN DimProduct ON
DimProductSubtype.ProductSubtypeCode = DimProduct.ProductSubtypeCode
INNER JOIN InventoryFact ON
DimProduct.ProductCode = InventoryFact.ProductCode;

--Checking the output:
USE MaxMinManufacturingDW
GO

SELECT *
FROM vInventoryByType;

---------------------------------------------------------------------------------------------

--Creating View: vAcceptedByCountry 
USE MaxMinManufacturingDW
GO

DROP VIEW IF EXISTS vAcceptedByCountry 
GO

CREATE VIEW vAcceptedByCountry AS 
SELECT DimCountry.CountryCode,
       DimCountry.CountryName,
       DimPlant.PlantName,
       CAST(ManufacturingFact.DateOfManufacture AS DATE) AS 'DateOfManufacture',
       ManufacturingFact.AcceptedProducts

FROM DimCountry
INNER JOIN DimPlant ON
DimCountry.CountryCode = DimPlant.CountryCode
INNER JOIN DimMachine ON
DimPlant.PlantNumber = DimMachine.PlantNumber
INNER JOIN ManufacturingFact ON
DimMachine.MachineNumber = ManufacturingFact.MachineNumber;

--Checking the output:
USE MaxMinManufacturingDW
GO

SELECT *
FROM vAcceptedByCountry;

---------------------------------------------------------------------------------------------

--Creating View: vRejectedProductsByType
USE MaxMinManufacturingDW
GO

DROP VIEW IF EXISTS vRejectedProductsByType
GO

CREATE VIEW vRejectedProductsByType AS 
SELECT DimProductType.ProductTypeName,
       DimProductSubtype.ProductSubtypeName,
       ROUND((CAST( ManufacturingFact.RejectedProducts AS FLOAT)/
       (ManufacturingFact.AcceptedProducts + 
       ManufacturingFact.RejectedProducts) * 100),7) AS 'Percent Rejected', 
       (ManufacturingFact.AcceptedProducts + 
       ManufacturingFact.RejectedProducts) AS 'Total Manufactured',
       CAST( ManufacturingFact.DateOfManufacture AS DATE) AS 'DateOfManufacture'

FROM DimProductType
INNER JOIN DimProductSubtype ON
DimProductType.ProductTypeCode = DimProductSubtype.ProductTypeCode
INNER JOIN DimProduct ON
DimProductSubtype.ProductSubtypeCode = DimProduct.ProductSubtypeCode
INNER JOIN ManufacturingFact ON
DimProduct.ProductCode = ManufacturingFact.ProductCode;


--Checking the output:
USE MaxMinManufacturingDW
GO

SELECT *
FROM vRejectedProductsByType;

---------------------------------------------------------------------------------------------
--Views Over
---------------------------------------------------------------------------------------------


--Creating Stored Procedures:
-----------------------------

--Creating stored procedure: spMaxInventoryByType with two input parameters (year and month)
USE MaxMinManufacturingDW
GO

DROP PROCEDURE IF EXISTS spMaxInventoryByType 
GO

CREATE PROCEDURE spMaxInventoryByType (@YEAR INT, @MONTH INT) AS
BEGIN 
	SELECT vInventoryByType.ProductTypeName,
	       vInventoryByType.ProductSubtypeName,
	       MAX(vInventoryByType.InventoryLevel) AS 'MaxInventory'
	FROM   vInventoryByType
	WHERE  YEAR(vInventoryByType.DateOfInventory) = @YEAR AND
		   MONTH(vInventoryByType.DateOfInventory) = @MONTH
	GROUP BY vInventoryByType.ProductTypeName, vInventoryByType.ProductSubtypeName
	ORDER BY vInventoryByType.ProductTypeName, vInventoryByType.ProductSubtypeName
END

--Checking the output:
USE MaxMinManufacturingDW
GO

EXEC spMaxInventoryByType 2009, 04;

---------------------------------------------------------------------------------------------

--Creating stored procedure: spAcceptedByCountry with two input parameters (year and month)
USE MaxMinManufacturingDW
GO

DROP PROCEDURE IF EXISTS spAcceptedByCountry 
GO

CREATE PROCEDURE spAcceptedByCountry (@YEAR INT, @MONTH INT) AS
BEGIN 
	SELECT vAcceptedByCountry.CountryCode,
	       vAcceptedByCountry.CountryName,
	       SUBSTRING(vAcceptedByCountry.PlantName, CHARINDEX('-',vAcceptedByCountry.PlantName) + 1,
	       LEN(vAcceptedByCountry.PlantName)) AS 'Plant Name',
	       SUM(vAcceptedByCountry.AcceptedProducts) AS 'Accepted Products'
	FROM   vAcceptedByCountry
	WHERE  YEAR(vAcceptedByCountry.DateOfManufacture) = @YEAR AND
		   MONTH(vAcceptedByCountry.DateOfManufacture) = @MONTH
	GROUP BY vAcceptedByCountry.CountryCode,vAcceptedByCountry.CountryName,vAcceptedByCountry.PlantName
	ORDER BY vAcceptedByCountry.CountryCode,vAcceptedByCountry.CountryName,vAcceptedByCountry.PlantName
END

--Checking the output:
USE MaxMinManufacturingDW
GO

EXEC spAcceptedByCountry 2009, 04;

---------------------------------------------------------------------------------------------

--Creating stored procedure: spAvgRejected with two input parameters (year and month)
USE MaxMinManufacturingDW
GO

DROP PROCEDURE IF EXISTS spAvgRejected 
GO

CREATE PROCEDURE spAvgRejected (@YEAR INT, @MONTH INT) AS
BEGIN 
	SELECT vRejectedProductsByType.ProductTypeName,
	       vRejectedProductsByType.ProductSubtypeName,
	       AVG(vRejectedProductsByType.[Percent Rejected]) AS 'AvgPercentRejected',
	       SUM(vRejectedProductsByType.[Total Manufactured]) AS 'TotManufactured'
	FROM   vRejectedProductsByType
	WHERE  YEAR(vRejectedProductsByType.DateOfManufacture) = @YEAR AND
		   MONTH(vRejectedProductsByType.DateOfManufacture) = @MONTH
	GROUP BY vRejectedProductsByType.ProductTypeName,vRejectedProductsByType.ProductSubtypeName
	ORDER BY vRejectedProductsByType.ProductTypeName,vRejectedProductsByType.ProductSubtypeName 
END

--Checking the output:
USE MaxMinManufacturingDW
GO

EXEC spAvgRejected 2009, 04;


---------------------------------------------------------------------------------------------
--Stored Procedure over
---------------------------------------------------------------------------------------------
