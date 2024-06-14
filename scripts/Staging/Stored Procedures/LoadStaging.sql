Use Staging

Create PROCEDURE dbo.LoadStaging
as 
BEGIN  
INSERT INTO STAGING.Application.StateProvinces
    (StateProvinceID, StateProvinceCode, StateProvinceName, CountryID, SalesTerritory, Border, LatestRecordedPopulation, LastEditedBy, ValidFrom, ValidTo)
SELECT StateProvinceID, StateProvinceCode, StateProvinceName, CountryID, SalesTerritory, Border, LatestRecordedPopulation, LastEditedBy, ValidFrom, ValidTo
FROM WideWorldImporters.Application.StateProvinces
INSERT INTO STAGING.Application.Cities
    (CityID, CityName, StateProvinceID, Location, LatestRecordedPopulation, LastEditedBy, ValidFrom, ValidTo)
SELECT CityID, CityName, StateProvinceID, Location, LatestRecordedPopulation, LastEditedBy, ValidFrom, ValidTo
FROM WideWorldImporters.Application.Cities
INSERT INTO STAGING.Application.SystemParameters
    (SystemParameterID, DeliveryAddressLine1, DeliveryAddressLine2, DeliveryCityID, DeliveryPostalCode, DeliveryLocation, PostalAddressLine1, PostalAddressLine2, PostalCityID, PostalPostalCode, ApplicationSettings, LastEditedBy, LastEditedWhen)
SELECT SystemParameterID, DeliveryAddressLine1, DeliveryAddressLine2, DeliveryCityID, DeliveryPostalCode, DeliveryLocation, PostalAddressLine1, PostalAddressLine2, PostalCityID, PostalPostalCode, ApplicationSettings, LastEditedBy, LastEditedWhen
FROM WideWorldImporters.Application.SystemParameters
INSERT INTO STAGING.Application.People
    (PersonID, FullName, PreferredName, SearchName, IsPermittedToLogon, LogonName, IsExternalLogonProvider, HashedPassword, IsSystemUser, IsEmployee, IsSalesperson, UserPreferences, PhoneNumber, FaxNumber, EmailAddress, Photo, CustomFields, OtherLanguages, LastEditedBy, ValidFrom, ValidTo)
SELECT PersonID, FullName, PreferredName, SearchName, IsPermittedToLogon, LogonName, IsExternalLogonProvider, HashedPassword, IsSystemUser, IsEmployee, IsSalesperson, UserPreferences, PhoneNumber, FaxNumber, EmailAddress, Photo, CustomFields, OtherLanguages, LastEditedBy, ValidFrom, ValidTo
FROM WideWorldImporters.Application.People
INSERT INTO STAGING.Application.Countries
    (CountryID, CountryName, FormalName, IsoAlpha3Code, IsoNumericCode, CountryType, LatestRecordedPopulation, Continent, Region, Subregion, Border, LastEditedBy, ValidFrom, ValidTo)
SELECT CountryID, CountryName, FormalName, IsoAlpha3Code, IsoNumericCode, CountryType, LatestRecordedPopulation, Continent, Region, Subregion, Border, LastEditedBy, ValidFrom, ValidTo
FROM WideWorldImporters.Application.Countries
INSERT INTO STAGING.Application.DeliveryMethods
    (DeliveryMethodID, DeliveryMethodName, LastEditedBy, ValidFrom, ValidTo)
SELECT DeliveryMethodID, DeliveryMethodName, LastEditedBy, ValidFrom, ValidTo
FROM WideWorldImporters.Application.DeliveryMethods
INSERT INTO STAGING.Application.PaymentMethods
    (PaymentMethodID, PaymentMethodName, LastEditedBy, ValidFrom, ValidTo)
SELECT PaymentMethodID, PaymentMethodName, LastEditedBy, ValidFrom, ValidTo
FROM WideWorldImporters.Application.PaymentMethods
INSERT INTO STAGING.Application.TransactionTypes
    (TransactionTypeID, TransactionTypeName, LastEditedBy, ValidFrom, ValidTo)
SELECT TransactionTypeID, TransactionTypeName, LastEditedBy, ValidFrom, ValidTo
FROM WideWorldImporters.Application.TransactionTypes
INSERT INTO STAGING.Purchasing.SupplierCategories
    (SupplierCategoryID, SupplierCategoryName, LastEditedBy, ValidFrom, ValidTo)
