
-- 10.1

BEGIN TRANSACTION;

INSERT INTO bookings
            (customer_id, showtime_id, seats_booked)
            SELECT
                c.customer_id,
                13,
                2
            FROM customers c
            WHERE c.full_name = 'Elena Petrova';

UPDATE customers
SET loyalty_points = loyalty_points + 10
WHERE full_name = 'Elena Petrova';

COMMIT;

-- 10.2

BEGIN TRANSACTION;

DELETE FROM bookings;

SELECT COUNT(*) FROM bookings;

ROLLBACK;

SELECT COUNT(*) FROM bookings;


-- 10.3

BEGIN TRANSACTION;

INSERT INTO bookings
            (customer_id, showtime_id, seats_booked)
            SELECT
                c.customer_id,
                13,
                2
            FROM customers c
            WHERE c.full_name = 'Elena Petrova';

SAVEPOINT INSERT_SP;

UPDATE bookings
SET seats_booked = -1
WHERE showtime_id = 13;

ROLLBACK TO INSERT_SP;

COMMIT;


-- TO ENSURE NO DUPLICATE BOOKINGS
DELETE FROM bookings
WHERE booking_id = (SELECT MAX(booking_id) FROM bookings);
--

