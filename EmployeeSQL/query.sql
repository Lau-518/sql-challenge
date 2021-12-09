-- 1.List the following details of each employee: employee number, last name, first name, sex, and salary.


SELECT employees.emp_no, employees.first_name, employees.last_name, employees.sex, salaries.salary 
FROM salaries
INNER JOIN employees ON
employees.emp_no=salaries.emp_no;

-- 2.List first name, last name, and hire date for employees who were hired in 1986.

SELECT employees.first_name, employees.last_name, employees.hire_date
FROM employees
WHERE hire_date::text LIKE '%/%/1986'


-- 3.List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

CREATE TABLE department_manager_join1 as
SELECT department.dept_no, department.dept_name, dept_manager.emp_no
FROM department
INNER JOIN dept_manager ON
dept_manager.dept_no=department.dept_no;


SELECT department_manager_join1.dept_no, department_manager_join1.dept_name, department_manager_join1.emp_no, employees.first_name, employees.last_name
FROM employees
INNER JOIN department_manager_join1 ON
department_manager_join1.emp_no=employees.emp_no;

-- 4.List the department of each employee with the following information: employee number, last name, first name, and department name

CREATE TABLE employee_department_join1 as
SELECT dept_emp.emp_no, dept_emp.dept_no, department.dept_name
FROM department
INNER JOIN dept_emp ON
dept_emp.dept_no=department.dept_no;


SELECT employee_department_join1.emp_no, employees.last_name, employees.first_name, employee_department_join1.dept_name
FROM employees
INNER JOIN employee_department_join1 ON
employee_department_join1.emp_no=employees.emp_no;

-- 5.List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

SELECT employees.first_name, employees.last_name, employees.sex
FROM employees
WHERE first_name = 'Hercules' 
AND last_name LIKE 'B%'

-- 6.List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT employee_department_join1.emp_no, employees.last_name, employees.first_name, employee_department_join1.dept_name
FROM employees
INNER JOIN employee_department_join1 ON
employee_department_join1.emp_no=employees.emp_no
WHERE dept_name = 'Sales' ;

-- 7.List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT employee_department_join1.emp_no, employees.last_name, employees.first_name, employee_department_join1.dept_name
FROM employees
INNER JOIN employee_department_join1 ON
employee_department_join1.emp_no=employees.emp_no
WHERE dept_name = 'Sales'
OR dept_name = 'Development';

-- 8.In descending order, list the frequency count of employee last names, i.e., how many employees share each last name

select employees.last_name, count(*)
from employees
group by last_name
HAVING count(*) > 1
ORDER BY count DESC;
