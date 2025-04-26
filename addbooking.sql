CREATE DEFINER=`root`@`localhost` PROCEDURE `AddBooking`(
    IN booking_id INT,           -- Boekings-ID
    IN customer_id INT,          -- Klant-ID
    IN booking_date DATE,        -- Boekingsdatum
    IN table_number INT          -- Tafelnummer
)
BEGIN
    DECLARE existing_booking INT;

    -- Start een transactie
    START TRANSACTION;

    -- Controleer of de tafel al geboekt is voor de opgegeven datum
SELECT 
    COUNT(*)
INTO existing_booking FROM
    bookings
WHERE
    TableNumber = table_number
        AND Date = booking_date;

    -- Als de tafel al geboekt is, rollback de transactie
    IF existing_booking > 0 THEN
        ROLLBACK;
SELECT 
    CONCAT('Table ',
            table_number,
            ' is already booked for ',
            booking_date,
            ' - booking cancelled') AS BookingStatus;
    ELSE
        -- Voeg de boeking toe aan de tabel
        INSERT INTO bookings (BookingID, CustomerID, Date, TableNumber)
        VALUES (booking_id, customer_id, booking_date, table_number);

        -- Commit de transactie
        COMMIT;
SELECT 
    CONCAT('Booking successful for Customer ',
            customer_id,
            ' on Table ',
            table_number,
            ' for date ',
            booking_date) AS BookingStatus;
    END IF;
END