-- database_index.sql

-- Create index on user_id in User table CREATE INDEX idx_user_id ON users(user_id);

-- Create index on email in User table CREATE INDEX idx_email ON users(email);

-- Create index on user_id in Booking table CREATE INDEX idx_booking_user_id ON bookings(user_id);

-- Create index on property_id in Booking table CREATE INDEX idx_booking_property_id ON bookings(property_id);

-- Create index on booking_date in Booking table CREATE INDEX idx_booking_date ON bookings(booking_date);

-- Create index on property_id in Property table CREATE INDEX idx_property_id ON properties(property_id);

-- Create index on location in Property table CREATE INDEX idx_location ON properties(location);

-- Create index on price in Property table CREATE INDEX idx_price ON properties(price);
