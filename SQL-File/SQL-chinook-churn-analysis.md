**หาวันที่ลูกค้าคนสุดท้ายสั่งซื้อ**
```sql
SELECT MAX(InvoiceDate) AS LastPurchase FROM invoices;
```

**Label ลูกค้าเป็น Churn หรือ Active**
ถ้าลูกค้าคนไหน LastDayPurchases > 180 = 'Churn'
```sql
SELECT
  c.CustomerId,
  c.FirstName || ' ' || c.LastName AS Fullname,
  c.Country,
  COUNT(i.InvoiceID) AS TotalPurchases,
  SUM(i.Total) AS TotalSpend,
  MAX(i.InvoiceDate) AS LastDayPurchases,
  CASE 
    WHEN MAX(i.InvoiceDate) < date('2013-12-22', '-180 days') THEN 'Churn'
    ELSE 'Active'
    END Status
FROM customers c
LEFT JOIN invoices i ON c.CustomerId = i.CustomerId
GROUP BY c.CustomerId
```

**ลองวิเคราห์เชิงลึก**

เช่น
- ประเทศไหนมีอัตตรา Churn สูง
```sql
WITH label AS (
SELECT
  c.CustomerId,
  c.FirstName || ' ' || c.LastName AS Fullname,
  c.Country,
  COUNT(i.InvoiceID) AS TotalPurchases,
  SUM(i.Total) AS TotalSpend,
  MAX(i.InvoiceDate) AS LastDayPurchases,
  CASE 
    WHEN MAX(i.InvoiceDate) < date('2013-12-22', '-180 days') THEN 'Churn'
    ELSE 'Active'
    END Status
FROM customers c
LEFT JOIN invoices i ON c.CustomerId = i.CustomerId
GROUP BY c.CustomerId
)

SELECT
  country,
  COUNT(*) AS TotalCustomers,
  SUM(CASE WHEN Status = 'Churn' THEN 1 ELSE 0 END) AS Churned,
  ROUND(100.0 * SUM(CASE WHEN Status = 'Churn' THEN 1 ELSE 0 END)/COUNT(*),2) AS ChurnRate
FROM label
GROUP BY Country
```
