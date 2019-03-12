INSERT INTO student_name(id, name) VALUES (1, 'Sayak');

INSERT INTO student_name(id, name) VALUES (2, 'Alex');

INSERT INTO student_name(id, name) VALUES (3, 'Sameer');

INSERT INTO student_name(id, name) VALUES (4, 'Rick');

select * from student_name;

INSERT INTO student_stream(id, stream) VALUES (1, 'CS');

INSERT INTO student_stream(id, stream) VALUES (1, 'IT');

INSERT INTO student_stream(id, stream) VALUES (2, 'ECE');

INSERT INTO student_stream(id, stream) VALUES (9, 'ECE');

select * from student_stream;
            
    
SELECT s1.id, s1.name, s2.stream
FROM student_name AS s1
INNER JOIN student_stream AS s2
ON s1.id = s2.id; 

SELECT s1.id, s1.name, s2.stream
FROM student_name AS s1
INNER JOIN student_stream AS s2
USING (id);


select * from countries;

SELECT c1.name AS country1, c2.name AS country2, c1.continent 
FROM countries AS c1
INNER JOIN countries AS c2
ON c1.continent = c2.continent AND c1.name <> c2.name
LIMIT 13; 

SELECT s1.id, s1.name, s2.stream
FROM student_name AS s1
LEFT JOIN student_stream AS s2
ON s1.id = s2.id;             
    
SELECT s1.id, s1.name, s2.stream
FROM student_name AS s1
RIGHT JOIN student_stream AS s2
ON s1.id = s2.id;   

SELECT s1.id, s2.id
FROM student_name AS s1
CROSS JOIN student_stream AS s2;

    
select id, name 
from student_name
where id IN 
(select id from student_stream where stream 
IN ('CS', 'IT', 'ECE'));