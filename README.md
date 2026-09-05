# sql-data-warehouse-projects
Building a modern data warehouse with Mysql/sql server,including ETL processes, data modeling and analytics.

## 🥉 Bronze Layer - Table Definition

The Bronze layer contains raw data ingested from CRM and ERP source systems.

The tables are designed to preserve the original source structure with minimal
transformation before the data moves into the Silver layer.

### CRM Tables

| Table | Description |
|---|---|
| `crm_cust_info` | Raw CRM customer information |
| `crm_prd_info` | Raw CRM product information |
| `crm_sales_details` | Raw CRM sales transaction data |

### ERP Tables

| Table | Description |
|---|---|
| `erp_cust_az12` | Raw ERP customer information |
| `erp_loc_a101` | Raw ERP location/country information |
| `erp_px_cat_g1v2` | Raw ERP product category information |

### Bronze Layer Design Principles

- Preserve raw source data
- Apply minimal transformation
- Maintain source-level attributes
- Support efficient data ingestion
- Prepare data for Silver-layer cleansing and transformation

### DDL Operations

The Bronze DDL script performs the following operations:

1. Drops existing Bronze tables.
2. Recreates the Bronze tables.
3. Defines appropriate MySQL data types.
4. Organizes tables by CRM and ERP source systems.
5. Verifies table creation using `SHOW TABLES`.
6. Verifies table structures using `DESC`.

> ⚠️ Running the DDL script will drop and recreate existing Bronze tables,
> resulting in permanent data loss from those tables.
