Use StarSchema

Create Procedure LoadSS
as 
Begin

BULK INSERT dbo.DimSupplier
FROM 'D:\OneDrive - PERSEUS MANAGEMENT GROUP INC\Desktop\personal\University\Institute of Business Administration\1st Semester\Data Analytics and Warehousing\Assignments\Project\Scripts\Star Schema Tables\dim\DimSupplier.csv'
WITH (
	FORMAT = 'CSV',
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2,
    TABLOCK
);
BULK INSERT dbo.DimProduct
FROM 'D:\OneDrive - PERSEUS MANAGEMENT GROUP INC\Desktop\personal\University\Institute of Business Administration\1st Semester\Data Analytics and Warehousing\Assignments\Project\Scripts\Star Schema Tables\dim\DimProduct.csv'
WITH (
	FORMAT = 'CSV',
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2,
    TABLOCK
);
BULK INSERT dbo.DimColor
FROM 'D:\OneDrive - PERSEUS MANAGEMENT GROUP INC\Desktop\personal\University\Institute of Business Administration\1st Semester\Data Analytics and Warehousing\Assignments\Project\Scripts\Star Schema Tables\dim\DimColor.csv'
WITH (
	FORMAT = 'CSV',
    FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n',    
    FIRSTROW = 2,
    TABLOCK
);
BULK INSERT dbo.DimDate
FROM 'D:\OneDrive - PERSEUS MANAGEMENT GROUP INC\Desktop\personal\University\Institute of Business Administration\1st Semester\Data Analytics and Warehousing\Assignments\Project\Scripts\Star Schema Tables\dim\DimDate.csv'
WITH (
	FORMAT = 'CSV',
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2,
    TABLOCK
);

BULK INSERT dbo.DimPackageType
FROM 'D:\OneDrive - PERSEUS MANAGEMENT GROUP INC\Desktop\personal\University\Institute of Business Administration\1st Semester\Data Analytics and Warehousing\Assignments\Project\Scripts\Star Schema Tables\dim\DimPackageTypes.csv'
WITH (
	FORMAT = 'CSV',
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2,
    TABLOCK
);
BULK INSERT dbo.DimTransactionType
FROM 'D:\OneDrive - PERSEUS MANAGEMENT GROUP INC\Desktop\personal\University\Institute of Business Administration\1st Semester\Data Analytics and Warehousing\Assignments\Project\Scripts\Star Schema Tables\dim\DimTransactionTypes.csv'
WITH (
	FORMAT = 'CSV',
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2,
    TABLOCK
);

BULK INSERT dbo.FactInventoryTransaction
FROM 'D:\OneDrive - PERSEUS MANAGEMENT GROUP INC\Desktop\personal\University\Institute of Business Administration\1st Semester\Data Analytics and Warehousing\Assignments\Project\Scripts\Star Schema Tables\fact\FactInventoryTransaction.csv'
WITH (
	FORMAT = 'CSV',
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2,
    TABLOCK
);

END;