# Index Performance Analysis

## Overview

This document outlines the indexes created to improve query performance on the Airbnb database. It also measures the performance of specific queries before and after the indexes were added.

## Identified High-Usage Columns

- **User Table**: `user_id`, `email`
- **Booking Table**: `booking_id`, `user_id`, `property_id`, `start_date`, `end_date`
- **Property Table**: `property_id`, `location`, `name`

## Created Indexes

```sql
-- User Table
CREATE INDEX idx_user_email ON User(email);
CREATE INDEX idx_user_id ON User(user_id);

-- Booking Table
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_booking_start_date ON Booking(start_date);
CREATE INDEX idx_booking_end_date ON Booking(end_date);


-- Property Table
CREATE INDEX idx_property_id ON Property(property_id);
CREATE INDEX idx_property_location ON Property(location);
CREATE INDEX idx_property_name ON Property(name);
```
