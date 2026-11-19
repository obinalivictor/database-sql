USE cape_codd;

-- 2.17
SELECT SKU, SKU_Description
FROM INVENTORY;

-- 2.18
SELECT SKU_Description, SKU
FROM INVENTORY;

-- 2.19
SELECT WarehouseID
FROM INVENTORY;

-- 2.20
SELECT DISTINCT WarehouseID
FROM INVENTORY;

-- 2.21
SELECT *
FROM INVENTORY;

-- 2.22
SELECT SKU, WarehouseID, SKU_Description, QuantityOnHand, QuantityOnOrder
FROM INVENTORY;

-- 2.23
SELECT *
FROM INVENTORY
WHERE QuantityOnHand > 0;

-- 2.24
SELECT SKU, SKU_Description
FROM INVENTORY
WHERE QuantityOnHand = 0;

-- 2.25
SELECT SKU, SKU_Description
FROM INVENTORY
WHERE QuantityOnHand = 0
ORDER BY WarehouseID ASC;

-- 2.26
SELECT SKU, SKU_Description, WarehouseID
FROM INVENTORY
WHERE QuantityOnHand > 0
ORDER BY WarehouseID DESC, SKU ASC;

-- 2.27
SELECT SKU, SKU_Description, WarehouseID
FROM INVENTORY
WHERE QuantityOnHand = 0 AND QuantityOnOrder > 0
ORDER BY WarehouseID DESC, SKU ASC;

-- 2.28
SELECT SKU, SKU_Description, WarehouseID
FROM INVENTORY
WHERE QuantityOnHand = 0 OR QuantityOnOrder = 0
ORDER BY WarehouseID DESC, SKU ASC;

-- 2.29
SELECT SKU, SKU_Description, WarehouseID, QuantityOnHand
FROM INVENTORY
WHERE QuantityOnHand > 1 AND QuantityOnHand < 10;

-- 2.30
SELECT SKU, SKU_Description, WarehouseID, QuantityOnHand
FROM INVENTORY
WHERE QuantityOnHand BETWEEN 2 AND 9;

-- 2.31
SELECT DISTINCT SKU, SKU_Description
FROM INVENTORY
WHERE SKU_Description LIKE '%Half-dome%';

-- 2.32
SELECT DISTINCT SKU, SKU_Description
FROM INVENTORY
WHERE SKU_Description LIKE '%CLIMB%';

-- 2.33
SELECT DISTINCT SKU, SKU_Description
FROM INVENTORY
WHERE SKU_Description LIKE '__d%';

-- 2.34
SELECT COUNT(QuantityOnHand) AS HandQuantityNumber,
       SUM(QuantityOnHand)   AS SumOfQuantityRows,
       AVG(QuantityOnHand)   AS Average,
       MIN(QuantityOnHand)   AS Minimum,
       MAX(QuantityOnHand)   AS Maximum
FROM INVENTORY;

-- 2.35 (notes)
-- COUNT(*) counts the number of rows in the table.
-- COUNT(column-name) counts rows where that column is not null.
-- SUM calculates the sum of all values for numeric columns only.

-- 2.36
SELECT WarehouseID, SUM(QuantityOnHand) AS TotalItemsOnHand
FROM INVENTORY
GROUP BY WarehouseID
ORDER BY TotalItemsOnHand DESC;

-- 2.37
SELECT WarehouseID, SUM(QuantityOnHand) AS TotalItemsOnHandLT3
FROM INVENTORY
WHERE QuantityOnHand < 3
GROUP BY WarehouseID
ORDER BY TotalItemsOnHandLT3 DESC;

-- 2.38
SELECT WarehouseID, SUM(QuantityOnHand) AS TotalItemsOnHandLT3
FROM INVENTORY
WHERE QuantityOnHand < 3
GROUP BY WarehouseID
HAVING COUNT(SKU) < 2
ORDER BY TotalItemsOnHandLT3 DESC;


-- 2.41

SELECT I.SKU, I.SKU_Description, I.WarehouseID, W.WarehouseCity, W.WarehouseState
FROM INVENTORY I
JOIN WAREHOUSE W ON I.WarehouseID = W.WarehouseID
WHERE W.WarehouseCity IN ('Atlanta', 'Bangor', 'Chicago');


-- 2.42
SELECT I.SKU, I.SKU_Description, I.WarehouseID, W.WarehouseCity, W.WarehouseState
FROM INVENTORY I
JOIN WAREHOUSE W ON I.WarehouseID = W.WarehouseID
WHERE W.WarehouseCity != 'Atlanta'
  AND W.WarehouseCity != 'Bangor'
  AND W.WarehouseCity != 'Chicago';


-- 2.43
SELECT I.SKU, I.SKU_Description, I.WarehouseID, W.WarehouseCity, W.WarehouseState
FROM INVENTORY I
JOIN WAREHOUSE W ON I.WarehouseID = W.WarehouseID
WHERE W.WarehouseCity NOT IN ('Atlanta', 'Bangor', 'Chicago');


-- 2.44
SELECT (SKU_Description +'is located in'+ W.WarehouseCity ) AS itemLOCATION
FROM INVENTORY I
JOIN WAREHOUSE W ON I.WarehouseID = W.WarehouseID;


-- 2.45
SELECT SKU, SKU_Description, WarehouseID
FROM INVENTORY
WHERE WarehouseID IN (
    SELECT WarehouseID
    FROM WAREHOUSE
    WHERE Manager = 'Lucille Smith'
);








SELECT 1;








