/*****************************************************************************************************************
NAME: Create Answers 
PURPOSE: Finding Answers to SQL Questions

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     04/5/2025   LMOYO       1. Built this script for Johannesburg Community


RUNTIME: 
Xm Xs

NOTES: 
How do I translate My Communities data set questions into SQL statements?
 
******************************************************************************************************************/

-- Q1: How many customers make repeat purchases within six months of their initial transaction?
-- Author name - Lillian Moyo
-- A1: We will use a SELECT QUERY Statement - 49839

WITH InitialTransactions AS (
    SELECT 
        customerid, 
        MIN(salesdate) AS first_purchase_date
    FROM Sales
    GROUP BY customerid
),
RepeatPurchases AS (
    SELECT 
        s.customerid,
        COUNT(s.salesid) AS repeat_purchase_count
    FROM Sales s
    JOIN InitialTransactions i ON s.customerid = i.customerid
    WHERE s.salesdate > i.first_purchase_date
    AND s.salesdate <= DATEADD(MONTH, 6, i.first_purchase_date) -- within 6 months
    GROUP BY s.customerid
)
SELECT COUNT(DISTINCT customerid) AS repeat_customers_count
FROM RepeatPurchases
WHERE repeat_purchase_count > 0;

--Q2 What are the spending patterns in the community of Johannesburg?
--Author name : Lillian Moyo
--Ans - 0
   
  -- Spending Patterns by Month
SELECT COUNT(*) AS total_sales_last_year
FROM Sales s
WHERE s.salesdate >= DATEADD(YEAR, -1, GETDATE());

--Q3 Which product had the highest total sales in the last 6 months?
-- Author name : Hezron Eyiki
--Ans - 0

SELECT 
    ProductID,
    SUM(CAST(TotalPrice AS FLOAT)) AS TotalSales
FROM dbo.sales
WHERE TRY_CAST(SalesDate AS DATE) >= DATEADD(MONTH, -6, GETDATE())
GROUP BY ProductID
ORDER BY TotalSales DESC;


--Q4 Which month had the highest number of transactions?
-- Q3: Highest number of transactions by month
-- Author: Lillian Moyo
--Ans - March

SELECT 
    FORMAT(CAST(SalesDate AS DATE), 'yyyy-MM') AS SaleMonth,
    COUNT(SalesID) AS TotalTransactions
FROM dbo.sales
GROUP BY FORMAT(CAST(SalesDate AS DATE), 'yyyy-MM')
ORDER BY TotalTransactions DESC;
