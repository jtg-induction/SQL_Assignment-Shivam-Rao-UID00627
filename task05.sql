-- 5.1

SELECT m.title, SUM(s.ticket_price * b.seats_booked) total
FROM bookings b INNER JOIN showtimes s ON b.showtime_id = s.showtime_id
INNER JOIN movies m ON s.movie_id =  m.movie_id
WHERE b.status = 'confirmed'
GROUP BY m.title
ORDER BY total DESC;

-- 5.2

SELECT m.genre, SUM(b.seats_booked) total_seats
FROM bookings b INNER JOIN showtimes s ON b.showtime_id = s.showtime_id
INNER JOIN movies m ON s.movie_id = m.movie_id
WHERE b.status = 'confirmed'
GROUP BY m.genre
ORDER BY total_seats DESC;

--- 5.3

SELECT s.screen_name, ROUND(AVG(st.ticket_price),2) average_price
FROM screens s INNER JOIN showtimes st ON st.screen_id = s.screen_id
GROUP BY s.screen_id
ORDER BY average_price;

-- 5.4

SELECT m.genre, SUM(b.seats_booked)
FROM movies m INNER JOIN showtimes s ON m.movie_id = s.movie_id
INNER JOIN bookings b ON s.showtime_id = b.showtime_id
WHERE b.status = 'confirmed'
GROUP BY m.genre
HAVING SUM(b.seats_booked) > 10;

-- 5.5

SELECT st.showtime_id, m.title, s.screen_name, s.capacity,
        SUM(b.seats_booked) Seats_Sold,
        ROUND(((SUM(b.seats_booked*100.0)/s.capacity)),2) Percent_Full
FROM  showtimes st LEFT JOIN screens s ON st.screen_id = s.screen_id
INNER JOIN movies m ON m.movie_id = st.movie_id
INNER JOIN bookings b ON b.showtime_id = st.showtime_id
WHERE b.status = 'confirmed'
GROUP BY st.showtime_id,
            m.title, s.screen_name,s.capacity
ORDER BY Percent_Full DESC;
