SELECT e."Emp_No", e."Last_Name", e."First_Name", e."Sex", s."Salary"
	FROM public."Employees" as e
	JOIN public."Salaries" as s on e."Emp_No" = s."Emp_No";
	
SELECT "First_Name", "Last_Name", "Hire_Date"
	FROM public."Employees"
	WHERE "Hire_Date" >= '1/1/1986' AND "Hire_Date" <= '12/31/1986';
	
SELECT dm."Dept_No", d."Dept_Name", e."Emp_No", e."Last_Name", e."First_Name"
	FROM public."Employees" as e
	JOIN public."Dept_Manager" as dm on e."Emp_No" = dm."Emp_No"
	JOIN public."Departments" as d on dm."Dept_No" = d."Dept_No"
	WHERE e."Emp_No" IN (
		SELECT "Emp_No"
		FROM public."Dept_Manager"
	);
	
SELECT de."Dept_No", e."Emp_No", e."Last_Name", e."First_Name", d."Dept_Name"
	FROM public."Employees" as e
	JOIN public."Dept_Emp" as de on e."Emp_No" = de."Emp_No"
	JOIN public."Departments" as d on de."Dept_No" = d."Dept_No";

-- Source: https://stackoverflow.com/questions/6192499/select-records-based-on-what-a-field-begins-with
SELECT "First_Name", "Last_Name", "Sex"
	FROM public."Employees"
	WHERE "First_Name" = 'Hercules' AND "Last_Name" LIKE 'B%';
	
SELECT e."Emp_No", e."Last_Name", e."First_Name"
	FROM public."Employees" as e
	JOIN public."Dept_Emp" as de on e."Emp_No" = de."Emp_No"
	JOIN public."Departments" as d on de."Dept_No" = d."Dept_No"
	WHERE d."Dept_Name" = 'Sales';
	
SELECT e."Emp_No", e."Last_Name", e."First_Name", d."Dept_Name"
	FROM public."Employees" as e
	JOIN public."Dept_Emp" as de on e."Emp_No" = de."Emp_No"
	JOIN public."Departments" as d on de."Dept_No" = d."Dept_No"
	WHERE d."Dept_Name" = 'Sales' OR d."Dept_Name" = 'Development';
	
SELECT "Last_Name", COUNT("Last_Name") as "count"
	FROM public."Employees"
	GROUP By "Last_Name"
	ORDER BY "count" DESC;