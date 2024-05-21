use CinemaExtract;


SELECT ID 
FROM peliculas_generos 
WHERE ID NOT IN (SELECT id_pelicula FROM detalles_peliculas);

DELETE FROM peliculas_generos
WHERE (nombre columna) = "...";
