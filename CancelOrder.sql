CALL CancelOrder('54-366-6861');
DELIMITER //

CREATE PROCEDURE DisplayOrderDetails(IN customer_id VARCHAR(15))
BEGIN
    SELECT Order_ID AS "Order ID", 
           Quantity AS "Quantity Ordered", 
           Total_Cost AS "Total Order Cost"
    FROM Orders
    WHERE Customer_ID = customer_id;
END //

DELIMITER ;

-- Call the procedure to see formatted results
CALL DisplayOrderDetails('72-055-7985');
