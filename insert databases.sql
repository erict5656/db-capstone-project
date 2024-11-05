-- Switch to LittleLemon database
USE LittleLemon;

-- Populate the Customers table
INSERT IGNORE INTO Customers (CustomerID, FullName, ContactNumber, Email, City, Country, PostalCode, CountryCode)
SELECT DISTINCT `Customer_ID`, `Customer_Name`, NULL AS ContactNumber, NULL AS Email, `City`, `Country`, `Postal_Code`, `Country_Code`
FROM meta_capstone.littlelemon_data;

-- Populate the MenuItems table
INSERT IGNORE INTO MenuItems (CourseName, CuisineName, StarterName, DesertName, Drink, Sides)
SELECT DISTINCT `Course_Name`, `Cuisine_Name`, `Starter_Name`, `Desert_Name`, `Drink`, `Sides`
FROM meta_capstone.littlelemon_data;

-- Populate the Menus table
-- Assuming MenuItemsID in Menus is linked to the MenuItems table by matching CourseName and CuisineName
INSERT IGNORE INTO Menus (MenuItemsID, MenuName, Cuisine)
SELECT DISTINCT MI.MenuItemsID, MI.CourseName AS MenuName, MI.CuisineName AS Cuisine
FROM meta_capstone.littlelemon_data AS LL
JOIN MenuItems AS MI ON LL.Course_Name = MI.CourseName AND LL.Cuisine_Name = MI.CuisineName;

-- Populate the Orders table
INSERT IGNORE INTO Orders (OrderID, MenuID, CustomerID, TotalCost, OrderDate, DeliveryDate, Quantity)
SELECT DISTINCT 
    `Order_ID`, 
    M.MenuID, 
    `Customer_ID`, 
    `Cost`, 
    STR_TO_DATE(`Order_Date`, '%m/%d/%Y'), 
    STR_TO_DATE(`Delivery_Date`, '%m/%d/%Y'), 
    `Quantity`
FROM meta_capstone.littlelemon_data AS LL
JOIN Menus AS M ON LL.Course_Name = M.MenuName AND LL.Cuisine_Name = M.Cuisine;
