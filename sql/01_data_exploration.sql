USE RetailSalesDB;

-- Check first 10 rows
SELECT TOP 10 *
FROM dbo.Orders;

-- Check total number of rows
SELECT COUNT(*) AS Total_Rows
FROM dbo.Orders;

-- Check date range
SELECT
    MIN(Order_Date) AS Earliest_Order,
    MAX(Order_Date) AS Latest_Order
FROM dbo.Orders;

-- Check total sales
SELECT
    SUM(Sales) AS Total_Sales
FROM dbo.Orders;

-- Check total profit
SELECT
    SUM(Profit) AS Total_Profit
FROM dbo.Orders;