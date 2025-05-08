SELECT * FROM users; 
S 


INSERT INTO users(fname, lname, username, birth_date)
VALUES('акбар', 'хасанов', 'akhasanov', '2008-12-17');


INSERT INTO users(fname, lname, username, birth_date)
VALUES
('руслан', 'кан', 'kan', '2008-11-25'), 
('джахангир', 'нуратдинов', 'lmlb', '2009-10-06'),
('тимур', 'аббасов', 'abbasov', '2009-02-12');


INSERT INTO posts(content, user_id)
VALUES
('LAAKERSSS', 1), 
('BAAAASKEET', 1),
('я не делаю дз', 1);

INSERT INTO posts(content, user_id)
VALUES
('ielts 8.5', 2), 
('sat хочу 1600', 2),
('ли', 2),
('я не интересуюсь футболом', 2);

INSERT INTO posts(content, user_id)
VALUES
('маблааа', 3), 
('роблокс', 3);


INSERT INTO posts(content, user_id)
VALUES
('я не буду опаздывать', 4);
