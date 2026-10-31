# ETL Process Documentation

## 1. Project Overview

This project implements an ETL (Extract, Transform, Load) pipeline using SQL Server Integration Services (SSIS) to process the UCI Bank Marketing dataset.

The objective is to extract data from a CSV file, convert data types, apply data quality validations, separate valid and rejected records, and load the results into SQL Server staging tables.

## 2. Source Data

- **Dataset:** Bank Marketing
- **Source:** UCI Machine Learning Repository
- **File:** `bank-full.csv`
- **Format:** CSV
- **Field delimiter:** Semicolon (`;`)
- **Original records:** 45,211
- **Columns:** 17

## 3. ETL Architecture

The pipeline consists of the following stages:

1. **Preparation:** An Execute SQL Task truncates the staging and rejected-record tables before each execution.
2. **Extraction:** A Flat File Source reads the original CSV file.
3. **Data Conversion:** Numeric fields are converted from string to integer data types.
4. **Data Validation:** A Conditional Split applies predefined data quality rules.
5. **Data Loading:** Valid and rejected records are directed to separate SQL Server tables.

## 4. Extraction

The `SRC_BankMarketing_CSV` component reads the source file through the `CM_BankMarketing_CSV` Flat File Connection Manager.

The source configuration uses a semicolon as the column delimiter and recognizes the first row as column headers.

## 5. Transformation

The `TRF_DataConversion` component converts the following fields into integer data types:

- age
- balance
- day
- duration
- campaign
- pdays
- previous

The remaining fields retain their original text values.

## 6. Data Validation

The `TRF_ConditionalSplit` component evaluates records using predefined conditions.

Records that satisfy all validation conditions are sent to the valid-record output. Records that do not satisfy the conditions are sent to the rejected-record output.

## 7. Data Loading

The pipeline loads records into two SQL Server tables:

- `dbo.Stg_BankMarketing`: stores records that pass validation.
- `dbo.Rej_BankMarketing`: stores records that fail validation.

The OLE DB Destination components use fast-load mode for data insertion.

## 8. Execution Results

The pipeline successfully processed all 45,211 records from the source dataset.

| Result | Records |
|---|---:|
| Valid records | 41,445 |
| Rejected records | 3,766 |
| Total processed | 45,211 |

The total number of valid and rejected records matches the original source record count.

## 9. Technologies Used

- SQL Server
- SQL Server Integration Services (SSIS)
- Visual Studio
- SQL Server Management Studio (SSMS)
- CSV
- Git and GitHub