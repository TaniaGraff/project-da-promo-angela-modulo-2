# Repo_CinemExtract
Repositorio Proyecto CinemExtract: Explorando el Séptimo Arte a través de Datos y Tecnología.

*Equipo de desarrollo*: 
Elena Águila, Vanesa Díaz, Valentina Fisher, Tania Graff y Franca Tortarolo.


## El trabajo consta de 7 fases:

### Fase 1:

En esta fase se utilizó la API de MovieDataSet para extraer información de peliculas y cortos entre los años 2015-2020.
 
    - Tipo (si es corto o película).

    - Nombre de la película o el corto.

    - Año de estreno de la película o corto.

    - Mes de estreno de la película o corto.

    - Id de la película (Identificativo de IMDB)

    - Género: Drama, Comedy, Action, Fantasy, Horror, Mystery, Romance, Thriller.

### Fase 2: 


En esta fase se ha obtenido información de las peliculas y cortos extraidos de la FASE 1. Mediante la ténica Selenium se ha obtenido la siguiente información de la página IMDB: 

    - Puntuacion de IMDB (en caso de que la tenga).

    - Dirección (director/a o directore/as de cada película).

    - Guionistas (de cada película).

    - Argumento.

    - Duración (en minutos).

    - Nombre de la película.


### Fase 3: 

En esta fase se ha obtenido información detallada de los 10 principales actores de cada una de las peliculas extraidas en la fase 1 utilizando Selenium. Dicha información se ha obtenido de la página de IMDB.

    - Nombre

    - Año de nacimiento

    - ¿Por qué es conocido?

    - ¿Qué hace?

    - Premios

### Fase 4:

En esta fase se trabajó con la biblioteca Beautiful Soup para extrar información relevante de la tabla de los premios Oscars desde 2015 hasta 2020. La tabla fue extraída del siguiente link: https://es.wikipedia.org/wiki/Premios_Óscar 
   
    - Fecha de la ceremonia

    - Mejor película

    - Mejor director

    - Mejor actor

    - Mejor actriz 

    
### Fase 5: 

En esta fase se pensó la estructura de una base de datos donde se almacenó toda la información recopilada, a través de tablas y conectándolas entre sí.

### Fase 6: 

En esta fase se insertaron todos los datos en la base de datos, que fue diseñada en la fase 5.

### Fase 7:

En esta fase se realizaron consultas SQL para recuperar información específica:

    - ¿Qué géneros han recibido más premios Óscar?

    - ¿Qué género es el mejor valorado en IMDB?

    - ¿En qué año se estrenaron más películas?

    - ¿En qué año se estrenaron mas cortos?

    - ¿Cuál es la mejor serie valorada en IMDB?

    - ¿Cuál es la película mejor valorada en IMDB?

    - ¿Qué actor/actriz ha recibido más premios?

    - ¿Hay algun actor/actriz que haya recibido más de un premio Óscar?

    - Encontrar películas con ciertas calificaciones
    
    - Encontrar películas dirigidas por un director en particular

    - Obtener una lista de películas fanadoras de un premio Oscar en una categoría específica