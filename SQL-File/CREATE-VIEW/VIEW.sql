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
