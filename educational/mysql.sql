/*SQL Database*/
/*CREATE A NEW DATABASE*/
CREATE DATABASE employee;


/*CREATE TABLE*/
CREATE TABLE biodata(
    id_no INTEGER(3) AUTO_INCREMENT PRIMARY KEY,
    firstname VARCHAR(50),
    lastname VARCHAR(50),
    email VARCHAR(50) UNIQUE,
    phone VARCHAR(20),
    address VARCHAR(50),
    nationality VARCHAR(30)
);

/*ADD A NEW COLUMN TO THE TABLE*/
ALTER TABLE biodata
ADD COLUMN state_of_origin VARCHAR(40);

/*ADD A NEW COLUMN USING THE 'AFTER' KEYWORD*/
ALTER TABLE biodata 
ADD COLUMN state_of_residence VARCHAR(40) AFTER address;

/*DELETE A COLUMN*/
ALTER TABLE biodata 
DROP COLUMN state_of_origin;

/*INSERT VALUES INTO MySQL TABLE*/
INSERT INTO biodata(firstname,lastname,email,phone,address,state_of_residence,nationality) 
VALUES("Mark","Johnson","mark.johnson@company.com","+234809876554","50 uwani road","Enugu","Nigeria");

INSERT INTO biodata(firstname,lastname,email,phone,address,state_of_residence,nationality)
VALUES("Mary","Ifeoma","mary.ifeoma@company.com","+23470976544","Maryland estate","Enugu","Nigeria");

INSERT INTO biodata(firstname,lastname,email,phone,address,state_of_residence,nationality)
VALUES("Henry","Chibueze","henry.chi@company.com","+234908765654","Achara Layout","Enugu","Nigeria");

INSERT INTO biodata(firstname,lastname,email,phone,address,state_of_residence,nationality)
VALUES("Ugoeze","Chinwo","ugochi@company.com","+2348908764","Achara Layout","Enugu","Nigeria");

INSERT INTO biodata(firstname,lastname,email,phone,address,state_of_residence,nationality)
VALUES("Chidiebere","Jonathan","chijo@company.com","+2349087654","Ebe Lane Close","Enugu","Nigeria");

/*UPDATE RECORD*/
UPDATE biodata SET phone = '+234904365478' WHERE id_no = 10;

/*SQL SELECT STATEMENT*/
/*Select all*/
SELECT * FROM biodata;

/*SELECT Particular Columns*/
SELECT state_of_residence,nationality FROM biodata;

/*'AS' keyword*/
SELECT state_of_residence AS state FROM biodata;

/*SELECT ALL ABOUT A PARTICULAR USER USING THE 'WHERE' KEYWORD*/
 SELECT * FROM biodata WHERE id_no=2;

 /*DATA FOR SECOND TABLE*/
 CREATE TABLE workdata(
	id_no INTEGER(3) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    department VARCHAR(30) NOT NULL,
    position VARCHAR(30) NOT NULL,
    current_salary decimal(11,2) NOT NULL,
    appointment_date timestamp default CURRENT_TIMESTAMP
);

 INSERT INTO workdata(dapartment,position,current_salary) VALUES("Software","Senior dev.","100000");
 INSERT INTO workdata(department,position,current_salary) VALUES("Software","Senior dev.","100000");
 INSERT INTO workdata(department,position,current_salary) VALUES("Software","Junior dev.","90000");
 INSERT INTO workdata(department,position,current_salary) VALUES("Software","Junior dev.","90000");
 INSERT INTO workdata(department,position,current_salary) VALUES("Marketing","Lead Marketer","80000");
 INSERT INTO workdata(department,position,current_salary) VALUES("Marketing","Senior Marketer","100000");
 INSERT INTO workdata(department,position,current_salary) VALUES("Web development","Senior dev.","100000");
 INSERT INTO workdata(department,position,current_salary) VALUES("Accounts","Lead Accountant","90000");
 INSERT INTO workdata(department,position,current_salary) VALUES("Operations","Manager","100000");
 INSERT INTO workdata(department,position,current_salary) VALUES("Equipment","Manager","100000");


