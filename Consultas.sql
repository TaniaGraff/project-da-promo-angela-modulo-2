-- FASE 7
-- Realización de Consultas para Obtener Información
USE CinemaExtract;

-- CONSULTA 1
-- ¿Qué géneros han recibido más premios Óscar?

SELECT peliculas_generos.genero,
COUNT(*) AS cantidad_oscars
FROM oscars
JOIN peliculas_generos
ON oscars.mejor_pelicula = peliculas_generos.titulo
GROUP BY peliculas_generos.genero
ORDER BY cantidad_oscars DESC
LIMIT 1;

-- Si el resultado fuera dos o más generos que han recibido el mismo numero de premios
-- Uso 'CTE' para separar el conteo de premios por genero de la consulta principal
WITH genero_premios AS (
    SELECT
    peliculas_generos.genero,
    COUNT(*) AS num_oscars
    FROM oscars
    JOIN peliculas_generos
    ON oscars.mejor_pelicula = peliculas_generos.titulo
    GROUP BY peliculas_generos.genero)
SELECT
genero,
num_oscars
FROM genero_premios
WHERE num_oscars = (
    SELECT MAX(num_oscars)
    FROM genero_premios
);
-- RESULTADO: El género Drama con 5 oscars (entre 2015 y 2020)


-- CONSULTA 2
-- ¿Qué género es el mejor valorado en IMDB?

-- Puede que existan dos o mas generos tengan la maxima valoracion
-- Hago la consulta con dos CTE's
WITH valoracion_genero AS ( -- calculo la valoracion media por genero
    SELECT
	peliculas_generos.genero,
	AVG(detalles_peliculas.puntuacion) AS valoracion_media
    FROM peliculas_generos
    JOIN detalles_peliculas
    ON peliculas_generos.id_imdb = detalles_peliculas.id_imdb
    GROUP BY peliculas_generos.genero
),
max_valoracion AS ( -- busco la valoracion maxima
    SELECT MAX(valoracion_media) AS valoracion_maxima
    FROM valoracion_genero
) -- consulta general donde selecciono los genero con valoracion maxima
SELECT
valoracion_genero.genero,
valoracion_genero.valoracion_media
FROM valoracion_genero
JOIN max_valoracion
ON valoracion_genero.valoracion_media = max_valoracion.valoracion_maxima;
-- RESULTADO: El genero Comedia tiene la valoracion maxima con 7.69 sobre 10

-- CONSULTA 3
-- ¿En qué año se estrenaron más películas?

SELECT anio,
COUNT(id_imdb) AS peliculas_estrenadas
FROM peliculas_generos
WHERE tipo = 'Movie'
GROUP BY anio
ORDER BY peliculas_estrenadas DESC
LIMIT 1;

-- En caso de que haya dos o más años con la misma cantidad de películas
-- Hago la consulta con dos CTE's
WITH peliculas_anio AS ( -- cantidad de peliculas estrenadas por anio
    SELECT anio, COUNT(id_imdb) AS peliculas_estrenadas
    FROM peliculas_generos
    WHERE tipo = 'Movie'
    GROUP BY anio 
), max_peliculas AS ( -- cantidad max de peliculas estrenadas
    SELECT MAX(peliculas_estrenadas) AS max_peliculas_estrenadas
    FROM peliculas_anio
) -- conculta principal: selecciona todos los años que tengan esa cantidad maxima de peliculas estrenadas
SELECT
anio,
peliculas_estrenadas
FROM peliculas_anio
WHERE peliculas_estrenadas = (
	SELECT max_peliculas_estrenadas
    FROM max_peliculas
);
-- RESULTADO: 2020 con 663 peliculas estrenadas

-- CONSULTA 4
-- ¿En qué año se estrenaron mas cortos?

SELECT anio,
COUNT(id_imdb) AS peliculas_estrenadas
FROM peliculas_generos
WHERE tipo = 'Short'
GROUP BY anio
ORDER BY peliculas_estrenadas DESC
LIMIT 1;

-- con CTE's por si devuelve mas de un anio
WITH cortos_anio AS ( -- cantidad de peliculas estrenadas por anio
    SELECT
    anio,
    COUNT(id_imdb) AS cortos_estrenados
    FROM peliculas_generos
    WHERE tipo = 'Short'
    GROUP BY anio 
), max_cortos AS ( -- cantidad max de peliculas estrenadas
    SELECT MAX(cortos_estrenados) AS max_cortos_estrenados
    FROM cortos_anio
) -- conculta principal: selecciona todos los años que tengan esa cantidad máxima de películas estrenadas
SELECT
anio,
cortos_estrenados
FROM cortos_anio
WHERE cortos_estrenados = (
	SELECT max_cortos_estrenados
    FROM max_cortos
);
-- RESULTADO: 2020 con 483 cortos estrenados

-- CONSULTA 5
-- ¿Cuál es la mejor serie valorada en IMDB?
-- No hay series, cambiamos la consigna a cortos

