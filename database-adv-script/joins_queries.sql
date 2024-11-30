-- Query 1: Retrieve all bookings and the respective users who made those bookings using INNER JOIN
SELECT b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    u.first_name,
    u.last_name,
    u.email
FROM Booking b
    INNER JOIN User u ON b.user_id = u.user_id;
-- Query 2: Retrieve all properties and their reviews, including properties that have no reviews using LEFT JOIN
SELECT p.property_id,
    p.name AS property_name,
    p.description,
    r.rating,
    r.comment
FROM Property p
    LEFT JOIN Review r ON p.property_id = r.property_id;
-- Query 3: Retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user using FULL OUTER JOIN
SELECT u.user_id,
    u.first_name,
    u.last_name,
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price
FROM User u
    FULL OUTER JOIN Booking b ON u.user_id = b.user_id;