use mavenmovies;

/* 1) We will need list of all staff members including their first name and last names
,email addresses and the storeidentification no where they work.
*/
SELECT 
	first_name,
    last_name,
    email,
    store_id
FROM 
	staff;
    
/*
2) We will need separate counts of inventory items held at each of your two stores
*/

SELECT 
	store_id,
    COUNT(inventory_id) AS inventory_items
FROM inventory
GROUP BY
	store_id;

/*
3)we will need a count of active customers for each of our stores.Separately, please.
*/
SELECT 
	store_id,
    COUNT(customer_id) AS active_customers
FROM customer
WHERE active = 1
GROUP BY 
	store_id;
    
/*
4) In order to assess the liability of a data breach,
we will need you to provide a count of all the customer email 
addresses stored in the database.
*/

SELECT
	COUNT(email) as emails
FROM customer;

/*
5)we are interested in how diverse your film offering is as a means 
of understanding how likely you are to keep customers engaged in the future 
please provide the count of unique film titles you have an inventory at each 
row and then provide a count of the unit categories of films you provide
*/

SELECT 
	store_id,
    COUNT(DISTINCT film_id) AS unique_films
FROM 
	inventory
GROUP BY
	store_id;
    
SELECT 
	COUNT(DISTINCT name) AS unique_categories
FROM category;

/*
6)we would like to understand a replacement cost of your films.
please provide a replacement cost for the film that is least expensive to replace, 
the most expensive to replace and the  and the average of all the films you carry
*/

SELECT
	MIN(replacement_cost) AS least_expensive,
    MAX(replacement_cost) AS most_expensive,
    AVG(replacement_cost) AS average_replacement_cost
FROM film;

/*
7)we are interested in having you put payment monitoring system and maximum payment 
processing restrictions in place in order to minimise the Future risk of fraud by a staff
Please provide the average payment you process as well as the maximum
 payment you have processed
*/

SELECT
	AVG(amount) AS average_payment,
    MAX(amount) AS max_payment
FROM payment;

/*
8)we would like to better understand what your customers base looks like. 
please provide a list of the customers identification values, 
with the count of rentals they have made all-time, 
with your highest volume customers at the top of the list
*/

SELECT
	customer_id,
    COUNT(rental_id) as number_of_rentals
FROM rental
Group by rental_id
order by count(rental_id) desc;






