-- INNER JOIN: Bookings and respective users
SELECT Booking.booking_id,
    Booking.property_id,
    Booking.start_date,
    Booking.end_date,
    Booking.total_price,
    Booking.status,
    User.user_id,
    User.first_name,
    User.last_name,
    User.email
FROM Booking
    INNER JOIN User ON Booking.user_id = User.user_id;
-- LEFT JOIN: Properties and their reviews
SELECT Property.property_id,
    Property.name AS property_name,
    Property.description,
    Property.pricepernight,
    Review.review_id,
    Review.rating,
    Review.comment
FROM Property
    LEFT JOIN Review ON Property.property_id = Review.property_id;