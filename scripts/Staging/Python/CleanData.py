import pandas as pd

from Transform import transform_ap_TransactionTypes, transform_pc_Suppliers, transform_wh_ColdRoomTemperatures, transform_wh_Colors, transform_wh_PackageTypes, transform_wh_StockGroups, transform_wh_StockItemStockGroups, transform_wh_StockItemTransactions, transform_wh_StockItems, transform_wh_StockItemsHoldings, transform_wh_VehicleTemperatures, transform_wh_StockItems, transform_wh_StockItemsHoldings
from getDataFromStaging import get_staging_application_TransactionTypes, get_staging_purchasing_Suppliers, get_staging_warehouse_ColdRoomTemperatures, get_staging_warehouse_Colors, get_staging_warehouse_PackageTypes, get_staging_warehouse_StockGroups, get_staging_warehouse_StockItemStockGroups, get_staging_warehouse_StockItemTransactions, get_staging_warehouse_StockItems, get_staging_warehouse_VehicleTemperatures, get_staging_warehouse_StockItems, get_staging_warehouse_StockItemHoldings


def __main__():
    df_wh_ColdRoomTemperatures = get_staging_warehouse_ColdRoomTemperatures()
    transform_wh_ColdRoomTemperatures(df_wh_ColdRoomTemperatures)
    print(df_wh_ColdRoomTemperatures.isnull().sum())


    df_wh_Colors = get_staging_warehouse_Colors()
    transform_wh_Colors(df_wh_Colors)
    print(df_wh_Colors.isnull().sum())


    df_wh_PackageTypes = get_staging_warehouse_PackageTypes()
    transform_wh_PackageTypes(df_wh_PackageTypes)
    print(df_wh_PackageTypes.isnull().sum())


    df_wh_StockGroups = get_staging_warehouse_StockGroups()
    transform_wh_StockGroups(df_wh_StockGroups)
    print(df_wh_StockGroups.isnull().sum())


    df_wh_StockItemsHoldings = get_staging_warehouse_StockItemHoldings()
    transform_wh_StockItemsHoldings(df_wh_StockItemsHoldings)
    print(df_wh_StockItemsHoldings.isnull().sum())


    df_wh_StockItems = get_staging_warehouse_StockItems()
    transform_wh_StockItems(df_wh_StockItems)
    print("StockItems DataFrame:")
    print(df_wh_StockItems.isnull().sum())

    df_wh_StockItemStockGroups = get_staging_warehouse_StockItemStockGroups()
    transform_wh_StockItemStockGroups(df_wh_StockItemStockGroups)
    print(df_wh_StockItemStockGroups.isnull().sum())

    df_wh_StockItemTransactions = get_staging_warehouse_StockItemTransactions()
    transform_wh_StockItemTransactions(df_wh_StockItemTransactions)
    print("StockItemTransactions DataFrame:")
    print(df_wh_StockItemTransactions.isnull().sum())

    df_wh_VehicleTemperatures = get_staging_warehouse_VehicleTemperatures()
    transform_wh_VehicleTemperatures(df_wh_VehicleTemperatures)
    print("Vehicle Temperature DataFrame:")
    print(df_wh_VehicleTemperatures.isnull().sum())

    df_pc_Suppliers = get_staging_purchasing_Suppliers()
    transform_pc_Suppliers(df_pc_Suppliers)
    print("Suppliers DataFrame:")
    print(df_pc_Suppliers.isnull().sum())

    df_ap_TransactionTypes = get_staging_application_TransactionTypes()
    transform_ap_TransactionTypes(df_ap_TransactionTypes)
    print("TransactionTypes DataFrame:")
    print(df_ap_TransactionTypes.isnull().sum())

          
__main__()


