DELIMITER //

CREATE PROCEDURE AddValidBooking(IN booking_date DATE, IN table_number INT, IN customer_id VARCHAR(20))
BEGIN
    DECLARE booking_exists INT;

    -- Start transaction
    START TRANSACTION;

    -- Check if the table is already booked on the given date
    SELECT COUNT(*) INTO booking_exists
    FROM Bookings
    WHERE BookingDate = booking_date AND TableNumber = table_number;

    -- Check if booking exists
    IF booking_exists > 0 THEN
        -- Rollback the transaction and output a cancellation message
        ROLLBACK;
        SELECT CONCAT('Table ', table_number, ' is already booked on ', booking_date, ' - booking cancelled') AS `Booking status`;
    ELSE
        -- Table is available, proceed with booking
        INSERT INTO Bookings (TableNumber, BookingDate, CustomerID)
        VALUES (table_number, booking_date, customer_id);

        -- Commit the transaction
        COMMIT;
        SELECT CONCAT('Table ', table_number, ' has been successfully booked on ', booking_date) AS `Booking status`;
    END IF;
END //

DELIMITER ;
