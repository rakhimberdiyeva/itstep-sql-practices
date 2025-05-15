SELECT* FROM orders;
SELECT COUNT(*) FROM orders;

SELECT SUM(price) FROM orders;

SELECT
customer_id,
SUM(price * quantity)
FROM orders
GROUP BY customer_id
ORDER BY SUM(price) ASC;


SELECT
product,
SUM(quantity) 
FROM orders
GROUP BY product 
ORDER BY COUNT(product) ASC;

SELECT
customer_id,
AVG(price * quantity)
FROM orders
GROUP BY customer_id
ORDER BY AVG(price * quantity) ASC;


SELECT
order_date,
COUNT(id) 
FROM orders
GROUP BY order_date 
ORDER BY COUNT(order_date) ASC;



SELECT
c.fullname,
SUM(o.price * o.quantity)
FROM orders o
INNER JOIN customers c ON o.customer_id = c.id
GROUP BY c.fullname
ORDER BY SUM(o.price * o.quantity) ASC;


SELECT
customer_id,
AVG(price * quantity)
FROM orders
GROUP BY customer_id
HAVING AVG(price * quantity) > 1000;



















