
DROP TABLE IF EXISTS employees;

-- Create the employee_salary table
CREATE TABLE employeess (
    emp_id INT,
    name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10, 2)
);



-- Insert all records again to simulate duplicates
INSERT INTO employeess(emp_id, name, department, salary) VALUES
(1, 'John Doe', 'Finance', 60000.00),
(2, 'Jane Smith', 'Finance', 65000.00), 
(2, 'Jane Smith', 'Finance', 65000.00),   -- Duplicate
(9, 'Lisa Anderson', 'Sales', 63000.00),
(9, 'Lisa Anderson', 'Sales', 63000.00),  -- Duplicate
(9, 'Lisa Anderson', 'Sales', 63000.00),  -- Duplicate
(10, 'Kevin Martinez', 'Sales', 61000.00);


/*
Question:
How would you identify duplicate entries in
a SQL in given table employees columns are 
emp_id, name, department, salary
*/

-- ------------------------
-- My Solution
-- ------------------------

-- approach 1

select
	emp_id,
	name,
	count(1) as duplicate
from employeess
group by emp_id,name
having count(1) > 1


-- appproach 2

select
*
from
(select
	*,
	row_number() over(partition by name order by name) as rn
	from employeess
) as subquery
where rn > 1


