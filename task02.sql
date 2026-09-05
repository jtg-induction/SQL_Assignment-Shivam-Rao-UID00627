-- 2.1

INSERT INTO movies 
    (title, genre, rating, duration_minutes, release_year) VALUES
    ('The Marlowe Reel', 'Documentary', 'PG', 80, 2026);

-- 2.2

INSERT INTO customers
    (full_name, email, phone)   VALUES
    ('Shivam Rao', 'shivam.rao@joshtechnologygroup.com', '1234567890');

-- 2.3

INSERT INTO showtimes
    (movie_id, screen_id, show_date, start_time, ticket_price)
    SELECT
        m.movie_id,
        s.screen_id,
        '2026-08-16',
        '18:00',
        8.00
    FROM movies m
    CROSS JOIN  screens s
    WHERE m.title = 'The Marlowe Reel'
    AND s.screen_name = 'The Vault';

-- 2.4

UPDATE movies
SET title = 'The Comet Kids'
WHERE title = 'The Comet Kidz';

--2.5

UPDATE showtimes
SET ticket_price = ticket_price + 2.00
WHERE show_date = '2026-08-14'
    AND start_time >= '18:00';

--2.6

UPDATE customers
SET loyalty_points = loyalty_points + 25
WHERE email = (SELECT email FROM customers WHERE  full_name = 'Elena Petrova');

--2.7
WITH hollow_peak_id AS(
    SELECT movie_id
    FROM movies
    WHERE title = 'Hollow Peak'
)DELETE FROM showtimes
WHERE movie_id = hollow_peak_id
    AND show_date = '2026-08-16'
    AND showtime_id > (SELECT min(showtime_id) FROM showtimes 
                        WHERE movie_id = hollow_peak_id 
                        AND show_date = '2026-08-16');
