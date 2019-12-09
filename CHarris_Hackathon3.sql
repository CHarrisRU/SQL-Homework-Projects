-- 1.	Write a query that provide a current head count by each department with a subtotal. Hint: Use WITH ROLLUP keyword.
SELECT
	dept_no,
    count(emp_no)
FROM dept_emp
WHERE to_date = '9999-01-01'
GROUP BY dept_no WITH ROLLUP;
-- 2.	Write a query that uses an inner join to return a table with all columns from salaries and employees.
SELECT *
FROM salaries
INNER JOIN employees
ON salaries.emp_no = employees.emp_no;

-- 3.	Write a query that returns the complete salary history and demographic information for employee number = 10002. Here’s what your output should look like:
SELECT *
FROM salaries
INNER JOIN employees
ON salaries.emp_no = employees.emp_no
WHERE employees.emp_no = 10002;

-- 4.	Write a query that returns the following columns: emp_no, full name (first_name + last_name), and current salary for all employees. Here’s an example of the first two rows of the output:
SELECT 
employees.emp_no,
concat(employees.first_name, ' ', employees.last_name) AS 'Full Name',
salaries.salary AS 'Current Salary'
FROM salaries
INNER JOIN employees
ON salaries.emp_no = employees.emp_no
WHERE salaries.to_date = '9999-01-01';

-- 5.	Revise the query in #3 to include a column for the employee’s job title.
SELECT 
employees.emp_no,
salaries.salary,
employees.first_name,
employees.last_name,
titles.title AS "Employee Title"
FROM salaries
INNER JOIN employees
INNER JOIN titles
ON salaries.emp_no = employees.emp_no 
AND titles.emp_no = employees.emp_no
WHERE employees.emp_no = 10002;

-- 6.	What is the name of the department that Georgi Facello work in?
SELECT 
employees.emp_no,
employees.first_name,
employees.last_name,
dept_emp.dept_no,
departments.dept_name AS 'Department Name'
FROM employees
INNER JOIN dept_emp
INNER JOIN departments
ON employees.emp_no = dept_emp.emp_no 
AND dept_emp.dept_no = departments.dept_no
WHERE employees.emp_no = 10001;

-- 7.	Who is Georgi Facello’s manager?
SELECT 
employees.emp_no,
concat(employees.first_name, ' ', employees.last_name) AS 'Manager Name'
FROM dept_manager
INNER JOIN employees
ON dept_manager.emp_no = employees.emp_no
WHERE dept_manager.dept_no = 'd005'
AND to_date = '9999-01-01';