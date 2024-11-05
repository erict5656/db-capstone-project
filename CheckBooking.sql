DELIMITER //

CREATE PROCEDURE CheckBooking(IN booking_date DATE, IN table_number INT)
BEGIN
    DECLARE booking_status INT;

    -- Check if the table is already booked on the specified date
    SELECT COUNT(*) INTO booking_status
    FROM Bookings
    WHERE BookingDate = booking_date AND TableNumber = table_number;

    -- Output the booking status
    IF booking_status > 0 THEN
        SELECT CONCAT('Table ', table_number, ' is already booked on ', booking_date) AS `Booking status`;
    ELSE
        SELECT CONCAT('Table ', table_number, ' is available on ', booking_date) AS `Booking status`;
    END IF;
END //

DELIMITER ;
