-- List the following details of each employee: 
-- employee number, last name, first name, sex, and salary.
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM salaries
INNER JOIN employees ON
employees.emp_no=salaries.emp_no;

-- List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, to_char(hire_date, 'YYYY-MM-DD')
FROM employees
WHERE to_char(hire_date, 'YYYY-MM-DD') LIKE '1986%';

SELECT * FROM departments;
SELECT * FROM dept_manager;

-- List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name.
-- Join dept_manager and departments tables
SELECT dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM departments
JOIN dept_manager
ON dept_manager.dept_no=departments.dept_no
	JOIN employees 
	ON dept_manager.emp_no=employees.emp_no;

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM departments
JOIN dept_emp
ON dept_emp.dept_no=departments.dept_no
	JOIN employees
	ON dept_emp.emp_no=employees.emp_no
	WHERE departments.dept_name='Sales';

-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM employees
WHERE first_name='Hercules'
AND last_name LIKE 'B%';

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, count(last_name) AS "Frequency"
FROM employees
GROUP BY last_name
ORDER BY count(last_name) DESC;

