use DataWarehouse
	
--Which suppliers provided the highest quantity of stock?

SELECT 
    SupplierName, 
    SUM(fact.Quantity) AS TotalQuantity
FROM 
    Snapshot fact
GROUP BY 
    SupplierName
ORDER BY 
    TotalQuantity DESC;


-- What is the average lead time for products from each supplier?

SELECT 
    SupplierName, 
    AVG(LeadTimeDays) AS AverageLeadTime
FROM 
    Snapshot fact
GROUP BY 
    SupplierName
ORDER BY 
    AverageLeadTime;


-- How many transactions were made for each transaction type ?

SELECT 
    TransactionTypeName, 
    COUNT(InventoryTransactionID) AS TransactionCount
FROM 
    Snapshot fact

GROUP BY 
    TransactionTypeName
ORDER BY 
    TransactionCount DESC;


--What is the total inventory cost for each product?

SELECT 
    ProductName, 
    SUM(UnitPrice * Quantity) AS TotalInventoryCost
FROM 
    Snapshot fact
GROUP BY 
    ProductName
ORDER BY 
    TotalInventoryCost DESC;


-- What are the top 10 most frequently transacted products?

SELECT 
    ProductName, 
    COUNT(InventoryTransactionID) AS TransactionCount
FROM 
    Snapshot fact
GROUP BY 
    ProductName
ORDER BY 
    TransactionCount DESC
OFFSET 0 ROWS
FETCH NEXT 10 ROWS ONLY;


