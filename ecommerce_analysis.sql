
-- Customers Table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50),
    email VARCHAR(100)
);

-- Products Table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

-- Orders Table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    quantity INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Insert Customers
INSERT INTO customers VALUES
(1,'Pavan Kumar','Hyderabad','Telangana','pavan@example.com'),
(2,'Rohit Sharma','Mumbai','Maharashtra','rohit@example.com'),
(3,'Anjali Verma','Pune','Maharashtra','anjali@example.com');

-- Insert Products
INSERT INTO products VALUES
(101,'Laptop','Electronics',55000),
(102,'Keyboard','Electronics',1500),
(103,'Office Chair','Furniture',7000);

-- Insert Orders
INSERT INTO orders VALUES
(201,1,101,1,'2024-02-10'),
(202,2,102,2,'2024-02-15'),
(203,3,103,1,'2024-03-01'),
(204,1,102,3,'2024-03-05');

-- JOIN Example
SELECT o.order_id, c.customer_name, p.product_name, o.quantity
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN products p ON o.product_id = p.product_id;
