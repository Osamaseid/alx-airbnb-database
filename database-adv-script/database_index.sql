USE airbnb;
USE airbnb;
EXPLAIN
SELECT *
FROM Booking
WHERE user_id = "1e2d3c4b-5a6f-7e8d-9c0b-1a2b3c4d5e6f";
-- Indexes for User table
CREATE INDEX idx_user_id ON User(user_id);
-- Indexes for Booking table
CREATE INDEX booking_user_id ON Booking(user_id);
CREATE INDEX booking_property_id ON Booking(property_id);
CREATE INDEX booking_date ON Booking(booking_date);
-- Indexes for Property table
CREATE INDEX idx_property_id ON Property(property_id);
EXPLAIN ANALYZE
SELECT *
FROM Booking
WHERE user_id = "1e2d3c4b-5a6f-7e8d-9c0b-1a2b3c4d5e6f";
ANALYZE
SELECT *
FROM Booking
WHERE user_id = "1e2d3c4b-5a6f-7e8d-9c0b-1a2b3c4d5e6f";