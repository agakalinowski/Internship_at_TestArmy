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
        
     
    CREATE TABLE Buyer (
        CustomerID INT,
        OrderID INT PRIMARY KEY,
        ProductID INT
    );
    
   INSERT INTO Buyer (CustomerID, OrderID, ProductID) VALUES
    (105, 1, 201),
    (103, 2, 202),
    (102, 3, 203),
    (107, 4, 204),
    (109, 5, 205),
    (110, 6, 206),
    (106, 7, 207),
    (108, 8, 208),
    (101, 9, 209), 
    (104, 10, 210);
    
 
**Query 1**: Joining Orders and Buyer Tables to Retrieve Customer Order Details

    SELECT o.OrderID, b.CustomerID, o.ProductID, o.OrderDate, o.Quantity, o.TotalAmount
    FROM Orders o
    JOIN Buyer b ON o.OrderID = b.OrderID

**[Results][2]**:

    | OrderID | CustomerID | ProductID |  OrderDate | Quantity | TotalAmount |
    |---------|------------|-----------|------------|----------|-------------|
    |       1 |        105 |       201 | 2023-01-10 |        3 |         150 |
    |       2 |        103 |       202 | 2023-01-12 |        2 |       120.5 |
    |       3 |        102 |       203 | 2023-02-05 |        5 |      250.75 |
    |       4 |        107 |       204 | 2023-02-15 |        1 |       50.25 |
    |       5 |        109 |       205 | 2023-03-01 |        4 |         200 |
    |       6 |        110 |       206 | 2023-03-10 |        2 |       100.5 |
    |       7 |        106 |       207 | 2023-04-01 |        3 |      150.75 |
    |       8 |        108 |       208 | 2023-04-15 |        4 |         200 |
    |       9 |        101 |       209 | 2023-05-02 |        1 |       50.25 |
    |      10 |        104 |       210 | 2023-05-20 |        5 |         250 |

  [1]: http://sqlfiddle.com/#!9/1578f7/1
  [2]: http://sqlfiddle.com/#!9/1578f7/1/0

