 
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





-- Reportes parte 2: Sumemos complejidad 
-- Si llegamos hasta acá, tenemos en claro la estructura básica de un SELECT. En los siguientes reportes vamos a sumar complejidad. 
-- ¿Probamos? 


-- 1. Obtener la cantidad TOTAL de alquileres (rentals). Utilizar un alias para mostrarlo en una columna llamada “cantidad”. 

SELECT COUNT(rental_id) AS "cantidad"
FROM rental;

-- 2. Obtener la suma TOTAL de todos los pagos (payments). Utilizar un alias para mostrarlo en una columna llamada “total”, 
-- junto a una columna con la cantidad de alquileres con el alias “Cantidad” y una columna que indique el 
-- “Importe promedio” por alquiler. 

SELECT SUM(payment.amount) AS "total", COUNT(rental.rental_id) AS "cantidad", AVG(payment.amount) AS  "importe promedio"
FROM payment
INNER JOIN rental ON payment.rental_id = rental.rental_id;

-- 3. Generar un reporte que responda la pregunta: ¿cuáles son los diez clientes que más dinero gastan y en cuántos alquileres lo hacen? 
SELECT customer.first_name AS "cliente", SUM(payment.amount) AS "gasto total", COUNT(payment.rental_id) AS "renta de peliculas"
FROM customer
INNER JOIN rental  ON customer.customer_id = rental.customer_id 
INNER JOIN payment ON payment.customer_id = customer.customer_id
GROUP BY customer.first_name
ORDER BY "gasto total" DESC
LIMIT 10;

-- 4. Generar un reporte que indique: ID de cliente, cantidad de alquileres y monto total para todos los clientes que hayan gastado más de 150 dólares en alquileres. 

SELECT customer.customer_id AS "numero_de_cliente", COUNT(rental.rental_id) AS "cantidad_de_alquileres", SUM(payment.amount) AS "monto_total"
FROM customer
INNER JOIN rental  ON customer.customer_id = rental.customer_id 
INNER JOIN payment ON payment.customer_id = customer.customer_id
GROUP BY customer.customer_id
HAVING monto_total > 150;

-- 5. Generar un reporte que muestre por mes de alquiler (rental_date de tabla rental), la cantidad de alquileres y 
-- la suma total pagada (amount de tabla payment) para el año de alquiler 2005 (rental_date de tabla rental). 



-- 6. Generar un reporte que responda a la pregunta: ¿cuáles son los 5 inventarios más alquilados? (columna inventory_id en la tabla rental). Para cada una de ellas indicar la cantidad de alquileres. 

