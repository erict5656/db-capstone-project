-- Prepare the statement
PREPARE GetOrderDetail FROM
    "SELECT Order_ID, Quantity, Total_Cost 
     FROM Orders 
     WHERE Customer_ID = ?";

-- Set the variable for CustomerID
SET @id = 1;

-- Execute the prepared statement using the variable
EXECUTE GetOrderDetail USING @id;

-- Optionally, deallocate the prepared statement after use
DEALLOCATE PREPARE GetOrderDetail;
