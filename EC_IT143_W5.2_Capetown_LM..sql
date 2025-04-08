/*****************************************************************************************************************
NAME: Lillian Moyo 
PURPOSE: Finding Answers to SQL Questions

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     04/5/2025   LMOYO       1. Built this script for Capetown Community


RUNTIME: 
Xm Xs

NOTES: 
How do I translate My Communities data set questions into SQL statements?
 
******************************************************************************************************************/

-- Q1:Question by: Lillian Moyo
-- Monthly active customers
-- How many unique customers made purchases each month?
-- Ans - Different numbers 
SELECT 
    FORMAT(CAST(SalesDate AS DATE), 'yyyy-MM') AS SaleMonth,
    COUNT(DISTINCT CustomerID) AS UniqueCustomers
FROM sales
GROUP BY FORMAT(CAST(SalesDate AS DATE), 'yyyy-MM')
ORDER BY SaleMonth;


-- Q2 : By Donsel Hove
-- What is the average discount given per transaction?
-- Average discount per transaction
-- Ans - 0.03
SELECT 
    AVG(CAST(Discount AS FLOAT)) AS AvgDiscount
FROM sales;

  
--Q3 : Question by: Lillian Moyo
-- Number of sales by each salesperson
--How many sales transactions were processed by each salesperson?
SELECT 
    SalespersonID,
    COUNT(*) AS TotalTransactions
FROM sales
GROUP BY SalespersonID
ORDER BY TotalTransactions DESC;


--Q4 : -- Question by: Lillian Moyo
-- Average discount given per product
-- 
SELECT 
    ProductID,
    AVG(CAST(Discount AS FLOAT)) AS AverageDiscount
FROM sales
GROUP BY ProductID
ORDER BY AverageDiscount DESC;
