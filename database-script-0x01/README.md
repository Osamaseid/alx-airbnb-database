# AirBnB Database Schema

## Overview

This README provides a summary of the AirBnB database schema, which supports an online rental platform where users can book properties, make payments, and leave reviews.

## Entities

1. **User**

   - Attributes: `user_id`, `first_name`, `last_name`, `email`, `password_hash`, `phone_number`, `role`, `created_at`

2. **Location**

   - Attributes: `location_id`, `location_name`

3. **Property**

   - Attributes: `property_id`, `host_id`, `name`, `description`, `location_id`, `pricepernight`, `created_at`, `updated_at`

4. **Booking**

   - Attributes: `booking_id`, `property_id`, `user_id`, `start_date`, `end_date`, `total_price`, `status`, `created_at`

5. **Payment**

   - Attributes: `payment_id`, `booking_id`, `amount`, `payment_date`, `payment_method`

6. **Review**

   - Attributes: `review_id`, `property_id`, `user_id`, `rating`, `comment`, `created_at`

7. **Message**
   - Attributes: `message_id`, `sender_id`, `recipient_id`, `message_body`, `sent_at`

## Normalization

The schema is designed to be in Third Normal Form (3NF), eliminating redundancy and ensuring data integrity.

## SQL Schema Definition

The SQL statements for creating the tables are included in the documentation, establishing relationships through foreign keys and ensuring proper indexing for performance optimization.

## Conclusion

This database schema provides a solid foundation for developing a rental platform, focusing on data integrity and efficient data retrieval.