SELECT SupplierCategoryID, SupplierCategoryName, LastEditedBy, ValidFrom, ValidTo
FROM WideWorldImporters.Purchasing.SupplierCategories
INSERT INTO STAGING.Purchasing.PurchaseOrderLines
    (PurchaseOrderLineID, PurchaseOrderID, StockItemID, OrderedOuters, Description, ReceivedOuters, PackageTypeID, ExpectedUnitPricePerOuter, LastReceiptDate, IsOrderLineFinalized, LastEditedBy, LastEditedWhen)
SELECT PurchaseOrderLineID, PurchaseOrderID, StockItemID, OrderedOuters, Description, ReceivedOuters, PackageTypeID, ExpectedUnitPricePerOuter, LastReceiptDate, IsOrderLineFinalized, LastEditedBy, LastEditedWhen
FROM WideWorldImporters.Purchasing.PurchaseOrderLines
INSERT INTO STAGING.Purchasing.SupplierTransactions
    (SupplierTransactionID, SupplierID, TransactionTypeID, PurchaseOrderID, PaymentMethodID, SupplierInvoiceNumber, TransactionDate, AmountExcludingTax, TaxAmount, TransactionAmount, OutstandingBalance, FinalizationDate, IsFinalized, LastEditedBy, LastEditedWhen)
SELECT SupplierTransactionID, SupplierID, TransactionTypeID, PurchaseOrderID, PaymentMethodID, SupplierInvoiceNumber, TransactionDate, AmountExcludingTax, TaxAmount, TransactionAmount, OutstandingBalance, FinalizationDate, IsFinalized, LastEditedBy, LastEditedWhen
FROM WideWorldImporters.Purchasing.SupplierTransactions
INSERT INTO STAGING.Purchasing.Suppliers
    (SupplierID, SupplierName, SupplierCategoryID, PrimaryContactPersonID, AlternateContactPersonID, DeliveryMethodID, DeliveryCityID, PostalCityID, SupplierReference, BankAccountName, BankAccountBranch, BankAccountCode, BankAccountNumber, BankInternationalCode, PaymentDays, InternalComments, PhoneNumber, FaxNumber, WebsiteURL, DeliveryAddressLine1, DeliveryAddressLine2, DeliveryPostalCode, DeliveryLocation, PostalAddressLine1, PostalAddressLine2, PostalPostalCode, LastEditedBy, ValidFrom, ValidTo)
SELECT SupplierID, SupplierName, SupplierCategoryID, PrimaryContactPersonID, AlternateContactPersonID, DeliveryMethodID, DeliveryCityID, PostalCityID, SupplierReference, BankAccountName, BankAccountBranch, BankAccountCode, BankAccountNumber, BankInternationalCode, PaymentDays, InternalComments, PhoneNumber, FaxNumber, WebsiteURL, DeliveryAddressLine1, DeliveryAddressLine2, DeliveryPostalCode, DeliveryLocation, PostalAddressLine1, PostalAddressLine2, PostalPostalCode, LastEditedBy, ValidFrom, ValidTo
FROM WideWorldImporters.Purchasing.Suppliers
INSERT INTO STAGING.Purchasing.PurchaseOrders
    (PurchaseOrderID, SupplierID, OrderDate, DeliveryMethodID, ContactPersonID, ExpectedDeliveryDate, SupplierReference, IsOrderFinalized, Comments, InternalComments, LastEditedBy, LastEditedWhen)
SELECT PurchaseOrderID, SupplierID, OrderDate, DeliveryMethodID, ContactPersonID, ExpectedDeliveryDate, SupplierReference, IsOrderFinalized, Comments, InternalComments, LastEditedBy, LastEditedWhen
FROM WideWorldImporters.Purchasing.PurchaseOrders
INSERT INTO STAGING.Sales.Orders
    (OrderID, CustomerID, SalespersonPersonID, PickedByPersonID, ContactPersonID, BackorderOrderID, OrderDate, ExpectedDeliveryDate, CustomerPurchaseOrderNumber, IsUndersupplyBackordered, Comments, DeliveryInstructions, InternalComments, PickingCompletedWhen, LastEditedBy, LastEditedWhen)
