create database laptop_db;
SELECT * FROM laptop_prices;

-- Easy Level Queries

-- Query 1. Count how many laptops are there from each company
SELECT Company, COUNT(*) as Count FROM laptop_prices group by Company ORDER BY Count DESC;

-- Query 2. Find the average price of laptops
SELECT CAST(AVG(Price_euros) as decimal(10,2)) as Average_Price 
FROM laptop_prices;

-- Query 3. List all unique laptop types
SELECT DISTINCT TypeName 
FROM laptop_prices;

-- Query 4. Retrieve all laptops from Dell
SELECT * FROM laptop_prices
WHERE Company = "Dell";

-- Query 5. Find the total number of laptops with Retina Display
SELECT COUNT(*) as Laptops_with_Retina_Display FROM laptop_prices 
WHERE RetinaDisplay = "Yes";

-- Query 6. Show laptops with OS = 'Windows 10' and RAM = 8GB
SELECT Company, Product, OS, Ram 
FROM laptop_prices
WHERE Ram = 8 and OS = "Windows 10";

-- Intermediate Level Queries
-- Query 7. Find the top 5 most expensive laptops
SELECT Company, Product,PrimaryStorage, Price_euros
FROM laptop_prices
ORDER BY Price_euros DESC
LIMIT 5;

-- Query 8. Find laptops with SSD (Primary Storage Type = 'SSD') and price less than 1000 euros
SELECT Company, Product, Price_euros
FROM laptop_prices
WHERE PrimaryStorageType = "SSD" and Price_euros < 1000
ORDER BY Price_euros DESC;

-- Query 9. Get the average price of laptops for each OS
SELECT OS, ROUND(AVG(Price_euros)) as Average_Price
FROM laptop_prices 
GROUP BY OS
ORDER BY Average_Price DESC;

-- Query 10. Find number of touchscreen laptops by each company
SELECT Company, COUNT(*) as TouchScreen_Count
FROM laptop_prices
GROUP BY Company
ORDER BY TouchScreen_Count DESC;

-- Query 11. Show top 3 companies by number of high-resolution screens (ScreenW ≥ 1920).
SELECT Company, COUNT(*) as hd_screen_count
FROM laptop_prices
WHERE ScreenW >= 1920
GROUP BY Company
ORDER BY hd_screen_count DESC
LIMIT 3;

-- Query 12. List average CPU frequency grouped by CPU company.
SELECT CPU_company, CAST(AVG(CPU_freq) as decimal(10,2)) as CPU_frequency
FROM laptop_prices
GROUP BY CPU_company
ORDER BY CPU_frequency DESC;

-- Hard Level Queries

-- 13. Rank laptops by price within each company (using window functions)
SELECT Company, Product, Price_euros,
    RANK() OVER(PARTITION BY Company ORDER BY Price_euros DESC) as Laptop_Rank  
FROM laptop_prices;

-- Query 14. Find the total primary + secondary storage for each laptop and show top 5 with highest total
SELECT Company, Product, (PrimaryStorage + SecondaryStorage) as Total_Storage
FROM laptop_prices
ORDER BY Total_Storage DESC
LIMIT 5;

-- Query 15. Get the laptop(s) with the best price-to-RAM ratio (lowest price per GB RAM)
SELECT Company, Product, Price_euros, RAM,
ROUND( Price_euros / RAM) as Price_Per_GB_RAM
FROM laptop_prices
ORDER BY Price_Per_GB_RAM
LIMIT 1;

-- Query 16. Calculate percentage of laptops that have SSD as primary storage.
SELECT 
    SUM(CASE WHEN PrimaryStorageType = "SSD" THEN 1 ELSE 0 END) * 100 / COUNT(*) as SSD_Percent
FROM laptop_prices; 

-- Query 17. Show the most expensive laptop for each type (using window functions)
SELECT TypeName, Company, Product, Price_euros
FROM(
    SELECT *, ROW_NUMBER() OVER(PARTITION BY TypeName ORDER BY Price_euros DESC) as rn
    FROM laptop_prices
    ) as ranked 
WHERE rn = 1;

-- Query 18. Find the top 3 laptops with the best storage-to-price ratio
SELECT Company, Product, Price_euros, (PrimaryStorage + SecondaryStorage) as Total_Storage,
ROUND((PrimaryStorage + SecondaryStorage) / Price_euros , 2) as Storage_per_euro
FROM laptop_prices
ORDER BY Storage_per_euro DESC
LIMIT 3;


