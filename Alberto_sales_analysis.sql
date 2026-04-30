-- Sales Territory Analysis
-- Territory: Texas (South Region)
-- Manager: Jeff "Howdy" Richards

-- ============================================================
-- Total Revenue of Texas, Start Date, and End Date
-- Answer: Total Revenue = $3,417,850.01
-- Start Date = 2022-01-01
-- End Date = 2025-12-31
SELECT
	SUM(Store_Sales.Sale_Amount) 		AS Total_Revenue,
	MIN(Store_Sales.Transaction_Date)   AS Start_Date,
	MAX(Store_Sales.Transaction_Date)   AS End_Date
FROM Store_Sales
JOIN Store_Locations
ON Store_Sales.Store_ID = Store_Locations.StoreId
WHERE Store_Locations.State = 'Texas';
-- ==================================================
-- Texas Month by Month revenue breakdown
SELECT
YEAR(Store_Sales.Transaction_Date)  AS Sale_Year,
MONTH(Store_Sales.Transaction_Date) AS Sale_Month,
SUM(Store_Sales.Sale_Amount)        AS Monthly_Revenue
FROM Store_Sales
JOIN Store_Locations
ON Store_Sales.Store_ID = Store_Locations.StoreId
WHERE Store_Locations.State = 'Texas'
GROUP BY
YEAR(Store_Sales.Transaction_Date),
MONTH(Store_Sales.Transaction_Date)
ORDER BY
Sale_Year,
Sale_Month;
-- ======================================
-- Total revenue for Texas vs total revenue for South Region
SELECT
    SUM(CASE WHEN Store_Locations.State = 'Texas'
        THEN Store_Sales.Sale_Amount
        ELSE 0
    END) AS Texas_Revenue,
    SUM(Store_Sales.Sale_Amount) AS South_Region_Revenue
FROM Store_Sales
JOIN Store_Locations
ON Store_Sales.Store_ID = Store_Locations.StoreId
JOIN Management
ON Store_Locations.State = Management.State
WHERE Management.Region = 'South';
-- ===============================================
-- List number of transactions and average sale amount per 
-- month broken out by product category in Texas.
SELECT
    YEAR(store_sales.Transaction_Date) AS Sale_Year,
    MONTH(store_sales.Transaction_Date) AS Sale_Month,
    store_sales.Prod_Num AS Product_Category,
    COUNT(*) AS Number_Of_Transactions,
    AVG(store_sales.Sale_Amount) AS Avg_Transaction_Size
FROM store_sales
JOIN store_locations
    ON store_sales.Store_ID = store_locations.StoreId
WHERE store_locations.State = 'Texas'
GROUP BY
    YEAR(store_sales.Transaction_Date),
    MONTH(store_sales.Transaction_Date),
    store_sales.Prod_Num
ORDER BY
    Sale_Year,
    Sale_Month,
    Product_Category;
-- ================================================================
-- Rank all Texas stores from highest to lowest total revenue.
SELECT
    Store_Locations.StoreId AS Store_ID,
    Store_Locations.StoreLocation AS Store_City,
    Store_Locations.State AS Store_State,
    SUM(Store_Sales.Sale_Amount) AS Total_Revenue,
    COUNT(*) AS Total_Transactions,
    AVG(Store_Sales.Sale_Amount) AS Avg_Transaction_Size
FROM Store_Sales
JOIN Store_Locations
    ON Store_Sales.Store_ID = Store_Locations.StoreId
WHERE Store_Locations.State = 'Texas'
GROUP BY
    Store_Locations.StoreId,
    Store_Locations.StoreLocation,
    Store_Locations.State
ORDER BY
    Total_Revenue DESC;
-- ====================================
-- Sale month 4 in 2025 had the lowest revenue for the year.
-- I reccomemend running a promotion to attract more customers during these months.
 

