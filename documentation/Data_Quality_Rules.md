# Data Quality Rules

## 1. Overview

This document describes the validation rules implemented in the Bank Marketing ETL pipeline.

The purpose of these rules is to identify records that do not meet the project's predefined data quality criteria before loading them into the staging table.

## 2. Validation Rules

The Conditional Split component evaluates the following conditions:

| Field | Rule | Description |
|---|---|---|
| age | age >= 18 | Age must be at least 18. |
| balance | balance >= 0 | Balance must be non-negative under this project's validation criteria. |
| day | day >= 1 AND day <= 31 | Day must be within the valid calendar-day range. |
| duration | duration >= 0 | Call duration cannot be negative. |

A record must satisfy all four conditions to be classified as valid.

**Important:** These are project-specific validation criteria for this exercise. A negative bank balance is possible in real banking environments and should not automatically be considered invalid in a production system.

## 3. Record Classification

The Conditional Split component generates two outputs:

### Valid_Records

Contains records that satisfy every validation condition.

These records are loaded into:

`dbo.Stg_BankMarketing`

### Invalid_Records

Contains records that fail at least one validation condition.

These records are loaded into:

`dbo.Rej_BankMarketing`

Rejected records are retained for inspection instead of being discarded.

## 4. Data Type Validation

The Data Conversion component converts the following fields from string to integer:

- age
- balance
- day
- duration
- campaign
- pdays
- previous

This allows SQL Server to store these values using appropriate numeric data types.

## 5. Execution Results

The validation process produced the following results:

| Classification | Records |
|---|---:|
| Valid records | 41,445 |
| Rejected records | 3,766 |
| Total records | 45,211 |

## 6. Reconciliation

The pipeline results are reconciled against the original source dataset.

The following condition must always hold:

`Valid Records + Rejected Records = Source Records`

For this execution:

`41,445 + 3,766 = 45,211`

This reconciliation confirms that all source records were accounted for in the two output tables.

## 7. Limitations

- The current validation rules are intentionally simple and designed for this learning project.
- The pipeline does not yet implement advanced duplicate detection.
- Rejected records are stored for review, but no automated remediation process is implemented.
- Additional validations could be introduced for missing values, categorical consistency, and business-specific constraints.