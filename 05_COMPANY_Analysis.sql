"How much revenue and profit did the company generate?"

SELECT
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    SUM(Quantity) AS Total_Units_Sold
FROM Orders;


"Which region generates the most revenue?"

SELECT
    Region,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM Orders
GROUP BY Region
ORDER BY Total_Sales DESC;


"Which region is actually the most profitable?"

SELECT
    Region,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    ROUND(
        SUM(Profit) * 100.0 /
        NULLIF(SUM(Sales), 0),
        2
    ) AS Profit_Margin
FROM Orders
GROUP BY Region
ORDER BY Profit_Margin DESC;



"Who are our top 10 customers by revenue?"

SELECT TOP 10
    Customer_ID,
    Customer_Name,
    SUM(Sales) AS Total_Sales
FROM Orders
GROUP BY
    Customer_ID,
    Customer_Name
ORDER BY Total_Sales DESC;


"Who are our most profitable customers?"

SELECT TOP 10
    Customer_ID,
    Customer_Name,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM Orders
GROUP BY
    Customer_ID,
    Customer_Name
ORDER BY Total_Profit DESC;


"Which customers are buying repeatedly?"

SELECT
    Customer_ID,
    Customer_Name,
    COUNT(DISTINCT Order_ID) AS Number_Of_Orders
FROM Orders
GROUP BY
    Customer_ID,
    Customer_Name
HAVING COUNT(DISTINCT Order_ID) > 1
ORDER BY Number_Of_Orders DESC;

"What percentage of customers are repeat customers?"

WITH CustomerOrders AS
(
    SELECT
        Customer_ID,
        COUNT(DISTINCT Order_ID) AS Order_Count
    FROM Orders
    GROUP BY Customer_ID
)

SELECT
    COUNT(*) AS Total_Customers,

    SUM(
        CASE
            WHEN Order_Count > 1 THEN 1
            ELSE 0
        END
    ) AS Repeat_Customers,

    ROUND(
        SUM(
            CASE
                WHEN Order_Count > 1 THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS Repeat_Customer_Percentage

FROM CustomerOrders;

"Which customer segment generates the most revenue?"

SELECT
    Segment,
    COUNT(DISTINCT Customer_ID) AS Customers,
    COUNT(DISTINCT Order_ID) AS Orders,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM Orders
GROUP BY Segment
ORDER BY Total_Sales DESC;

"What are the top 10 products by sales?"

SELECT TOP 10
    Product_ID,
    Product_Name,
    SUM(Sales) AS Total_Sales
FROM Orders
GROUP BY
    Product_ID,
    Product_Name
ORDER BY Total_Sales DESC;


"Which categories are performing best?"

SELECT
    Category,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    SUM(Quantity) AS Units_Sold
FROM Orders
GROUP BY Category
ORDER BY Total_Sales DESC;


"Which sub-categories are most profitable?"

SELECT
    Sub_Category,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    SUM(Quantity) AS Units_Sold
FROM Orders
GROUP BY Sub_Category
ORDER BY Total_Profit DESC;

"Which products have strong sales but poor profit margins?"

SELECT
    Product_ID,
    Product_Name,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,

    ROUND(
        SUM(Profit) * 100.0 /
        NULLIF(SUM(Sales), 0),
        2
    ) AS Profit_Margin

FROM Orders

GROUP BY
    Product_ID,
    Product_Name

HAVING SUM(Sales) > 1000

ORDER BY Profit_Margin ASC;


Top 3 Products Per Category

WITH ProductSales AS
(
    SELECT
        Category,
        Product_ID,
        Product_Name,
        SUM(Sales) AS Total_Sales
    FROM Orders
    GROUP BY
        Category,
        Product_ID,
        Product_Name
),

RankedProducts AS
(
    SELECT
        Category,
        Product_ID,
        Product_Name,
        Total_Sales,

        ROW_NUMBER() OVER
        (
            PARTITION BY Category
            ORDER BY Total_Sales DESC
        ) AS Product_Rank

    FROM ProductSales
)

SELECT
    Category,
    Product_ID,
    Product_Name,
    Total_Sales,
    Product_Rank
FROM RankedProducts
WHERE Product_Rank <= 3
ORDER BY
    Category,
    Product_Rank;

    SELECT
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    SUM(Quantity) AS Total_Units_Sold
FROM Orders;

SELECT
    MIN(Order_Date) AS Earliest_Order,
    MAX(Order_Date) AS Latest_Order,
    MIN(Ship_Date) AS Earliest_Ship,
    MAX(Ship_Date) AS Latest_Ship
FROM Orders;

SELECT COUNT(*) AS Invalid_Shipping_Dates
FROM Orders
WHERE Ship_Date < Order_Date;