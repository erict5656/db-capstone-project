DELIMITER //

CREATE PROCEDURE AddBooking(
    IN booking_id INT,
    IN customer_id VARCHAR(20),
    IN booking_date DATE,
    IN table_number INT
)
BEGIN
    -- Insert a new booking record
    INSERT INTO Bookings (BookingID, CustomerID, BookingDate, TableNumber)
    VALUES (booking_id, customer_id, booking_date, table_number);

    -- Confirmation message
    SELECT CONCAT('Booking added successfully with Booking ID: ', booking_id) AS `Booking status`;
END //

DELIMITER ;
