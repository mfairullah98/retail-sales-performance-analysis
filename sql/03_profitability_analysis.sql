USE RetailSalesDB;
GO

-- Profit by Category

SELECT
	Category,
	SUM(Profit) AS  Total_Profit
FROM dbo.Orders
GROUP BY Category
ORDER BY Total_Profit DESC;

-- Profit Margin

SELECT
	Category,
	SUM(Sales) AS Total_Sales,
	SUM(Profit) AS Total_Profit,
	ROUND(
		SUM(Profit) * 100.0 /
		NULLIF(SUM(Sales),0),
		2
	) AS Profit_Margin_Percent
FROM dbo.Orders
GROUP BY Category
ORDER BY Profit_Margin_Percent DESC;

-- Loss Making Products

SELECT TOP 20
	Product_Name,
	SUM(Sales) AS Total_Sales,
	SUM(Profit) AS Total_Profit
FROM dbo.Orders
GROUP BY Product_Name
HAVING SUM(Profit) < 0
ORDER BY Total_Profit;

-- Discount Impact

SELECT
	Discount, 
	COUNT(*) AS Transactions,
	SUM(Sales) AS Total_Sales,
	SUM(Profit) AS Total_Profit
FROM dbo.Orders
GROUP BY Discount
ORDER BY Discount;

--Higher discount -> lower profits? (Let the data answer)

