-- สร้าง table ลูกค้า
CREATE TABLE customer (
    customer_id INT PRIMARY KEY, -- ห้ามเป็น NULL เพราะเป็น PRIMARY KEY
    name VARCHAR(100) NOT NULL,   -- ห้ามเป็น NULL (ต้องมีชื่อ)
    email VARCHAR(100) UNIQUE  -- ว่างไว้ได้และทำให้ email ห้ามซ้ำกัน
);

--สร้าง table คำสั่งซื้อ
CREATE TABLE orders (
    order_id INT PRIMARY KEY, -- ห้ามเป็น NULL เพราะเป็น PRIMARY KEY
    customer_id INT,-- ว่างไว้ได้เผื่อเป็น order ที่ สั่งโดยลูกค้าที่ไม่เป็นสมาชิก
    order_date DATE NOT NULL,      -- ต้องมีวันที่สั่งซื้อ
    amount DECIMAL(10,2) NOT NULL, -- ต้องมีจำนวนเงิน (ห้ามเว้นว่าง)
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

-- ใส่ข้อมูลลูกค้า
INSERT INTO customer (customer_id, name, email) VALUES
(1, 'Alice Smith', 'alice@example.com'),
(2, 'Bob Johnson', 'bob@example.com'),
(3, 'Charlie Brown', 'charlie@example.com'),
(4, 'David Lee', 'david@example.com'),
(5, 'Emma Wilson', 'emma@example.com'),
(6, 'Frank Harris', 'frank@example.com'),
(7, 'Grace Miller', 'grace@example.com'),
(8, 'Henry Scott', 'henry@example.com');

-- ใส่ข้อมูลคำสั่งซื้อ
INSERT INTO orders (order_id, customer_id, order_date, amount) VALUES
(101, 1, '2024-02-01', 150.50),
(102, NULL, '2024-02-05', 200.00),
(103, 2, '2024-02-10', 99.99),
(104, 3, '2024-02-15', 75.25),
(105, 5, '2024-02-20', 300.00),
(106, 6, '2024-02-25', 50.00),
(107, 1, '2024-03-01', 120.75),
(108, 4, '2024-03-05', 199.99);
