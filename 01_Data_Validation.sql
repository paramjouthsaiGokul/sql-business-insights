SELECT COUNT(*) AS Total_Rows
FROM Orders;

SELECT COUNT(DISTINCT Order_ID) AS Total_Orders
FROM Orders;

SELECT COUNT(DISTINCT Customer_ID) AS Total_Customers
FROM Orders;

SELECT COUNT(DISTINCT Product_ID) AS Total_Products
FROM Orders;

SELECT DISTINCT Category
FROM Orders;

SELECT DISTINCT Ship_Mode
FROM Orders;

