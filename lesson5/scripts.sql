INSERT INTO users(first_name, last_name, password, username)
VALUES
	('rashid', 'galiev', '1234', 'rashid'),
	('yusuf', 'ronaldo', 'cr7', 'cristiano'),
	('malika', 'raximberdiyeva', '111', 'malika')

SELECT * FROM users

INSERT INTO profiles(user_id)
VALUES (1), (2), (3)

INSERT INTO categories(name)
VALUES ('фрукты'), ('овощи'), ('напитки')

SELECT * FROM products

INSERT INTO products(name, price, category_id)
VALUES 
	('банан', 10000, 1),
	('яблоко', 8000, 1),
	('ананас', 30000, 1);

INSERT INTO products(name, price, category_id)
VALUES 
	('морковь', 10000, 2),
	('огурец', 25000, 2),
	('баклажан', 20000, 2);

INSERT INTO products(name, price, category_id)
VALUES 
	('кола', 18000, 3),
	('fusetea', 11000, 3),
	('фанта', 18000, 3),
	('redbull', 27000, 3);


INSERT INTO orders(user_id)
VALUES (1), (1), (3), (3), (3);
SELECT * FROM orders


INSERT INTO order_products(product_id, order_id, quantity)
VALUES 
	(1, 1, 5),
	(10, 1, 2),
	(4, 2, 1),
	(5, 3, 10),
	(6, 4, 52),
	(7, 5, 12),
	(9, 5, 1);


SELECT * FROM order_products
SELECT * FROM profiles
DELETE FROM users WHERE id=1


SELECT * FROM categories
DELETE FROM categories WHERE id=3



