SELECT detalles_peliculas.titulo
FROM detalles_peliculas
JOIN peliculas_generos
ON detalles_peliculas.titulo = peliculas_generos.titulo
WHERE peliculas_generos.tipo = 'Short'
AND detalles_peliculas.puntuacion = (
    SELECT MAX(detalles_peliculas.puntuacion)
    FROM detalles_peliculas
    JOIN peliculas_generos
    ON detalles_peliculas.titulo = peliculas_generos.titulo
    WHERE peliculas_generos.tipo = 'Short'
);
-- RESUTLADO: Killer Missionaries

-- CONSULTA 6
-- ¿Cuál es la película mejor valorada en IMDB?

WITH peliculas AS ( -- CTE para obtener las peliculas tipo Movie
    SELECT titulo
    FROM peliculas_generos
    WHERE tipo = 'Movie'
) -- consulta general para seleccionar la mas valorada
SELECT detalles_peliculas.titulo
FROM detalles_peliculas
JOIN peliculas
ON detalles_peliculas.titulo = peliculas.titulo
WHERE detalles_peliculas.puntuacion = (
    SELECT MAX(puntuacion)
    FROM detalles_peliculas
    WHERE titulo IN (
		SELECT titulo
        FROM peliculas)
);
-- RESULTADOS: Badi, The Forest

-- CONSULTA 7
-- ¿Qué actor/actriz ha recibido más premios?

WITH actor_premios AS (-- Uso 'CTE' para separar el conteo de premios por actor de la consulta principal
    SELECT
    nombre_actor,
    COUNT(*) AS num_oscars
    FROM (-- combino las columnas de mejor actor y mejor actriz
        SELECT mejor_actor AS nombre_actor
        FROM oscars
        UNION ALL
        SELECT mejor_actriz AS nombre_actor
        FROM oscars
    ) AS actores
    GROUP BY nombre_actor
) -- consulta general: maximo numero de premios
SELECT
nombre_actor,
num_oscars
FROM actor_premios
WHERE num_oscars = (
    SELECT
    MAX(num_oscars)
    FROM actor_premios
);
-- RESULTADO: Me devuelve todos los resultados porque todos tiene solo 1

-- CONSULTA 8
-- ¿Hay algun actor/actriz que haya recibido más de un premio Óscar?

WITH actor_premios AS (-- Uso 'CTE' para separar el conteo de premios por actor de la consulta principal
    SELECT
    nombre_actor,
    COUNT(*) AS num_oscars
    FROM (-- combino las columnas de mejor actor y mejor actriz
        SELECT mejor_actor AS nombre_actor
        FROM oscars
        UNION ALL
        SELECT mejor_actriz AS nombre_actor
        FROM oscars
    ) AS actores
    GROUP BY nombre_actor
) -- consulta general: premios mayor que uno
SELECT
nombre_actor,
num_oscars
FROM actor_premios
WHERE num_oscars > 1;
-- RESULTADO: Ninguno, porque todos tienen solo un premio (entre 2015-2020)

-- CONSULTA 8 BIS
-- ¿Hay algun director/directora que haya recibido más de un premio Óscar?

WITH director_premios AS (
    -- Uso 'CTE' para separar el conteo de premios por director de la consulta principal
    SELECT
        mejor_director AS nombre_director,
        COUNT(*) AS num_oscars
    FROM oscars
    GROUP BY mejor_director
)
-- consulta general: premios mayor que uno
SELECT
    nombre_director,
    num_oscars
FROM director_premios
WHERE num_oscars > 1;


-- CONSULTA 9
-- ¿Qué actor/actriz ha recibido más premios?
SELECT nombre_actor, premios_ganados
FROM actores
ORDER BY premios_ganados DESC
LIMIT 1;

#tambien podemos hacer de la siguiente forma:
SELECT nombre_actor, premios_ganados
FROM actores
WHERE premios_ganados = (SELECT MAX(premios_ganados) FROM actores);

-- BONUS: CONSULTA 10
-- en qué trabajan los actores, además de reparto?
SELECT que_hace
FROM actores
WHERE que_hace NOT LIKE '%Reparto%';

-- BONUS: CONSULTA 11
-- quien es el actor más joven?
SELECT nombre_actor, anyo_nac
FROM actores
WHERE anyo_nac = (SELECT MAX(anyo_nac) FROM actores);

-- BONUS: CONSULTA 12
-- Encontrar películas con ciertas calificaciones

SELECT titulo
FROM detalles_peliculas
WHERE puntuacion BETWEEN 5 AND 8;

-- BONUS: CONSULTA 13
-- Encontrar películas dirigidas por un director en particular

SELECT titulo
FROM detalles_peliculas
WHERE direccion LIKE '%Guillermo%Toro%';

-- BONUS: CONSULTA 14
-- Obtener una lista de películas ganadoras de un premio Oscar en una categoría específica

SELECT titulo
FROM detalles_peliculas
WHERE genero = 'Drama'
AND titulo IN(
	SELECT mejor_pelicula
    FROM oscars);
    

