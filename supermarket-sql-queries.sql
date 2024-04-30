use sales_db ;
-- uploading data from the csv file in to the created table :
load   data infile 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\supermarket_sales - Sheet1.csv'
into table supermarket
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows;
-- --------------------------------------------------
-- now we check the data uploaded to the table :

SELECT * FROM sales_db.supermarket;
-- 1 total products quantity sold :
select sum(Quantity) as total_sold_products from supermarket ;
--  2 total revenu :
select sum(Total) as total_revenue from supermarket  ;
-- 3 total sales by branch:
select Branch ,sum(Total) as sales from supermarket
group by Branch 
order by sales desc;
-- 4 total orders  by product line:
select  `Product line`,count(distinct(`Invoice ID`)) as total_orders from supermarket
group by `Product line` 
order by total_orders desc;
-- 5 total orders 
select count(distinct(`Invoice ID`)) as total_orders from supermarket;
-- 6 total orders by branch:
select Branch , count(distinct(`Invoice ID`)) as total_orders from supermarket
group by Branch
order by total_orders desc;
--  7 total order by gender:
select  Gender,count(distinct(`Invoice ID`)) as total_orders from supermarket
group by Gender 
order by total_orders desc;
-- 8  orders by city:
select City ,count(distinct(`Invoice ID`)) as total_orders from supermarket
group by City
order by total_orders desc;
-- 9 total orders by customer type:
select  `Customer type`,count(distinct(`Invoice ID`)) as total_orders from supermarket
group by `Customer type` 
order by total_orders desc;
-- 10  average items per order:
select  avg(Quantity) as average_items_per_order from supermarket ;
-- 11 orders by payment method:
select Payment,count(distinct(`Invoice ID`)) as orders from supermarket
group by Payment 
order by orders desc;
-- 12 rating for each branch 
select Branch,avg(Rating) as rate from supermarket
group by Branch
order by rate desc;
-- 13 orders by day--
select dayname(str_to_date(`Date`,"%m/%d/%y"))as order_day ,count(distinct(`Invoice ID`)) as orders from supermarket
group by order_day
order by orders desc ;
--  14 orders by month
select monthname(str_to_date(`Date`,"%m/%d/%y"))as order_month ,count(distinct(`Invoice ID`)) as orders from supermarket
group by order_month
order by orders desc ;
-- 15 monthly gross income :
select  monthname(str_to_date(`Date`,"%m/%d/%y")) as Month ,sum(`gross income`) as total_gross from supermarket 
group by Month
order by total_gross desc ;








