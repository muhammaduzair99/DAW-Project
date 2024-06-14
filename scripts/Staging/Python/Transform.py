import pandas as pd
import numpy as np

output_path = r'D:\OneDrive - PERSEUS MANAGEMENT GROUP INC\Desktop\personal\University\Institute of Business Administration\1st Semester\Data Analytics and Warehousing\Assignments\Project\Scripts\Clean Tables'

def to_csv(df: pd.DataFrame, filename):
    df.to_csv(f'{filename}',index = False)

def transform_wh_ColdRoomTemperatures(df: pd.DataFrame):
    to_csv(df,f'{output_path}\ColdRoomTemperatures.csv')

def transform_wh_Colors(df: pd.DataFrame):
    to_csv(df,f'{output_path}\Colors.csv')

def transform_wh_PackageTypes(df: pd.DataFrame):
    to_csv(df,f'{output_path}\PackageTypes.csv')
    
def transform_wh_StockGroups(df: pd.DataFrame):
    to_csv(df,f'{output_path}\StockGroups.csv')

def transform_wh_StockItemsHoldings(df: pd.DataFrame):
    to_csv(df,f'{output_path}\StockItemsHoldings.csv')

def transform_wh_StockItems(df: pd.DataFrame):
    df['ColorID'].replace(np.nan, 0, inplace=True)
    df['Brand'].replace(np.nan, 'No Brand', inplace=True)
    df['Size'].replace(np.nan, 'No Size', inplace=True)
    df['Barcode'].replace(np.nan, 'No Barcode', inplace=True)
    df['MarketingComments'].replace(np.nan, 'No Comments', inplace=True)
    df['InternalComments'].replace(np.nan, 'No Comments', inplace=True)
    df['Photo'].replace(np.nan, 'No Photo', inplace=True)
    
    to_csv(df,f'{output_path}\StockItems.csv')

  
def transform_wh_StockItemStockGroups(df: pd.DataFrame):
    to_csv(df,f'{output_path}\StockItemStockGroups.csv')

def transform_wh_StockItemTransactions(df: pd.DataFrame):
    df['CustomerID'].replace(np.nan, 0 , inplace=True)
    df['SupplierID'].replace(np.nan, 0 , inplace=True)
    df['InvoiceID'].replace(np.nan, 0 , inplace=True)
    df['PurchaseOrderID'].replace(np.nan, 0 , inplace=True)
       
    # Convert TransactionOccurredWhen to datetime format
    df['TransactionOccurredWhen'] = pd.to_datetime(df['TransactionOccurredWhen'])
    
    # Transform TransactionOccurredWhen column
    # df['DateKey'] = df['TransactionOccurredWhen'].dt.strftime('%Y%m%d').astype(int)
    df['Date'] = df['TransactionOccurredWhen'].dt.date
    df['Year'] = df['TransactionOccurredWhen'].dt.year
    df['Quarter'] = df['TransactionOccurredWhen'].dt.quarter
    df['Month'] = df['TransactionOccurredWhen'].dt.month
    df['Day'] = df['TransactionOccurredWhen'].dt.day
        # Rearrange columns
    original_columns = list(df.columns)
    new_columns = ['Date', 'Year', 'Quarter', 'Month', 'Day']
    
    # Remove new columns from the original list if they are already there
    for col in new_columns:
        if col in original_columns:
            original_columns.remove(col)
    
    # Find the position of TransactionOccurredWhen
    insert_index = original_columns.index('TransactionOccurredWhen') + 1
    
    # Insert the new columns right after TransactionOccurredWhen
    new_columns_order = original_columns[:insert_index] + new_columns + original_columns[insert_index:]
    
    df = df[new_columns_order]

    to_csv(df,f'{output_path}\StockItemTransactions.csv')

def transform_wh_VehicleTemperatures(df: pd.DataFrame):
    df['CompressedSensorData'].replace(np.nan, 'None', inplace=True)
    to_csv(df,f'{output_path}\VehicleTemperatures.csv')

def transform_pc_Suppliers(df: pd.DataFrame):
    df['DeliveryMethodID'].replace(np.nan, 7 , inplace=True)
    df['InternalComments'].replace(np.nan, 'No Comments', inplace=True)

    df['DeliveryAddress'] = df['DeliveryAddressLine1'].fillna('') + ' ' + df['DeliveryAddressLine2'].fillna('')
    
    # Rearrange columns
    original_columns = list(df.columns)
    new_columns = ['DeliveryAddress']
    
    # Remove new columns from the original list if they are already there
    for col in new_columns:
        if col in original_columns:
            original_columns.remove(col)
    
    # Find the position of DeliveryAddressLine2
    insert_index = original_columns.index('DeliveryAddressLine2') + 1
    
    # Insert the new columns right after DeliveryAddressLine2
    new_columns_order = original_columns[:insert_index] + new_columns + original_columns[insert_index:]
    
    # Remove DeliveryAddressLine1 and DeliveryAddressLine2 from the new columns order
    new_columns_order = [col for col in new_columns_order if col not in ['DeliveryAddressLine1', 'DeliveryAddressLine2']]
    
    df = df[new_columns_order]

    to_csv(df,f'{output_path}\Suppliers.csv')

def transform_ap_TransactionTypes(df: pd.DataFrame):
    to_csv(df,f'{output_path}\TransactionTypes.csv')
