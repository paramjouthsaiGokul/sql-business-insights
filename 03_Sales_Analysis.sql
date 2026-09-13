How are sales distributed across regions?
SELECT
    Region,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    COUNT(DISTINCT Order_ID) AS Total_Orders
FROM Orders
GROUP BY Region
ORDER BY Total_Sales DESC;

Which category generates the most sales?
SELECT
    Category,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    SUM(Quantity) AS Units_Sold
FROM Orders
GROUP BY Category
ORDER BY Total_Sales DESC;

What are the monthly sales trends?
SELECT
    DATEFROMPARTS(
        YEAR(Order_Date),
        MONTH(Order_Date),
        1
    ) AS Sales_Month,
    SUM(Sales) AS Total_Sales
FROM Orders
GROUP BY
    DATEFROMPARTS(
        YEAR(Order_Date),
        MONTH(Order_Date),
        1
    )
ORDER BY Sales_Month;