-- Sample Data for User Table
INSERT INTO User (
        user_id,
        first_name,
        last_name,
        email,
        password_hash,
        phone_number,
        role
    )
VALUES (
        UUID(),
        'Alice',
        'Smith',
        'alice.smith@example.com',
        'hashed_password1',
        '123-456-7890',
        'guest'
    ),
    (
        UUID(),
        'Bob',
        'Johnson',
        'bob.johnson@example.com',
        'hashed_password2',
        '234-567-8901',
        'host'
    ),
    (
        UUID(),
        'Carol',
        'Williams',
        'carol.williams@example.com',
        'hashed_password3',
        NULL,
        'admin'
    ),
    (
        UUID(),
        'Dave',
        'Brown',
        'dave.brown@example.com',
        'hashed_password4',
        '345-678-9012',
        'guest'
    ),
    (
        UUID(),
        'Eve',
        'Davis',
        'eve.davis@example.com',
        'hashed_password5',
        '456-789-0123',
        'host'
    );
-- Sample Data for Location Table
INSERT INTO Location (location_id, location_name)
VALUES (UUID(), 'New York, NY'),
    (UUID(), 'Los Angeles, CA'),
    (UUID(), 'Chicago, IL'),
    (UUID(), 'Houston, TX'),
    (UUID(), 'Miami, FL');
-- Sample Data for Property Table
INSERT INTO Property (
        property_id,
        host_id,
        name,
        description,
        location_id,
        pricepernight,
        created_at,
        updated_at
    )
VALUES (
        UUID(),
        (
            SELECT user_id
            FROM User
            WHERE first_name = 'Bob'
        ),
        'Cozy Apartment in NYC',
        'A lovely apartment in the heart of New York City.',
        (
            SELECT location_id
            FROM Location
            WHERE location_name = 'New York, NY'
        ),
        150.00,
        NOW(),
        NOW()
    ),
    (
        UUID(),
        (
            SELECT user_id
            FROM User
            WHERE first_name = 'Eve'
        ),
        'Hollywood Hills Retreat',
        'Enjoy stunning views in this luxurious retreat.',
        (
            SELECT location_id
            FROM Location
            WHERE location_name = 'Los Angeles, CA'
        ),
        300.00,
        NOW(),
        NOW()
    ),
    (
        UUID(),
        (
            SELECT user_id
            FROM User
            WHERE first_name = 'Bob'
        ),
        'Chicago Studio',
        'Charming studio apartment near downtown.',
        (
            SELECT location_id
            FROM Location
            WHERE location_name = 'Chicago, IL'
        ),
        120.00,
        NOW(),
        NOW()
    ),
    (
        UUID(),
        (
            SELECT user_id
            FROM User
            WHERE first_name = 'Eve'
        ),
        'Houston Family Home',
        'Spacious home perfect for families.',
        (
            SELECT location_id
            FROM Location
            WHERE location_name = 'Houston, TX'
        ),
        200.00,
        NOW(),
        NOW()
    );
-- Sample Data for Booking Table
INSERT INTO Booking (
        booking_id,
        property_id,
        user_id,
        start_date,
        end_date,
        total_price,
        status,
        created_at
    )
VALUES (
        UUID(),
        (
            SELECT property_id
            FROM Property
            WHERE name = 'Cozy Apartment in NYC'
        ),
        (
            SELECT user_id
            FROM User
            WHERE first_name = 'Alice'
        ),
        '2024-12-01',
        '2024-12-05',
        600.00,
        'confirmed',
        NOW()
    ),
    (
        UUID(),
        (
            SELECT property_id
            FROM Property
            WHERE name = 'Hollywood Hills Retreat'
        ),
        (
            SELECT user_id
            FROM User
            WHERE first_name = 'Dave'
        ),
        '2024-12-10',
        '2024-12-15',
        1500.00,
        'pending',
        NOW()
    ),
    (
        UUID(),
        (
            SELECT property_id
            FROM Property
            WHERE name = 'Chicago Studio'
        ),
        (
            SELECT user_id
            FROM User
            WHERE first_name = 'Alice'
        ),
        '2024-11-20',
        '2024-11-25',
        600.00,
        'confirmed',
        NOW()
    );
-- Sample Data for Payment Table
INSERT INTO Payment (
        payment_id,
        booking_id,
        amount,
        payment_date,
        payment_method
    )
VALUES (
        UUID(),
        (
            SELECT booking_id
            FROM Booking
            WHERE user_id = (
                    SELECT user_id
                    FROM User
                    WHERE first_name = 'Alice'
                )
                AND status = 'confirmed'
        ),
        600.00,
        NOW(),
        'credit_card'
    ),
    (
        UUID(),
        (
            SELECT booking_id
            FROM Booking
            WHERE user_id = (
                    SELECT user_id
                    FROM User
                    WHERE first_name = 'Dave'
                )
                AND status = 'pending'
        ),
        1500.00,
        NOW(),
        'paypal'
    );
-- Sample Data for Review Table
INSERT INTO Review (
        review_id,
        property_id,
        user_id,
        rating,
        comment,
        created_at
    )
VALUES (
        UUID(),
        (
            SELECT property_id
            FROM Property
            WHERE name = 'Cozy Apartment in NYC'
        ),
        (
            SELECT user_id
            FROM User
            WHERE first_name = 'Alice'
        ),
        5,
        'Amazing stay! Highly recommend.',
        NOW()
    ),
    (
        UUID(),
        (
            SELECT property_id
            FROM Property
            WHERE name = 'Hollywood Hills Retreat'
        ),
        (
            SELECT user_id
            FROM User
            WHERE first_name = 'Dave'
        ),
        4,
        'Great views but a bit pricey.',
        NOW()
    );
-- Sample Data for Message Table
INSERT INTO Message (
        message_id,
        sender_id,
        recipient_id,
        message_body,
        sent_at
    )
VALUES (
        UUID(),
        (
            SELECT user_id
            FROM User
            WHERE first_name = 'Alice'
        ),
        (
            SELECT user_id
            FROM User
            WHERE first_name = 'Bob'
        ),
        'Can I check in early?',
        NOW()
    ),
    (
        UUID(),
        (
            SELECT user_id
            FROM User
            WHERE first_name = 'Bob'
        ),
        (
            SELECT user_id
            FROM User
            WHERE first_name = 'Alice'
        ),
        'Sure! Just let me know your arrival time.',
        NOW()
    );