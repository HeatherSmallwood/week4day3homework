-- 1. List all customers who live in Texas (use
-- JOINs)
SELECT customer.first_name, customer.last_name, address.district
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
WHERE district = 'Texas';

-- Answer: The customers names that live in Texas are Jennifer Davis, Kim Cruz, Richard Mccrary, Bryan Hardison, and Ian Still.


-- 2. Get all payments above $6.99 with the Customer's Full
-- Name HOW DO I DO DISTINCT
SELECT customer.first_name, customer.last_name, payment.amount
FROM customer
INNER JOIN payment
ON customer.customer_id = payment.customer_id
WHERE payment.amount > 6.99
ORDER BY payment.amount;

-- Answer: Mary Smith, Ida Andrews, Alvin Deloah, Alfredo Acadams, Harold Martino, Peter Menard, Douglas Graf, are the customers who have payments over $6.99 .

-- 3. Show all customers names who have made payments over $175(use
-- subqueries)

SELECT customer.first_name, customer.last_name
FROM customer
FULL JOIN payment
ON customer.customer_id = payment.customer_id
WHERE payment.amount IN(
	SELECT payment.amount
	FROM payment
	GROUP BY payment.amount 
)
GROUP BY customer.first_name, customer.last_name
HAVING SUM(amount) > 175;

-- Answer: Peter Menard and Mary Smith are the customers who have made payments over $175.

-- 4. List all customers that live in Nepal (use the city
-- table)

SELECT first_name, last_name
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
INNER JOIN city
ON address.city_id = city.city_id
INNER JOIN country
ON city.country_id = country.country_id
WHERE country.country = 'Nepal';
-- Answer: Kevin Schuler is the only customer who live in Nepal.

-- 5. Which staff member had the most
-- transactions?

SELECT first_name, last_name, COUNT(staff.staff_id)
FROM staff
INNER JOIN payment
ON staff.staff_id = payment.staff_id
GROUP BY staff.staff_id 
ORDER BY COUNT DESC;

-- Answer:Jon Stephens has the most transactions, he had 7304 transactions. 

-- 6. How many movies of each rating are
-- there?

SELECT rating, COUNT(film_id)
FROM film
GROUP BY rating
ORDER BY COUNT DESC;


-- Answer: There are 224 movies for PG-13 rating, 209 movies for NC-17 rating, 196 movies for R rating, 194 movies for PG rating, and 178 movies for G rating.

-- 7.Show all customers who have made a single payment
-- above $6.99 (Use Subqueries)

SELECT customer.customer_id
FROM customer
FULL JOIN payment
ON customer.customer_id = payment.customer_id
WHERE payment.amount IN(
	SELECT payment.amount
	FROM payment
	WHERE amount > 6.99
	GROUP BY payment.amount
)
GROUP BY customer.customer_id
HAVING COUNT(amount) = 1;

SELECT first_name, last_name
FROM customer
WHERE customer_id = '183';

-- Answer: These are the customers with single purchases over $6.99: Alfredo Mcadams (567), Harold Martino (342), 
-- Douglas Graf(343), Alvin Deloach(467), and Ida Andrews(183)

-- 8. How many free rentals did our stores give away?
SELECT COUNT(amount)
FROM payment
WHERE amount = 0.00;

-- Answer: there are zero free rentals.