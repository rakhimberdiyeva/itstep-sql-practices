CREATE TABLE students(
	id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	fullname VARCHAR(512) NOT NULL,
	date_of_birth DATE NOT NULL
);

CREATE TABLE grades(
	id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	grade INT NOT NULL,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	student_id BIGINT REFERENCES students(id) ON DELETE CASCADE
);

INSERT INTO students(fullname, date_of_birth) VALUES
('ruslan', '2008-11-25'),
('jahangir', '2009-10-06'),
('rashid', '2008-07-13'),
('malika', '1999-02-21');

SELECT * FROM students

INSERT INTO grades(grade, student_id) VALUES
(12, 1),
(11, 1),
(12, 1),
(10, 2),
(8, 2),
(9, 2),
(0, 2),
(12, 2),
(8, 3),
(0, 3),
(0, 3),
(11, 3),
(12, 4),
(12, 4),
(12, 4),
(12, 4);


SELECT COUNT (*) FROM students;

SELECT
s.fullname,
AVG(g.grade)
FROM students s
JOIN grades g ON g.student_id = s.id
GROUP BY s.fullnameS
HAVING AVG(g.grade) > 7;






