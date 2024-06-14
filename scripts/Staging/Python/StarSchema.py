from pathlib import Path
import traceback
import pandas as pd
import traceback


def populate_dimension_table(df: pd.DataFrame, table_name, output_path):
    Path(output_path).mkdir(parents=True, exist_ok=True)
    df.to_csv(f'{output_path}/{table_name}.csv', index=False)

# Function to generate surrogate keys
def generate_surrogate_keys(df, column_name):
    df['{}_Key'.format(column_name)] = df[column_name].astype('category').cat.codes + 1
    return df

# Function to map foreign keys to surrogate keys
def map_foreign_keys(df, column_name, foreign_key_mapping):
    df['{}_Key'.format(column_name)] = df[column_name].map(foreign_key_mapping)
    return df

# Function to populate fact table
def populate_fact_table(df, output_path):
    Path(output_path).mkdir(parents=True, exist_ok=True)
    df.to_csv(f'{output_path}/FactInventoryTransaction.csv', index=False)

def clean_column(df, column_name):
    """Clean the column to remove any hidden characters and ensure it is an integer."""
    df[column_name] = df[column_name].astype(str).str.strip()
    df[column_name] = df[column_name].str.replace(r'\D', '', regex=True)  # Remove non-digit characters
    df[column_name] = pd.to_numeric(df[column_name], errors='coerce').fillna(0).astype(int)
    return df


