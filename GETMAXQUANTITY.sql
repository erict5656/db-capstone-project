DELIMITER //

CREATE PROCEDURE GetMaxQuantity()
BEGIN
    SELECT MAX(Quantity) AS Max_Quantity
    FROM Orders;
END //

DELIMITER ;

-- Call the procedure to test it
CALL GetMaxQuantity();
