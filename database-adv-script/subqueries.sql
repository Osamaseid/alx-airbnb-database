-- Query to find properties with average rating > 4.0
SELECT property_id,
    name,
    description,
    pricepernight
FROM Property
WHERE property_id IN (
        SELECT property_id
        FROM Review
        GROUP BY property_id
        HAVING AVG(rating) > 4.0
    );
-- Query to find users with more than 3 bookings
SELECT user_id,
    first_name,
    last_name,
    email
FROM User
WHERE (
        SELECT COUNT(*)
        FROM Booking
        WHERE Booking.user_id = User.user_id
    ) > 3;