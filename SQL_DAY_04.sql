DROP TABLE IF EXISTS orders;


create table orderss(
  	category varchar(20),
	product varchar(20),
	user_id int , 
  	spend int,
  	transaction_date DATE
);



Insert into orderss values
('appliance','refrigerator',165,246.00,'2021/12/26'),
('appliance','refrigerator',123,299.99,'2022/03/02'),
('appliance','washingmachine',123,219.80,'2022/03/02'),
('electronics','vacuum',178,152.00,'2022/04/05'),
('electronics','wirelessheadset',156,	249.90,'2022/07/08'),
('electronics','TV',145,189.00,'2022/07/15'),
('Television','TV',165,129.00,'2022/07/15'),
('Television','TV',163,129.00,'2022/07/15'),
('Television','TV',141,129.00,'2022/07/15'),
('toys','Ben10',145,189.00,'2022/07/15'),
('toys','Ben10',145,189.00,'2022/07/15'),
('toys','yoyo',165,129.00,'2022/07/15'),
('toys','yoyo',163,129.00,'2022/07/15'),
('toys','yoyo',141,129.00,'2022/07/15'),
('toys','yoyo',145,189.00,'2022/07/15'),
('electronics','vacuum',145,189.00,'2022/07/15');



/*
Find the top 2 products in the top 2 categories based on spend amount?
*/

-- top 2 category based on spend 
-- top 2 product in above best 2 category

select * from orderss




with cte_category
as
(
	select
		category,
		total_spend_category
	from
		(
		select
			category,
			sum(spend) as total_spend_category,
			dense_rank() over(order by sum(spend) desc) as drn
		from
			orderss
		group by	
			category
		) as subq1
		where drn <= 2
)
SELECT
	category,
	product,
	total_spend_by_product
FROM
	(
	select
		o.category,
		o.product,
		sum(spend) as total_spend_by_product,
		dense_rank() over(partition by o.category order by sum(o.spend) desc) as pdrn
	from orderss as o
	join cte_category as ct
	on ct.category = o.category
	group by o.category,o.product
)subq2
where pdrn <= 2 








