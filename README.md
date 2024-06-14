**Data Warehouse and ETL Pipeline Project**
**Overview**
This repository contains a comprehensive semester project focused on creating a data warehouse and an ETL pipeline, culminating in a Power BI dashboard. The project utilizes multiple software tools and technologies, including SQL Server Management Studio, Visual Studio (SSIS), Visual Studio Code (Python), and Power BI Desktop & Web. The aim is to transform raw data into a structured star schema, ensuring data integrity and providing meaningful business insights through visualization.

**Tools Used**
SQL Server Management Studio: For managing and querying SQL databases.
Visual Studio (SSIS): For building and managing the ETL pipeline.
Visual Studio Code (Python): For scripting data cleaning and transformation.
Power BI Desktop & Web: For creating and sharing interactive dashboards.

**Project Steps**
**Data Warehouse Design:**

Filled a data warehouse Excel template to outline the conversion of the database into a star schema.

**Data Import:**
Imported the dataset into SQL Server Management Studio (WideWorldImporters database).

**Staging Database:**
Created a separate duplicate database (Staging) to fetch the same data from the imported database, ensuring the main database remains unaffected and the data remains raw.

**SQL Scripts for Data Fetching:**
Developed SQL scripts to fetch identical tables from the main WideWorldImporters database and created stored procedures for these processes to integrate them efficiently into the pipeline.

**Data Cleaning Scripts:**
Created SQL scripts and stored procedures to clean the tables in the staging database to prevent data duplication during pipeline re-runs.

**Data Loading:**
Wrote SQL scripts and stored procedures to load data from the main database into the staging tables.

**Data Handling with Python:**
Connected the database with Python to handle missing and null values in selected tables, preparing them for conversion into a star schema.
Integrated the data cleaning and transformation steps into the pipeline using Python scripts.

**Star Schema Conversion:**
Converted the cleaned data into a star schema and exported these tables to Excel.

**Star Schema Database:**
Created a new star schema database and cleaned it to avoid data duplication during pipeline re-runs.
Bulk inserted the star schema Excel tables into the database.

**Enhanced Star Schema Database:**
Created an additional star schema database with two extra columns (createdAt and updatedAt) to track data updates accurately during pipeline re-runs.

**Snapshot View for Power BI:**
Created a snapshot view to export data to Power BI for dashboard creation.

**Power BI Dashboard:**
Developed a dashboard in Power BI based on the star schema to provide insights.

**Power BI Web Integration:**
Integrated the Power BI dashboard with Power BI web to share with others.



**Automated ETL Pipeline**
**Clean Staging Tables:**
Ensures the staging tables are cleared before loading new data to avoid duplication.

**Load Staging Tables:**
Loads data into the staging tables from the main database.

**Data Cleaning:**
Performs data cleaning operations to handle missing and null values.

**Transform into Star Schema:**
Transforms the cleaned data into a star schema format.

**Clean Star Schema Tables:**
Cleans the star schema tables to ensure no duplication during data load.

**Load Star Schema Tables:**
Loads the transformed star schema data into the star schema tables.

**Merge or Update Data Warehouse:**
Merges or updates the data warehouse with the new star schema data, including handling createdAt and updatedAt columns for tracking.

**Snapshot:**
Creates a snapshot view for exporting data to Power BI.

Power BI Dashboard

**Conclusion**
This is my first comprehensive semester project related to data warehousing, ETL pipelines, and dashboarding in Power BI. I have chosen to focus on the warehouse department for this project, as sales and e-commerce analysis was restricted by my professor. I am open to suggestions on how to further improve this project.
