-- 4.1

SELECT c.full_name, m.title, s.show_date, s.start_time, b.seats_booked, b.status
FROM customers c 
INNER JOIN bookings b ON c.customer_id = b.customer_id
INNER JOIN showtimes s ON b.showtime_id = s.showtime_id
INNER JOIN movies m ON m.movie_id = s.movie_id
ORDER BY b.booked_at;


-- 4.2

SELECT c.full_name
FROM customers c
LEFT JOIN bookings b ON c.customer_id = b.customer_id
WHERE b.booking_id IS NULL;

-- 4.3

SELECT s.showtime_id, m.title, s.show_date
FROM showtimes s
LEFT JOIN bookings b ON s.showtime_id = b.showtime_id
INNER JOIN movies m ON m.movie_id = s.movie_id 
WHERE b.booking_id IS NULL;

-- 4.4

SELECT segment, COUNT(*)
FROM (SELECT CASE
            WHEN c.customer_id IS NULL THEN 'promo only'
            WHEN p.signup_id IS NULL THEN 'customer only'
            ELSE 'both'
            END AS segment
            FROM customers c FULL JOIN promo_signups p
            ON c.email = p.email)
GROUP BY segment;
