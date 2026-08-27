USE RetailSalesDB;
GO

-- Sales by Category
SELECT 
	Category,
	SUM(Sales) AS Total_Sales
FROM dbo.Orders
GROUP BY Category
ORDER BY Total_Sales DESC;

-- Sales by Region
SELECT
	Region,
	SUM(Sales) AS Total_Sales,
	SUM(Profit) AS Total_Profit
FROM dbo.Orders
GROUP BY Region
ORDER BY Total_Sales DESC;

-- Customer Segment Performance
SELECT
	Segment,
	SUM(Sales) AS Total_Sales,
	COUNT(DISTINCT Customer_ID) AS Customers
FROM dbo.Orders
GROUP BY Segment
ORDER BY Total_Sales DESC;

-- Top 10 Products By Sales

SELECT TOP 10
	Product_Name,
	SUM(Sales) AS Total_Sales
FROM dbo.Orders
GROUP BY Product_Name
ORDER BY Total_Sales DESC;

-- Top 10 Products By Profit

SELECT TOP 10
	Product_Name,
	SUM(Profit) AS Total_Profit
FROM dbo.Orders
GROUP BY Product_Name
ORDER BY Total_Profit DESC;

-- Monthly Sales Trend

SELECT
	Order_Year, 
	Order_Month,
	SUM(Sales) AS Total_Sales
FROM dbo.Orders
GROUP BY
	Order_Year,
	Order_Month
ORDER BY
	Order_Year,
	Order_Month;

