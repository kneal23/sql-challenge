-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/mdqTZe
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Departments" (
    "DeptNo" INT   NOT NULL,
    "DeptName" VARCHAR(255)   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "DeptNo"
     )
);

CREATE TABLE "Dept_Emp" (
    "EmpNo" INT   NOT NULL,
    "DeptNo" INT   NOT NULL,
    CONSTRAINT "pk_Dept_Emp" PRIMARY KEY (
        "EmpNo"
     )
);

CREATE TABLE "Dept_Manager" (
    "DeptNo" INT   NOT NULL,
    "EmpNo" INT   NOT NULL,
    CONSTRAINT "pk_Dept_Manager" PRIMARY KEY (
        "EmpNo"
     )
);

CREATE TABLE "Employees" (
    "EmpNo" INT   NOT NULL,
    "EmpTitleID" INT   NOT NULL,
    "FirstName" VARCHAR(255)   NOT NULL,
    "LastName" VARCHAR(255)   NOT NULL,
    "Sex" VARCHAR(255)   NOT NULL,
    "HireDate" INT   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "EmpTitleID"
     )
);

CREATE TABLE "Salaries" (
    "EmpNo" INT   NOT NULL,
    "Salary" INT   NOT NULL,
    CONSTRAINT "pk_Salaries" PRIMARY KEY (
        "EmpNo"
     )
);

CREATE TABLE "Titles" (
    "TitleID" INT   NOT NULL,
    "Title" VARCHAR(255)   NOT NULL,
    CONSTRAINT "pk_Titles" PRIMARY KEY (
        "TitleID"
     )
);

ALTER TABLE "Departments" ADD CONSTRAINT "fk_Departments_DeptName" FOREIGN KEY("DeptName")
REFERENCES "Dept_Emp" ("EmpNo");

ALTER TABLE "Dept_Emp" ADD CONSTRAINT "fk_Dept_Emp_DeptNo" FOREIGN KEY("DeptNo")
REFERENCES "Departments" ("DeptNo");

ALTER TABLE "Dept_Manager" ADD CONSTRAINT "fk_Dept_Manager_DeptNo" FOREIGN KEY("DeptNo")
REFERENCES "Departments" ("DeptNo");

ALTER TABLE "Employees" ADD CONSTRAINT "fk_Employees__EmpNo" FOREIGN KEY("", "EmpNo")
REFERENCES "Salaries" ("", "EmpNo");

ALTER TABLE "Titles" ADD CONSTRAINT "fk_Titles__Title" FOREIGN KEY("", "Title")
REFERENCES "Employees" ("", "EmpTitleID");

