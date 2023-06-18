-- Funciones de agregación, GROUP BY y HAVING

-- 1. ¿Cuántas películas hay?

SELECT COUNT(id) AS "cantidad de peliculas" 
FROM movies;

-- 2. ¿Cuántas películas tienen entre 3 y 7 premios?

SELECT COUNT(id)
FROM movies
WHERE awards BETWEEN 3 AND 7;
 
-- 3. ¿Cuántas películas tienen entre 3 y 7 premios y un rating mayor a 7?

SELECT COUNT(id)
FROM movies
WHERE awards BETWEEN 3 AND 7
AND rating >= 7;

-- 4. Crear un listado a partir de la tabla de películas, mostrar un reporte de la
-- cantidad de películas por id. de género.

SELECT COUNT(genre_id)
FROM movies;


-- 5. De la consulta anterior, listar sólo aquellos géneros que tengan como suma
-- de premios un número mayor a 5.

SELECT COUNT(genre_id)
FROM movies
HAVING COUNT(awards) > 5;