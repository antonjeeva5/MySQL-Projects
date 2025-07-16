-- Create Database
CREATE DATABASE Investment;
USE Investment;

-- Create Assets table (Stores information about each asset)
CREATE TABLE Assets (
asset_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(255) NOT NULL,
type VARCHAR(100) NOT NULL,
ticker VARCHAR(20),
sector VARCHAR(100),
is_active BOOLEAN DEFAULT TRUE
);

-- Create Transactions table (Tracks buy/sell transactions for each asset)
CREATE TABLE Transactions (
txn_id INT AUTO_INCREMENT PRIMARY KEY,
asset_id INT,
txn_date DATE,
txn_type VARCHAR(10),
quanity DECIMAL(12,2),
price_per_unit DECIMAL(12,2),
fees DECIMAL(10,2),
FOREIGN KEY (asset_id) REFERENCES Assets(asset_id)
);

-- Create Accounts table
CREATE TABLE Accounts(
account_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(255) NOT NULL,
type VARCHAR(50),
opened_date date
);

-- Create Holdings table
CREATE TABLE Holdings(
holding_id INT AUTO_INCREMENT PRIMARY KEY,
account_id INT,
asset_id INT,
quantity DECIMAL(12,2),
FOREIGN KEY (account_id) REFERENCES Accounts(account_id),
FOREIGN KEY (asset_id) REFERENCES Assets(asset_id)
);

-- Insert records into the Assets table
INSERT INTO Assets (name, type, ticker, sector) VALUES
('Apple Inc', 'Stock', 'AAPL', 'Technology'),
('Vanguard S&P 500 ETF', 'ETF', 'VOO', 'Index Fund'),
('Bitcoin', 'Crypto', 'BTC', 'Cryptocurrency'),
('US Trasury Bond', 'Bond', 'USTB', 'Government');

-- Insert records into the Accounts table
INSERT INTO Accounts (name, type, opened_date) VALUES
('Robinhood', 'Brokerage', '2021-01-10'),
('Coinbase', 'Crypto Exachange', '2022-03-15');

-- Insert records into the Transactions table
INSERT INTO Transactions (asset_id, txn_date, txn_type, quantity, price_per_unit, fees) VALUES
(1, '2024-01-15', 'BUY', 10, 170.50,1.00),
(2, '2024-02-10', 'BUY', 5, 400.00, 0.50),
(3, '2024-03-01', 'BUY', 0.1, 45000.00, 10.00),
(1, '2024-06-01', 'SELL', 5, 190.00, 1.00);

-- Insert records into the Holdings table
INSERT INTO Holdings (account_id, asset_id, quantity) VALUES
(1, 1, 5),
(1, 2, 5),
(2, 3, 0.1);

SELECT * FROM Assets;
DESC Transactions;
ALTER TABLE Transactions RENAME column quanity TO quantity;





