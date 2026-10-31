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