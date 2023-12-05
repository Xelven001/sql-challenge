

-- List the employee number, last name, first name, sex, and salary of each employee.
SELECT e.emp_no
		,e.last_name
		,e.first_name
		,e.sex
		,s.salary
FROM "Employee" e
JOIN "Salaries" s
ON e.emp_no = s.emp_no;


-- List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT e.first_name
		,e.last_name
		,e.hire_date 
FROM "Employee" e
WHERE 
EXTRACT(YEAR FROM e.hire_date) = 1986
ORDER BY 3 ;

-- List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT  cast(e.first_name || ' ' || e.last_name as VARCHAR(50)) AS department_manager
		,d.dept_no
		,d.dept_name
		,e.emp_no
		,e.last_name
		,e.first_name
FROM "Dept_Manager" dm
JOIN "Departments" d 
	ON dm.dept_no = d.dept_no 
JOIN "Employee" e
	ON dm.emp_no = e.emp_no;


-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT 	e.emp_no 
		,de.dept_no 
		,e.last_name
		,e.first_name
		,d.dept_name
FROM "Employee" e
JOIN "Dept_Emp" de
	ON e.emp_no = de.emp_no 
JOIN "Departments" d
	ON de.dept_no = d.dept_no;
	

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name
		,last_name 
		,sex
FROM "Employee"
WHERE first_name = 'Hercules' 
AND lower(last_name) like 'b%';


-- List each employee in the Sales department, including their employee number, last name, and first name.
SELECT e.emp_no
		,e.last_name
		,e.first_name 
FROM "Employee" e
JOIN "Dept_Emp" de 
	ON e.emp_no = de.emp_no
JOIN "Departments" d
	ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';


-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no
		,e.last_name
		,e.first_name 
		,d.dept_name
FROM "Employee" e
JOIN "Dept_Emp" de 
	ON e.emp_no = de.emp_no
JOIN "Departments" d
	ON de.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales','Development');


-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT e.last_name 
		,COUNT(*) as frequency_count
FROM "Employee" e
GROUP BY 1 
ORDER BY 1 DESC;
