DROP TABLE IF EXISTS Person;
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Inventory;
DROP TABLE IF EXISTS `Order`;
DROP TABLE IF EXISTS OrderInventory;

CREATE TABLE Person (
    person_id BIGINT PRIMARY KEY,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    phone_number CHAR(10) NOT NULL,
    email VARCHAR(100) NOT NULL
);

CREATE TABLE Employee (
    person_id BIGINT PRIMARY KEY,
    hire_date DATE NOT NULL,
    hourly_wage DECIMAL(5, 2) NOT NULL,
    CONSTRAINT fk_employee_person FOREIGN KEY (person_id) REFERENCES Person(person_id)
);

CREATE TABLE Inventory (
    inventory_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    wholesale_price NUMERIC NOT NULL,
    sale_price NUMERIC NOT NULL,
    category TEXT NOT NULL CHECK (category IN ('Video Game', 'Board Game', 'Console', 'Accessory', 'Collectible')),
    quantity INTEGER NOT NULL
);

CREATE TABLE "Order" (
    order_id INTEGER PRIMARY KEY,
    person_id INTEGER NOT NULL,
    method_of_payment TEXT NOT NULL CHECK (method_of_payment IN ('Cash', 'Credit Card', 'Debit Card', 'Store Credit', 'Gift Card')),
    FOREIGN KEY (person_id) REFERENCES Person(person_id)
);

CREATE TABLE OrderInventory (
    order_id INTEGER NOT NULL,
    inventory_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL,
    price_at_sale NUMERIC NOT NULL,
    PRIMARY KEY (order_id, inventory_id),
    FOREIGN KEY (order_id) REFERENCES "Order"(order_id),
    FOREIGN KEY (inventory_id) REFERENCES Inventory(inventory_id)
);

INSERT INTO Person (person_id, first_name, last_name, phone_number, email) VALUES
(1, 'Marcus', 'Fenix', '5550101001', 'mfenix@example.com'),
(2, 'Lara', 'Croft', '5550101002', 'lcroft@example.com'),
(3, 'Gordon', 'Freeman', '5550101003', 'gfreeman@example.com'),
(4, 'Jill', 'Valentine', '5550101004', 'jvalentine@example.com'),
(5, 'Arthur', 'Morgan', '5550101005', 'amorgan@example.com'),
(6, 'Nathan', 'Drake', '5550101006', 'ndrake@example.com'),
(7, 'Claire', 'Redfield', '5550101007', 'credfield@example.com'),
(8, 'Solid', 'Snake', '5550101008', 'ssnake@example.com'),
(9, 'Samus', 'Aran', '5550101009', 'saran@example.com'),
(10, 'Cloud', 'Strife', '5550101010', 'cstrife@example.com'),
(11, 'Aerith', 'Gainsborough', '5550101011', 'aerith@example.com'),
(12, 'Leon', 'Kennedy', '5550101012', 'lkennedy@example.com'),
(13, 'Geralt', 'Rivia', '5550101013', 'grivia@example.com'),
(14, 'Yennefer', 'Vengerberg', '5550101014', 'yvengerberg@example.com'),
(15, 'Peter', 'Parker', '5550101015', 'pparker@example.com'),
(16, 'Miles', 'Morales', '5550101016', 'mmorales@example.com'),
(17, 'Ellie', 'Williams', '5550101017', 'ewilliams@example.com'),
(18, 'Joel', 'Miller', '5550101018', 'jmiller@example.com'),
(19, 'Kratos', 'Spartan', '5550101019', 'kratos@example.com'),
(20, 'Atreus', 'Laufey', '5550101020', 'atreus@example.com');

INSERT INTO Employee (person_id, hire_date, hourly_wage) VALUES
(1, '2021-03-15', 22.50),
(2, '2021-06-01', 19.00),
(3, '2022-01-10', 21.00),
(4, '2022-05-18', 18.50),
(5, '2022-11-01', 17.75),
(6, '2023-02-14', 16.50),
(7, '2023-04-20', 16.50),
(8, '2023-08-01', 18.00),
(9, '2024-01-15', 17.25),
(10, '2024-06-10', 16.00);

