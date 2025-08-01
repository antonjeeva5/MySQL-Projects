CREATE DATABASE InventoryDB;
USE InventoryDB;

-- Table for product categories
CREATE TABLE Categories (
category_id INT AUTO_INCREMENT PRIMARY KEY,
category_name VARCHAR(255) NOT NULL UNIQUE
);

-- Table for Suppliers
CREATE TABLE Suppliers (
supplier_id INT AUTO_INCREMENT PRIMARY KEY,
supplier_name VARCHAR(255),
contact_name VARCHAR(255),
address TEXT,
phone VARCHAR(20),
email VARCHAR(255) UNIQUE
);

-- Table for Customers
CREATE TABLE Customers (
customer_id INT AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(255),
last_name VARCHAR(255),
email VARCHAR(255) UNIQUE
);

-- Table for Products
CREATE TABLE Products(
product_id INT AUTO_INCREMENT PRIMARY KEY,
sku VARCHAR(100) NOT NULL UNIQUE,
product_name VARCHAR(255),
description TEXT,
cost_price DECIMAL (10,2),
selling_price DECIMAL(10,2),
category_id INT,
FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

-- Table Product Supliers
CREATE TABLE Product_Supliers (
product_id INT,
supplier_id INT,
PRIMARY KEY (product_id, supplier_id),
FOREIGN KEY (product_id) REFERENCES Products (product_id),
FOREIGN KEY (supplier_id) REFERENCES Suppliers (supplier_id)
);

-- Table for Inventory
CREATE TABLE Inventory (
inventory_id INT AUTO_INCREMENT PRIMARY KEY,
product_id INT UNIQUE, -- each product has one inventory record
quantity INT NOT NULL DEFAULT 0,
last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
FOREIGN KEY (product_id) REFERENCES Products (product_id)
);

-- Table for Transactions
CREATE TABLE Transactions (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    transaction_type ENUM('sale', 'purchase') NOT NULL,
    quantity INT NOT NULL,
    price_at_transaction DECIMAL(10, 2) NOT NULL, -- Records the price for this specific transaction
    transaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    customer_id INT NULL, -- Null if it's a purchase
    supplier_id INT NULL, -- Null if it's a sale
    FOREIGN KEY (product_id) REFERENCES Products(product_id),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id)
);

-- Inserting Data into product categories Table
INSERT INTO categories (category_name) VALUES
('Electronics'),
('Office supplies'),
('Furniture'),
('Peripherals');

-- Inserting Data into Suppliers Table
INSERT INTO Suppliers (supplier_name, contact_name, address, phone, email) VALUES
('tech-supply co.' ,'john smith', '123 Tech Park, Silicon Valley, CA', '111-222-3333', 'contact@techsupply.com'),
('office-first inc.', 'jane doe', '456 Business Blvd, New York, NY', '444-555-6666', 'sales@officefirst.com'),
('furnish-all ltd.', 'Peter Jones', '789 Design District, Miami, FL', '777-888-9999', 'support@furnishall.com');

-- Inserting Data into Customers Table
INSERT INTO Customers ( first_name, last_name, email) VALUES
('michael', 'brown', 'michael.brown@email.com'),
('sarah', 'davis', 'sarah.davis@email.com'),
('emily', 'Clark', 'emily.clark@email.com'),
('David', 'Rodriguez', 'david.r@email.com'),
('Jessica', 'Lee', 'jess.lee@email.com');

-- Inserting Data into Products Table
INSERT INTO Products (sku, product_name, description, cost_price, selling_price, category_id) VALUES
('ELEC-001', 'Laptop Pro 15"', 'A high-performance laptop.', 800.00, 1200.00, 1),
('ELEC-002', 'Wireless Mouse', 'Ergonomic wireless mouse.', 15.00, 25.00, 1),
('OFF-001', 'A4 Printer Paper', 'Pack of 500 sheets.', 5.00, 10.00, 2),
('FURN-001', 'Ergonomic Office Chair', 'A comfortable and supportive chair.', 150.00, 250.00, 3),
('PERI-001', '24" 4K Monitor', 'A high-resolution monitor for professionals.', 250.00, 400.00, 4),
('OFF-002', 'Stapler', 'A heavy-duty office stapler.', 8.00, 15.00, 2);

-- Inserting Data into Product Suppliers Table
INSERT INTO Product_Supliers (product_id, supplier_id) VALUES
(1,1),
(2,1),
(3,2),
(4,2),
(4,3),
(5,1),
(6,2);

-- Inserting Data into Inventory Table
INSERT INTO Inventory(product_id, quantity) VALUES
(1, 50),
(2, 200),
(3, 1000),
(4, 75),
(5, 40),
(6, 300);

-- Inserting Data into Transactions Table
INSERT INTO Transactions(product_id, transaction_type, quantity, price_at_transaction, transaction_date, customer_id, supplier_id) VALUES
(1, 'purchase', 10, 800.00, NULL,  NULL, 1),
(2, 'sale', 2, 25.00, NULL, 1, NULL),
(4, 'sale', 1, 250.00, NULL, 2, NULL),
(3, 'purchase', 500, 4.50, '2024-11-15 10:30:00', NULL, 2),
(5, 'purchase', 20, 250.00, '2025-01-20 14:00:00', NULL, 1),
(6, 'purchase', 150, 7.50, '2025-02-10 11:00:00', NULL, 2),
(1, 'sale', 1, 1200.00, '2025-03-05 13:45:00', 3, NULL),
(3, 'sale', 10, 10.00, '2025-04-12 09:30:00', 4, NULL), 
(2, 'sale', 2, 25.00, '2025-05-21 16:00:00', 1, NULL),
(5, 'sale', 1, 400.00, '2025-06-10 10:00:00', 3, NULL), 
(1, 'sale', 2, 1150.00, '2025-07-15 11:30:00', 2, NULL);


SELECT * FROM transactions;
DESC transactions;


