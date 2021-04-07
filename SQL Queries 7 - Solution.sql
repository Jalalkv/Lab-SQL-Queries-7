#Lab | SQL Queries 7 - Solution 



# 1) In the actor table, which are the actors whose last names are not repeated? 
# For example if you would sort the data in the table actor by last_name, 
# you would see that there is Christian Arkoyd, Kirsten Arkoyd, and Debbie Arkoyd. 
# These three actors have the same last name. So we do not want to include this last name in our output. 
# Last name "Astaire" is present only one time with actor "Angelina Astaire", 
# hence we would want this in our output list.

SELECT 
    a.last_name, COUNT(*) AS no_repeat
FROM
    sakila.actor a
GROUP BY a.last_name
HAVING COUNT(*) = 1;  



# 2) Which last names appear more than once?
# We would use the same logic as in the previous question 
# but this time we want to include the last names of the actors where the last name was present more than once.

SELECT 
    a.last_name, COUNT(*) AS repeated_surnames
FROM
    sakila.actor a
GROUP BY a.last_name
HAVING COUNT(*) > 1; 



# 3) Using the rental table, find out how many rentals were processed by each employee.

SELECT 
    COUNT(rental_id)
FROM
    sakila.rental
GROUP BY staff_id;



# 4) Using the film table, find out how many films were released each year

SELECT count(film_id), release_year
FROM sakila.film
GROUP BY release_year;



# 5) Using the film table, find out for each rating how many films were there.

SELECT count(film_id), rating
FROM sakila.film
GROUP BY rating;



# 6) What is the average length of films for each rating? Round off the average lengths to two decimal places.

SELECT 
    f.rating, ROUND(AVG(f.length / f.rating), 2) AS avglen
FROM
    sakila.film f
GROUP BY f.rating; 



# 7) Which kind of movies (based on rating) have an average duration of two hours or more? (X)

SELECT 
    f.rating, ROUND(AVG(f.length / f.rating), 2) AS avglen
FROM
    sakila.film f
WHERE f.lenght > 120 
GROUP BY f.rating;