
-- 9.1

SELECT m.title, SUM(b.seats_booked * st.ticket_price) AS revenue,
        RANK() OVER (
            ORDER BY SUM(b.seats_booked * st.ticket_price) DESC
        ) 
FROM bookings b INNER JOIN showtimes st ON b.showtime_id = st.showtime_id
INNER JOIN movies m ON m.movie_id = st.movie_id
WHERE b.status = 'confirmed'
GROUP BY m.title;


-- 9.2
SELECT m.genre,
    SUM(b.seats_booked) AS seats,
    RANK() OVER (
        ORDER BY SUM(b.seats_booked) DESC
    ) AS genre_rank
FROM bookings b INNER JOIN showtimes st ON b.showtime_id = st.showtime_id
INNER JOIN movies m ON m.movie_id = st.movie_id
WHERE b.status = 'confirmed'
GROUP BY m.genre;


-- 9.3 
WITH revenue AS (
    SELECT st.show_date,
        SUM(b.seats_booked * st.ticket_price) AS revenue
    FROM bookings b INNER JOIN showtimes st ON b.showtime_id = st.showtime_id
    INNER JOIN movies m ON m.movie_id = st.movie_id
    WHERE b.status = 'confirmed'
    GROUP BY st.show_date
)
SELECT
    show_date, revenue,
    SUM(revenue) OVER (
        ORDER BY show_date
    ) AS running_total
FROM revenue
ORDER BY show_date;


-- 9.4

SELECT show_date, ticket_price,
    ROUND(AVG(ticket_price) OVER(
        PARTITION BY movie_id
    ),2)
FROM showtimes;

