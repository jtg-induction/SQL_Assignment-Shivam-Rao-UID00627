-- 3.1

SELECT title, rating, duration_minutes FROM movies
WHERE rating = 'R';

-- 3.2

SELECT title, duration_minutes FROM movies
WHERE duration_minutes < 100 ORDER BY duration_minutes;

-- 3.3

SELECT show_date, start_time, ticket_price FROM showtimes
ORDER BY ticket_price DESC
LIMIT 5;

-- 3.4

SELECT full_name, loyalty_points FROM customers
WHERE EXTRACT(YEAR FROM joined_on) = 2026
    AND loyalty_points >= 50; 

-- 3.5

SELECT title FROM movies
WHERE LOWER(title) LIKE '%the%';

-- 3.6

SELECT booking_id AS BOOKING_ID, customer_id AS CUSTOMER_ID, seats_booked AS SEATS FROM bookings
WHERE status = 'cancelled';
