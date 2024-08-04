USE SuperStoreDB;

DROP TABLE IF EXISTS DimState_T; 

CREATE TABLE DimState_T(
	StateID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	State_Name VARCHAR(255) NOT NULL,
	CountryID INT NOT NULL
	CONSTRAINT FK_Country FOREIGN KEY (CountryID) REFERENCES DimCountry_T(CountryID)
);