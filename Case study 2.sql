
create database casestudy2;
use casestudy2;

create table customers (
    customerid int primary key,
    firstname varchar(50),
    lastname varchar(50),
    city varchar(50),
    state varchar(50)
);


insert into  customers (customerid, firstname, lastname, city, state) values
(10101, 'John', 'Gray', 'Lynden', 'Washington'),
(10298, 'Leroy', 'Brown', 'Pinetop', 'Arizona'),
(10299, 'Elroy', 'Keller', 'Snoqualmie', 'Washington'),
(10315, 'Lisa', 'Jones', 'Oshkosh', 'Wisconsin'),
(10325, 'Ginger', 'Schultz', 'Pocatello', 'Idaho'),
(10329, 'Kelly', 'Mendoza', 'Kailua', 'Hawaii'),
(10330, 'Shawn', 'Dalton', 'Cannon Beach', 'Oregon'),
(10338, 'Michael', 'Howell', 'Tillamook', 'Oregon'),
(10339, 'Anthony', 'Sanchez', 'Winslow', 'Arizona'),
(10408, 'Elroy', 'Cleaver', 'Globe', 'Arizona'),
(10410, 'Mary Ann', 'Howell', 'Charleston', 'South Carolina'),
(10413, 'Donald', 'Davids', 'Gila Bend', 'Arizona'),
(10419, 'Linda', 'Sakahara', 'Nogales', 'Arizona'),
(10429, 'Sarah', 'Graham', 'Greensboro', 'North Carolina'),
(10438, 'Kevin', 'Smith', 'Durango', 'Colorado'),
(10439, 'Conrad', 'Giles', 'Telluride', 'Colorado'),
(10449, 'Isabela', 'Moore', 'Yuma', 'Arizona');

create table items_ordered (
    order_id int primary key auto_increment,
    customerid int,
    order_date date,
    Item varchar(50),
    quantity int,
    price decimal(10, 2),
    foreign key (customerid) references customers(customerid)
);


insert into items_ordered (customerid, order_date, Item, quantity, price) values
(10330, '1999-06-30', 'Pogo stick', 1, 28.00),
(10101, '1999-06-30', 'Raft', 1, 58.00),
(10298, '1999-07-01', 'Skateboard', 1, 33.00),
(10101, '1999-07-01', 'Life Vest', 4, 125.00),
(10299, '1999-07-06', 'Parachute', 1, 1250.00),
(10339, '1999-07-27', 'Umbrella', 1, 4.50),
(10449, '1999-08-13', 'Unicycle', 1, 180.79),
(10439, '1999-08-14', 'Ski Poles', 2, 25.50),
(10101, '1999-08-18', 'Rain Coat', 1, 18.30),
(10449, '1999-09-01', 'Snow Shoes', 1, 45.00),
(10439, '1999-09-18', 'Tent', 1, 88.00),
(10298, '1999-09-19', 'Lantern', 2, 29.00),
(10410, '1999-10-28', 'Sleeping Bag', 1, 89.22),
(10438, '1999-11-01', 'Umbrella', 1, 6.75),
(10438, '1999-11-02', 'Pillow', 1, 8.50),
(10298, '1999-12-01', 'Helmet', 1, 22.00),
(10449, '1999-12-15', 'Bicycle', 1, 380.50),
(10449, '1999-12-22', 'Canoe', 1, 280.00),
(10101, '1999-12-30', 'Hoola Hoop', 3, 14.75),
(10330, '2000-01-01', 'Flashlight', 4, 28.00),
(10101, '2000-01-02', 'Lantern', 1, 16.00),
(10299, '2000-01-18', 'Inflatable Mattress', 1, 38.00),
(10438, '2000-01-18', 'Tent', 1, 79.99),
(10413, '2000-01-19', 'Lawnchair', 4, 32.00),
(10410, '2000-01-30', 'Unicycle', 1, 192.50),
(10315, '2000-02-02', 'Compass', 1, 8.00),
(10449, '2000-02-29', 'Flashlight', 1, 4.50),
(10101, '2000-03-08', 'Sleeping Bag', 2, 88.70),
(10298, '2000-03-18', 'Pocket Knife', 1, 22.38),
(10449, '2000-03-19', 'Canoe paddle', 2, 40.00),
(10298, '2000-04-01', 'Ear Muffs', 1, 12.50),
(10330, '2000-04-19', 'Shovel', 1, 16.75);


select * from customers;


-- SELECT Statement
-- 1.From the items_ordered table, select a list of all items purchased for customerid 10449. Display the customerid, item, and price for this customer.

select customerid, Item, price
from items_ordered
where customerid = 10449;


-- 2.Select all columns from the items_ordered table for whoever purchased a Tent.

select * from items_ordered
where Item = 'Tent';


-- 3.Select the customerid, order_date, and item values from the items_ordered table for any items in the item column that start with the letter "S".

