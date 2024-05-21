use CinemaExtract;


SELECT ID 
FROM peliculas_generos 
WHERE ID NOT IN (SELECT id_pelicula FROM detalles_peliculas);

DELETE FROM peliculas_generos
WHERE (nombre columna) = "...";


SELECT *
FROM peliculas_generos
WHERE ID = 'tt0478970';


-- buscar duplicaods

SELECT titulo, COUNT(titulo)
FROM detalles_peliculas
GROUP BY titulo
HAVING COUNT(titulo) > 1;