SELECT OrderID, CustomerID, SalespersonPersonID, PickedByPersonID, ContactPersonID, BackorderOrderID, OrderDate, ExpectedDeliveryDate, CustomerPurchaseOrderNumber, IsUndersupplyBackordered, Comments, DeliveryInstructions, InternalComments, PickingCompletedWhen, LastEditedBy, LastEditedWhen
FROM WideWorldImporters.Sales.Orders
INSERT INTO STAGING.Sales.Customers
    (CustomerID, CustomerName, BillToCustomerID, CustomerCategoryID, BuyingGroupID, PrimaryContactPersonID, AlternateContactPersonID, DeliveryMethodID, DeliveryCityID, PostalCityID, CreditLimit, AccountOpenedDate, StandardDiscountPercentage, IsStatementSent, IsOnCreditHold, PaymentDays, PhoneNumber, FaxNumber, DeliveryRun, RunPosition, WebsiteURL, DeliveryAddressLine1, DeliveryAddressLine2, DeliveryPostalCode, DeliveryLocation, PostalAddressLine1, PostalAddressLine2, PostalPostalCode, LastEditedBy, ValidFrom, ValidTo)
SELECT CustomerID, CustomerName, BillToCustomerID, CustomerCategoryID, BuyingGroupID, PrimaryContactPersonID, AlternateContactPersonID, DeliveryMethodID, DeliveryCityID, PostalCityID, CreditLimit, AccountOpenedDate, StandardDiscountPercentage, IsStatementSent, IsOnCreditHold, PaymentDays, PhoneNumber, FaxNumber, DeliveryRun, RunPosition, WebsiteURL, DeliveryAddressLine1, DeliveryAddressLine2, DeliveryPostalCode, DeliveryLocation, PostalAddressLine1, PostalAddressLine2, PostalPostalCode, LastEditedBy, ValidFrom, ValidTo
FROM WideWorldImporters.Sales.Customers
INSERT INTO STAGING.Sales.InvoiceLines
    (InvoiceLineID, InvoiceID, StockItemID, Description, PackageTypeID, Quantity, UnitPrice, TaxRate, TaxAmount, LineProfit, ExtendedPrice, LastEditedBy, LastEditedWhen)
SELECT InvoiceLineID, InvoiceID, StockItemID, Description, PackageTypeID, Quantity, UnitPrice, TaxRate, TaxAmount, LineProfit, ExtendedPrice, LastEditedBy, LastEditedWhen
FROM WideWorldImporters.Sales.InvoiceLines
INSERT INTO STAGING.Sales.CustomerTransactions
    (CustomerTransactionID, CustomerID, TransactionTypeID, InvoiceID, PaymentMethodID, TransactionDate, AmountExcludingTax, TaxAmount, TransactionAmount, OutstandingBalance, FinalizationDate, IsFinalized, LastEditedBy, LastEditedWhen)
SELECT CustomerTransactionID, CustomerID, TransactionTypeID, InvoiceID, PaymentMethodID, TransactionDate, AmountExcludingTax, TaxAmount, TransactionAmount, OutstandingBalance, FinalizationDate, IsFinalized, LastEditedBy, LastEditedWhen
FROM WideWorldImporters.Sales.CustomerTransactions
INSERT INTO STAGING.Sales.OrderLines
    (OrderLineID, OrderID, StockItemID, Description, PackageTypeID, Quantity, UnitPrice, TaxRate, PickedQuantity, PickingCompletedWhen, LastEditedBy, LastEditedWhen)
SELECT OrderLineID, OrderID, StockItemID, Description, PackageTypeID, Quantity, UnitPrice, TaxRate, PickedQuantity, PickingCompletedWhen, LastEditedBy, LastEditedWhen
FROM WideWorldImporters.Sales.OrderLines
INSERT INTO STAGING.Sales.SpecialDeals
    (SpecialDealID, StockItemID, CustomerID, BuyingGroupID, CustomerCategoryID, StockGroupID, DealDescription, StartDate, EndDate, DiscountAmount, DiscountPercentage, UnitPrice, LastEditedBy, LastEditedWhen)
