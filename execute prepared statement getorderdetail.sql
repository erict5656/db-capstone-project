-- Step 1: Create the Prepared Statement
PREPARE GetOrderDetail FROM
    "SELECT OrderID, Quantity, TotalCost
     FROM Orders
     WHERE CustomerID = ?";

-- Step 2: Set the CustomerID Variable
SET @id = 1;

-- Step 3: Execute the Prepared Statement
EXECUTE GetOrderDetail USING @id;

-- Step 4: Deallocate the Prepared Statement
DEALLOCATE PREPARE GetOrderDetail;
