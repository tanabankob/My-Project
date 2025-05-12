# CREATE VIEW
การสร้าง virture table โดย fuction {CREATE VIEW} เหมือนการสร้าง table เสมือน 
ที่มี colum ที่เราต้องการ แบบ การสร้าง table ที่คำนวณอะไรบางอย่างเอาไว้ แต่ไม่ได้ต้องการให้เข้าไปอยู่ในdataจริง

โดยเวลาเรียกใช้ สามารถ `SELECT * FROM invoice_jan2009` ได้เลย
```sql

CREATE VIEW invoice_jan2009 AS
SELECT 
  Invoicedate,
  billingaddress,
  billingcity,
  total,
  ROUND(total * 0.07,2)  AS vat,
  SUBSTR(billingcity, 1, 3) AS first_three_letters
FROM invoices
WHERE invoicedate BETWEEN '2009-01-06' AND '2009-01-31'

```
จากQuery คือการเลือก คอลัม Invoicedate, billingaddres, billingcity, total
และคำนวณ คอลัมน์ vat ด้วย การคำนวน คอลัมน์ total และ wrap ด้วย function `ROUND()`
เพื่อให้แสดงจุดทศนิยมออกมาแค่ 2 หลัก
แถมด้วย `SUBSTR()` เพื่อดึงอักษร 3 ตัวแรกออกมาจาก คอลัมน์ billingcity ครับ

## ลบ VIEW
```sql
DROP VIEW invoice_jan2009;
```
