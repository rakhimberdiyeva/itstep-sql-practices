SELECT
* 
FROM posts
WHERE user_id in (1,4);


SELECT
* 
FROM users
WHERE fname LIKE '%акба%';


SELECT
* 
FROM posts
ORDER BY content ASC;


SELECT 
* 
FROM users
WHERE id in (1,3)
ORDER BY birth_date ASC;


SELECT
p.id AS "ид",
p.content AS "контент", 
p.created_at AS "дата создания",
p.user_id AS "ид пользователя",
u.fname || ' ' || u.lname AS "ФИО",
u.username AS "имя пользователя"
FROM posts p
INNER JOIN users u ON u.id = p.user_id
WHERE p.user_id in(1, 2, 4) AND p.id > 5
ORDER BY p.created_at ASC;















