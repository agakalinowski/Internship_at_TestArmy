**MySQL 5.6 Schema Setup**:

    CREATE TABLE Employees (
        IdEmployee INT PRIMARY KEY,
        Name VARCHAR(50),
        Surname VARCHAR(50),
        BasicSalary DECIMAL(10, 2),
        DepartmentName VARCHAR(50),
        DateOfEmployment DATE,
        PESEL CHAR(11),
        Education VARCHAR(50),
        Address VARCHAR(255)
    );
    
    INSERT INTO Employees (IdEmployee, Name, Surname, BasicSalary, DepartmentName, DateOfEmployment, PESEL, Education, Address) VALUES
    (1, 'John', 'Doe', 5000.00, 'IT Department', '2022-01-15', '12345678901', 'Bachelor', '123 Main St, City'),
    (2, 'Alice', 'Smith', 6000.50, 'HR Department', '2021-12-01', '98765432109', 'Master', '456 Oak St, Town'),
    (3, 'Bob', 'Johnson', 4500.75, 'Finance Department', '2022-02-10', '23456789012', 'High School', '789 Pine St, Village'),
    (4, 'Emily', 'Williams', 5500.25, 'Marketing Department', '2022-03-05', '34567890123', 'PhD', '101 Cedar St, Suburb'),
    (5, 'Michael', 'Brown', 5200.00, 'Sales Department', '2021-11-20', '45678901234', 'Bachelor', '202 Elm St, County'),
    (6, 'Sophia', 'Lee', 4800.00, 'IT Department', '2022-04-15', '56789012345', 'Master', '303 Maple St, City'),
    (7, 'Daniel', 'Martinez', 5100.50, 'HR Department', '2021-10-01', '67890123456', 'Bachelor', '404 Birch St, Town'),
    (8, 'Olivia', 'Garcia', 4700.75, 'Finance Department', '2022-05-10', '78901234567', 'High School', '505 Pine St, Village'),
    (9, 'Ethan', 'Anderson', 5900.25, 'Marketing Department', '2022-06-05', '89012345678', 'PhD', '606 Cedar St, Suburb'),
    (10, 'Ava', 'Clark', 5300.00, 'Sales Department', '2021-09-20', '90123456789', 'Bachelor', '707 Oak St, County');
    
    
**Query 1**:Retrieve All Employees
   SELECT *
    FROM Employees

**[Results][2]**:

    | IdEmployee |    Name |  Surname | BasicSalary |       DepartmentName | DateOfEmployment |       PESEL |   Education |              Address |
    |------------|---------|----------|-------------|----------------------|------------------|-------------|-------------|----------------------|
    |          1 |    John |      Doe |        5000 |        IT Department |       2022-01-15 | 12345678901 |    Bachelor |    123 Main St, City |
    |          2 |   Alice |    Smith |      6000.5 |        HR Department |       2021-12-01 | 98765432109 |      Master |     456 Oak St, Town |
    |          3 |     Bob |  Johnson |     4500.75 |   Finance Department |       2022-02-10 | 23456789012 | High School | 789 Pine St, Village |
    |          4 |   Emily | Williams |     5500.25 | Marketing Department |       2022-03-05 | 34567890123 |         PhD | 101 Cedar St, Suburb |
    |          5 | Michael |    Brown |        5200 |     Sales Department |       2021-11-20 | 45678901234 |    Bachelor |   202 Elm St, County |
    |          6 |  Sophia |      Lee |        4800 |        IT Department |       2022-04-15 | 56789012345 |      Master |   303 Maple St, City |
    |          7 |  Daniel | Martinez |      5100.5 |        HR Department |       2021-10-01 | 67890123456 |    Bachelor |   404 Birch St, Town |
    |          8 |  Olivia |   Garcia |     4700.75 |   Finance Department |       2022-05-10 | 78901234567 | High School | 505 Pine St, Village |
    |          9 |   Ethan | Anderson |     5900.25 | Marketing Department |       2022-06-05 | 89012345678 |         PhD | 606 Cedar St, Suburb |
    |         10 |     Ava |    Clark |        5300 |     Sales Department |       2021-09-20 | 90123456789 |    Bachelor |   707 Oak St, County |

  **Query 2**: Retrieve Names and Basic Salaries of Employees in the IT Department
  
    SELECT Name, Surname, BasicSalary
    FROM Employees
    WHERE DepartmentName = 'IT Department'

**[Results][3]**:

    |   Name | Surname | BasicSalary |
    |--------|---------|-------------|
    |   John |     Doe |        5000 |
    | Sophia |     Lee |        4800 |
  
**Query 3**:Retrieve Employees Hired After January 1, 2022
  
    SELECT *
    FROM Employees
    WHERE DateOfEmployment > '2022-01-01'

**[Results][4]**:

    | IdEmployee |   Name |  Surname | BasicSalary |       DepartmentName | DateOfEmployment |       PESEL |   Education |              Address |
    |------------|--------|----------|-------------|----------------------|------------------|-------------|-------------|----------------------|
    |          1 |   John |      Doe |        5000 |        IT Department |       2022-01-15 | 12345678901 |    Bachelor |    123 Main St, City |
    |          3 |    Bob |  Johnson |     4500.75 |   Finance Department |       2022-02-10 | 23456789012 | High School | 789 Pine St, Village |
    |          4 |  Emily | Williams |     5500.25 | Marketing Department |       2022-03-05 | 34567890123 |         PhD | 101 Cedar St, Suburb |
    |          6 | Sophia |      Lee |        4800 |        IT Department |       2022-04-15 | 56789012345 |      Master |   303 Maple St, City |
    |          8 | Olivia |   Garcia |     4700.75 |   Finance Department |       2022-05-10 | 78901234567 | High School | 505 Pine St, Village |
    |          9 |  Ethan | Anderson |     5900.25 | Marketing Department |       2022-06-05 | 89012345678 |         PhD | 606 Cedar St, Suburb |

  **Query 4**:Retrieve Employees Hired After January 1, 2022
  
    SELECT Name, Surname
    FROM Employees
    WHERE BasicSalary > 4000

**[Results][5]**:

    |    Name |  Surname |
    |---------|----------|
    |    John |      Doe |
    |   Alice |    Smith |
    |     Bob |  Johnson |
    |   Emily | Williams |
    | Michael |    Brown |
    |  Sophia |      Lee |
    |  Daniel | Martinez |
    |  Olivia |   Garcia |
    |   Ethan | Anderson |
    |     Ava |    Clark |
  
**Query 5**: Average Basic Salary by Department
  
    SELECT DepartmentName, AVG(BasicSalary) AS AverageSalary
    FROM Employees
    GROUP BY DepartmentName

**[Results][6]**:

    |       DepartmentName | AverageSalary |
    |----------------------|---------------|
    |   Finance Department |       4600.75 |
    |        HR Department |        5550.5 |
    |        IT Department |          4900 |
    | Marketing Department |       5700.25 |
    |     Sales Department |          5250 |

  [1]: http://sqlfiddle.com/#!9/23e57b/1
  [2]: http://sqlfiddle.com/#!9/23e57b/1/0
  [3]: http://sqlfiddle.com/#!9/23e57b/1/1
  [4]: http://sqlfiddle.com/#!9/23e57b/1/2
  [5]: http://sqlfiddle.com/#!9/23e57b/1/3
  [6]: http://sqlfiddle.com/#!9/23e57b/1/4
