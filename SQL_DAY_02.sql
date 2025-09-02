
DROP TABLE IF EXISTS Orders;


CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2)
);


DROP TABLE IF EXISTS Returns;
CREATE TABLE Returns (
    ReturnID INT PRIMARY KEY,
    OrderID INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);


INSERT INTO Orders (OrderID, OrderDate, TotalAmount) VALUES
(1, '2023-01-15', 150.50),
(2, '2023-02-20', 200.75),
(3, '2023-02-28', 300.25),
(4, '2023-03-10', 180.00),
(5, '2023-04-05', 250.80);


INSERT INTO Returns (ReturnID, OrderID) VALUES
(101, 2),
(102, 4),
(103, 5),
(104, 1),
(105, 3);


SELECT * FROM Orders
SELECT * FROM Returns

/*

Given the Orders table with columns OrderID, 
OrderDate, and TotalAmount, and the 
Returns table with columns ReturnID and OrderID, 

write an SQL query to calculate the total 
numbers of returned orders for each month

*/
-- total numbers of returns
-- group by month orders
-- LEFT JOIN 


SELECT
	EXTRACT(MONTH FROM OrderDate) AS mnth,
	count(rn.ReturnID) as tlt_rrnt
	
FROM Orders AS o
LEFT JOIN Returns as rn
ON o.OrderID = rn.OrderID
group by mnth --EXTRACT(MONTH FROM o.OrderDate)
order by mnth




SELECT 
	EXTRACT(MONTH FROM o.orderdate) || '-' || EXTRACT(YEAR FROM o.orderdate) as month,
	COUNT(r.returnid) as total_return
FROM returns as r
LEFT JOIN
orders as o
ON r.orderid = o.orderid
GROUP BY month
ORDER BY month ;

