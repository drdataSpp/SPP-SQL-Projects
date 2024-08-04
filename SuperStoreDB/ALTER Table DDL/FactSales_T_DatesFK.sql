--Adding ShipDate and OrderDate FK to DimDate

ALTER TABLE [dbo].[FactSales_T]
ADD CONSTRAINT FK_OrderDate
FOREIGN KEY ([OrderDate]) REFERENCES [dbo].[DimDate_T]([DateKey]);

ALTER TABLE [dbo].[FactSales_T]
ADD CONSTRAINT FK_ShipDate
FOREIGN KEY ([ShipDate]) REFERENCES [dbo].[DimDate_T]([DateKey]);