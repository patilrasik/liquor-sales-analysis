create database liquor;
use liquor;
CREATE TABLE liquor_sales (
    Liquor_ID VARCHAR(10) PRIMARY KEY,
    Date DATE,
    Brand VARCHAR(100),
    Category VARCHAR(50),
    Base_Price FLOAT,
    MRP FLOAT,
    Cost_Price FLOAT,
    Units_Sold INT,
    GST_Percentage FLOAT,
    Excise_Duty_Ltr FLOAT,
    State VARCHAR(50),
    Distributor VARCHAR(100)
);

CREATE TABLE brand_info (
    Brand VARCHAR(100),
    Category VARCHAR(50),
    Manufacturer VARCHAR(100),
    Popularity_Index INT,
    PRIMARY KEY (Brand, Category)
);

CREATE TABLE state_tax_policy (
    State VARCHAR(50) PRIMARY KEY,
    Min_Age INT,
    Dry_Days_Per_Year INT
);
SELECT State, SUM(MRP) AS Total_Sales
FROM liquor_sales
GROUP BY State
ORDER BY Total_Sales DESC;

SELECT Brand, SUM(`Units Sold`) AS Total_Units
FROM liquor_sales
GROUP BY Brand
ORDER BY Total_Units DESC
LIMIT 10;

SELECT State, SUM(`Total Revenue`) AS State_Revenue
FROM liquor_sales
GROUP BY State
ORDER BY State_Revenue DESC
LIMIT 6;

SELECT 
    Brand,
    SUM(`Total Brand Profit`) AS Brand_Profit,
    SUM(`Total Govt Profit`) AS Govt_Profit
FROM liquor_sales
GROUP BY Brand
ORDER BY Brand_Profit DESC
LIMIT 10;

SELECT 
    DATE_FORMAT(Date, '%Y-%m') AS Month,
    SUM(`Units Sold`) AS Monthly_Units,
    SUM(`Total Revenue`) AS Monthly_Revenue
FROM liquor_sales
GROUP BY Month
ORDER BY Month;


