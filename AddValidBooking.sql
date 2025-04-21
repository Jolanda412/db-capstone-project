DELIMITER $$

CREATE PROCEDURE AddValidBooking (IN Booking_date DATE, IN Table_No INT)
BEGIN
    DECLARE id INT;
    DECLARE existing_booking INT;

    -- Start een transactie
    START TRANSACTION;

    -- Haal het hoogste BookingID op en verhoog het
    SELECT BookingID INTO id FROM bookings ORDER BY BookingID DESC LIMIT 1;
    SET id = id + 1;

    -- Controleer of de tafel al geboekt is
    SELECT COUNT(*) INTO existing_booking
    FROM bookings
    WHERE TableNumber = Table_No AND Date = Booking_date;  -- Gebruik 'Date' als kolomnaam

    -- Als de tafel al geboekt is, rollback, anders voeg de boeking toe
    IF existing_booking > 0 THEN
        ROLLBACK;
        SELECT CONCAT('Table ', Table_No, ' is already booked - booking cancelled') AS BookingStatus;
    ELSE
        -- Voeg de boeking toe
        INSERT INTO bookings (BookingID, Date, TableNumber, CustomerID)  -- Gebruik 'Date' als kolomnaam
        VALUES (id, Booking_date, Table_No, NULL);

        COMMIT;
        SELECT CONCAT('Booking Successful') AS BookingStatus;
    END IF;
END $$

DELIMITER ;
