CREATE DATABASE IF NOT EXISTS ecommerce_customer_analytics;
USE ecommerce_customer_analytics;
DROP TABLE IF EXISTS customer_feedback, orders, products, customers;

CREATE TABLE customers (
 customer_id INT PRIMARY KEY, customer_name VARCHAR(100),
 email VARCHAR(100), city VARCHAR(50), signup_date DATE,
 phone VARCHAR(15), age INT, gender VARCHAR(10),
 membership_type VARCHAR(20), total_orders INT
);
CREATE TABLE products (
 product_id INT PRIMARY KEY, product_name VARCHAR(100),
 category VARCHAR(50), price DECIMAL(10,2), stock_quantity INT
);
CREATE TABLE orders (
 order_id INT PRIMARY KEY, customer_id INT, product_id INT,
 order_date DATE, quantity INT, total_amount DECIMAL(10,2),
 payment_method VARCHAR(20), order_status VARCHAR(20),
 FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
 FOREIGN KEY (product_id) REFERENCES products(product_id)
);
CREATE TABLE customer_feedback (
 feedback_id INT PRIMARY KEY, customer_id INT,
 rating INT, feedback_text VARCHAR(255), feedback_date DATE,
 FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO customers VALUES
(1,'Aarav Sharma','aarav@gmail.com','Jaipur','2024-01-15','9876543210',28,'Male','Gold',12),
(2,'Priya Verma','priya@gmail.com','Delhi','2024-02-20','9876543211',25,'Female','Platinum',18),
(3,'Rohan Singh','rohan@gmail.com','Mumbai','2024-03-10','9876543212',32,'Male','Silver',5),
(4,'Neha Gupta','neha@gmail.com','Jaipur','2024-04-05','9876543213',27,'Female','Gold',15),
(5,'Aman Patel','aman@gmail.com','Pune','2024-05-12','9876543214',30,'Male','Silver',4),
(6,'Sneha Rao','sneha@gmail.com','Bangalore','2024-06-18','9876543215',26,'Female','Gold',9),
(7,'Vikash Kumar','vikash@gmail.com','Delhi','2024-07-22','9876543216',29,'Male','Bronze',2),
(8,'Anjali Mehta','anjali@gmail.com','Mumbai','2024-08-10','9876543217',24,'Female','Platinum',20),
(9,'Karan Jain','karan@gmail.com','Jaipur','2024-09-15','9876543218',31,'Male','Gold',11),
(10,'Pooja Yadav','pooja@gmail.com','Pune','2024-10-01','9876543219',28,'Female','Silver',6);

INSERT INTO products VALUES
(1,'iPhone 15','Electronics',79999,50),(2,'Nike Shoes','Fashion',5999,120),
(3,'Levi Jeans','Fashion',3499,80),(4,'MacBook Air M2','Electronics',110000,25),
(5,'Kitchen Mixer','Home Appliances',4500,60),(6,'Boat Headphones','Electronics',1999,200),
(7,'Adidas T-Shirt','Fashion',1299,150),(8,'Sofa Set','Furniture',35000,10),
(9,'Microwave Oven','Home Appliances',8500,30),(10,'Watch Titan','Accessories',3999,90);

INSERT INTO orders VALUES
(101,1,6,'2025-02-10',1,1999,'UPI','Delivered'),(102,1,2,'2025-03-12',1,5999,'Credit Card','Delivered'),
(103,2,1,'2025-03-15',1,79999,'EMI','Shipped'),(104,2,7,'2025-04-01',2,2598,'UPI','Delivered'),
(105,3,4,'2025-04-05',1,110000,'Credit Card','Delivered'),(106,4,9,'2025-05-01',1,8500,'Debit Card','Delivered'),
(107,1,10,'2025-05-10',1,3999,'UPI','Delivered'),(108,2,5,'2025-05-18',1,4500,'COD','Pending');

INSERT INTO customer_feedback VALUES
(1,1,5,'Great service and fast delivery','2025-03-20'),(2,2,4,'Product good but delivery late','2025-04-02'),
(3,3,5,'Excellent quality','2025-05-01'),(4,4,3,'Average experience','2025-06-10');
SELECT * FROM customers;