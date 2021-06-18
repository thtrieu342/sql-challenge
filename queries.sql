--List the following details of each employee: 
--employee number, last name, first name, sex, and salary.

SELECT employee.emp_no, employee.last_name, employee.first_name, employee.sex, sal.salary
FROM employees as employee
	LEFT JOIN salaries as sal
		ON (employee.emp_no = sal.emp_no)
	ORDER BY employee.emp_no;

--List first name, last name, and hire date for employees who were hired in 1986.

SELECT hire_date, first_name, last_name
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

--List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name.

SELECT depart.dept_no, depart.dept_name, dm.emp_no, emp.last_name, emp.first_name
FROM department_manager as dm

INNER JOIN departments as depart
	ON (dm.dept_no=depart.dept_no)
INNER JOIN employees as emp
	ON (dm.emp_no=emp.emp_no)

--List the department of each employee with the following information: 
--employee number, last name, first name, and department name.
SELECT emp.emp_no, emp.last_name, emp.first_name, dept_name
FROM employees as emp

INNER JOIN department_employees as de
	ON (emp.emp_no = de.emp_no)
INNER JOIN departments as depart
	ON (depart.dept_no = de.dept_no)
ORDER BY emp.emp_no;

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, birth_date, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT emp.emp_no, emp.last_name, emp.first_name, depart.dept_name
FROM employees as emp

INNER JOIN department_employees as de
	ON (emp.emp_no = de.emp_no)
INNER JOIN departments as depart
	ON (depart.dept_no = de.dept_no)
WHERE depart.dept_name IN ('Sales')
ORDER BY emp.emp_no;

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT emp.emp_no, emp.last_name, emp.first_name, depart.dept_name
FROM employees as emp

INNER JOIN department_employees as de
	ON (emp.emp_no = de.emp_no)
INNER JOIN departments as depart
	ON (depart.dept_no = de.dept_no)
WHERE depart.dept_name IN ('Sales', 'Development')
ORDER BY emp.emp_no;

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY COUNT (last_name);
