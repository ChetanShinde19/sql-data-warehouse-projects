
SHOW GLOBAL VARIABLES LIKE 'local_infile';


-- 1. customer info
desc bronze.crm_cust_info;
truncate table bronze.crm_cust_info;
LOAD DATA LOCAL INFILE 'D:/Projects/Mysql/sql-data-warehouse-project-main/datasets/source_crm/cust_info.csv'
INTO TABLE bronze.crm_cust_info
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;
select * from bronze.crm_cust_info;


-- 2. CRM Product Information
desc bronze.crm_prd_info;
select * from bronze.crm_prd_info;
truncate table bronze.crm_prd_info;
LOAD DATA LOCAL INFILE 'D:/Projects/Mysql/sql-data-warehouse-project-main/datasets/source_crm/prd_info.csv'
INTO TABLE bronze.crm_prd_info
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;
select * from bronze.crm_prd_info;


-- 3.CRM sales Details
desc bronze.crm_sales_details;
truncate table bronze.crm_sales_details;
LOAD DATA LOCAL INFILE 'D:/Projects/Mysql/sql-data-warehouse-project-main/datasets/source_crm/sales_details.csv'
INTO TABLE bronze.crm_sales_details
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;
select * from bronze.crm_sales_details;


-- 4. ERP Location
desc bronze.erp_cust_az12;
truncate table bronze.erp_cust_az12;
LOAD DATA LOCAL INFILE 'D:/Projects/Mysql/sql-data-warehouse-project-main/datasets/source_erp/CUST_AZ12.csv'
INTO TABLE bronze.erp_cust_az12
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;
select * from bronze.erp_cust_az12;


-- 5. ERP Customer
desc bronze.erp_loc_a101;

truncate table bronze.erp_loc_a101;
LOAD DATA LOCAL INFILE 'D:/Projects/Mysql/sql-data-warehouse-project-main/datasets/source_erp/LOC_A101.csv'
INTO TABLE bronze.erp_loc_a101
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;
select * from bronze.erp_loc_a101;

-- 6. ERP Product Category
desc bronze.erp_px_cat_g1v2;
truncate table bronze.erp_px_cat_g1v2;
LOAD DATA LOCAL INFILE 'D:/Projects/Mysql/sql-data-warehouse-project-main/datasets/source_erp/PX_CAT_G1V2.csv'
INTO TABLE bronze.erp_px_cat_g1v2
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;
select * from bronze.erp_px_cat_g1v2;


show tables;
table crm_cust_info;
table crm_prd_info;
table crm_sales_details;
table erp_cust_az12;
table erp_loc_a101;
table erp_px_cat_g1v2;
