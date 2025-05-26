
CREATE TABLE students(
	id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	fullname VARCHAR(512) NOT NULL,
	birth_date DATE,
	email VARCHAR(100)
);

CREATE TABLE courses(
	id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	title VARCHAR(512) NOT NULL,
	description TEXT
);

CREATE TABLE enrollments(
	id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	student_id BIGINT REFERENCES students(id) ON DELETE CASCADE,
	course_id BIGINT REFERENCES courses(id) ON DELETE CASCADE,
	enrolled_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


INSERT INTO students(fullname, birth_date, email)
VALUES
('monica', '03-02-2001', 'monikag'),
('bree', '14-01-2004', 'breevk'),
('gabi', '25-07-2007', 'gabrielle');


INSERT INTO courses(title, description)
VALUES
('english', 'advanced english'),
('biology', 'biology for beginners');


INSERT INTO enrollments(student_id, course_id)
VALUES
(1 , 1),
(2 , 1);

UPDATE students
SET email = 'monicag'
WHERE id = 1;

DELETE FROM students
WHERE id = 3;


SELECT 
	s.fullname,
	c.title,
	e.enrolled_at
FROM enrollments e
INNER JOIN students s ON s.id = e.student_id
INNER JOIN courses c ON c.id = e.course_id;

SELECT 
	s.fullname
FROM students s
LEFT JOIN enrollments e ON s.id = e.student_id
WHERE e.id IS NULL;

SELECT 
	e.enrolled_at,
	COUNT(s.id)
FROM enrollments e
INNER JOIN students s ON s.id = e.course_id
GROUP BY e.enrolled_at;

SELECT 
	s.fullname,
	COUNT(e.id)
FROM students s
FULL JOIN enrollments e ON s.id = e.student_id
GROUP BY s.fullname

SELECT 
	s.fullname,
	COUNT(e.id)
FROM students s
FULL JOIN enrollments e ON s.id = e.student_id
GROUP BY s.fullname;


CREATE PROCEDURE get_student_courses(s_id BIGINT)
LANGUAGE plpgsql
AS $$
DECLARE courses_list BIGINT;
BEGIN
	SELECT course_id INTO courses_list FROM enrollments WHERE student_id = s_id;
	RAISE NOTICE '%', COUNT(courses_list);
END;
$$;
CALL get_student_courses(3)








