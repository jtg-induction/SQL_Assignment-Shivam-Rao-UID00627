CREATE TABLE movies (
    movie_id            SERIAL  PRIMARY KEY,
    title               TEXT    NOT NULL,
    genre               TEXT,
    rating              TEXT,
    duration_minutes    INT CHECK (duration_minutes > 0),
    release_year        INT
);

CREATE TABLE screens (
    screen_id   SERIAL  PRIMARY KEY,
    screen_name TEXT    UNIQUE  NOT NULL,
    capacity    INT     CHECK (capacity > 0)
);

CREATE TABLE showtimes (
    showtime_id     SERIAL          PRIMARY KEY,
    movie_id        INT          NOT NULL,
    screen_id       INT          NOT NULL,
    show_date       DATE            NOT NULL,
    start_time      TIME            NOT NULL,
    ticket_price    NUMERIC(6,2)    NOT NULL,
    CONSTRAINT fk_movies FOREIGN KEY (movie_id) REFERENCES movies(movie_id),
    CONSTRAINT fk_screens FOREIGN KEY (screen_id) REFERENCES screens(screen_id)
);

CREATE TABLE bookings (
    booking_id      SERIAL  PRIMARY KEY,
    customer_id     INT  NOT NULL,
    showtime_id     INT  NOT NULL,
    seats_booked    INT     NOT NULL,
    booked_at       TIME    DEFAULT NOW(),
    status          TEXT    NOT NULL DEFAULT 'confirmed',
    CONSTRAINT  fk_customers FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    CONSTRAINT  fk_showtimes FOREIGN KEY (showtime_id) REFERENCES showtimes(showtime_id)
);
