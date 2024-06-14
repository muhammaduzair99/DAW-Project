import pyodbc
import pandas as pd

# Connection parameters
server = 'CRKRL-UZAIRMUH2\\SQLEXPRESS'  # Replace with your server name
database = 'Staging'  # Replace with your database name
trusted_connection = 'yes'  # Use Windows authentication

# Establish connection
conn = pyodbc.connect(
    'DRIVER={SQL Server};SERVER=' + server + ';DATABASE=' + database + ';Trusted_Connection=' + trusted_connection + ';'
)

print('Connection Status:', conn.closed)

def getAlldata(schema, tableName, columns):
    query = f"Select {columns} from {schema}.{tableName}"
    # print('QUERY: ', query, '\n')
    table = pd.read_sql(query,conn)
    return table

def get_staging_warehouse_ColdRoomTemperatures():
    columns = 'ColdRoomTemperatureID,ColdRoomSensorNumber,RecordedWhen,Temperature,ValidFrom,ValidTo'
    table = getAlldata('Warehouse', 'ColdRoomTemperatures', columns)
    return table


def get_staging_warehouse_Colors():
    columns = 'ColorID,ColorName,LastEditedBy,ValidFrom,ValidTo'
    table = getAlldata('Warehouse', 'Colors', columns)
    return table

def get_staging_warehouse_PackageTypes():
    columns = 'PackageTypeID,PackageTypeName,LastEditedBy,ValidFrom,ValidTo'
    table = getAlldata('Warehouse', 'PackageTypes', columns)
    return table

def get_staging_warehouse_StockGroups():
    columns = 'StockGroupID,StockGroupName,LastEditedBy,ValidFrom,ValidTo'
    table = getAlldata('Warehouse', 'StockGroups', columns)
    return table

def get_staging_warehouse_StockItemHoldings():
    columns = 'StockItemID,QuantityOnHand,BinLocation,LastStocktakeQuantity,LastCostPrice,ReorderLevel,TargetStockLevel,LastEditedBy,LastEditedWhen'
    table = getAlldata('Warehouse', 'StockItemHoldings', columns)
    return table

def get_staging_warehouse_StockItems():
    columns = 'StockItemID,StockItemName,SupplierID,ColorID,UnitPackageID,OuterPackageID,Brand,Size,LeadTimeDays,QuantityPerOuter,IsChillerStock,Barcode,TaxRate,UnitPrice,RecommendedRetailPrice,TypicalWeightPerUnit,MarketingComments,InternalComments,Photo,CustomFields,Tags,SearchDetails,LastEditedBy,ValidFrom,ValidTo'
    table = getAlldata('Warehouse', 'StockItems', columns)
    return table

def get_staging_warehouse_StockItemStockGroups():
    columns = 'StockItemStockGroupID,StockItemID,StockGroupID,LastEditedBy,LastEditedWhen'
    table = getAlldata('Warehouse', 'StockItemStockGroups', columns)
    return table

def get_staging_warehouse_StockItemTransactions():
    columns = 'StockItemTransactionID,StockItemID,TransactionTypeID,CustomerID,InvoiceID,SupplierID,PurchaseOrderID,TransactionOccurredWhen,Quantity,LastEditedBy,LastEditedWhen'
    table = getAlldata('Warehouse', 'StockItemTransactions', columns)
    return table

def get_staging_warehouse_VehicleTemperatures():
    columns = 'VehicleTemperatureID,VehicleRegistration,ChillerSensorNumber,RecordedWhen,Temperature,FullSensorData,IsCompressed,CompressedSensorData'
    table = getAlldata('Warehouse', 'VehicleTemperatures', columns)
    return table

def get_staging_purchasing_Suppliers():
    columns = 'SupplierID,SupplierName,SupplierCategoryID,PrimaryContactPersonID,AlternateContactPersonID,DeliveryMethodID,DeliveryCityID,PostalCityID,SupplierReference,BankAccountName,BankAccountBranch,BankAccountCode,BankAccountNumber,BankInternationalCode,PaymentDays,InternalComments,PhoneNumber,FaxNumber,WebsiteURL,DeliveryAddressLine1,DeliveryAddressLine2,DeliveryPostalCode,DeliveryLocation,PostalAddressLine1,PostalAddressLine2,PostalPostalCode,LastEditedBy,ValidFrom,ValidTo'
    table = getAlldata('Purchasing', 'Suppliers', columns)
    return table

def get_staging_application_TransactionTypes():
    columns = 'TransactionTypeID,TransactionTypeName,LastEditedBy,ValidFrom,ValidTo'
    table = getAlldata('Application', 'TransactionTypes', columns)
    return table