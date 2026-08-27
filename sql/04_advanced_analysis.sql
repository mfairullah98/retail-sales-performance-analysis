USE RetailSalesDB;
GO

--Advanced Query 1 (CASE)
--Classify every transaction

SELECT
	Order_ID,
	Product_Name,
	Sales,
	Profit,
	CASE
		WHEN Profit > 0 THEN 'Profitable'
		WHEN Profit < 0 THEN 'Loss'
		ELSE 'Break-even'
	END AS Profit_Status
FROM dbo.Orders;

-- Advanced Query 2 - Profit Status Summary
-- Classify then Aggregate

SELECT
	CASE
		WHEN Profit > 0 THEN 'Profitable'
		WHEN Profit < 0 THEN 'Loss'
		ELSE 'Break-even'
	END AS Profit_Status,
	COUNT(*) AS Transactions,
	SUM(Sales) AS Total_Sales,
	SUM(Profit) AS Total_Profit
FROM dbo.Orders
GROUP BY
	CASE
		WHEN Profit > 0 THEN 'Profitable'
		WHEN Profit < 0 THEN 'Loss'
		ELSE 'Break-even'
	END;

-- Advanced Query 3 (CTE)
-- improve readability

WITH CategoryPerformance AS
(
	SELECT
		Category,
		SUM(Sales) AS Total_Sales,
		SUM(Profit) AS Total_Profit
	FROM dbo.Orders
	GROUP BY Category
)

SELECT *
FROM CategoryPerformance
ORDER BY Total_Profit DESC;

--Advanced Query 4 (Window Function)
-- Aggregation, Ranking, Window Functions

SELECT
	Sub_Category,
	SUM(Sales) AS Total_Sales,
	RANK() OVER
	(
		ORDER BY SUM(Sales) DESC
	) AS Sales_Rank
FROM dbo.Orders
GROUP BY Sub_Category
ORDER BY Sales_Rank;

