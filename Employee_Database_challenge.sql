SELECT e.emp_no, e.first_name, e.last_name,
	t.title, t.from_date, t.to_date
	INTO retirement_titles
FROM public.employees as e
INNER JOIN public.titles as t
ON e.emp_no=t.emp_no
WHERE e.birth_date >='1952-01-01'::date and 
e.birth_date <='1955-12-31'::date
ORDER BY e.emp_no;

SELECT DISTINCT ON (e.emp_no) 
e.emp_no, e.first_name, e.last_name,
	t.title, t.from_date, t.to_date
	INTO unique_titles
FROM public.employees as e
INNER JOIN public.titles as t
ON e.emp_no=t.emp_no
WHERE e.birth_date >='1952-01-01'::date and 
e.birth_date <='1955-12-31'::date
ORDER BY e.emp_no, t.from_date DESC;
--limit 10;

SELECT (title), count (title) 
INTO retiring_titles
From unique_titles 
group by title
order by count desc;

SELECT DISTINCT ON (e.emp_no)
 e.emp_no, e.first_name, e.last_name, e.birth_date,
	t.title, de.from_date, de.to_date 
	INTO mentorship_eligibilty
FROM public.employees as e
INNER JOIN public.titles as t
ON e.emp_no=t.emp_no
INNER JOIN public."dept employee" as de
ON e.emp_no = de.emp_no
WHERE e.birth_date >='1965-01-01'::date and 
e.birth_date <='1965-12-31'::date
ORDER BY e.emp_no, de.from_date DESC;