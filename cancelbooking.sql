DELIMITER //

CREATE PROCEDURE CancelBooking(
    IN booking_id INT
)
BEGIN
    -- Delete the booking with the specified booking ID
    DELETE FROM Bookings
    WHERE BookingID = booking_id;

    -- Confirmation message
    SELECT CONCAT('Booking ID ', booking_id, ' has been successfully canceled.') AS `Booking status`;
END //

DELIMITER ;
