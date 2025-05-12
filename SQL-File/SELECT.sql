--เลือกทุกคอลลัมจาก TABLE customers
SELECT * FROM customers;

--เลือกบางคอลัมน์ออกจาก TABLE customers เลือกเฉพาะ firstname ที่ขึ้นต้นด้วย 'l'
SELECT 
	customerId,
  Firstname,
  lastname,
  city,
  state,
  country,
  phone
FROM customers
WHERE firstname LIKE 'l%';
