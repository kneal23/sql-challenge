-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/mdqTZe
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Departments" (
    "DeptNo" VARCHAR(10)   NOT NULL,
    "DeptName" VARCHAR(255)   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "DeptNo"
     )
);

CREATE TABLE "Dept_Emp" (
    "EmpNo" INT   NOT NULL,
    "DeptNo" VARCHAR(10)   NOT NULL,
    CONSTRAINT "pk_Dept_Emp" PRIMARY KEY (
        "EmpNo"
     )
);

CREATE TABLE "Dept_Manager" (
    "DeptNo" VARCHAR(10)   NOT NULL,
    "EmpNo" INT   NOT NULL,
    CONSTRAINT "pk_Dept_Manager" PRIMARY KEY (
        "EmpNo"
     )
);

CREATE TABLE "Employees" (
    "EmpNo" INT   NOT NULL,
    "EmpTitleID" VARCHAR(10)   NOT NULL,
    "BirthDate" DATE   NOT NULL,
    "FirstName" VARCHAR(255)   NOT NULL,
    "LastName" VARCHAR(255)   NOT NULL,
    "Sex" VARCHAR(10)   NOT NULL,
    "HireDate" DATE   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "EmpNo"
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
    "Title" VARCHAR(30)   NOT NULL,
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

ALTER TABLE "Employees" ADD CONSTRAINT "fk_Employees__EmpTitleID" FOREIGN KEY("", "EmpTitleID")
REFERENCES "Salaries" ("", "EmpNo");

