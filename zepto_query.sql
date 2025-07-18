create database zepto;
use zepto;
show tables;

create table zepto(
category varchar(120),
name varchar(150) not null,
mrp numeric(8,2),
discountPercent numeric(5,2),
availableQuantity integer,
discountedSellingPrice numeric(8,2),
weightInGms integer,
outOfStock boolean,
quantity integer
);

#Data Exploration

#count of rows
select count(*) from zepto_v2;

#sample data
select * from zepto_v2 limit 5;

ALTER TABLE zepto_v2
RENAME COLUMN `Category` TO category;

#null values
select * from zepto_v2 where category is null 
or name is null 
or mrp is null
or discountPercent is null
or availableQuantity is null
or discountedSellingPrice is null
or weightInGms is null
or outOfStock is null
or quantity is null;

#different product categories
select distinct category from zepto_v2 order by category;

#product in stock vs product out of stock
select outOfStock, count(outOfStock) from zepto_v2 group by outOfStock;

#product names present multiple times
select name, count(name) as ncount from zepto_v2 group by name order by ncount desc;

#Data Cleaning

#products with price 0
select * from zepto_v2 where mrp = 0 or discountedSellingPrice = 0;
delete from zepto_v2 where mrp = 0;
select * from zepto_v2 where mrp = 0;

#convert paise to rupees
UPDATE zepto_v2
SET
  mrp = mrp / 100,
  discountedSellingPrice = discountedSellingPrice / 100;

select mrp, discountedSellingPrice from zepto_v2;

#Questions
#Q1 Find the top 10 best value products based on the disocunt percentage
select name, mrp, discountPercent from zepto_v2 order by discountPercent desc limit 10; 

#Q2 What are the products with high Mrp but out of stock?
select distinct name, mrp from zepto_v2 where outOfStock = 'TRUE' and mrp > 300 order by mrp desc;

#Q3 Calculate estimated revenue for each category
select category, sum(availableQuantity * discountedSellingPrice) as total_revenue from zepto_v2 group by category order by total_revenue desc;

#Q4 Find all products where MRP is greater than Rs500 and discount is less than 10%
select distinct name, mrp, discountPercent from zepto_v2 where mrp > 500 and discountPercent < 10 order by mrp desc;

#Q5 Identify the top 5 categories offering the highest average discount percentage
select category, round(avg(discountPercent),2) as avg_discount from zepto_v2 group by category order by avg_discount desc limit 5;

#Q6 Find the price per gram for products above 100g and sort by best value
select distinct name, weightInGms, discountedSellingPrice, round(discountedSellingPrice/weightInGms,2) as price_per_gm from zepto_v2 where weightInGms > 100 order by price_per_gm;

#Q7 Group the products categories like Low, Medium, Bulk.
select distinct name, weightInGms,
case when weightInGms < 1000 then 'Low'
	when weightInGms < 5000 then 'Medium'
    else 'Bulk'
    end as weight_category
from zepto_v2;

#Q8 What is the total inventory weight per category
select category, sum(weightInGms * availableQuantity) as total_weight from zepto_v2 group by category order by total_weight;














