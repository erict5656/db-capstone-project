CREATE DATABASE IF NOT EXISTS LittleLemon;
USE LittleLemon;
CREATE TABLE Customers (
    CustomerID VARCHAR(20) PRIMARY KEY,
    FullName VARCHAR(100),
    ContactNumber VARCHAR(20),
    Email VARCHAR(100),
    City VARCHAR(50),
    Country VARCHAR(50),
    PostalCode VARCHAR(20),
    CountryCode VARCHAR(5)
);
CREATE TABLE MenuItems (
    MenuItemsID INT AUTO_INCREMENT PRIMARY KEY,
    CourseName VARCHAR(50),
    CuisineName VARCHAR(50),
    StarterName VARCHAR(50),
    DesertName VARCHAR(50),
    Drink VARCHAR(50),
    Sides VARCHAR(50)
);
CREATE TABLE Menus (
    MenuID INT AUTO_INCREMENT PRIMARY KEY,
    MenuItemsID INT,
    MenuName VARCHAR(50),
    Cuisine VARCHAR(50),
    FOREIGN KEY (MenuItemsID) REFERENCES MenuItems(MenuItemsID)
);
CREATE TABLE Orders (
    OrderID VARCHAR(20) PRIMARY KEY,
    MenuID INT,
    CustomerID VARCHAR(20),
    TotalCost DECIMAL(10, 2),
    OrderDate DATE,
    DeliveryDate DATE,
    Quantity INT,
    FOREIGN KEY (MenuID) REFERENCES Menus(MenuID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);


