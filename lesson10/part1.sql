drop procedure check_number_even( INT)

CREATE PROCEDURE check_number(n INT)
LANGUAGE plpgsql
AS $$
BEGIN
	IF n < 10 THEN
		RAISE NOTICE 'ты слишком мелкий';
	ELSIF n < 18 THEN
		RAISE NOTICE 'ты еще школьник';
	ELSE 
		RAISE NOTICE 'ты подходишь';
	END IF;
END;
$$;
CALL check_number(22);


------------------------------------------------------------1

CREATE PROCEDURE check_number_even(n INT)
LANGUAGE plpgsql
AS $$
BEGIN
	IF n % 2 = 0 THEN
		RAISE NOTICE 'even';
	ELSE 
		RAISE NOTICE 'odd';
	END IF;
END;
$$;
CALL check_number_even(21);



------------------------------------------------------------2

CREATE PROCEDURE check_age(n INT)
LANGUAGE plpgsql
AS $$
BEGIN
	IF n < 18 THEN
		RAISE NOTICE 'Несовершеннолетний';
	ELSIF n < 60 THEN
		RAISE NOTICE 'Совершеннолетний';
	ELSIF n > 60 THEN
		RAISE NOTICE 'Пенсионер';
	ELSE 
		RAISE NOTICE 'ошибка';
	END IF;
END;
$$;
CALL check_age(58);


------------------------------------------------------------3

CREATE PROCEDURE check_grade(n INT)
LANGUAGE plpgsql
AS $$
BEGIN
	IF n < 50 THEN
		RAISE NOTICE 'Неудовлетворительно';
	ELSIF n < 69 THEN
		RAISE NOTICE 'Удовлетворительно';
	ELSIF n < 89 THEN
		RAISE NOTICE 'Хорошо';
	ELSIF n < 100 THEN
		RAISE NOTICE 'Отлично';
	ELSE 
		RAISE NOTICE 'ошибка';
	END IF;
END;
$$;
CALL check_grade(97);


------------------------------------------------------------4

CREATE PROCEDURE check_login(login VARCHAR(512))
LANGUAGE plpgsql
AS $$
BEGIN
	IF login = 'admin' THEN
		RAISE NOTICE 'Администратор';
	ELSE 
		RAISE NOTICE 'Обычный пользователь';
	END IF;
END;
$$;
CALL check_login('admin');


------------------------------------------------------------5

CREATE PROCEDURE check_time(n INT)
LANGUAGE plpgsql
AS $$
BEGIN
	IF n >= 6 and n <= 10 THEN
		RAISE NOTICE 'Утро';
	ELSIF n >= 12 and n <= 17 THEN
		RAISE NOTICE 'День';
	ELSIF n >= 18 and n <= 22 THEN
		RAISE NOTICE 'Вечер';
	ELSIF n = 23 OR n >= 0 and n <= 5 THEN
		RAISE NOTICE 'Ночь';
	ELSE 
		RAISE NOTICE 'ошибка';
	END IF;
END;
$$;
CALL check_time(18);


-------------------------------------
CREATE TABLE users(
	id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	username VARCHAR(320) UNIQUE NOT NULL,
	age INT NOT NULL CHECK (age > 0),
	fullname VARCHAR(512) NOT NULL
);


CREATE PROCEDURE add_update(u_username VARCHAR(320), u_age INT, u_fullname VARCHAR(512))
LANGUAGE plpgsql
AS $$
DECLARE user_count BIGINT;
BEGIN
	SELECT COUNT(*) INTO user_count FROM users WHERE username = u_username;
	IF user_count > 0 THEN
		UPDATE users
		SET age = u_age, fullname = u_fullname
		WHERE username = u_username;
	ELSE 
		INSERT INTO users(username, age, fullname)
		VALUES (u_username, u_age, u_fullname);
	END IF;
END;
$$;

CALL add_update('r.monica', 23, 'monica');
CALL add_update('susan11', 27, 'susan');
CALL add_update('bob_s', 17, 'bob');

CALL add_update('r.monica', 26, 'monica');
CALL add_update('susan33', 27, 'susan');
CALL add_update('bob_s', 17, 'ross');

select * from users
