def __main__():
    try:
        read_path = r'D:\\OneDrive - PERSEUS MANAGEMENT GROUP INC\\Desktop\\personal\\University\\Institute of Business Administration\\1st Semester\\Data Analytics and Warehousing\\Assignments\\Project\\Scripts\\Clean Tables'
        output_dim_path = r'D:\OneDrive - PERSEUS MANAGEMENT GROUP INC\Desktop\personal\University\Institute of Business Administration\1st Semester\Data Analytics and Warehousing\Assignments\Project\Scripts\Star Schema Tables\dim'
        output_fact_path = r'D:\OneDrive - PERSEUS MANAGEMENT GROUP INC\Desktop\personal\University\Institute of Business Administration\1st Semester\Data Analytics and Warehousing\Assignments\Project\Scripts\Star Schema Tables\fact'
        
        df_ColdRoomTemperatures = pd.read_csv(f'{read_path}\\ColdRoomTemperatures.csv')
        df_Colors = pd.read_csv(f'{read_path}\\Colors.csv')
        df_PackageTypes = pd.read_csv(f"{read_path}\\PackageTypes.csv")
        df_StockGroups = pd.read_csv(f"{read_path}\\StockGroups.csv")
        df_StockItems = pd.read_csv(f"{read_path}\\StockItems.csv")
        df_StockItemsHoldings = pd.read_csv(f"{read_path}\\StockItemsHoldings.csv")
        df_StockItemStockGroups = pd.read_csv(f"{read_path}\\StockItemStockGroups.csv")
        df_StockItemTransactions = pd.read_csv(f"{read_path}\\StockItemTransactions.csv")
        df_VehicleTemperatures = pd.read_csv(f"{read_path}\\VehicleTemperatures.csv")
        df_Suppliers = pd.read_csv(f"{read_path}\\Suppliers.csv")
        df_TransactionTypes = pd.read_csv(f"{read_path}\\TransactionTypes.csv")

        # Populate DimDate table
        dim_date = df_StockItemTransactions[['Date', 'Year', 'Quarter', 'Month', 'Day']].copy()
        dim_date['DateKey'] = pd.to_datetime(dim_date['Date']).dt.strftime('%Y%m%d').astype(int)
        df_StockItemTransactions['DateKey'] = pd.to_datetime(df_StockItemTransactions['Date']).dt.strftime('%Y%m%d').astype(int)
        # Remove duplicates from dim_date
        dim_date = dim_date.drop_duplicates(subset=['DateKey'])
        populate_dimension_table(dim_date, 'DimDate', output_dim_path)

        # Populate DimProduct table
        columns_to_keep = ['StockItemID', 'StockItemName','SupplierID','ColorID','UnitPackageID','OuterPackageID', 'Brand', 'Size', 'LeadTimeDays','IsChillerStock','Barcode','TaxRate','UnitPrice','RecommendedRetailPrice','TypicalWeightPerUnit']
        DimProduct = df_StockItems[columns_to_keep]  
        DimProduct.rename(columns={
                    'StockItemID': 'ProductID',
                    'StockItemName': 'ProductName',
                    'RecommendedRetailPrice':'RetailPrice',
                    'TypicalWeightPerUnit': 'WeightPerUnit'
        }, inplace=True)
        
        print(DimProduct.dtypes)
        DimProduct['ColorID'] = DimProduct['ColorID'].astype(int)
        print(DimProduct.dtypes)

        #DimProduct['SupplierID'] = DimProduct['SupplierID'].astype(int)
        #DimProduct = clean_column(DimProduct, 'SupplierID')

        populate_dimension_table(DimProduct, 'DimProduct', output_dim_path)

        # Populate DimSupplier table
        columns_to_keep = ['SupplierID', 'SupplierName', 'SupplierReference', 'PhoneNumber', 'WebsiteURL', 'DeliveryAddress','DeliveryPostalCode']
        DimSupplier = df_Suppliers[columns_to_keep]  
        DimSupplier.rename(columns={
                    'WebsiteURL': 'Website',
                    'DeliveryPostalCode': 'PostalCode'
        }, inplace=True)
        populate_dimension_table(DimSupplier, 'DimSupplier', output_dim_path)

        # Populate DimColor table
        columns_to_keep = ['ColorID', 'ColorName']
        DimColor = df_Colors[columns_to_keep]
        populate_dimension_table(DimColor, 'DimColor', output_dim_path)

        # Populate DimPackageType
        columns_to_keep = ['PackageTypeID', 'PackageTypeName']
        DimPackageType = df_PackageTypes[columns_to_keep]
        populate_dimension_table(DimPackageType, 'DimPackageTypes', output_dim_path)


        # Populate DimTransactionType table
        columns_to_keep = ['TransactionTypeID', 'TransactionTypeName']
        DimTransactionTypes = df_TransactionTypes[columns_to_keep]        
        populate_dimension_table(DimTransactionTypes, 'DimTransactionTypes', output_dim_path)

        # Merge fact table
        fact_table = df_StockItemTransactions.merge(df_StockItems, how='left', on='StockItemID', suffixes=(None, '_y'))
        fact_table = fact_table.merge(df_TransactionTypes, how='left', left_on='TransactionTypeID', right_on='TransactionTypeID', suffixes=(None, '_y'))
        fact_table = fact_table.merge(df_PackageTypes, how='left', left_on='UnitPackageID', right_on='PackageTypeID')
        fact_table = fact_table.merge(df_Suppliers, how='left', left_on='SupplierID', right_on='SupplierID', suffixes=(None, '_y'))
        fact_table = fact_table.merge(df_Colors, how='left', left_on='ColorID', right_on='ColorID', suffixes=(None, '_y'))
        
        fact_table['ColorID'] = fact_table['ColorID'].astype(int)

        # Drop unwanted columns
        columns_to_keep = ['StockItemTransactionID', 'DateKey', 'TransactionTypeID', 'SupplierID', 'Quantity', 'StockItemID','PackageTypeID','ColorID']
        fact_table = fact_table[columns_to_keep]

        # Rename columns for fact table
        fact_table.rename(columns={
            'StockItemTransactionID': 'InventoryTransactionID',
            'StockItemID': 'ProductID',
            'TransactionTypeID': 'TransactionTypeID',
            'SupplierID': 'SupplierID'
        }, inplace=True)
        fact_table['SupplierID'] = fact_table['SupplierID'].astype(int)

        # Populate fact table
        populate_fact_table(fact_table, output_fact_path)

    except Exception as exp:
        traceback.print_exc()

__main__()
