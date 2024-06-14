use DataWarehouse

Create View Snapshot As
select fact.InventoryTransactionID, fact.Quantity,
	p.ProductName, p.Brand, p.Size, p.LeadTimeDays, p.IsChillerStock, p.Barcode, p.TaxRate, p.UnitPrice, p.RetailPrice, p.WeightPerUnit,
	c.ColorName,	
	d.Date, d.Year, d.Quarter, d.Month, d.Day,
	pt.PackageTypeName,
	s.SupplierName, s.SupplierReference, s.PhoneNumber, s.Website, s.DeliveryAddress, s.PostalCode,
	t.TransactionTypeName,
	fact.createdAt, fact.updatedAt
from 
FactInventoryTransaction fact 
left join dimColor c on c.ColorID = fact.ColorID
left join dimDate d on d.Datekey = fact.DateKey
left join dimPackageType pt on pt.PackageTypeID = fact.PackageTypeID
left join dimProduct p on p.productId = fact.productID
left join dimSupplier s on s.SupplierID = fact.SupplierID
left join dimTransactionType t on t.TransactionTypeID = fact.TransactionTypeID