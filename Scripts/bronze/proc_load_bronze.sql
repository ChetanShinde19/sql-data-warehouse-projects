/*
===============================================================================
Project: Data Warehouse - Bronze Layer
Database: bronze
Purpose: Load raw CSV source data into Bronze layer tables
===============================================================================

Description:
    This script performs the initial data loading process for the Bronze layer.

Main Operations:
    1. Check whether LOCAL INFILE is enabled.
    2. Truncate existing Bronze table data.
    3. Load raw CSV files using LOAD DATA LOCAL INFILE.
    4. Verify loaded data using SELECT statements.
    5. Display available Bronze tables.

Source Systems:
    - CRM
    - ERP

CRM Source Files:
    - cust_info.csv
    - prd_info.csv
    - sales_details.csv

ERP Source Files:
    - CUST_AZ12.csv
    - LOC_A101.csv
    - PX_CAT_G1V2.csv

Bronze Tables:
    - crm_cust_info
    - crm_prd_info
    - crm_sales_details
    - erp_cust_az12
    - erp_loc_a101
    - erp_px_cat_g1v2

Loading Method:
    LOAD DATA LOCAL INFILE

CSV Configuration:
    - Fields terminated by comma (,)
    - Fields enclosed by double quotes (")
    - Windows line endings (\r\n)
    - Header row ignored

Note:
    Bronze layer stores raw/source data with minimal transformation.
===============================================================================
*/


/*
===============================================================================
1. Check LOCAL INFILE Configuration
===============================================================================
*/

SHOW GLOBAL VARIABLES LIKE 'local_infile';


/*
===============================================================================
2. CRM - Customer Information
===============================================================================
*/

-- Display table structure
DESC bronze.crm_cust_info;

-- Remove existing data before reload
TRUNCATE TABLE bronze.crm_cust_info;

-- Load customer data from CSV file
LOAD DATA LOCAL INFILE
'D:/Projects/Mysql/sql-data-warehouse-project-main/datasets/source_crm/cust_info.csv'
INTO TABLE bronze.crm_cust_info
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

-- Verify loaded customer data
SELECT *
FROM bronze.crm_cust_info;


/*
===============================================================================
3. CRM - Product Information
===============================================================================
*/

-- Display table structure
DESC bronze.crm_prd_info;

-- Remove existing data before reload
TRUNCATE TABLE bronze.crm_prd_info;

-- Load product data from CSV file
LOAD DATA LOCAL INFILE
'D:/Projects/Mysql/sql-data-warehouse-project-main/datasets/source_crm/prd_info.csv'
INTO TABLE bronze.crm_prd_info
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

-- Verify loaded product data
SELECT *
FROM bronze.crm_prd_info;


/*
===============================================================================
4. CRM - Sales Details
===============================================================================
*/

-- Display table structure
DESC bronze.crm_sales_details;

-- Remove existing data before reload
TRUNCATE TABLE bronze.crm_sales_details;

-- Load sales transaction data from CSV file
LOAD DATA LOCAL INFILE
'D:/Projects/Mysql/sql-data-warehouse-project-main/datasets/source_crm/sales_details.csv'
INTO TABLE bronze.crm_sales_details
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

-- Verify loaded sales data
SELECT *
FROM bronze.crm_sales_details;


/*
===============================================================================
5. ERP - Customer Information
===============================================================================
*/

-- Display table structure
DESC bronze.erp_cust_az12;

-- Remove existing data before reload
TRUNCATE TABLE bronze.erp_cust_az12;

-- Load ERP customer data from CSV file
LOAD DATA LOCAL INFILE
'D:/Projects/Mysql/sql-data-warehouse-project-main/datasets/source_erp/CUST_AZ12.csv'
INTO TABLE bronze.erp_cust_az12
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

-- Verify loaded ERP customer data
SELECT *
FROM bronze.erp_cust_az12;


/*
===============================================================================
6. ERP - Location Information
===============================================================================
*/

-- Display table structure
DESC bronze.erp_loc_a101;

-- Remove existing data before reload
TRUNCATE TABLE bronze.erp_loc_a101;

-- Load ERP location data from CSV file
LOAD DATA LOCAL INFILE
'D:/Projects/Mysql/sql-data-warehouse-project-main/datasets/source_erp/LOC_A101.csv'
INTO TABLE bronze.erp_loc_a101
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

-- Verify loaded ERP location data
SELECT *
FROM bronze.erp_loc_a101;


/*
===============================================================================
7. ERP - Product Category Information
===============================================================================
*/

-- Display table structure
DESC bronze.erp_px_cat_g1v2;

-- Remove existing data before reload
TRUNCATE TABLE bronze.erp_px_cat_g1v2;

-- Load ERP product category data from CSV file
LOAD DATA LOCAL INFILE
'D:/Projects/Mysql/sql-data-warehouse-project-main/datasets/source_erp/PX_CAT_G1V2.csv'
INTO TABLE bronze.erp_px_cat_g1v2
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

-- Verify loaded product category data
SELECT *
FROM bronze.erp_px_cat_g1v2;


/*
===============================================================================
8. Verify Bronze Layer Tables
===============================================================================
*/

-- Display all tables in the Bronze database
SHOW TABLES;


/*
===============================================================================
9. Record Verification
===============================================================================
*/

-- Customer records
SELECT COUNT(*) AS total_records
FROM bronze.crm_cust_info;

-- Product records
SELECT COUNT(*) AS total_records
FROM bronze.crm_prd_info;

-- Sales records
SELECT COUNT(*) AS total_records
FROM bronze.crm_sales_details;

-- ERP Customer records
SELECT COUNT(*) AS total_records
FROM bronze.erp_cust_az12;

-- ERP Location records
SELECT COUNT(*) AS total_records
FROM bronze.erp_loc_a101;

-- ERP Product Category records
SELECT COUNT(*) AS total_records
FROM bronze.erp_px_cat_g1v2;
