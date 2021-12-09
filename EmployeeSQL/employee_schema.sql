-- Create a title table

DROP TABLE title;

CREATE TABLE title(
	title_id varchar(5) NOT NULL PRIMARY KEY,
	title varchar(30) NOT NULL

);
SELECT *
FROM title;

-- Create an employees table
DROP TABLE employees;


CREATE TABLE employees(
	emp_no INT PRIMARY KEY,
	emp_title_id varchar(5) NOT NULL,
	birth_date varchar(15),
  	first_name varchar(30) NOT NULL,
	last_name varchar(30) NOT NULL,
	sex text,
	hire_date varchar(15),
	FOREIGN KEY (emp_title_id) REFERENCES title(title_id)
);
SELECT *
FROM employees;

-- Create a salaries table

CREATE TABLE salaries(
	emp_no INT,
	salary INT,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

SELECT *
FROM salaries;

-- Create a department table

CREATE TABLE department(
	dept_no varchar(5) NOT NULL PRIMARY KEY,
	dept_name varchar(30) NOT NULL
);

SELECT *
FROM department;


-- Create a dept_emp table

DROP TABLE dept_emp;

CREATE TABLE dept_emp(
	emp_no INT,
	dept_no varchar(5) NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES department(dept_no)
);

SELECT *
FROM dept_emp;

-- Create a dept_manager table

CREATE TABLE dept_manager(
	dept_no varchar(5) NOT NULL,
	emp_no INT,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES department(dept_no)
);

SELECT *
FROM dept_manager;
