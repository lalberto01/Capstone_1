-- Bonus Questions
-- Territory: Texas (South Region)
-- Manager: Jeff "Howdy" Richards
-- ==============================================
-- All transactions that took place on January 15, 2024 sorted by sale amount
-- from highest to lowest
SELECT
    Store_Sales.id                        AS Transaction_ID,
    Store_Sales.Transaction_Date          AS Transaction_Date,
    Store_Locations.StoreLocation         AS Store_City,
    Store_Locations.State                 AS Store_State,
    Store_Sales.Prod_Num                  AS Product_Number,
    SUBSTRING_INDEX(Store_Sales.Prod_Num, '-', -1) AS Category,
    Store_Sales.Sale_Amount               AS Sale_Amount
FROM Store_Sales
JOIN Store_Locations
    ON Store_Sales.Store_ID = Store_Locations.StoreId
WHERE Store_Sales.Transaction_Date = '2024-01-15'
ORDER BY
    Store_Sales.Sale_Amount DESC;
-- =============================================================
-- All transactions where the sale amount was greater than $500, showing transaction
-- date, store ID, product number, and sale amount sorted highest to lowest
SELECT
    Store_Sales.Transaction_Date          AS Transaction_Date,
    Store_Sales.Store_ID                  AS Store_ID,
    Store_Sales.Prod_Num                  AS Product_Number,
    Store_Sales.Sale_Amount               AS Sale_Amount
FROM Store_Sales
WHERE Store_Sales.Sale_Amount > 500
ORDER BY
    Store_Sales.Sale_Amount DESC;
-- ===================================================================
-- Find all products whose product number begins with 105250 and identify 
-- what category they belong to.
SELECT DISTINCT
    Store_Sales.Prod_Num                           AS Product_Number,
    SUBSTRING_INDEX(Store_Sales.Prod_Num, '-', -1) AS Category
FROM Store_Sales
WHERE Store_Sales.Prod_Num LIKE '105250%'
ORDER BY
    Store_Sales.Prod_Num;
--========================================================================
