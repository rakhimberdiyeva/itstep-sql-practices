--- drop удаление процедуры
DROP PROCEDURE add_user(VARCHAR, VARCHAR);

CREATE TABLE balances(
	id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	amount NUMERIC(10, 2) DEFAULT 0
);

CREATE TABLE transactions(
	id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	amount NUMERIC(10, 2) CHECK (amount > 1),
	sender_id BIGINT REFERENCES balances(id),
	getter_id BIGINT REFERENCES balances(id)
);


CREATE PROCEDURE add_balance(b_amount NUMERIC(10, 2) DEFAULT 0) 
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO balances(amount)
	VALUES(b_amount);
END;
$$;

CALL add_balance(1000);
CALL add_balance(1400);



SELECT * FROM balances

CREATE PROCEDURE perevod(t_amount NUMERIC(10, 2), t_sender_id BIGINT, t_getter_id BIGINT) 
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO transactions(amount, sender_id, getter_id)
	VALUES(t_amount, t_sender_id, t_getter_id);
	
	UPDATE balances
	SET  amount = amount - t_amount
	WHERE id = t_sender_id;

	UPDATE balances
	SET  amount = amount + t_amount
	WHERE id = t_getter_id;
END;
$$;


CALL perevod(200, 1, 2);
SELECT * FROM transactions



































