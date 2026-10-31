# Banking Data Integration | SSIS ETL Pipeline

## Project Overview

This project implements an ETL (Extract, Transform, Load) pipeline using SQL Server Integration Services (SSIS) to process the UCI Bank Marketing dataset.

The pipeline extracts data from a CSV file, performs data type conversions, applies data quality validation rules, separates valid and rejected records, and loads the results into SQL Server staging tables.

The main goal is to demonstrate practical skills in data integration, ETL development, SQL Server, and data quality management.

## Technologies

- SQL Server
- SQL Server Integration Services (SSIS)
- Visual Studio
- SQL Server Management Studio (SSMS)
- SQL
- CSV
- Git and GitHub

## Project Architecture

```text
Bank Marketing CSV (45,211 records)
              |
              v
       Flat File Source
              |
              v
        Data Conversion
              |
              v
        Conditional Split
          /          \
         /            \
        v              v
  Valid Records    Invalid Records
        |              |
        v              v
 Stg_BankMarketing  Rej_BankMarketing
        |              |
        +-------+------+
                |
                v
       SQL Server Database
```

## ETL Workflow

1. **Preparation:** Truncate staging and rejected-record tables before execution.
2. **Extraction:** Read the original CSV file using an SSIS Flat File Source.
3. **Transformation:** Convert numeric columns from string to integer.
4. **Validation:** Apply data quality rules using Conditional Split.
5. **Loading:** Insert valid and rejected records into separate SQL Server tables.

## Data Quality Rules

The pipeline applies the following validation criteria:

| Field | Validation |
|---|---|
| age | Must be greater than or equal to 18 |
| balance | Must be greater than or equal to 0 |
| day | Must be between 1 and 31 |
| duration | Must be greater than or equal to 0 |

These are project-specific validation criteria and do not represent universal banking rules.

## Execution Results

The pipeline successfully processed all 45,211 records from the original dataset.

| Metric | Records |
|---|---:|
| Source records | 45,211 |
| Valid records | 41,445 |
| Rejected records | 3,766 |
| Total processed | 45,211 |

All source records were accounted for in the valid and rejected output tables.

## Repository Structure

```text
Banking-Data-Integration-SSIS/
│
├── data/
│   ├── raw/
│   └── processed/
│
├── documentation/
│   ├── screenshots/
│   ├── ETL_Process.md
│   └── Data_Quality_Rules.md
│
├── sql/
├── ssis/
├── README.md
└── .gitignore
```

## Documentation

Additional technical documentation is available in the `documentation/` directory:

- [ETL Process](documentation/ETL_Process.md)
- [Data Quality Rules](documentation/Data_Quality_Rules.md)
- [Execution Screenshots](documentation/screenshots/)

## Dataset

Source: [UCI Machine Learning Repository - Bank Marketing](https://archive.ics.uci.edu/dataset/222/bank+marketing)

The dataset contains information related to direct marketing campaigns conducted by a Portuguese banking institution.

## Project Status

**Current status:** Initial ETL pipeline implemented and validated.

Future improvements may include:

- Additional data quality checks.
- Duplicate record detection.
- More advanced SQL transformations.
- Automated execution and logging.
- Incremental data loading.