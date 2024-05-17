CREATE TABLE IF NOT EXISTS public."Departments"
(
    "Dept_No" character varying(4) COLLATE pg_catalog."default" NOT NULL,
    "Dept_Name" character varying(30) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "Department Number" PRIMARY KEY ("Dept_No"),
    CONSTRAINT "Department Name" UNIQUE ("Dept_Name")
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Departments"
    OWNER to postgres;
	
CREATE TABLE IF NOT EXISTS public."Dept_Emp"
(
    "Emp_No" integer NOT NULL,
    "Dept_No" character varying(4) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "Department Number" FOREIGN KEY ("Dept_No")
        REFERENCES public."Departments" ("Dept_No") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "Employee Number" FOREIGN KEY ("Emp_No")
        REFERENCES public."Employees" ("Emp_No") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Dept_Emp"
    OWNER to postgres;
	
CREATE TABLE IF NOT EXISTS public."Dept_Manager"
(
    "Dept_No" character varying(4) COLLATE pg_catalog."default" NOT NULL,
    "Emp_No" integer NOT NULL,
    CONSTRAINT "Department Number" FOREIGN KEY ("Dept_No")
        REFERENCES public."Departments" ("Dept_No") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "Employee Number" FOREIGN KEY ("Emp_No")
        REFERENCES public."Employees" ("Emp_No") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Dept_Manager"
    OWNER to postgres;
	
CREATE TABLE IF NOT EXISTS public."Employees"
(
    "Emp_No" integer NOT NULL,
    "Emp_Title_ID" character varying(5) COLLATE pg_catalog."default" NOT NULL,
    "Birth_Date" date NOT NULL,
    "First_Name" character varying(20) COLLATE pg_catalog."default" NOT NULL,
    "Last_Name" character varying(20) COLLATE pg_catalog."default" NOT NULL,
    "Sex" "char",
    "Hire_Date" date NOT NULL,
    CONSTRAINT "Employee Number" PRIMARY KEY ("Emp_No"),
    CONSTRAINT "Title ID" FOREIGN KEY ("Emp_Title_ID")
        REFERENCES public."Titles" ("Title_ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Employees"
    OWNER to postgres;
	
CREATE TABLE IF NOT EXISTS public."Salaries"
(
    "Emp_No" integer NOT NULL,
    "Salary" money NOT NULL,
    CONSTRAINT "Employee Number" FOREIGN KEY ("Emp_No")
        REFERENCES public."Employees" ("Emp_No") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Salaries"
    OWNER to postgres;
	
CREATE TABLE IF NOT EXISTS public."Titles"
(
    "Title_ID" character varying(5) COLLATE pg_catalog."default" NOT NULL,
    "Title" character varying(30) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "Title ID" PRIMARY KEY ("Title_ID"),
    CONSTRAINT "Title Name" UNIQUE ("Title")
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Titles"
    OWNER to postgres;