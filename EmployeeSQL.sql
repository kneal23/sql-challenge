--Departments Table
CREATE TABLE Departments (
  DeptNo VARCHAR(10) NOT NULL primary key,
  DeptName VARCHAR(255) NOT NULL 
);

-- Query all fields from the Departments table
SELECT *
FROM Departments;

--Dept Manager Table
CREATE TABLE Dept_Manager (
 DeptNo VARCHAR(10) NOT NULL,
 EmpNo INT Primary Key,
 FOREIGN KEY (EmpNo) REFERENCES Employees (EmpNo),
 FOREIGN KEY (DeptNo) REFERENCES Departments (DeptNo)
);

-- Query all fields from the Manager table
SELECT *
FROM Dept_Manager;

--Employees Table
CREATE TABLE Employees (
  EmpNo INT Primary Key,
  EmpTitleID VARCHAR(10) NOT NULL,
  BirthDate DATE,
  FirstName VARCHAR(255) NOT NULL,
  LastName VARCHAR(255) NOT NUll,
  Sex VARCHAR(1) NOT NULL,
  HireDate DATE,
  FOREIGN KEY (EmpTitleID) REFERENCES Titles (TitleID)
);

-- Query all fields from the Employees table
SELECT *
FROM Employees;

--Dept Employee Table
CREATE TABLE Dept_Employee (
  EmpNo INT,
  DeptNo VARCHAR(10) NOT NULL,
  Primary KEY (EmpNo, DeptNo)
);


-- Query all fields from the Dept Employee table
SELECT *
FROM Dept_Employee;

--Salaries Table
CREATE TABLE Salaries (
  EmpNo INT Primary Key,
  Salary INT,
  FOREIGN KEY (EmpNo) REFERENCES Employees (EmpNo)
);

-- Query all fields from the Salaries table
SELECT *
FROM Salaries;

--Titles
CREATE TABLE Titles (
  TitleID VARCHAR(10) NOT NULL Primary Key,
  Title VARCHAR(30) NOT NULL 
);

-- Query all fields from the Titles table
SELECT *
FROM Titles;


--List EmpNo, LastName, FirstName, Sex, and Salary of each employee
SELECT e.EmpNo, e.LastName, e.FirstName, e.Sex, s.Salary
FROM Employees e
JOIN Salaries s ON e.EmpNo = s.EmpNo;

--List the FirstName, LastName, and HireDate of employees hired =1986
SELECT FirstName, LastName, hireDate
FROM Employees 
WHERE Extract(Year From HireDate) = 1986;

--List the dept_manager of each dept w/ DeptNo, DeptName, EmpNo, LastName, and FirstName
SELECT dm.DeptNo, d.DeptName, dm.EmpNo, e.LastName, e.FirstName
FROM Dept_Manager dm
JOIN Departments d ON dm.DeptNo = d.DeptNo
JOIN Employees e ON dm.EmpNo = e.EmpNo;

--List the DeptNo for each employee along with EmpNo, LastName, FirstName, and DeptName
SELECT e.EmpNo, e.LastName, e.FirstName, d.DeptNo, d.DeptName
FROM Employees e
JOIN Dept_Employee de ON e.EmpNo = de.EmpNo
JOIN Departments d ON de.DeptNo = d.DeptNo;

--List the FirstName, LastName, and Sex of each employee who FirstName='Hercules' and LastName='B..'
SELECT FirstName, LastName, Sex
FROM Employees
WHERE FirstName = 'Hercules' AND LastName LIKE 'B%';

--List each employee in DeptName='Sales' w/ EmpNo, LastName, and FirstName
SELECT e.EmpNo, e.LastName, e.FirstName
FROM Employees e
JOIN Dept_Employee de ON e.EmpNo = de.EmpNo
JOIN Departments d ON de.DeptNo = d.DeptNo
WHERE d.DeptName = 'Sales';

--List each employee in DeptName='Sales', 'Development' w/ EmplNo, LastName, and FirstName, and DeptName
SELECT e.EmpNo, e.LastName, e.FirstName, d.DeptName
FROM Employees e
JOIN Dept_Employee de ON e.EmpNo = de.EmpNo
JOIN Departments d ON de.DeptNo = d.DeptNo
WHERE d.DeptName = 'Sales'

UNION

SELECT e.EmpNo, e.LastName, e.FirstName, d.DeptName
FROM Employees e
JOIN Dept_Employee de ON e.EmpNo = de.EmpNo
JOIN Departments d ON de.DeptNo = d.DeptNo
WHERE d.DeptName = 'Development';

--List the freqency count in DESC of all the employee last names (how employees share each LastName=header)
SELECT LastName, COUNT(*) AS Frequency
FROM Employees
GROUP BY LastName
ORDER BY Frequency DESC;
