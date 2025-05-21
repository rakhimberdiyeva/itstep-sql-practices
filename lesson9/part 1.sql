CREATE TABLE users(
	id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	fullname VARCHAR(512) NOT NULL,
	username VARCHAR(320) UNIQUE NOT NULL,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE profiles(
	id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	user_id BIGINT REFERENCES users(id) ON DELETE CASCADE,
	bio TEXT
);


-- хранимая процедура для создания пользователя и его профиля

CREATE PROCEDURE add_user(u_fullname VARCHAR(512), u_username VARCHAR(320)) 
LANGUAGE plpgsql
AS $$
DECLARE new_user_id BIGINT;
BEGIN
	INSERT INTO users(fullname, username)
	VALUES(u_fullname, u_username)
	RETURNING id INTO new_user_id;

	INSERT INTO profiles(user_id)
	VALUES (new_user_id);
END;
$$;

CALL add_user('ruslan kan', 'kan2008');


SELECT * FROM users;
SELECT * FROM profiles















