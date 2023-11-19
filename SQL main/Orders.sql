**MySQL 5.6 Schema Setup**:

    CREATE TABLE Orders (
        OrderID INT PRIMARY KEY,
        CustomerID INT,
        ProductID INT,
        OrderDate DATE,
        Quantity INT,
        TotalAmount DECIMAL(10, 2)
    );
    
    INSERT INTO Orders (OrderID, CustomerID, ProductID, OrderDate, Quantity, TotalAmount) VALUES
    (1, 101, 201, '2023-01-10', 3, 150.00),
    (2, 102, 202, '2023-01-12', 2, 120.50),
    (3, 103, 203, '2023-02-05', 5, 250.75),
    (4, 104, 204, '2023-02-15', 1, 50.25),
    (5, 105, 205, '2023-03-01', 4, 200.00),
    (6, 106, 206, '2023-03-10', 2, 100.50),
    (7, 107, 207, '2023-04-01', 3, 150.75),
    (8, 108, 208, '2023-04-15', 4, 200.00),
    (9, 109, 209, '2023-05-02', 1, 50.25),
    (10, 110, 210, '2023-05-20', 5, 250.00);

**Query 1**: Retrieve All Orders

SELECT * 
FROM Orders

**[Results][2]**:

    | OrderID | CustomerID | ProductID |  OrderDate | Quantity | TotalAmount |
    |---------|------------|-----------|------------|----------|-------------|
    |       1 |        101 |       201 | 2023-01-10 |        3 |         150 |
    |       2 |        102 |       202 | 2023-01-12 |        2 |       120.5 |
    |       3 |        103 |       203 | 2023-02-05 |        5 |      250.75 |
    |       4 |        104 |       204 | 2023-02-15 |        1 |       50.25 |
    |       5 |        105 |       205 | 2023-03-01 |        4 |         200 |
    |       6 |        106 |       206 | 2023-03-10 |        2 |       100.5 |
    |       7 |        107 |       207 | 2023-04-01 |        3 |      150.75 |
    |       8 |        108 |       208 | 2023-04-15 |        4 |         200 |
    |       9 |        109 |       209 | 2023-05-02 |        1 |       50.25 |
    |      10 |        110 |       210 | 2023-05-20 |        5 |         250 |

  **Query 2**: Calculate Total Revenue

  SELECT SUM(TotalAmount) AS TotalRevenue
    FROM Orders

**[Results][3]**:

    | TotalRevenue |
    |--------------|
    |         1523 |

  **Query 3**: Retrieve Orders Placed in March 2023

    SELECT *
    FROM Orders
    WHERE OrderDate BETWEEN '2023-03-01' AND '2023-03-31'

**[Results][4]**:

    | OrderID | CustomerID | ProductID |  OrderDate | Quantity | TotalAmount |
    |---------|------------|-----------|------------|----------|-------------|
    |       5 |        105 |       205 | 2023-03-01 |        4 |         200 |
    |       6 |        106 |       206 | 2023-03-10 |        2 |       100.5 |

  **Query 4**: Find Customers with the Highest Total Spending

    SELECT CustomerID, SUM(TotalAmount) AS TotalSpending
    FROM Orders
    GROUP BY CustomerID
    ORDER BY TotalSpending DESC
    LIMIT 1

**[Results][5]**:

    | CustomerID | TotalSpending |
    |------------|---------------|
    |        103 |        250.75 |

  [1]: http://sqlfiddle.com/#!9/7142d6/1
  [2]: http://sqlfiddle.com/#!9/7142d6/1/0
  [3]: http://sqlfiddle.com/#!9/7142d6/1/1
  [4]: http://sqlfiddle.com/#!9/7142d6/1/2
  [5]: http://sqlfiddle.com/#!9/7142d6/1/3
