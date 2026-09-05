
-- 7.1

ALTER TABLE bookings 
ADD CONSTRAINT chk_seats CHECK (
    seats_booked >= 1 AND 
    seats_booked <= 10
);


-- 7.2 

ALTER TABLE bookings
ADD CONSTRAINT chk_status CHECK (status IN ('confirmed', 'cancelled'));

-- 7.3

ALTER TABLE showtimes
ADD CONSTRAINT chk_ticket_price CHECK (ticket_price > 0);

-- 7.4

ALTER TABLE showtimes
ADD CONSTRAINT Unique_id_date_time UNIQUE(screen_id, show_date, start_time);

-- 7.5

ALTER TABLE movies
ADD CONSTRAINT chk_rating CHECK (rating IN ('G', 'PG', 'PG-13', 'R'));

-- 7.6

INSERT INTO bookings
    (customer_id, showtime_id, seats_booked, booked_at) VALUES
    (11, 9, 0, '10:15');

INSERT INTO showtimes
    (movie_id, screen_id, show_date, start_time, ticket_price) VALUES
    (11, 3, '2026-08-16', '18:00', 8.00);

INSERT INTO movies
    (title, genre, rating, duration_minutes, release_year) VALUES
    ('Avengers: Endgame', 'Sci-FI', 'NC-99', 181, 2019);

