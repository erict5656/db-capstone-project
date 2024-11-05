-- MySQL Script generated by MySQL Workbench
-- Tue Nov  5 10:15:09 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema meta_capstone
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema meta_capstone
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `meta_capstone` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
-- -----------------------------------------------------
-- Schema littlelemon2
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema littlelemon2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `littlelemon2` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
-- -----------------------------------------------------
-- Schema littlelemon22
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema littlelemon22
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `littlelemon22` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
-- -----------------------------------------------------
-- Schema littlelemondb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema littlelemondb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `littlelemondb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `meta_capstone` ;

-- -----------------------------------------------------
-- Table `meta_capstone`.`bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `meta_capstone`.`bookings` (
  `BookingID` INT NOT NULL AUTO_INCREMENT,
  `BookingDate` DATE NULL DEFAULT NULL,
  `TableNumber` INT NULL DEFAULT NULL,
  PRIMARY KEY (`BookingID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `meta_capstone`.`customerdetails`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `meta_capstone`.`customerdetails` (
  `CustomerID` INT NOT NULL AUTO_INCREMENT,
  `CustomerName` VARCHAR(255) NULL DEFAULT NULL,
  `ContactDetails` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `meta_capstone`.`deliverystatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `meta_capstone`.`deliverystatus` (
  `DeliveryStatusID` INT NOT NULL AUTO_INCREMENT,
  `DeliveryDate` DATE NULL DEFAULT NULL,
  `Status` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`DeliveryStatusID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `meta_capstone`.`littlelemon_data`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `meta_capstone`.`littlelemon_data` (
  `Row_Number` INT NULL DEFAULT NULL,
  `Order_ID` VARCHAR(20) NULL DEFAULT NULL,
  `Order_Date` DATE NULL DEFAULT NULL,
  `Delivery_Date` DATE NULL DEFAULT NULL,
  `Customer_ID` VARCHAR(20) NULL DEFAULT NULL,
  `Customer_Name` VARCHAR(50) NULL DEFAULT NULL,
  `City` VARCHAR(50) NULL DEFAULT NULL,
  `Country` VARCHAR(50) NULL DEFAULT NULL,
  `Postal_Code` VARCHAR(20) NULL DEFAULT NULL,
  `Country_Code` VARCHAR(5) NULL DEFAULT NULL,
  `Cost` DECIMAL(10,2) NULL DEFAULT NULL,
  `Sales` DECIMAL(10,2) NULL DEFAULT NULL,
  `Quantity` INT NULL DEFAULT NULL,
  `Discount` DECIMAL(5,2) NULL DEFAULT NULL,
  `Delivery_Cost` DECIMAL(10,2) NULL DEFAULT NULL,
  `Course_Name` VARCHAR(50) NULL DEFAULT NULL,
  `Cuisine_Name` VARCHAR(50) NULL DEFAULT NULL,
  `Starter_Name` VARCHAR(50) NULL DEFAULT NULL,
  `Desert_Name` VARCHAR(50) NULL DEFAULT NULL,
  `Drink` VARCHAR(50) NULL DEFAULT NULL,
  `Sides` VARCHAR(50) NULL DEFAULT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `meta_capstone`.`menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `meta_capstone`.`menu` (
  `MenuID` INT NOT NULL AUTO_INCREMENT,
  `CuisineName` VARCHAR(255) NULL DEFAULT NULL,
  `StarterName` VARCHAR(255) NULL DEFAULT NULL,
  `CourseName` VARCHAR(255) NULL DEFAULT NULL,
  `Drink` VARCHAR(255) NULL DEFAULT NULL,
  `Dessert` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`MenuID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `meta_capstone`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `meta_capstone`.`orders` (
  `OrderID` INT NOT NULL AUTO_INCREMENT,
  `OrderDate` DATE NULL DEFAULT NULL,
  `CustomerID` INT NULL DEFAULT NULL,
  `Quantity` INT NULL DEFAULT NULL,
  `TotalCost` DECIMAL(10,2) NULL DEFAULT NULL,
  `DeliveryStatusID` INT NULL DEFAULT NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `CustomerID` (`CustomerID` ASC) VISIBLE,
  INDEX `DeliveryStatusID` (`DeliveryStatusID` ASC) VISIBLE,
  CONSTRAINT `orders_ibfk_1`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `meta_capstone`.`customerdetails` (`CustomerID`),
  CONSTRAINT `orders_ibfk_2`
    FOREIGN KEY (`DeliveryStatusID`)
    REFERENCES `meta_capstone`.`deliverystatus` (`DeliveryStatusID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `meta_capstone`.`staffinformation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `meta_capstone`.`staffinformation` (
  `StaffID` INT NOT NULL AUTO_INCREMENT,
  `StaffName` VARCHAR(255) NULL DEFAULT NULL,
  `Role` VARCHAR(100) NULL DEFAULT NULL,
  `Salary` DECIMAL(10,2) NULL DEFAULT NULL,
  PRIMARY KEY (`StaffID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

USE `littlelemon2` ;

-- -----------------------------------------------------
-- Table `littlelemon2`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemon2`.`customers` (
  `Customer_ID` VARCHAR(15) NOT NULL,
  `Customer_Name` VARCHAR(100) NULL DEFAULT NULL,
  `City` VARCHAR(50) NULL DEFAULT NULL,
  `Country` VARCHAR(50) NULL DEFAULT NULL,
  `Postal_Code` VARCHAR(20) NULL DEFAULT NULL,
  `Country_Code` VARCHAR(5) NULL DEFAULT NULL,
  PRIMARY KEY (`Customer_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `littlelemon2`.`bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemon2`.`bookings` (
  `Booking_ID` INT NOT NULL AUTO_INCREMENT,
  `Booking_Date` DATE NULL DEFAULT NULL,
  `Table_Number` INT NULL DEFAULT NULL,
  `Customer_ID` VARCHAR(15) NULL DEFAULT NULL,
  PRIMARY KEY (`Booking_ID`),
  INDEX `Customer_ID` (`Customer_ID` ASC) VISIBLE,
  CONSTRAINT `bookings_ibfk_1`
    FOREIGN KEY (`Customer_ID`)
    REFERENCES `littlelemon2`.`customers` (`Customer_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `littlelemon2`.`menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemon2`.`menu` (
  `Menu_ID` INT NOT NULL AUTO_INCREMENT,
  `Course_Name` VARCHAR(50) NULL DEFAULT NULL,
  `Cuisine_Name` VARCHAR(50) NULL DEFAULT NULL,
  `Starter_Name` VARCHAR(50) NULL DEFAULT NULL,
  `Dessert_Name` VARCHAR(50) NULL DEFAULT NULL,
  `Drink` VARCHAR(50) NULL DEFAULT NULL,
  `Sides` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`Menu_ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 128
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `littlelemon2`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemon2`.`orders` (
  `Order_ID` VARCHAR(15) NOT NULL,
  `Order_Date` DATE NULL DEFAULT NULL,
  `Customer_ID` VARCHAR(15) NULL DEFAULT NULL,
  `Quantity` INT NULL DEFAULT NULL,
  `Total_Cost` DECIMAL(10,2) NULL DEFAULT NULL,
  PRIMARY KEY (`Order_ID`),
  INDEX `Customer_ID` (`Customer_ID` ASC) VISIBLE,
  CONSTRAINT `orders_ibfk_1`
    FOREIGN KEY (`Customer_ID`)
    REFERENCES `littlelemon2`.`customers` (`Customer_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `littlelemon2`.`order_delivery_status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemon2`.`order_delivery_status` (
  `Order_ID` VARCHAR(15) NOT NULL,
  `Delivery_Date` DATE NOT NULL,
  `Delivery_Status` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`Order_ID`, `Delivery_Date`),
  CONSTRAINT `order_delivery_status_ibfk_1`
    FOREIGN KEY (`Order_ID`)
    REFERENCES `littlelemon2`.`orders` (`Order_ID`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

USE `littlelemon22` ;

-- -----------------------------------------------------
-- Table `littlelemon22`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemon22`.`customers` (
  `CustomerID` VARCHAR(15) NOT NULL,
  `FullName` VARCHAR(100) NULL DEFAULT NULL,
  `ContactNumber` VARCHAR(15) NULL DEFAULT NULL,
  `Email` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `littlelemon22`.`menuitems`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemon22`.`menuitems` (
  `MenuItemsID` INT NOT NULL AUTO_INCREMENT,
  `CourseName` VARCHAR(50) NULL DEFAULT NULL,
  `StarterName` VARCHAR(50) NULL DEFAULT NULL,
  `DesertName` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`MenuItemsID`))
ENGINE = InnoDB
AUTO_INCREMENT = 64
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `littlelemon22`.`menus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemon22`.`menus` (
  `MenuID` INT NOT NULL AUTO_INCREMENT,
  `MenuItemsID` INT NULL DEFAULT NULL,
  `MenuName` VARCHAR(50) NULL DEFAULT NULL,
  `Cuisine` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`MenuID`),
  INDEX `MenuItemsID` (`MenuItemsID` ASC) VISIBLE,
  CONSTRAINT `menus_ibfk_1`
    FOREIGN KEY (`MenuItemsID`)
    REFERENCES `littlelemon22`.`menuitems` (`MenuItemsID`))
ENGINE = InnoDB
AUTO_INCREMENT = 128
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `littlelemon22`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemon22`.`orders` (
  `OrderID` VARCHAR(15) NOT NULL,
  `MenuID` INT NULL DEFAULT NULL,
  `CustomerID` VARCHAR(15) NULL DEFAULT NULL,
  `TotalCost` DECIMAL(10,2) NULL DEFAULT NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `MenuID` (`MenuID` ASC) VISIBLE,
  INDEX `CustomerID` (`CustomerID` ASC) VISIBLE,
  CONSTRAINT `orders_ibfk_1`
    FOREIGN KEY (`MenuID`)
    REFERENCES `littlelemon22`.`menus` (`MenuID`),
  CONSTRAINT `orders_ibfk_2`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `littlelemon22`.`customers` (`CustomerID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

USE `littlelemondb` ;

-- -----------------------------------------------------
-- Table `littlelemondb`.`customer_details`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondb`.`customer_details` (
  `Customer_ID` VARCHAR(20) NOT NULL,
  `Customer_Name` VARCHAR(100) NOT NULL,
  `City` VARCHAR(50) NULL DEFAULT NULL,
  `Country` VARCHAR(50) NULL DEFAULT NULL,
  `Postal_Code` VARCHAR(20) NULL DEFAULT NULL,
  `Country_Code` VARCHAR(10) NULL DEFAULT NULL,
  PRIMARY KEY (`Customer_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `littlelemondb`.`bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondb`.`bookings` (
  `Booking_ID` INT NOT NULL AUTO_INCREMENT,
  `Booking_Date` DATE NOT NULL,
  `Table_Number` INT NOT NULL,
  `Customer_ID` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`Booking_ID`),
  INDEX `idx_bookings_customer_id` (`Customer_ID` ASC) VISIBLE,
  CONSTRAINT `bookings_ibfk_1`
    FOREIGN KEY (`Customer_ID`)
    REFERENCES `littlelemondb`.`customer_details` (`Customer_ID`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 128
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `littlelemondb`.`menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondb`.`menu` (
  `Menu_ID` INT NOT NULL AUTO_INCREMENT,
  `Cuisine_Name` VARCHAR(50) NULL DEFAULT NULL,
  `Starter_Name` VARCHAR(50) NULL DEFAULT NULL,
  `Course_Name` VARCHAR(50) NULL DEFAULT NULL,
  `Desert_Name` VARCHAR(50) NULL DEFAULT NULL,
  `Drink` VARCHAR(50) NULL DEFAULT NULL,
  `Sides` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`Menu_ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 128
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `littlelemondb`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondb`.`orders` (
  `Order_ID` VARCHAR(20) NOT NULL,
  `Order_Date` DATE NOT NULL,
  `Customer_ID` VARCHAR(20) NULL DEFAULT NULL,
  `Quantity` INT NOT NULL,
  `Cost` DECIMAL(10,2) NOT NULL,
  `Sales` DECIMAL(10,2) NOT NULL,
  `Discount` DECIMAL(5,2) NULL DEFAULT NULL,
  `Delivery_Cost` DECIMAL(10,2) NULL DEFAULT NULL,
  `Menu_ID` INT NULL DEFAULT NULL,
  PRIMARY KEY (`Order_ID`),
  INDEX `idx_orders_customer_id` (`Customer_ID` ASC) VISIBLE,
  INDEX `idx_orders_menu_id` (`Menu_ID` ASC) VISIBLE,
  CONSTRAINT `orders_ibfk_1`
    FOREIGN KEY (`Customer_ID`)
    REFERENCES `littlelemondb`.`customer_details` (`Customer_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `orders_ibfk_2`
    FOREIGN KEY (`Menu_ID`)
    REFERENCES `littlelemondb`.`menu` (`Menu_ID`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `littlelemondb`.`order_delivery_status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondb`.`order_delivery_status` (
  `Order_ID` VARCHAR(20) NOT NULL,
  `Delivery_Date` DATE NULL DEFAULT NULL,
  `Status` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`Order_ID`),
  INDEX `idx_order_delivery_order_id` (`Order_ID` ASC) VISIBLE,
  CONSTRAINT `order_delivery_status_ibfk_1`
    FOREIGN KEY (`Order_ID`)
    REFERENCES `littlelemondb`.`orders` (`Order_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `littlelemondb`.`staff_information`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondb`.`staff_information` (
  `Staff_ID` INT NOT NULL AUTO_INCREMENT,
  `Role` VARCHAR(50) NOT NULL,
  `Salary` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`Staff_ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

USE `littlelemon2` ;

-- -----------------------------------------------------
-- procedure CancelOrder
-- -----------------------------------------------------

DELIMITER $$
USE `littlelemon2`$$
CREATE DEFINER=`erict56`@`127.0.0.1` PROCEDURE `CancelOrder`(IN order_id VARCHAR(15))
BEGIN
    DELETE FROM Orders
    WHERE Order_ID = order_id;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure CustomerOrderSummary
-- -----------------------------------------------------

DELIMITER $$
USE `littlelemon2`$$
CREATE DEFINER=`erict56`@`127.0.0.1` PROCEDURE `CustomerOrderSummary`(IN customer_id VARCHAR(15))
BEGIN
    SELECT Customer_Name AS "Customer Name", City, Country
    FROM Customers
    WHERE Customer_ID = customer_id;
    
    SELECT Order_ID AS "Order ID", Order_Date AS "Order Date", Quantity, Total_Cost
    FROM Orders
    WHERE Customer_ID = customer_id;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure DisplayOrderDetails
-- -----------------------------------------------------

DELIMITER $$
USE `littlelemon2`$$
CREATE DEFINER=`erict56`@`127.0.0.1` PROCEDURE `DisplayOrderDetails`(IN customer_id VARCHAR(15))
BEGIN
    SELECT Order_ID AS "Order ID", 
           Quantity AS "Quantity Ordered", 
           Total_Cost AS "Total Order Cost"
    FROM Orders
    WHERE Customer_ID = customer_id;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure GetMaxQuantity
-- -----------------------------------------------------

DELIMITER $$
USE `littlelemon2`$$
CREATE DEFINER=`erict56`@`127.0.0.1` PROCEDURE `GetMaxQuantity`()
BEGIN
    SELECT MAX(Quantity) AS Max_Quantity
    FROM Orders;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure ShowMaxQuantity
-- -----------------------------------------------------

DELIMITER $$
USE `littlelemon2`$$
CREATE DEFINER=`erict56`@`127.0.0.1` PROCEDURE `ShowMaxQuantity`()
BEGIN
    DECLARE max_qty INT;
    
    -- Get the maximum quantity
    SELECT MAX(Quantity) INTO max_qty FROM Orders;
    
    -- Display formatted result
    SELECT CONCAT("The maximum quantity ordered is: ", max_qty) AS "Max Quantity Info";
END$$

DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
