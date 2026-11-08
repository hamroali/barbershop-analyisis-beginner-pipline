USE BarbershopAnalyisis;
GO

CREATE SCHEMA bronze;
GO

CREATE SCHEMA staging;
GO

CREATE SCHEMA dw;
GO

SELECT OBJECT_ID('bronze.customer_raw');

CREATE TABLE bronze.customers_raw (
    customer_id      VARCHAR(50),
    first_name       VARCHAR(100),
    last_name        VARCHAR(50),
    phone_number     VARCHAR(50),
    email            VARCHAR(100),
    gender           VARCHAR(50),
    city             VARCHAR(50),
    provinse         VARCHAR(50),
    signup_date      VARCHAR(50),
    source_file_name VARCHAR(50),
    loaded_at        DATETIME2 DEFAULT GETDATE()
);
GO

CREATE TABLE bronze.payments_raw (
    payment_id       VARCHAR(50),
    booking_id       VARCHAR(50),
    payment_method   VARCHAR(50),
    payment_amount   VARCHAR(50),
    payment_status   VARCHAR(50),
    payment_datetime VARCHAR(50),
    source_file_name VARCHAR(200),
    loaded_at        DATETIME2 DEFAULT GETDATE()
);
GO

IF OBJECT_ID('bronze.services_raw', 'U') IS NOT NULL
    DROP TABLE bronze.services_raw;
GO

CREATE TABLE bronze.services_raw (
    service_code     VARCHAR(50),
    service_name     VARCHAR(200),
    category         VARCHAR(100),
    standard_price   VARCHAR(50),
    duration_minutes VARCHAR(50),
    source_file_name VARCHAR(200),
    loaded_at        DATETIME2 DEFAULT GETDATE()
);
GO

IF OBJECT_ID('bronze.bookings_raw', 'U') IS NOT NULL
    DROP TABLE bronze.bookings_raw;
GO

CREATE TABLE bronze.bookings_raw (
    booking_id       VARCHAR(50),
    customer_id      VARCHAR(50),
    barber_code      VARCHAR(50),
    service_code     VARCHAR(50),
    branch_code      VARCHAR(50),
    booking_datetime VARCHAR(50),
    booking_status   VARCHAR(50),
    booking_amount   VARCHAR(50),
    discount_amount  VARCHAR(50),
    tip_amount       VARCHAR(50),
    source_file_name VARCHAR(200),
    loaded_at        DATETIME2 DEFAULT GETDATE()
);
GO

CREATE TABLE bronze.branches_raw (
    branch_code      VARCHAR(50),
    branch_name      VARCHAR(200),
    province         VARCHAR(100),
    city             VARCHAR(100),
    suburb           VARCHAR(50),
    source_file_name VARCHAR(200),
    loaded_at        DATETIME2 DEFAULT GETDATE()
);
GO

CREATE TABLE bronze.barbers_raw (
    barber_code      VARCHAR(20),
    barber_name      VARCHAR(50),
    branch_code      VARCHAR(20),
    experience_level VARCHAR(20),
    hire_date        VARCHAR(20),
    source_file_name VARCHAR(200),
    loaded_at        DATETIME2 DEFAULT GETDATE()
);
GO