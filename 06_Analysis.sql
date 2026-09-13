WITH CustomerSummary AS
(
    SELECT
        Customer_ID,
        SUM(Sales) AS Customer_Sales,
        SUM(Profit) AS Customer_Profit
    FROM Orders
    GROUP BY Customer_ID
)
SELECT
    o.Customer_ID,
    o.Customer_Name,
    o.Segment,
    cs.Customer_Sales,
    cs.Customer_Profit
FROM Orders o
INNER JOIN CustomerSummary cs
    ON o.Customer_ID = cs.Customer_ID;




Who are the top customers within each customer segment?

WITH CustomerSales AS
(
    SELECT
        Segment,
        Customer_ID,
        Customer_Name,
        SUM(Sales) AS Total_Sales
    FROM Orders
    GROUP BY
        Segment,
        Customer_ID,
        Customer_Name
),
RankedCustomers AS
(
    SELECT
        Segment,
        Customer_ID,
        Customer_Name,
        Total_Sales,
        ROW_NUMBER() OVER
        (
            PARTITION BY Segment
            ORDER BY Total_Sales DESC
        ) AS Customer_Rank
    FROM CustomerSales
)
SELECT
    Segment,
    Customer_ID,
    Customer_Name,
    Total_Sales,
    Customer_Rank
FROM RankedCustomers
WHERE Customer_Rank <= 3
ORDER BY
    Segment,
    Customer_Rank;
