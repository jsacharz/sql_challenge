-- (1) List the following details of each employee: 
-- employee number, last name, first name, sex, and salary.

SELECT e.emp_no, last_name, first_name, sex, salary
FROM employees AS e
JOIN salaries as s
ON e.emp_no = s.emp_no;


-- (2) List first name, last name, and hire date for employees who were hired in 1986.
SELECT last_name, first_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31'
ORDER BY hire_date ASC;


-- (3) List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name.
SELECT 
	d.dept_no, d.dept_name, 
	dm.emp_no,
	e.last_name, e.first_name 
FROM departments AS d
JOIN dept_manager AS dm
ON d.dept_no = dm.dept_no
JOIN employees as e
ON dm.emp_no = e.emp_no;

-- (4) List the department of each employee with the following information: 
--employee number, last name, first name, and department name.
SELECT
	e.emp_no, e.last_name, e.first_name,
	dept_name
FROM employees AS e
JOIN dept_emp AS de
ON e.emp_no = de.emp_no
JOIN departments AS d
ON de.dept_no = d.dept_no;

-- (5) List first name, last name, and sex for employees whose first name is "Hercules" 
-- and last names begin with "B."
SELECT 
e.first_name, e.last_name,  e.sex
FROM employees AS e
WHERE e.first_name = 'Hercules' AND e.last_name LIKE 'B%';

-- (6) List all employees in the Sales department, 
-- including their employee number, last name, first name, and department name.
SELECT
	e.emp_no, last_name, first_name,
	d.dept_name
FROM employees AS e
JOIN dept_emp AS de
ON e.emp_no = de.emp_no
JOIN departments AS d
ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

-- (7) List all employees in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name.

SELECT
	e.emp_no, last_name, first_name,
	d.dept_name
FROM employees AS e
JOIN dept_emp AS de
ON e.emp_no = de.emp_no
JOIN departments AS d
ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development';

-- (8) List the frequency count of employee last names 
-- (i.e., how many employees share each last name) in descending order.

SELECT last_name, COUNT(last_name)  AS last_name_count
FROM employees
GROUP BY last_name 
ORDER BY last_name DESC;
