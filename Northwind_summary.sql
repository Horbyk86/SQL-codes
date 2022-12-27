SELECT o.order_id, c.company_name AS "Company", CONCAT(e.first_name, ' ', e.last_name) AS "Employee", p.product_name AS "Product", 
cat.category_name AS "Category", o.order_date AS "Order date", o.shipped_date AS "Ship date", 
ROUND(CAST(SUM(ord_det.quantity*ord_det.unit_price) AS numeric),1) AS "Price", ROUND(CAST(SUM(ord_det.quantity*ord_det.discount) AS numeric),1) AS "Discount"
FROM orders o
LEFT JOIN customers c on o.customer_id = c.customer_id
LEFT JOIN order_details ord_det on o.order_id = ord_det.order_id
LEFT JOIN products p on ord_det.product_id = p.product_id
LEFT JOIN categories cat on p.category_id= cat.category_id
LEFT JOIN employees e USING(employee_id)
GROUP BY o.order_id, c.company_name, p.product_name, cat.category_name, o.order_date, o.shipped_date, "Employee"
ORDER BY "Price" DESC