SELECT SpecialDealID, StockItemID, CustomerID, BuyingGroupID, CustomerCategoryID, StockGroupID, DealDescription, StartDate, EndDate, DiscountAmount, DiscountPercentage, UnitPrice, LastEditedBy, LastEditedWhen
FROM WideWorldImporters.Sales.SpecialDeals
INSERT INTO STAGING.Sales.BuyingGroups
    (BuyingGroupID, BuyingGroupName, LastEditedBy, ValidFrom, ValidTo)
SELECT BuyingGroupID, BuyingGroupName, LastEditedBy, ValidFrom, ValidTo
FROM WideWorldImporters.Sales.BuyingGroups
INSERT INTO STAGING.Sales.Invoices
    (InvoiceID, CustomerID, BillToCustomerID, OrderID, DeliveryMethodID, ContactPersonID, AccountsPersonID, SalespersonPersonID, PackedByPersonID, InvoiceDate, CustomerPurchaseOrderNumber, IsCreditNote, CreditNoteReason, Comments, DeliveryInstructions, InternalComments, TotalDryItems, TotalChillerItems, DeliveryRun, RunPosition, ReturnedDeliveryData, ConfirmedDeliveryTime, ConfirmedReceivedBy, LastEditedBy, LastEditedWhen)
SELECT InvoiceID, CustomerID, BillToCustomerID, OrderID, DeliveryMethodID, ContactPersonID, AccountsPersonID, SalespersonPersonID, PackedByPersonID, InvoiceDate, CustomerPurchaseOrderNumber, IsCreditNote, CreditNoteReason, Comments, DeliveryInstructions, InternalComments, TotalDryItems, TotalChillerItems, DeliveryRun, RunPosition, ReturnedDeliveryData, ConfirmedDeliveryTime, ConfirmedReceivedBy, LastEditedBy, LastEditedWhen
FROM WideWorldImporters.Sales.Invoices
INSERT INTO STAGING.Sales.CustomerCategories
    (CustomerCategoryID, CustomerCategoryName, LastEditedBy, ValidFrom, ValidTo)
SELECT CustomerCategoryID, CustomerCategoryName, LastEditedBy, ValidFrom, ValidTo
FROM WideWorldImporters.Sales.CustomerCategories
INSERT INTO STAGING.Warehouse.StockItemHoldings
    (StockItemID, QuantityOnHand, BinLocation, LastStocktakeQuantity, LastCostPrice, ReorderLevel, TargetStockLevel, LastEditedBy, LastEditedWhen)
SELECT StockItemID, QuantityOnHand, BinLocation, LastStocktakeQuantity, LastCostPrice, ReorderLevel, TargetStockLevel, LastEditedBy, LastEditedWhen
FROM WideWorldImporters.Warehouse.StockItemHoldings
INSERT INTO STAGING.Warehouse.StockItems
    (StockItemID, StockItemName, SupplierID, ColorID, UnitPackageID, OuterPackageID, Brand, Size, LeadTimeDays, QuantityPerOuter, IsChillerStock, Barcode, TaxRate, UnitPrice, RecommendedRetailPrice, TypicalWeightPerUnit, MarketingComments, InternalComments, Photo, CustomFields, Tags, SearchDetails, LastEditedBy, ValidFrom, ValidTo)
SELECT StockItemID, StockItemName, SupplierID, ColorID, UnitPackageID, OuterPackageID, Brand, Size, LeadTimeDays, QuantityPerOuter, IsChillerStock, Barcode, TaxRate, UnitPrice, RecommendedRetailPrice, TypicalWeightPerUnit, MarketingComments, InternalComments, Photo, CustomFields, Tags, SearchDetails, LastEditedBy, ValidFrom, ValidTo
FROM WideWorldImporters.Warehouse.StockItems
INSERT INTO STAGING.Warehouse.PackageTypes
    (PackageTypeID, PackageTypeName, LastEditedBy, ValidFrom, ValidTo)
SELECT PackageTypeID, PackageTypeName, LastEditedBy, ValidFrom, ValidTo
FROM WideWorldImporters.Warehouse.PackageTypes
INSERT INTO STAGING.Warehouse.StockGroups
    (StockGroupID, StockGroupName, LastEditedBy, ValidFrom, ValidTo)
SELECT StockGroupID, StockGroupName, LastEditedBy, ValidFrom, ValidTo
FROM WideWorldImporters.Warehouse.StockGroups
INSERT INTO STAGING.Warehouse.StockItemStockGroups
    (StockItemStockGroupID, StockItemID, StockGroupID, LastEditedBy, LastEditedWhen)
