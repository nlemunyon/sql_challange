CREATE TABLE "departments" (
    "dept_no" varchar(15)   NOT NULL,
    "dept_name" varchar(50)   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "dept_emp" (
    "emp_no" integer   NOT NULL,
    "dep_no" varchar(15)   NOT NULL
);

CREATE TABLE "dept_manager" (
    "dept_no" varchar(15)   NOT NULL,
    "emp_no" integer   NOT NULL
);

CREATE TABLE "employees" (
    "emp_no" integer   NOT NULL,
    "emp_title" varchar(20)   NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" varchar(50)   NOT NULL,
    "last_name" varchar(50)   NOT NULL,
    "sex" varchar(1)   NOT NULL,
    "hire_date" date   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "salaries" (
    "emp_no" integer   NOT NULL,
    "salary" integer   NOT NULL
);

CREATE TABLE "titles" (
    "title_id" varchar(10)   NOT NULL,
    "title" varchar(50)   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);


ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dep_no" FOREIGN KEY("dep_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title" FOREIGN KEY("emp_title")
REFERENCES "titles" ("title_id");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

------------


select e.emp_no,last_name,first_name,sex,salary
from employees e
join salaries s on e.emp_no = s.emp_no;


select first_name,last_name,hire_date
from employees
where hire_date between '1986-01-01' and '1986-12-31'
order by hire_date asc

select dm.dept_no,d.dept_name, e.emp_no,e.last_name,e.first_name
from dept_manager dm
join departments d on dm.dept_no = d.dept_no
join employees e on dm.emp_no = e.emp_no


select de.dep_no,de.emp_no,e.last_name,e.first_name,d.dept_name
from dept_emp de
join departments d on de.dep_no = d.dept_no
join employees e on de.emp_no = e.emp_no


select first_name,last_name,sex
from employees
where first_name = 'Hercules' and last_name like 'B%'
order by last_name asc


select de.emp_no, e.last_name,e.first_name
from dept_emp de
join employees e on de.emp_no = e.emp_no
where de.dep_no = 'd007'


select de.emp_no, e.last_name,e.first_name,d.dept_name
from dept_emp de
join employees e on de.emp_no = e.emp_no
join departments d on de.dep_no = d.dept_no
where de.dep_no = 'd007' or de.dep_no = 'd005'


select last_name, count(last_name) as num_count
from employees
group by last_name
order by num_count desc

