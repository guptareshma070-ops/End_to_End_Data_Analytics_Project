 CREATE DATABASE projects;
 
 USE projects;
 
 SELECT * FROM hr;
 
 ALTER TABLE hr 
 CHANGE COLUMN ï»¿id emp_id VARCHAR(20) NULL;
 
DESCRIBE hr;

SELECT birthdate FROM  hr; 

SET SQL_SAFE_UPDATES = 0;
UPDATE IGNORE hr 
SET birthdate = CASE
WHEN birthdate LIKE '%/%' THEN date_format(str_to_date(birthdate,'%m/%d/%Y'),'%Y-%m-%d')
WHEN birthdate LIKE '%-%' THEN date_format(str_to_date(birthdate,'%m-%d-%Y'),'%Y-%m-%d')
ELSE birthdate
END;
 
 SELECT birthdate FROM hr LIMIT 10;
 
 ALTER TABLE hr 
 MODIFY COLUMN birthdate DATE;

SET SQL_SAFE_UPDATES = 0; 
UPDATE hr 
SET hire_date = CASE 
WHEN hire_date LIKE '%/%' AND length(substring_index(hire_date,'/',-1))=4 
THEN date_format(str_to_date(hire_date,'%m/%d/%Y'),'%Y-%m-%d')
WHEN hire_date LIKE '%/%' AND length(substring_index(hire_date,'/',-1))=2
THEN date_format(str_to_date(hire_date,'%m/%d/%y'),'%Y-%m-%d')
WHEN hire_date LIKE '%-%' AND length(substring_index(hire_date,'-',-1))=4 
THEN date_format(str_to_date(hire_date,'%m-%d-%Y'),'%Y-%m-%d')
WHEN hire_date LIKE '%-%' AND length(substring_index(hire_date,'/',-1))=2
THEN date_format(str_to_date(hire_date,'%m-%d-%y'),'%Y-%m-%d')
ELSE hire_date
END; 

SELECT hire_date FROM hr LIMIT 10;

SET SQL_SAFE_UPDATES = 0;
UPDATE hr
SET hire_date = DATE_FORMAT(str_to_date(hire_date,'%m-%d-%y'), '%Y-%m-%d')
WHERE hire_date LIKE '%-%' AND length(hire_date) <= 8;
 
 SELECT hire_date FROM hr LIMIT 10;

ALTER TABLE hr 
 MODIFY COLUMN hire_date DATE;

SET SQL_SAFE_UPDATES = 0; 

UPDATE hr
SET termdate = CASE
WHEN termdate IS NOT NULL AND termdate != ''
THEN date(str_to_date(termdate,'%Y-%m-%d %H:%i:%s UTC'))
ELSE NULL
END;

ALTER TABLE hr 
 MODIFY COLUMN termdate DATE;
 
 SELECT termdate FROM hr LIMIT 10;
 
 ALTER TABLE hr ADD COLUMN age INT;
 SELECT * FROM hr;
 
UPDATE hr 
SET age = timestampdiff(YEAR,birthdate,CURDATE());

 SELECT birthdate,age FROM hr LIMIT 10;
 
 SELECT
	min(age) AS Youngest,
    max(age) AS Oldest
FROM hr;

SELECT count(*) FROM hr
 WHERE age < 18;
 
 
 
 
 
 
 
 
 
 
 
 
 
 