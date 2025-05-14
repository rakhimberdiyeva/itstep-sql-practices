
SELECT * FROM users
SELECT * FROM profiles

SELECT
u.first_name || ' ' || u.last_name AS Fullname,
u.username AS Username,
u.id AS "ID",
p.bio AS "Bio",
p.avatar AS "Photo",
p.is_verified AS "Verified"
FROM users u
INNER JOIN profiles p
ON u.id = p.user_id 


SELECT * FROM categories;
SELECT * FROM products;
SELECT * FROM orders;
SELECT * FROM order_products;


SELECT
*
FROM products p
INNER JOIN categories c 
ON p.category_id = c.id;


SELECT
p.name AS "название",
p.price AS "цена",
c.name AS "категория"
FROM products p
INNER JOIN categories c 
ON p.category_id = c.id;

SELECT
o.id AS "ид заказа",
p.name AS "название продукта",
op.quantity AS "кол-во",
u.first_name || ' ' || u.last_name AS "ФИО"
FROM orders o
INNER JOIN order_products op ON o.id = op.order_id
INNER JOIN products p ON op.product_id = p.id
INNER JOIN users u ON o.id = u.id;













