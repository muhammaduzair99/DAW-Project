Use StarSchema

CREATE TABLE DimDate (
    Date DATE NOT NULL,
    Year INT NOT NULL,
    Quarter INT NOT NULL,
    Month INT NOT NULL,
    Day INT NOT NULL,
    DateKey INT primary key
);

CREATE TABLE DimProduct (
    ProductID INT NOT NULL Primary Key,
    ProductName NVARCHAR(255) NOT NULL,
    SupplierID bigINT,
    ColorID INT,
    UnitPackageID INT,
    OuterPackageID INT,
    Brand NVARCHAR(255),
    Size NVARCHAR(50),
    LeadTimeDays INT,
    IsChillerStock Varchar(255),
    Barcode NVARCHAR(255),
    TaxRate DECIMAL(18, 2),
    UnitPrice DECIMAL(18, 2),
    RetailPrice DECIMAL(18, 2),
    WeightPerUnit DECIMAL(18, 2)
);

CREATE TABLE DimSupplier (
    SupplierID bigINT NOT NULL Primary Key,
    SupplierName NVARCHAR(255),
    SupplierReference NVARCHAR(255),
    PhoneNumber NVARCHAR(50),
    Website NVARCHAR(255),
    DeliveryAddress NVARCHAR(255),
    PostalCode NVARCHAR(50)
);

CREATE TABLE DimColor (
    ColorID INT NOT NULL Primary Key,
    ColorName NVARCHAR(255),
);


CREATE TABLE DimPackageType (
    PackageTypeID INT NOT NULL Primary Key,
    PackageTypeName NVARCHAR(255)
);


CREATE TABLE DimTransactionType (
    TransactionTypeID INT NOT NULL Primary Key,
    TransactionTypeName NVARCHAR(255),
);

CREATE TABLE FactInventoryTransaction (
    InventoryTransactionID INT PRIMARY KEY,
    DateKey INT NOT NULL,
    TransactionTypeID INT NOT NULL,
    SupplierID bigINT,
    Quantity DECIMAL(18, 2),
    ProductID INT NOT NULL,
    PackageTypeID INT NOT NULL,	
	ColorID Int not Null,
    FOREIGN KEY (DateKey) REFERENCES DimDate(DateKey),
    FOREIGN KEY (ProductID) REFERENCES DimProduct(ProductID),
    FOREIGN KEY (SupplierID) REFERENCES DimSupplier(SupplierID),
    FOREIGN KEY (TransactionTypeID) REFERENCES DimTransactionType(TransactionTypeID),
    FOREIGN KEY (PackageTypeID) REFERENCES DimPackageType(PackageTypeID),
    FOREIGN KEY (ColorID) REFERENCES DimColor(ColorID) 
);