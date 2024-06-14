Use Staging

CREATE PROCEDURE dbo.CleanStaging
AS
BEGIN


TRUNCATE TABLE STAGING.Application.StateProvinces
TRUNCATE TABLE STAGING.Application.Cities
TRUNCATE TABLE STAGING.Application.SystemParameters
TRUNCATE TABLE STAGING.Application.People
TRUNCATE TABLE STAGING.Application.Countries
TRUNCATE TABLE STAGING.Application.DeliveryMethods
TRUNCATE TABLE STAGING.Application.PaymentMethods
TRUNCATE TABLE STAGING.Application.TransactionTypes
TRUNCATE TABLE STAGING.dbo.sysdiagrams
TRUNCATE TABLE STAGING.Purchasing.SupplierCategories
TRUNCATE TABLE STAGING.Purchasing.PurchaseOrderLines
TRUNCATE TABLE STAGING.Purchasing.SupplierTransactions
TRUNCATE TABLE STAGING.Purchasing.Suppliers
TRUNCATE TABLE STAGING.Purchasing.PurchaseOrders
TRUNCATE TABLE STAGING.Sales.Orders
TRUNCATE TABLE STAGING.Sales.Customers
TRUNCATE TABLE STAGING.Sales.InvoiceLines
TRUNCATE TABLE STAGING.Sales.CustomerTransactions
TRUNCATE TABLE STAGING.Sales.OrderLines
TRUNCATE TABLE STAGING.Sales.SpecialDeals
TRUNCATE TABLE STAGING.Sales.BuyingGroups
TRUNCATE TABLE STAGING.Sales.Invoices
TRUNCATE TABLE STAGING.Sales.CustomerCategories
TRUNCATE TABLE STAGING.Warehouse.StockItemHoldings
TRUNCATE TABLE STAGING.Warehouse.StockItems
TRUNCATE TABLE STAGING.Warehouse.PackageTypes
TRUNCATE TABLE STAGING.Warehouse.StockGroups
TRUNCATE TABLE STAGING.Warehouse.StockItemStockGroups
TRUNCATE TABLE STAGING.Warehouse.Colors
TRUNCATE TABLE STAGING.Warehouse.StockItemTransactions
TRUNCATE TABLE STAGING.Warehouse.ColdRoomTemperatures
TRUNCATE TABLE STAGING.Warehouse.VehicleTemperatures
TRUNCATE TABLE STAGING.Website.Customers
TRUNCATE TABLE STAGING.Website.VehicleTemperatures
TRUNCATE TABLE STAGING.Website.Suppliers

END