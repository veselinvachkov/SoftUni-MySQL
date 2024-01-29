CREATE SCHEMA oneline_store;

CREATE TABLE item_types (
    item_type_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) UNIQUE
);


CREATE TABLE items (
    item_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    item_type_id INT,
    CONSTRAINT fk_items_types
    FOREIGN KEY (item_type_id)
    REFERENCES item_types(item_type_id)
);

CREATE TABLE order_items (
    order_id INT,
    item_id INT,
    
    CONSTRAINT fk_items_orders
    FOREIGN KEY (order_id)
    REFERENCES orders(order_id),
    CONSTRAINT fk_items
    FOREIGN KEY (item_id)
    REFERENCES items(item_id)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    CONSTRAINT fk_customers_orders
    FOREIGN KEY (customer_id)
    REFERENCES customers(customer_id)
);

CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    birthday DATE,
    city_id INT,
    CONSTRAINT fk_customers_cities
    FOREIGN KEY (city_id)
    REFERENCES cities(city_id)
);


CREATE TABLE cities (
    city_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50)
);



CREATE SCHEMA university;
USE university;

CREATE TABLE majors (
    major_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) UNIQUE
);

CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    student_number VARCHAR(12),
    student_name VARCHAR(50),
    major_id INT,
    
    CONSTRAINT fk_major_id_majors
    FOREIGN KEY (major_id)
    REFERENCES majors(major_id)
);

CREATE TABLE payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    payment_date DATE,
    payment_amount DECIMAL(8,2),
    student_id INT,
    
    CONSTRAINT fk_student_id_students
    FOREIGN KEY (student_id)
    REFERENCES students(student_id)
);

CREATE TABLE subjects (
    subject_id INT PRIMARY KEY AUTO_INCREMENT,
    subject_name VARCHAR(50)
);

CREATE TABLE agenda (
    student_id INT,
    subject_id INT,
    
    PRIMARY KEY(student_id, subject_id),
    
    CONSTRAINT fk_agenda_student_id_students 
    FOREIGN KEY (student_id)
    REFERENCES students (student_id),
    
    CONSTRAINT fk_agenda_subject_id_subjects 
    FOREIGN KEY (subject_id)
    REFERENCES subjects (subject_id)
);


USE geography;
SELECT m.mountain_range, p.peak_name, p.elevation FROM peaks p
JOIN mountains m
ON p.mountain_id = m.id
WHERE m.mountain_range = 'Rila'
ORDER BY p.elevation DESC;

