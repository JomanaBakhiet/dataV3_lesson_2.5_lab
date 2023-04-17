--  1. Select all the actors with the first name ‘Scarlett’
use sakila ;
select* from sakila.actor
where first_name = 'Scarlett' ;
-- 2.How many physical copies of movies are available for rent in the store's inventory? How many unique movie titles are available?
select* from sakila.inventory ;
SELECT count(film_id) FROM sakila.inventory ;
SELECT count(distinct(film_id)) as Number_of_Unique_available_movies FROM inventory ;
-- 3. What are the shortest and longest movie duration? Name the values max_duration and min_duration
select
min(length) as min_duration,
max(length) as max_duration 
from film;
-- 4.What's the average movie duration expressed in format (hours, minutes)?
select time_format(sec_to_time(avg(length * 60)), '%H:%i') as avg_duration FROM film;
-- 5.How many distinct (different) actors' last names are there?
select count(distinct(last_name)) from sakila.actor ;
-- 6.How many days was the company operating? Assume the last rental date was their closing date. (check DATEDIFF() function)
select 
datediff
(max((rental_date)), 
min((rental_date)))
as op_days from rental;
-- 7. Show rental info with additional columns months and weekday. Get 20 results
select *, month(rental_date) AS "month", dayname(rental_date) as weekday
from rental
limit 20;
-- 8. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week
select *,
case dayofweek(rental_date)
when 6 then 'weekend'
when 7 then 'weekend'
else 'workday'
end as day_type
from rental;
-- 9. Get release years.
select distinct(release_year) from film;
-- 10. Get all films with ARMAGEDDON in the title.
select title from film
where title like "%%ARMAGEDDO%%";
-- 11. Get all films with ARMAGEDDON in the title.
select title from film
where title like "%APOLLO";
-- 12. Get 10 the longest films.
select title, length from film
order by length desc
limit 10;
-- 13. How many films include Behind the Scenes content?
select distinct special_features from film;
select count(distinct title) from film
where special_features = "Behind the Scenes";