select customerid, order_date, Item
where Item like 'S%';


-- 4.Select the distinct items in the items_ordered table. In other words, display a listing of each of the unique items from the items_ordered table.

select distinct Item
from items_ordered;
	

-- Aggregate Functions
-- 1.Select the maximum price of any item ordered in the items_ordered table. Hint: Select the maximum price only.

select max(price) as max_price
from items_ordered;


-- 2.Select the average price of all of the items ordered that were purchased in the month of Dec.

select avg(price) as avg_price_dec
from items_ordered
where extract(month from order_date) = 12;


-- 3.What are the total number of rows in the items_ordered table?

select count(customerid) as total_rows
from items_ordered;


-- 4.For all of the tents that were ordered in the items_ordered table, what is the price of the lowest tent? Hint: Your query should return the price only.

select min(price) as min_tent_price
from items_ordered
where Item = 'Tent';



-- GROUP BY clause
-- 1.How many people are in each unique state in the customers table? Select the state and display the number of people in each.
-- Hint: count is used to count rows in a column, sum works on numeric data only.

select state, count(state) as number_of_people
from customers
group by state;


-- 2.From the items_ordered table, select the item, maximum price, and minimum price for each specific item in the table. Hint: The items will need to be broken up into separate groups.

select Item, max(price) as maximum_price, min(price) as minimum_price
from items_ordered
group by Item;


-- 3.How many orders did each customer make? Use the items_ordered table. Select the customerid, number of orders they made, and the sum of their orders. Click the Group By answers link below if you have any problems.

select customerid, count(customerid) as number_of_orders, sum(quantity * price) as total_order_amount
from items_ordered
group by customerid; 



-- HAVING clause
-- 1.	How many people are in each unique state in the customers table that have more than one person in the state? Select the state and display the number of how many people are in each if it's greater than 1.

select state, count(customerid) as number_of_people
from customers
group by state
having count(customerid) > 1;


-- 2.From the items_ordered table, select the item, maximum price, and minimum price for each specific item in the table. Only display the results if the maximum price for one of the items is greater than 190.00.

select Item, max(price) as maximum_price, min(price) as minimum_price
from items_ordered
group by Item
having max(price) > 190.00;


-- 3.How many orders did each customer make? Use the items_ordered table. Select the customerid, number of orders they made, and the sum of their orders if they purchased more than 1 item.

select customerid, count(quantity) as number_of_orders, sum(quantity * price) as total_order_amount
from items_ordered
group by customerid
having count(quantity) > 1;



-- Order By
-- 1.Select the lastname, firstname, and city for all customers in the customers table. Display the results in Ascending Order based on the lastname.

select lastname, firstname, city
from customers
order by lastname;


-- 2.Same thing as exercise #1, but display the results in Descending order.

select lastname, firstname, city
from customers
order by lastname desc;


-- 3.Select the item and price for all of the items in the items_ordered table that the price is greater than 10.00. Display the results in Ascending order based on the price.

select item, price
from items_ordered
where price > 10.00
order by price ;



-- Combining Conditions & Boolean Operators
-- 1.Select the customerid, order_date, and item from the items_ordered table for all items unless they are 'Snow Shoes' or if they are 'Ear Muffs'. Display the rows as long as they are not either of these two items.

select customerid, order_date, item 
from items_ordered 
where (item <> 'Snow shoes') and (item <> 'Ear muffs');

-- 2.Select the item and price of all items that start with the letters 'S', 'P', or 'F'.

select item, price 
from items_ordered 
where (item like 'S%') or (item like 'P%') or (item like 'F%');



-- IN & BETWEEN
-- 1.Select the date, item, and price from the items_ordered table for all of the rows that have a price value ranging from 10.00 to 80.00.

select order_date, item, price
from items_ordered
where price between 10.00 and 80.00;


-- 2.Select the firstname, city, and state from the customers table for all of the rows where the state value is either: Arizona, Washington, Oklahoma, Colorado, or Hawaii.

SELECT firstname,city,state
FROM customers
WHERE state IN('Arizona','Washington','Oklahoma','Colorado','Hawaii');



-- Mathematical Functions
-- 1.Select the item and per unit price for each item in the items_ordered table. Hint: Divide the price by the quantity.

select item, price / quantity as per_unit_price
from items_ordered;



-- Table Joins
-- 1.Write a query using a join to determine which items were ordered by each of the customers in the customers table. Select the customerid, firstname, lastname, order_date, item, and price for everything each customer purchased in the items_ordered table.

select c.customerid, c.firstname, c.lastname, io.order_date, io.item, io.price
from customers c
inner join items_ordered io ON c.customerid = io.customerid;


-- 2.Repeat exercise #1, however display the results sorted by state in descending order.

select c.customerid, c.firstname, c.lastname, io.order_date, io.item, io.price
from customers c
inner join items_ordered io on c.customerid = io.customerid
order by c.state desc;
	











