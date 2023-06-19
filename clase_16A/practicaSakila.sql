 
-- Reportes parte 1: 

-- 1. Obtener el nombre y apellido de los primeros 5 actores disponibles. Utilizar 
-- alias para mostrar los nombres de las columnas en español. 

SELECT first_name AS nombre, last_name AS apellido
FROM actor
LIMIT 5;

-- 2. Obtener un listado que incluya nombre, apellido y correo electrónico de los 
-- clientes (customers) inactivos. Utilizar alias para mostrar los nombres de las 
-- columnas en español. 

SELECT first_name AS nombre, last_name AS apellido, email, active
FROM customer
WHERE active = 0;

-- 3. Obtener un listado de films incluyendo título, año y descripción de los films 
-- que tienen un rental_duration mayor a cinco. Ordenar por rental_duration de 
-- mayor a menor. Utilizar alias para mostrar los nombres de las columnas en 
-- español. 

SELECT title AS titulo, release_year AS "año de estreno", description AS descripcion 
FROM film
WHERE rental_duration > 5
ORDER BY rental_duration desc;

-- 4. Obtener un listado de alquileres (rentals) que se hicieron durante el mes de 
-- mayo de 2005, incluir en el resultado todas las columnas disponibles. 

SELECT*
FROM rental
WHERE rental_date BETWEEN "2005-05-01 00:00:00" AND "2005-05-31 00:00:00";