-- = Wednesday Homework = --


-- 1. List all customers who lives in Texas(use JOINs).
select first_name, last_name, district
from customer 
inner join address 
on customer.address_id = address.address_id
where district like 'Texas';
-- Answer: There are about 5 customers from Texas.


-- 2. Get all payments above $6.99 with Customer's Full Name.
select first_name, last_name, amount
from customer 
inner join payment 
on customer.customer_id = payment.customer_id
where amount > 6.99;
-- Answer: There are 1423 payments above $6.99

-- 3. Show all customers names who have made payments over $175 (use subqueries)
select first_name, last_name
from customer 
where customer_id in(
        select customer_id
        from payment 
        group by customer_id 
        having sum(amount) > 175
        order by sum(amount) desc
);
--There are 7 total customers who have made payments above $175.

--4. List all customers who live in Nepel.
select CUSTOMER.first_name, CUSTOMER.last_name
from customer 
full join address
on CUSTOMER.address_id = ADDRESS.address_id
full join city 
on ADDRESS.city_id = CITY.city_id 
full join country
on CITY.country_id = COUNTRY.country_id
where COUNTRY = 'Nepal';
--There is only one customer from 'Nepel' name Kevin Schuler

select * from rental;
select * from staff;

--5. Which staff member had the most transactions?
select staff.FIRST_NAME, staff.LAST_NAME, count(rental.rental_id)
from staff
full join rental 
on STAFF.staff_id = RENTAL.staff_id
group by STAFF.staff_id
order by COUNT desc;
-- Mike Hillyer had the most transactions with 8,040.

--6. How many movies of each rating are there?
select RATING, count(*) as RATING_COUNT
from film 
group by rating 
order by RATING_COUNT desc;
-- PG-13 has 223, NC-17 has 210, R has 195, PG has 194, G has 178

--7. Show all customers who have made a single payment above $6.99 (Use Subqueries).
select store_id, first_name, last_name
from customer 
where customer_id in (
    select customer_id
    from payment
    where amount > 6.99
);
-- There are 539 customers who have made a single payment above $6.99.

--8. How many free rentals did our stores give away?
select COUNT(amount)
from payment 
where amount = 0.00;
-- The store gave away 24 free rentals.




















