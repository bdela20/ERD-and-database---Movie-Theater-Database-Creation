-- Customers
CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(15) NOT NULL UNIQUE
);

-- Movies
CREATE TABLE movies (
    movie_id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    genre VARCHAR(50) NOT NULL,
    duration INTEGER NOT NULL,
    rating VARCHAR(10) NOT NULL
);
-- Concessions
CREATE TABLE concessions (
    concession_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    description TEXT,
    price DECIMAL(5, 2) NOT NULL
);

-- Screening Times
CREATE TABLE screening_times (
    screening_time_id SERIAL PRIMARY KEY,
    movie_id INTEGER REFERENCES movies(movie_id),
    screening_time TIME NOT NULL
);

-- Tickets
CREATE TABLE tickets (
    ticket_id SERIAL PRIMARY KEY,
    customer_id INTEGER REFERENCES customers(customer_id),
    movie_id INTEGER REFERENCES movies(movie_id),
    screening_time_id INTEGER REFERENCES screening_times(screening_time_id),
    seat_number INTEGER NOT NULL,
    price DECIMAL(5, 2) NOT NULL
);




-- Customers
INSERT INTO customers (first_name, last_name, email, phone)
VALUES ('John', 'Doe', 'john.doe@example.com', '555-123-4567');

-- Movies
INSERT INTO movies (title, genre, duration, rating)
VALUES ('Movie Title', 'Action', 120, 'PG-13');

-- Concessions
INSERT INTO concessions (name, description, price)
VALUES ('Popcorn', 'Large popcorn', 5.50);

-- Screening Times
INSERT INTO screening_times (movie_id, screening_time)
VALUES (1, '14:00:00');

-- Tickets
INSERT INTO tickets (customer_id, movie_id, screening_time_id, seat_number, price)
VALUES (1, 1, 1, 10, 10.00);

