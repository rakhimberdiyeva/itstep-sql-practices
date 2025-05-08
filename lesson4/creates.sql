
CREATE TABLE IF NOT EXISTS users(
	id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY, --автоматически будет генерировать ид
	fname VARCHAR(255) NOT NULL,
	lname VARCHAR(255) NOT NULL,
	username VARCHAR(512) UNIQUE NOT NULL, -- нужно давать уникальное значение
	birth_date DATE NOT NULL,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- тот же самый DATETIME
);

CREATE TABLE IF NOT EXISTS posts(
	id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY, 
	content VARCHAR(2048) NOT NULL,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	user_id BIGINT REFERENCES users(id)
)

SELECT * FROM users; 
SELECT * FROM posts; 


INSERT INTO users(fname, lname, username, birth_date)
VALUES('акбар', 'хасанов', 'akhasanov', '2008-12-17')


INSERT INTO users(fname, lname, username, birth_date)
VALUES
('руслан', 'кан', 'kan', '2008-11-25'), 
('джахангир', 'нуратдинов', 'lmlb', '2009-10-06'),
('тимур', 'аббасов', 'abbasov', '2009-02-12')