/*AND keyword with Logical operator*/
SELECT * FROM workdata WHERE current_salary<100000 AND department="Software";

/*CHANGE DATATYPE*/
ALTER TABLE table_name CHANGE current_salary 
current_salary INTEGER(30) NOT NULL;

/*RENAME A TABLE*/
ALTER TABLE table_name RENAME new_name;

/*OR and AND Keyword*/
SELECT * FROM workdata WHERE department="Software" OR (position="Manager" AND current_salary<200000);

/*SHOW TABLES*/
SHOW TABLES FROM db_name;

/*SHOW TABLES THAT STARTS/ENDS WITH PARTICULAR LETTER*/
SHOW TABLES FROM db_name LIKE 'A%';

/*SHOW COLUMNS IN A TABLE*/
SHOW COLUMNS FROM table_name;

/*SHOW COLUMNS IN A TABLE THAT STARTS/ENDS WITH PARTICULAR LETTER*/
SHOW COLUMNS FROM table_name LIKE 'A%';

/*ORDER BY*/
SELECT * FROM workdata ORDER BY current_salary ASC/DESC;

/*LIMIT Keyword*/
SELECT * FROM workdata ORDER BY current_salary LIMIT 1;


/*GROUP BY*/
SELECT position,current_salary FROM `workdata` GROUP BY department;

/**/
SELECT id_no, department,position,current_salary+9999 
AS proposed_salary FROM workdata;

/*SELECT DISTINCT*/
SELECT DISTINCT department FROM workdata;

/*SQL FUNCTIONS*/
/*count()*/
SELECT COUNT(position) FROM workdata;

/*sum()*/
SELECT sum(current_salary) FROM workdata;

/*average()*/
SELECT avg(current_salary) AS average_salary FROM workdata;

/*min()*/
SELECT min(current_salary) AS minimum_salary FROM workdata;

/*max()*/
SELECT max(current_salary) AS highest_salary FROM workdata;

/*JOINS*/
/*CROSS JOIN*/
SELECT * FROM biodata,workdata;

/*IMPLICIT JOIN*/
SELECT * FROM biodata,workdata WHERE biodata.id_no = workdata.id_no;

/*EXPLICIT JOIN - JOIN Keyword*/
SELECT * FROM biodata JOIN workdata ON biodata.id_no=workdata.id_no;

/*EXPLICIT JOIN - JOIN Keyword*/
SELECT biodata.firstname, biodata.lastname, biodata.email, workdata.current_salary 
FROM biodata JOIN workdata ON biodata.id_no=workdata.id_no;


/*EXPLICIT JOIN - JOIN Keyword USING WHERE Clause*/
SELECT biodata.firstname, biodata.lastname, biodata.email, workdata.department, workdata.current_salary 
FROM biodata JOIN workdata ON biodata.id_no=workdata.id_no 
WHERE current_salary<90000;

/*OUTER JOIN*/
/*LEFT or RIGHT OUTER JOIN*/
SELECT biodata.firstname, biodata.lastname, biodata.email, workdata.department
FROM biodata 
LEFT OUTER JOIN workdata ON biodata.id_no = workdata.id_no;


/*FULL OUTER JOIN*/
SELECT biodata.firstname, biodata.lastname, biodata.email, workdata.department
FROM biodata 
FULL OUTER JOIN workdata ON biodata.id_no = workdata.id_no;

/*DELETE*/
DELETE email FROM table_name WHERE id_no = 5;

/*THIRD TABLE*/
CREATE TABLE employee_login(
    id_no INTEGER(3) AUTO_INCREMENT PRIMARY KEY,
    employee_login VARCHAR(50),
    employee_password VARCHAR(50)
);

/*INSERTING FROM ELSEWHERE*/
INSERT INTO employee_login(employee_login) SELECT email FROM biodata;

/*Encryption of password*/
UPDATE employee_login SET employee_password = md5('password');
