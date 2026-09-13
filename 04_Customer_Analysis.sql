Who are the top 10 customers by sales?
SELECT TOP 10
    Customer_ID,
    Customer_Name,
    SUM(Sales) AS Total_Sales
FROM Orders
GROUP BY
    Customer_ID,
    Customer_Name
ORDER BY Total_Sales DESC;

Who are the top 10 customers by profit?
SELECT TOP 10
    Customer_ID,
    Customer_Name,
    SUM(Profit) AS Total_Profit
FROM Orders
GROUP BY
    Customer_ID,
    Customer_Name
ORDER BY Total_Profit DESC;