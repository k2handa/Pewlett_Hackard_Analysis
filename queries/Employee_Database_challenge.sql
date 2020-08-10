--- Retrieving necessary list ---
SELECT e.emp_no, 
		e.first_name,
		e.last_name, 
		ti.title, 
		ti.from_date, 
		ti.to_date 
INTO retirement_titles
FROM employees as e 
INNER JOIN titles as ti 
ON e.emp_no = ti.emp_no
WHERE e.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY e.emp_no;

--- Creating Table: removing duplicates --- 
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title

INTO unique_titles
FROM retirement_titles as rt
ORDER BY rt.emp_no, rt.to_date DESC;

--check unique_titles table --- 
SELECT * FROM unique_titles;

--Table to retrieve number of retiring titles --
SELECT COUNT(title), 
	title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC;

--check retiring_titles -- 
SELECT * FROM retiring_titles



--------------------------------------------------------------------------
-------------Deliverable 2: The Employees Eligible for Mentorship---------

--create mentorship_eligibility table -- 
SELECT DISTINCT ON (e.emp_no)
	e.emp_no,
	e.first_name, 
	e.last_name, 
	e.birth_date,
	de.from_date,
	de.to_date,
	ti.title
INTO mentorship_eligibility
FROM employees as e 
INNER JOIN dept_emp as de
ON e.emp_no = de.emp_no
INNER JOIN titles as ti
ON e.emp_no = ti.emp_no
WHERE e.birth_date BETWEEN '1965-01-01' AND '1965-12-31'
AND de.to_date = '9999-01-01'
ORDER BY e.emp_no;

--Check mentorship_eligibility -- 
SELECT * FROM mentorship_eligibility