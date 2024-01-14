CREATE DATABASE minions;
USE minions;

CREATE TABLE minions(
    id INT AUTO_INCREMENT,
    name VARCHAR(80),
    age INT,
	
    PRIMARY KEY(id)
);

CREATE TABLE towns(
    town_id INT AUTO_INCREMENT,
    name VARCHAR(80),
	
    PRIMARY KEY(town_id)
);

ALTER TABLE towns 
DROP COLUMN town_id;

ALTER TABLE towns
ADD COLUMN id INT AUTO_INCREMENT PRIMARY KEY;

ALTER TABLE minions
ADD COLUMN town_id INT;

ALTER TABLE minions
ADD CONSTRAINT fk_town_id FOREIGN KEY (town_id) REFERENCES towns(id);

SET SQL_SAFE_UPDATES = 0;
UPDATE towns SET name = 'Sofia' WHERE name = 'SOFIA';

INSERT INTO towns(id, name) VALUE(1, 'Sofia');
INSERT INTO towns(id, name) VALUE(2, 'Plovdiv');
INSERT INTO towns(id, name) VALUE(3, 'Varna');

INSERT INTO minions(id, name, age, town_id) VALUES (1, 'Kevin', 22, 1);
INSERT INTO minions(id, name, age, town_id) VALUES (2, 'Bob', 15, 3);
INSERT INTO minions(id, name, age, town_id) VALUES (3, 'Steward',NULL, 2);

SELECT * FROM towns;
SELECT * FROM minions;

TRUNCATE TABLE minions;

DROP TABLE minions;
DROP TABLE towns;

CREATE TABLE people(
    id INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    picture BLOB,
    height DOUBLE(6,2),
    weight DOUBLE(6,2),
    gender CHAR(1) NOT NULL,
    birthdate DATE NOT NULL,
    biography BLOB
);

INSERT INTO people(name, picture,height,weight,gender,birthdate,biography) VALUES
('Vesko', 'test', 1.85, 80.5, 'm', '2003-12-14','test'),
('Ivan', 'test', 1.85, 80.5, 'm', '2003-12-14','test'),
('Ivo', 'test', 1.85, 80.5, 'm', '2003-12-14','test'),
('Pepi', 'test', 1.85, 80.5, 'f', '2003-12-14','test'),
('Deni', 'test', 1.85, 80.5, 'f', '2003-12-14','test');

SELECT * FROM people;

CREATE TABLE users(
id INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
username VARCHAR(30) NOT NULL,
password VARCHAR(26) NOT NULL,
profile_picture BLOB,
last_login_time DATETIME,
is_deleted BLOB
);

INSERT INTO users(username, password, profile_picture,last_login_time, is_deleted) VALUES
('Vesko1', '123', 'test', NOW(),false),
('Vesko2', '123', 'test', NOW(),false),
('Vesko3', '123', 'test', NOW(),true),
('Vesko4', '123', 'test', NOW(),false),
('Vesko5', '123', 'test', NOW(),true);

DROP TABLE users;
SELECT * FROM users;

ALTER TABLE users
DROP PRIMARY KEY,
ADD PRIMARY KEY(id, username);

ALTER TABLE users
CHANGE last_login_time last_login_time DATETIME DEFAULT NOW();


CREATE DATABASE car_rental;
USE car_rental;


CREATE TABLE categories (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    category VARCHAR(255) NOT NULL,
    daily_rate DOUBLE(6,2),
    weekly_rate DOUBLE(6,2),
    monthly_rate DOUBLE(6,2),
    weekend_rate DOUBLE(6,2)
);

INSERT INTO categories(category, daily_rate, weekly_rate, monthly_rate, weekend_rate) VALUES
('Bus', 1.2, 2.3,4.6,5.7),
('Car', 1.2, 2.3,4.6,5.7),
('SUV', 1.2, 2.3,4.6,5.7);



CREATE TABLE cars (
    id INT NOT NULL  AUTO_INCREMENT PRIMARY KEY,
    plate_number VARCHAR(30) NOT NULL UNIQUE,
    make VARCHAR(255) NOT NULL,
    model VARCHAR(255) NOT NULL,
    car_year DATE,
    category_id INT,
    doors INT,
    picture BLOB,
    car_condition VARCHAR(255),
    available BLOB
);

INSERT INTO cars (plate_number, make, model, car_year, category_id, doors, picture, car_condition, available) VALUES
('M2877SA','Seat','Leon','2005-01-02',2,5,'Test','BEST',true),
('M2847SA','Seat','Ibiza','2005-01-02',3,5,'Test','BEST',false),
('M2857SA','Volkswagen','Pasat','2005-01-02',2,5,'Test','BEST',true);


CREATE TABLE employees (
    id INT NOT NULL  AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    title VARCHAR(255) NOT NULL,
    notes TEXT
);

INSERT INTO employees(first_name,last_name, title, notes) VALUES
('Vesko','Vachkov','Lord','I love you'),
('Deni','Vachkov','Lord','love'),
('Pepi','Ivo','Lord','you');


CREATE TABLE customers (
    id INT NOT NULL  AUTO_INCREMENT PRIMARY KEY,
    driver_licence_number INT NOT NULL UNIQUE,
    full_name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    city VARCHAR(80),
    zip_code INT,
    notes TEXT
);

INSERT INTO customers(driver_licence_number, full_name, address, city, zip_code, notes) VALUES
(1234567,'VESELIN VACHKOV','Lulin','Sofia',3400,'TEST'),
(1234568,'IVAN VACHKOV','Lulin','Sofia',5233,'TEST'),
(1234569,'VESELIN VACHKOV','Mladost','Sofia',1800,'TEST');


CREATE TABLE rental_orders (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    employee_id INT NOT NULL,
    customer_id INT NOT NULL,
    car_id INT NOT NULL,
    car_condition VARCHAR(255),
    tank_level INT,
    kilometrage_start INT,
    kilometrage_end INT,
    total_kilometrage INT,
    start_date DATE,
    end_date DATE, 
    total_days INT,
    rate_applied DECIMAL(6,2),
    tax_rate DECIMAL(6,2), 
    order_status BOOLEAN,
    notes TEXT
);

INSERT INTO rental_orders(employee_id, customer_id, car_id, car_condition, tank_level, kilometrage_start, kilometrage_end, total_kilometrage, start_date, end_date, total_days, rate_applied, tax_rate, order_status, notes) VALUES
(1,1,1,'GOOD', 100, 1111,2222,3333,'2022-12-05','2022-12-06',1,1.2,2.2,true,'Fished'),
(2,2,2,'GOOD', 100, 1111,2222,3333,'2022-12-05','2022-12-06',1,1.2,2.2,true,'Fished'),
(3,3,3,'GOOD', 100, 1111,2222,3333,'2022-12-05','2022-12-06',1,1.2,2.2,true,'Fished');

