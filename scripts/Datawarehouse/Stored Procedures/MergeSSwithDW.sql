Use DataWarehouse

Create Procedure MergeSSwithDW
as
begin


MERGE dbo.DimDate AS Target
USING StarSchema.dbo.DimDate AS Source
ON Source.DateKey = Target.DateKey
WHEN NOT MATCHED BY Target THEN
    INSERT (Date,Year, Quarter,Month, Day,DateKey, createdAt, updatedAt) 
    VALUES (Source.Date,Source.Year, Source.Quarter,Source.Month, Source.Day ,Source.DateKey, GETDATE(), GETDATE())

When Matched then
	update Set 
	Target.Date = Source.date,
	Target.Year = Source.Year, 
	Target.Quarter=Source.Quarter,
	Target.Month=Source.Month, 
	Target.Day=Source.Day, 
	Target.updatedAt=GETDATE();


	MERGE dbo.DimColor AS Target
USING StarSchema.dbo.DimColor AS Source
ON Source.ColorID = Target.ColorID
WHEN NOT MATCHED BY Target THEN
    INSERT (ColorID,ColorName,createdAt,updatedAt) 
    VALUES (Source.ColorID,Source.ColorName, GETDATE(), GETDATE())

When Matched then
	update Set 
	Target.ColorID = Source.ColorID,
	Target.ColorName = Source.ColorName,
	Target.updatedAt=GETDATE();


	MERGE dbo.DimPackageType AS Target
USING StarSchema.dbo.DimPackageType AS Source
ON Source.PackageTypeID = Target.PackageTypeID
WHEN NOT MATCHED BY Target THEN
    INSERT (PackageTypeID,PackageTypeName,createdAt,updatedAt) 
    VALUES (Source.PackageTypeID,Source.PackageTypeName, GETDATE(), GETDATE())

When Matched then
	update Set 
	Target.PackageTypeID = Source.PackageTypeID,
	Target.PackageTypeName = Source.PackageTypeName,
	Target.updatedAt=GETDATE();


	MERGE dbo.DimProduct AS Target
USING StarSchema.dbo.DimProduct AS Source
ON Source.ProductID = Target.ProductID
WHEN NOT MATCHED BY Target THEN
    INSERT (ProductID,ProductName,SupplierID,ColorID,UnitPackageID,OuterPackageID,Brand,Size,
				LeadTimeDays,IsChillerStock,Barcode,TaxRate,UnitPrice,RetailPrice,WeightPerUnit,createdAt,updatedAt) 
    VALUES (Source.ProductID,Source.ProductName,Source.SupplierID,Source.ColorID,Source.UnitPackageID,Source.OuterPackageID,
				Source.Brand, Source.Size, Source.LeadTimeDays, Source.IsChillerStock,Source.Barcode,Source.TaxRate,
					Source.UnitPrice,Source.RetailPrice,Source.WeightPerUnit, GETDATE(), GETDATE())

When Matched then
	update Set 
	Target.ProductID = Source.ProductID,
	Target.ProductName = Source.ProductName,
	Target.SupplierID = Source.SupplierID,
	Target.ColorID = Source.ColorID,
	Target.UnitPackageID = Source.UnitPackageID,
	Target.OuterPackageID = Source.OuterPackageID,
	Target.Brand = Source.Brand, 
	Target.Size = Source.Size, 
	Target.LeadTimeDays = Source.LeadTimeDays,
	Target.IsChillerStock = Source.IsChillerStock,
	Target.Barcode = Source.Barcode,
	Target.TaxRate = Source.TaxRate,
	Target.UnitPrice = Source.UnitPrice,
	Target.RetailPrice = Source.RetailPrice,
	Target.WeightPerUnit = Source.WeightPerUnit,
	Target.updatedAt=GETDATE();

	
MERGE dbo.DimSupplier AS Target
USING StarSchema.dbo.DimSupplier AS Source
ON Source.SupplierID = Target.SupplierID
WHEN NOT MATCHED BY Target THEN
    INSERT (SupplierID,SupplierName,SupplierReference,PhoneNumber,Website,DeliveryAddress,PostalCode,createdAt,updatedAt) 
    VALUES (Source.SupplierID,Source.SupplierName,Source.SupplierReference,Source.PhoneNumber,Source.Website,
				Source.DeliveryAddress, Source.PostalCode, GETDATE(), GETDATE())

When Matched then
	update Set 
	Target.SupplierID = Source.SupplierID,
	Target.SupplierName = Source.SupplierName,
	Target.SupplierReference = Source.SupplierReference,
	Target.PhoneNumber = Source.PhoneNumber,
	Target.Website = Source.Website,
	Target.DeliveryAddress = Source.DeliveryAddress, 
	Target.PostalCode = Source.PostalCode,
	Target.updatedAt=GETDATE();


	MERGE dbo.DimTransactionType AS Target
USING StarSchema.dbo.DimTransactionType AS Source
ON Source.TransactionTypeID = Target.TransactionTypeID
WHEN NOT MATCHED BY Target THEN
    INSERT (TransactionTypeID,TransactionTypeName,createdAt,updatedAt) 
    VALUES (Source.TransactionTypeID,Source.TransactionTypeName, GETDATE(), GETDATE())

When Matched then
	update Set 
	Target.TransactionTypeID = Source.TransactionTypeID,
	Target.TransactionTypeName = Source.TransactionTypeName,
	Target.updatedAt=GETDATE();


MERGE dbo.FactInventoryTransaction AS Target
USING StarSchema.dbo.FactInventoryTransaction AS Source
ON Source.InventoryTransactionID = Target.InventoryTransactionID
WHEN NOT MATCHED BY Target THEN
    INSERT (InventoryTransactionID,DateKey,TransactionTypeID,SupplierID,Quantity,ProductID,PackageTypeID,ColorID,createdAt,updatedAt) 
    VALUES (Source.InventoryTransactionID,Source.DateKey,Source.TransactionTypeID,Source.SupplierID,Source.Quantity,
				Source.ProductID, Source.PackageTypeID,Source.ColorID, GETDATE(), GETDATE())

When Matched then
	update Set 
	Target.InventoryTransactionID = Source.InventoryTransactionID,
	Target.DateKey = Source.DateKey,
	Target.TransactionTypeID = Source.TransactionTypeID,
	Target.SupplierID = Source.SupplierID,
	Target.Quantity = Source.Quantity,
	Target.ProductID = Source.ProductID, 
	Target.PackageTypeID = Source.PackageTypeID,
	Target.ColorID = Source.ColorID,
	Target.updatedAt=GETDATE();

END;



exec dbo.MergeSSwithDW


