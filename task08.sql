
-- 8.2

SELECT DISTINCT lb.customer_email
FROM legacy_bookings lb
WHERE NOT EXISTS (
    SELECT 1 
    FROM customers c
    WHERE c.email = lb.customer_email
);

-- 8.3

INSERT INTO customers (full_name, email)
SELECT DISTINCT lb.customer_name, lb.customer_email
FROM legacy_bookings lb
WHERE NOT EXISTS (
    SELECT 1
    FROM customers c
    WHERE c.email = lb.customer_email
);

-- 8.4

INSERT INTO movies (title, genre)
SELECT DISTINCT lb.movie_title, lb.movie_genre
FROM legacy_bookings lb
WHERE NOT EXISTS (
    SELECT 1
    FROM movies m
    WHERE m.title = lb.movie_title AND m.genre = lb.movie_genre
);

-- 8.5

SELECT COUNT(*) AS Individual_Seats
FROM legacy_bookings
CROSS JOIN LATERAL unnest(string_to_array(seats, ','));

