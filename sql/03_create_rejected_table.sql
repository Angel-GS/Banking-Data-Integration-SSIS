USE BankingDataIntegration;
GO

CREATE TABLE dbo.Rej_BankMarketing
(
    age INT,
    job VARCHAR(100),
    marital VARCHAR(50),
    education VARCHAR(50),
    default_credit VARCHAR(10),
    balance INT,
    housing VARCHAR(10),
    loan VARCHAR(10),
    contact VARCHAR(50),
    day INT,
    month VARCHAR(20),
    duration INT,
    campaign INT,
    pdays INT,
    previous INT,
    poutcome VARCHAR(50),
    subscribed VARCHAR(10)
);
GO

SELECT COUNT(*) AS Total_Valid_Records
FROM dbo.Rej_BankMarketing;


SELECT
    (SELECT COUNT(*) FROM dbo.Stg_BankMarketing)
    +
    (SELECT COUNT(*) FROM dbo.Rej_BankMarketing)
    AS Total_Processed_Records;


    --Conteo de registros 
    SELECT
    'Valid Records' AS Record_Type,
    COUNT(*) AS Total_Records
FROM dbo.Stg_BankMarketing

UNION ALL

SELECT
    'Rejected Records',
    COUNT(*)
FROM dbo.Rej_BankMarketing;