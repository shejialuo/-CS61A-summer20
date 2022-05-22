.read data.sql


CREATE TABLE bluedog AS
  SELECT color, pet FROM students WHERE color = 'blue' AND pet = 'dog';

CREATE TABLE bluedog_songs AS
  SELECT color, pet, song FROM students WHERE color = 'blue' AND pet = 'dog';

CREATE TABLE matchmaker AS
  SELECT A.pet, A.song, A.color, B.color
  FROM students as A, students as B
  WHERE A.pet = B.pet And A.song = B.song AND A.time < B.time;


CREATE TABLE sevens AS
  SELECT students.seven
  FROM students , numbers
  WHERE students.time = numbers.time
        AND students.number = 7 AND numbers.'7' = "True";


CREATE TABLE favpets AS
  SELECT pet, COUNT(pet) AS num
  FROM students
  GROUP BY pet ORDER BY num desc LIMIT 10;


CREATE TABLE dog AS
  SELECT pet, COUNT(pet)
  FROM students
  WHERE pet='dog';


CREATE TABLE bluedog_agg AS
  SELECT song, COUNT(song) as num
  FROM bluedog_songs
  GROUP BY song ORDER BY num desc;


CREATE TABLE instructor_obedience AS
  SELECT seven, instructor, COUNT(*)
  FROM students
  WHERE seven='7' GROUP BY instructor;

