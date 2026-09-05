/*
===============================================================================
DDL Script: Create Bronze Layer Tables - MySQL
===============================================================================

Script Purpose:
    This script creates the tables required for the Bronze layer
    of the MySQL Data Warehouse project.

    The Bronze layer stores raw data loaded from CRM and ERP source systems
    with minimal transformation.

Database:
    bronze

Source Systems:
    1. CRM (Customer, Product, Sales)
    2. ERP (Customer, Location, Product Category)

WARNING:
    Existing Bronze tables will be dropped and recreated when this script
    is executed. Any existing data in these tables will be permanently lost.

===============================================================================
*/


/*
===============================================================================
1. CRM - Customer Information
===============================================================================

Purpose:
    Stores raw customer information received from the CRM source system.
===============================================================================
*/

DROP TABLE IF EXISTS bronze.crm_cust_info;

CREATE TABLE bronze.crm_cust_info (
    cst_id INT,
    cst_key VARCHAR(50),
    cst_firstname VARCHAR(50),
    cst_lastname VARCHAR(50),
    cst_marital_status VARCHAR(50),
    cst_gndr VARCHAR(50),
    cst_create_date DATE
);


/*
===============================================================================
2. CRM - Product Information
===============================================================================

Purpose:
    Stores raw product information received from the CRM source system.
===============================================================================
*/

DROP TABLE IF EXISTS bronze.crm_prd_info;

CREATE TABLE bronze.crm_prd_info (
    prd_id INT,
    prd_key VARCHAR(50),
    prd_nm VARCHAR(50),
    prd_cost INT,
    prd_line VARCHAR(50),
    prd_start_dt DATETIME,
    prd_end_dt DATETIME
);


/*
===============================================================================
3. CRM - Sales Details
===============================================================================

Purpose:
    Stores raw sales transaction information received from the CRM system.

Note:
    Date columns are initially stored as INT because the Bronze layer
    preserves source data in its raw format.
===============================================================================
*/

DROP TABLE IF EXISTS bronze.crm_sales_details;

CREATE TABLE bronze.crm_sales_details (
    sls_ord_num VARCHAR(50),
    sls_prd_key VARCHAR(50),
    sls_cust_id INT,
    sls_order_dt INT,
    sls_ship_dt INT,
    sls_due_dt INT,
    sls_sales INT,
    sls_quantity INT,
    sls_price INT
);


/*
===============================================================================
4. ERP - Customer Information
===============================================================================

Purpose:
    Stores raw customer information received from the ERP source system.
===============================================================================
*/

DROP TABLE IF EXISTS bronze.erp_cust_az12;

CREATE TABLE bronze.erp_cust_az12 (
    cid VARCHAR(50),
    bdate DATE,
    gen VARCHAR(50)
);


/*
===============================================================================
5. ERP - Location Information
===============================================================================

Purpose:
    Stores raw country/location information received from the ERP system.
===============================================================================
*/

DROP TABLE IF EXISTS bronze.erp_loc_a101;

CREATE TABLE bronze.erp_loc_a101 (
    cid VARCHAR(50),       -- Customer/Country identifier
    cntry VARCHAR(50)      -- Country name
);


/*
===============================================================================
6. ERP - Product Category Information
===============================================================================

Purpose:
    Stores raw product category and maintenance information
    received from the ERP source system.
===============================================================================
*/

DROP TABLE IF EXISTS bronze.erp_px_cat_g1v2;

CREATE TABLE bronze.erp_px_cat_g1v2 (
    id VARCHAR(50),
    cat VARCHAR(50),             -- Category name
    subcat VARCHAR(50),          -- Subcategory name
    maintenance VARCHAR(50)      -- Maintenance information
);


/*
===============================================================================
7. Verification
===============================================================================
*/

-- Display all Bronze layer tables
SHOW TABLES FROM bronze;


/*
===============================================================================
8. Verify Table Structures
===============================================================================
*/

-- CRM Customer
DESC bronze.crm_cust_info;

-- CRM Product
DESC bronze.crm_prd_info;

-- CRM Sales
DESC bronze.crm_sales_details;

-- ERP Customer
DESC bronze.erp_cust_az12;

-- ERP Location
DESC bronze.erp_loc_a101;

-- ERP Product Category
DESC bronze.erp_px_cat_g1v2;