SELECT StockItemStockGroupID, StockItemID, StockGroupID, LastEditedBy, LastEditedWhen
FROM WideWorldImporters.Warehouse.StockItemStockGroups
INSERT INTO STAGING.Warehouse.Colors
    (ColorID, ColorName, LastEditedBy, ValidFrom, ValidTo)
SELECT ColorID, ColorName, LastEditedBy, ValidFrom, ValidTo
FROM WideWorldImporters.Warehouse.Colors
INSERT INTO STAGING.Warehouse.StockItemTransactions
    (StockItemTransactionID, StockItemID, TransactionTypeID, CustomerID, InvoiceID, SupplierID, PurchaseOrderID, TransactionOccurredWhen, Quantity, LastEditedBy, LastEditedWhen)
SELECT StockItemTransactionID, StockItemID, TransactionTypeID, CustomerID, InvoiceID, SupplierID, PurchaseOrderID, TransactionOccurredWhen, Quantity, LastEditedBy, LastEditedWhen
FROM WideWorldImporters.Warehouse.StockItemTransactions

SET IDENTITY_INSERT Warehouse.ColdRoomTemperatures ON
INSERT INTO STAGING.Warehouse.ColdRoomTemperatures
    (ColdRoomTemperatureID, ColdRoomSensorNumber, RecordedWhen, Temperature, ValidFrom, ValidTo)
SELECT ColdRoomTemperatureID, ColdRoomSensorNumber, RecordedWhen, Temperature, ValidFrom, ValidTo
FROM LoopbackServer.WideWorldImporters.Warehouse.ColdRoomTemperatures
SET IDENTITY_INSERT Warehouse.ColdRoomTemperatures off

SET IDENTITY_INSERT Warehouse.VehicleTemperatures ON
INSERT INTO STAGING.Warehouse.VehicleTemperatures
    (VehicleTemperatureID, VehicleRegistration, ChillerSensorNumber, RecordedWhen, Temperature, FullSensorData, IsCompressed, CompressedSensorData)
SELECT VehicleTemperatureID, VehicleRegistration, ChillerSensorNumber, RecordedWhen, Temperature, FullSensorData, IsCompressed, CompressedSensorData
FROM LoopbackServer.WideWorldImporters.Warehouse.VehicleTemperatures
SET IDENTITY_INSERT Warehouse.VehicleTemperatures OFF

INSERT INTO STAGING.Website.Customers
    (CustomerID, CustomerName, CustomerCategoryName, PrimaryContact, AlternateContact, PhoneNumber, FaxNumber, BuyingGroupName, WebsiteURL, DeliveryMethod, CityName, DeliveryLocation, DeliveryRun, RunPosition)
SELECT CustomerID, CustomerName, CustomerCategoryName, PrimaryContact, AlternateContact, PhoneNumber, FaxNumber, BuyingGroupName, WebsiteURL, DeliveryMethod, CityName, DeliveryLocation, DeliveryRun, RunPosition
FROM WideWorldImporters.Website.Customers

SET IDENTITY_INSERT Website.VehicleTemperatures ON
INSERT INTO STAGING.Website.VehicleTemperatures
    (VehicleTemperatureID, VehicleRegistration, ChillerSensorNumber, RecordedWhen, Temperature, FullSensorData)
SELECT VehicleTemperatureID, VehicleRegistration, ChillerSensorNumber, RecordedWhen, Temperature, FullSensorData
FROM LoopbackServer.WideWorldImporters.Website.VehicleTemperatures
SET IDENTITY_INSERT Website.VehicleTemperatures OFF

INSERT INTO STAGING.Website.Suppliers
    (SupplierID, SupplierName, SupplierCategoryName, PrimaryContact, AlternateContact, PhoneNumber, FaxNumber, WebsiteURL, DeliveryMethod, CityName, DeliveryLocation, SupplierReference)
SELECT SupplierID, SupplierName, SupplierCategoryName, PrimaryContact, AlternateContact, PhoneNumber, FaxNumber, WebsiteURL, DeliveryMethod, CityName, DeliveryLocation, SupplierReference
FROM WideWorldImporters.Website.Suppliers


END
