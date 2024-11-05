DELIMITER //

CREATE PROCEDURE UpdateBooking(
    IN booking_id INT,
    IN new_booking_date DATE
)
BEGIN
    -- Update the booking date for the specified booking ID
    UPDATE Bookings
    SET BookingDate = new_booking_date
    WHERE BookingID = booking_id;

    -- Confirmation message
    SELECT CONCAT('Booking ID ', booking_id, ' has been updated to new date: ', new_booking_date) AS `Booking status`;
END //

DELIMITER ;
