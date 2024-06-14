Use StarSchema

CREATE PROCEDURE CleanSS
AS
BEGIN
    -- Declare variables for constraint names
    DECLARE @ConstraintName NVARCHAR(255);

    -- Drop foreign key constraints
    DECLARE constraints_cursor CURSOR FOR
    SELECT name
    FROM sys.foreign_keys
    WHERE parent_object_id = OBJECT_ID('dbo.FactInventoryTransaction');

    OPEN constraints_cursor;
    FETCH NEXT FROM constraints_cursor INTO @ConstraintName;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        EXEC('ALTER TABLE dbo.FactInventoryTransaction DROP CONSTRAINT ' + @ConstraintName);
        FETCH NEXT FROM constraints_cursor INTO @ConstraintName;
    END;

    CLOSE constraints_cursor;
    DEALLOCATE constraints_cursor;

    -- Truncate the tables
    TRUNCATE TABLE dbo.FactInventoryTransaction;
    TRUNCATE TABLE dbo.DimSupplier;
    TRUNCATE TABLE dbo.DimProduct;
    TRUNCATE TABLE dbo.DimDate;
    TRUNCATE TABLE dbo.DimColor;
    TRUNCATE TABLE dbo.DimPackageType;
    TRUNCATE TABLE dbo.DimTransactionType;

    -- Reapply foreign key constraints
    ALTER TABLE dbo.FactInventoryTransaction
    ADD CONSTRAINT FK_FactInventoryTransaction_DimDate
    FOREIGN KEY (DateKey) REFERENCES dbo.DimDate(DateKey);

    ALTER TABLE dbo.FactInventoryTransaction
    ADD CONSTRAINT FK_FactInventoryTransaction_DimProduct
    FOREIGN KEY (ProductID) REFERENCES dbo.DimProduct(ProductID);

    ALTER TABLE dbo.FactInventoryTransaction
    ADD CONSTRAINT FK_FactInventoryTransaction_DimSupplier
    FOREIGN KEY (SupplierID) REFERENCES dbo.DimSupplier(SupplierID);

    ALTER TABLE dbo.FactInventoryTransaction
    ADD CONSTRAINT FK_FactInventoryTransaction_DimTransactionType
    FOREIGN KEY (TransactionTypeID) REFERENCES dbo.DimTransactionType(TransactionTypeID);

    ALTER TABLE dbo.FactInventoryTransaction
    ADD CONSTRAINT FK_FactInventoryTransaction_DimPackageType
    FOREIGN KEY (PackageTypeID) REFERENCES dbo.DimPackageType(PackageTypeID);

	ALTER TABLE dbo.FactInventoryTransaction
    ADD CONSTRAINT FK_FactInventoryTransaction_DimColor
    FOREIGN KEY (ColorID) REFERENCES dbo.DimColor(ColorID);

END;