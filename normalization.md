# Normalization to Third Normal Form (3NF)

Normalization is a database design technique that minimizes redundancy and dependency by organizing fields and tables. The goal of achieving Third Normal Form (3NF) is to ensure that:

1. The database is in Second Normal Form (2NF).
2. All attributes are functionally dependent only on the primary key.

## Review of the Initial Schema

### Entities and Attributes

1. **User**
   - Attributes are well-defined and do not have transitive dependencies.
2. **Property**

   - Contains attributes that depend on the `host_id`, which is a foreign key. No transitive dependencies are present.

3. **Booking**

   - All attributes depend on `booking_id`, and there are no transitive dependencies.

4. **Payment**

   - All attributes depend solely on `payment_id`, with no transitive dependencies.

5. **Review**

   - Attributes depend on both `property_id` and `user_id`, and there are no transitive dependencies.

6. **Message**
   - All attributes depend on `message_id`, with no transitive dependencies.

### Potential Redundancies

Upon review, we did not find any immediate redundancies or violations of normalization principles in the initial schema. The attributes in each table are appropriately defined, and functional dependencies are clear.

However, we can consider the following adjustments to enhance clarity and maintainability:

## Adjustments for 3NF

While the schema is already in 3NF, we can refine certain aspects:

### 1. User Table

No changes needed, as all attributes are dependent only on the primary key.

### 2. Property Table

- **Location** can be normalized into a separate table to reduce redundancy if we anticipate multiple properties sharing the same location. This could also allow for easier management of location-based data (e.g., adding additional attributes like city, state, etc.).

#### New Location Table:

- **location_id**: Primary Key, UUID
- **location_name**: VARCHAR, NOT NULL

### Adjusted Property Table:

- **property_id**: Primary Key, UUID, Indexed
- **host_id**: Foreign Key, references User(user_id)
- **name**: VARCHAR, NOT NULL
- **description**: TEXT, NOT NULL
- **location_id**: Foreign Key, references Location(location_id)
- **pricepernight**: DECIMAL, NOT NULL
- **created_at**: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
- **updated_at**: TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP

### 3. Booking Table

No changes needed, as all attributes are dependent solely on `booking_id`.

### 4. Payment Table

No changes needed, as all attributes are dependent solely on `payment_id`.

### 5. Review Table

No changes needed, as all attributes are dependent on both `property_id` and `user_id`.

### 6. Message Table

No changes needed, as all attributes are dependent on `message_id`.

## Final Schema

After reviewing and applying the above adjustments, the final schema is as follows:

### User

- **user_id**: Primary Key, UUID, Indexed
- **first_name**: VARCHAR, NOT NULL
- **last_name**: VARCHAR, NOT NULL
- **email**: VARCHAR, UNIQUE, NOT NULL
- **password_hash**: VARCHAR, NOT NULL
- **phone_number**: VARCHAR, NULL
- **role**: ENUM (guest, host, admin), NOT NULL
- **created_at**: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

### Location

- **location_id**: Primary Key, UUID, Indexed
- **location_name**: VARCHAR, NOT NULL

### Property

- **property_id**: Primary Key, UUID, Indexed
- **host_id**: Foreign Key, references User(user_id)
- **name**: VARCHAR, NOT NULL
- **description**: TEXT, NOT NULL
- **location_id**: Foreign Key, references Location(location_id)
- **pricepernight**: DECIMAL, NOT NULL
- **created_at**: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
- **updated_at**: TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP

### Booking

- **booking_id**: Primary Key, UUID, Indexed
- **property_id**: Foreign Key, references Property(property_id)
- **user_id**: Foreign Key, references User(user_id)
- **start_date**: DATE, NOT NULL
- **end_date**: DATE, NOT NULL
- **total_price**: DECIMAL, NOT NULL
- **status**: ENUM (pending, confirmed, canceled), NOT NULL
- **created_at**: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

### Payment

- **payment_id**: Primary Key, UUID, Indexed
- **booking_id**: Foreign Key, references Booking(booking_id)
- **amount**: DECIMAL, NOT NULL
- **payment_date**: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
- **payment_method**: ENUM (credit_card, paypal, stripe), NOT NULL

### Review

- **review_id**: Primary Key, UUID, Indexed
- **property_id**: Foreign Key, references Property(property_id)
- **user_id**: Foreign Key, references User(user_id)
- **rating**: INTEGER, CHECK: rating >= 1 AND rating <= 5, NOT NULL
- **comment**: TEXT, NOT NULL
- **created_at**: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

### Message

- **message_id**: Primary Key, UUID, Indexed
- **sender_id**: Foreign Key, references User(user_id)
- **recipient_id**: Foreign Key, references User(user_id)
- **message_body**: TEXT, NOT NULL
- **sent_at**: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

## Conclusion

Through this normalization process, we established a separate **Location** table to eliminate potential redundancy in property locations while ensuring the remaining tables adhered to the principles of 3NF. The schema now effectively minimizes data duplication while maintaining clarity and integrity.