INSERT INTO Inventory (inventory_id, name, wholesale_price, sale_price, category, quantity) VALUES
(101, 'The Legend of Zelda: Tears of the Kingdom', 45.00, 69.99, 'Video Game', 40),
(102, 'Elden Ring', 35.00, 59.99, 'Video Game', 30),
(103, 'Cyberpunk 2077', 25.00, 49.99, 'Video Game', 25),
(104, 'Super Mario Odyssey', 35.00, 59.99, 'Video Game', 50),
(105, 'PlayStation 5 Console', 420.00, 499.99, 'Console', 12),
(106, 'Xbox Series X Console', 410.00, 499.99, 'Console', 10),
(107, 'Nintendo Switch OLED', 280.00, 349.99, 'Console', 18),
(108, 'DualSense Wireless Controller', 45.00, 69.99, 'Accessory', 35),
(109, 'Xbox Wireless Controller', 40.00, 59.99, 'Accessory', 30),
(110, 'Gaming Headset Pro', 50.00, 89.99, 'Accessory', 22),
(111, 'Catan', 28.00, 44.99, 'Board Game', 15),
(112, 'Ticket to Ride', 30.00, 49.99, 'Board Game', 20),
(113, 'Gloomhaven', 85.00, 139.99, 'Board Game', 8),
(114, 'Charizard Collector Figurine', 15.00, 29.99, 'Collectible', 45),
(115, 'Master Chief Vinyl Statue', 20.00, 39.99, 'Collectible', 25);

INSERT INTO `Order` (order_id, person_id, method_of_payment) VALUES
(1001, 6, 'Credit Card'),
(1002, 7, 'Debit Card'),
(1003, 8, 'Cash'),
(1004, 9, 'Credit Card'),
(1005, 10, 'Store Credit'),
(1006, 11, 'Debit Card'),
(1007, 12, 'Credit Card'),
(1008, 13, 'Cash'),
(1009, 14, 'Gift Card'),
(1010, 15, 'Credit Card'),
(1011, 16, 'Debit Card'),
(1012, 17, 'Cash'),
(1013, 18, 'Credit Card'),
(1014, 19, 'Store Credit'),
(1015, 20, 'Debit Card'),
(1016, 6, 'Credit Card'),
(1017, 8, 'Credit Card'),
(1018, 10, 'Debit Card'),
(1019, 12, 'Cash'),
(1020, 14, 'Credit Card'),
(1021, 16, 'Gift Card'),
(1022, 18, 'Debit Card'),
(1023, 20, 'Cash'),
(1024, 7, 'Store Credit'),
(1025, 9, 'Credit Card'),
(1026, 11, 'Debit Card'),
(1027, 13, 'Credit Card'),
(1028, 15, 'Cash'),
(1029, 17, 'Debit Card'),
(1030, 19, 'Credit Card');

INSERT INTO OrderInventory (order_id, inventory_id, quantity, price_at_sale) VALUES
(1001, 105, 1, 499.99),
(1001, 108, 1, 69.99),
(1002, 101, 1, 69.99),
(1003, 111, 1, 44.99),
(1004, 107, 1, 349.99),
(1004, 104, 1, 59.99),
(1005, 102, 1, 59.99),
(1006, 109, 2, 59.99),
(1007, 106, 1, 499.99),
(1007, 103, 1, 49.99),
(1008, 114, 2, 29.99),
(1009, 112, 1, 49.99),
(1010, 101, 1, 69.99),
(1010, 108, 1, 69.99),
(1011, 110, 1, 89.99),
(1012, 113, 1, 139.99),
(1013, 115, 1, 39.99),
(1014, 102, 1, 59.99),
(1014, 103, 1, 49.99),
(1015, 104, 1, 59.99),
(1016, 101, 1, 69.99),
(1016, 102, 1, 59.99),
(1016, 108, 1, 69.99),
(1017, 105, 1, 499.99),
(1017, 110, 1, 89.99),
(1018, 103, 1, 49.99),
(1018, 104, 1, 59.99),
(1019, 111, 1, 44.99),
(1019, 112, 1, 49.99),
(1019, 114, 2, 29.99),
(1020, 106, 1, 499.99),
(1020, 109, 2, 59.99),
(1021, 115, 1, 39.99),
(1021, 114, 1, 29.99),
(1022, 107, 1, 349.99),
(1022, 101, 1, 69.99),
(1022, 104, 1, 59.99),
(1023, 113, 1, 139.99),
(1024, 102, 1, 59.99),
(1024, 108, 1, 69.99),
(1025, 105, 1, 499.99),
(1025, 101, 1, 69.99),
(1025, 110, 1, 89.99),
(1026, 103, 1, 49.99),
(1026, 112, 1, 49.99),
(1027, 107, 1, 349.99),
(1027, 108, 1, 69.99),
(1027, 115, 2, 39.99),
(1028, 109, 1, 59.99),
(1028, 110, 1, 89.99),
(1029, 111, 2, 44.99),
(1029, 113, 1, 139.99),
(1030, 106, 1, 499.99),
(1030, 102, 1, 59.99),
(1030, 109, 1, 59.99);