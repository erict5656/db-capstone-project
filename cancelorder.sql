DELIMITER //

CREATE PROCEDURE CancelOrder(IN order_id VARCHAR(20))
BEGIN
    DECLARE affected_rows INT;

    -- Attempt to delete the order
    DELETE FROM Orders
    WHERE OrderID = order_id;

    -- Check if the delete was successful
    SET affected_rows = ROW_COUNT();

    -- Display message based on whether any rows were affected
    IF affected_rows > 0 THEN
        SELECT CONCAT('Order ', order_id, ' is canceled.') AS Message;
    ELSE
        SELECT CONCAT('No order found with Order ID: ', order_id) AS Message;
    END IF;
END //

DELIMITER ;
