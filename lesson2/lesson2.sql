 CREATE TABLE categories (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	name VARCHAR(255) NOT NULL
 );

CREATE TABLE products(
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	name VARCHAR(255) NOT NULL,
	price NUMERIC(10, 2) NOT NULL,
	description TEXT,
	rating REAL DEFAULT 10,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	is_active BLOB DEFAULT 1,
	category_id INTEGER NOT NULL,
	FOREIGN KEY (category_id) REFERENCES categories(id)
);

ALTER TABLE products ADD COLUMN categories_id INTEGER

DROP TABLE categories;
DROP TABLE products;

SELECT * FROM categories;
SELECT * FROM products;

INSERT INTO categories(name) VALUES(
	'хоз-товары'
);

INSERT INTO categories(name) VALUES(
	'электроника'
);

INSERT INTO categories(name) VALUES(
	'хлебо-булочное'
);

INSERT INTO products(name, description, price, rating, category_id) 
VALUES('веник', 'веник обыкновенный', 999.99, 10, 1);

INSERT INTO products(name, description, price, rating, category_id) 
VALUES('Смартфон Honor 400 Lite', 'Смартфон Honor 400 Lite 8/256GB Velvet Grey', 4555000, 9, 2);

INSERT INTO products(name, description, price, rating, category_id) 
VALUES('Зарядное устройство Samsung', 'Зарядное устройство Samsung 25 Вт EP-T2510NWEGRU', 174000, 8, 2);

INSERT INTO products(name, description, price, rating, category_id) 
VALUES('Внешний аккумулятор', 'Внешний аккумулятор Mi PLM13ZM 10000mAh Black', 154000, 8, 2);

INSERT INTO products(name, description, price, rating, category_id) 
VALUES('154 000', 'Фен Laifen SE Lite Light Pink', 1301000, 9, 2);

INSERT INTO products(name, description, price, rating, category_id) 
VALUES('Выпрямитель для волос', 'Выпрямитель для волос Rowenta SF1627F0', 420000 , 10, 2);

INSERT INTO products(name, description, price, rating, category_id) 
VALUES('хлеб', 'хлеб обычный', 5000 , 10, 3);

INSERT INTO products(name, description, price, rating, category_id) 
VALUES('булочка', 'булочка с вишней', 15000, 10, 3);

INSERT INTO products(name, description, price, rating, category_id) 
VALUES('круассан', 'круассан обычный', 20000 , 10, 3);

UPDATE products
SET name = 'Фен Laifen'
WHERE id = 5


SELECT 
	p.name AS 'название продукта',
	c.name AS 'название категорий'
FROM products p
INNER JOIN categories c ON c.id == p.category_id
WHERE p.category_id == 2;



