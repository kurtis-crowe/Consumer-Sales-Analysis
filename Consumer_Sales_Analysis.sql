/*
    Name: <Kurtis Crowe>
    DTSC660: Data and Database Managment with SQL
    Module 7
    Assignment 5


*/

--------------------------------------------------------------------------------
/*				                 Table Creation		  		                  */
--------------------------------------------------------------------------------

    CREATE TABLE customer_spending (
    sale_date date,
    sale_year integer,
    sale_month varchar(30),
    age integer,
    gender varchar(30),
    country text,
    state text,
    category text,
    sub_category text,
    quantitiy integer,
    unit_cost NUMERIC,
    unit_price NUMERIC,
    cost NUMERIC,
    revenue NUMERIC
);
--------------------------------------------------------------------------------


--------------------------------------------------------------------------------
/*				                 Import Data           		  		          */
--------------------------------------------------------------------------------

COPY customer_spending FROM 'C:/Users/jeromy/Eastern University/SQL/customer_spending (5).csv' DELIMITER ',' CSV HEADER;


--------------------------------------------------------------------------------



--------------------------------------------------------------------------------
/*				                 Question 1: 		  		                  */
--------------------------------------------------------------------------------
SELECT DISTINCT category,
	SUM(revenue)
FROM customer_spending
WHERE sale_year = '2016'
GROUP BY category;
--------------------------------------------------------------------------------
/*				                  Question 2           		  		          */
--------------------------------------------------------------------------------
SELECT  DISTINCT sub_category,
	AVG(unit_price),
	AVG(unit_cost),
	AVG(unit_price - unit_cost) AS margin
FROM customer_spending
WHERE sale_year = '2015'
GROUP BY sub_category;
--------------------------------------------------------------------------------
/*				                  Question 3           		  		          */
--------------------------------------------------------------------------------
SELECT DISTINCT COUNT(gender = 'F')
FROM customer_spending
WHERE category = 'Clothing';
--------------------------------------------------------------------------------
/*				                  Question 4           		  		          */
--------------------------------------------------------------------------------
SELECT DISTINCT age,
	sub_category,
	AVG(quantity),
	AVG(cost)
FROM customer_spending
GROUP BY age, sub_category
ORDER BY age DESC, sub_category;
--------------------------------------------------------------------------------
/*				                  Question 5           		  		          */
--------------------------------------------------------------------------------
SELECT DISTINCT country,
		count(country)
FROM customer_spending
WHERE age BETWEEN 18 and 25
GROUP BY country
HAVING count(*) > 30;
--------------------------------------------------------------------------------
/*				                  Question 6           		  		          */
--------------------------------------------------------------------------------
SELECT DISTINCT sub_category,
ROUND(avg(quantity), 2) AS avg_quantity,
ROUND(avg(cost), 2) AS avg_cost
FROM customer_spending
GROUP BY sub_category
HAVING count(sub_category) >= 10
ORDER BY sub_category;
--------------------------------------------------------------------------------
/*				                  Question 7           		  		          */
--------------------------------------------------------------------------------
SELECT sub_category,
quantity,
revenue
FROM customer_spending
WHERE gender = 'M' and sale_year = '2016'
GROUP by sub_category, quantity, revenue;
--------------------------------------------------------------------------------
/*				                  Question 8           		  		          */
--------------------------------------------------------------------------------

SELECT DISTINCT country,
	SUM(revenue) 
FROM customer_spending 
GROUP BY country
ORDER BY country;
--------------------------------------------------------------------------------
/*				                  Question 9           		  		          */
--------------------------------------------------------------------------------


SELECT DISTINCT gender,
	category,
	max(unit_cost) AS high_cost,
	min(unit_cost) AS low_cost,
	avg(unit_cost) AS avg_cost
FROM customer_spending
GROUP BY gender, category
ORDER BY gender, category;	
--------------------------------------------------------------------------------
/*				                  Question 10           		  	          */
--------------------------------------------------------------------------------

SELECT DISTINCT country,
	AVG(revenue) as high_sales
from customer_spending
GROUP BY country
ORDER by AVG(revenue) DESC
LIMIT 1;