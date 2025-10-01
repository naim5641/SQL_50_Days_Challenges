DROP TABLE IF EXISTS employees;
CREATE TABLE employees111 (
    emp_id INT PRIMARY KEY,
    name VARCHAR(100),
    manager_id INT,
    FOREIGN KEY (manager_id) REFERENCES employees111(emp_id)
);

INSERT INTO employees111 (emp_id, name, manager_id) VALUES
(1, 'John Doe', NULL),        -- John Doe is not a manager
(2, 'Jane Smith', 1),          -- Jane Smith's manager is John Doe
(3, 'Alice Johnson', 1),       -- Alice Johnson's manager is John Doe
(4, 'Bob Brown', 3),           -- Bob Brown's manager is Alice Johnson
(5, 'Emily White', NULL),      -- Emily White is not a manager
(6, 'Michael Lee', 3),         -- Michael Lee's manager is Alice Johnson
(7, 'David Clark', NULL),      -- David Clark is not a manager
(8, 'Sarah Davis', 2),         -- Sarah Davis's manager is Jane Smith
(9, 'Kevin Wilson', 2),        -- Kevin Wilson's manager is Jane Smith
(10, 'Laura Martinez', 4);     -- Laura Martinez's manager is Bob Brown


/*
You have a table named employees containing information about employees, 
including their emp_id, name, and manager_id. 
The manager_id refers to the emp_id of the employee's manager.


write a SQL query to retrieve all employees' 
details along with their manager's names based on the manager ID

*/

SELECT * FROM employees111;

select
	e1.emp_id,
	e1.name,
	e1.manager_id,
	e2.name as manager_name
from employees111 as e1
cross join
employees111 as e2
where e1.manager_id = e2.emp_id


select
	e1.emp_id,
	e1.name,
	e1.manager_id,
	e2.name as manager_name
from employees111 as e1
inner join 
employees111 as e2
on e1.manager_id = e2.emp_id


-- Your Task
-- Write a SQL query to find the names of all employees who are also managers. 

select
	name
from employees111
where emp_id in (
		select 
			distinct manager_id
		from employees111
		where employees111 is not null
)







