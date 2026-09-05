-- 6.1

SELECT show_date, start_time, ticket_price
FROM showtimes
WHERE ticket_price > (SELECT AVG(ticket_price) FROM showtimes);

-- 6.2

-- SELECT c.full_name
-- FROM customers c INNER JOIN bookings b ON c.customer_id = b.customer_id
-- INNER JOIN showtimes s ON b.showtime_id = s.showtime_id
-- INNER JOIN (SELECT movie_id FROM movies WHERE genre IN ('Thriller')) m ON s.movie_id = m.movie_id
-- WHERE b.status = 'confirmed';

SELECT c.full_name
    FROM customers c INNER JOIN bookings b ON c.customer_id = b.customer_id
    INNER JOIN showtimes s ON b.showtime_id = s.showtime_id
    WHERE s.movie_id IN (SELECT m.movie_id from movies m WHERE m.genre = 'Thriller')
    AND b.status = 'confirmed';

-- 6.3

WITH thriller_movies AS(
    SELECT movie_id
    FROM movies
    WHERE genre IN ('Thriller')
)
SELECT c.full_name
FROM customers c INNER JOIN bookings b ON c.customer_id = b.customer_id
INNER JOIN showtimes s ON b.showtime_id = s.showtime_id
INNER JOIN thriller_movies m ON s.movie_id = m.movie_id
WHERE b.status = 'confirmed';

--6.4 

-- Ww will use CTEs insted of a nested subquery when we need to use the same subquery more than one within a single query.

WITH movie_revenue AS(
        SELECT
            m.title AS title,
            SUM(b.seats_booked * st.ticket_price) AS revenue
        FROM movies m 
        INNER JOIN showtimes st ON m.movie_id = st.movie_id
        INNER JOIN bookings b ON b.showtime_id = st.showtime_id 
        WHERE b.status='confirmed' 
        GROUP BY m.title
    ), stat AS(
        SELECT AVG(revenue) AS revenue
        FROM movie_revenue
    )
SELECT title, mr.revenue
FROM movie_revenue mr
CROSS JOIN stat s
WHERE mr.revenue > s.revenue;
