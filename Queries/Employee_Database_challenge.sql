-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT	ON (e.emp_no) e.emp_no,
				e.first_name,
				e.last_name,
				titles.title,
				titles.from_date,
				titles.to_date
				
--INTO unique_titles 
FROM employees as e 
INNER JOIN titles
ON (e.emp_no = titles.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
	AND (titles.to_date = ('9999-01-01'))
ORDER BY emp_no, from_date DESC;

SELECT COUNT (ut.emp_no), ut.title
INTO retiring_titles
FROM unique_titles as ut 
GROUP BY title
ORDER BY COUNT (ut.emp_no) DESC;


SELECT DISTINCT	ON (e.emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	ts.title
INTO mentorship_eligibilty
FROM employees as e
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
INNER JOIN titles as ts
ON (e.emp_no = ts.emp_no)
WHERE (de.to_date = '9999-01-01')
	AND(e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY emp_no;
