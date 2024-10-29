# Proyecto CinemExtract
Explorando el Séptimo Arte a través de Datos y Tecnología.

*Equipo de desarrollo*: 
[Elena Águila](https://github.com/eaguilag), Vanesa Díaz, [Valentina Fisher](https://github.com/ValeFischer), [Tania Graff](https://github.com/TaniaGraff/) y [Franca Tortarolo](https://github.com/FrancaTortaroloo).

## Resumen del Proyecto
Identificar las películas y cortos más populares de los años 2015 a 2020, basándonos en criterios como las calificaciones o los premios recibidos, con el objetivo de proporcionar recomendaciones específicas para la promoción del contenido más relevante dentro de la plataforma de streaming BHO.

![imagen_portada_repo](portada_repo.png)

## Fases del proyecto
El proyecto consta de 7 fases, que van desde la extracción de datos de diversas plataformas online utilizando diferentes técnicas de web scraping, hasta la creación de una BBDD propia donde se realizaron las consultas y el análisis de los datos extraídos. 

### Fase 1

En esta fase se utilizó la API de MovieDataSet para extraer información de peliculas y cortos entre los años 2015-2020. 
 
    - Tipo (si es corto o película).

    - Nombre de la película o el corto.

    - Año de estreno de la película o corto.

    - Mes de estreno de la película o corto.

    - Id de la película (Identificativo de IMDB)

    - Género: Drama, Comedy, Action, Fantasy, Horror, Mystery, Romance, Thriller.

### Fase 2

En esta fase se obtuvo información más detallada sobre las peliculas y cortos extraidos durante la FASE 1. Utilizando Selenium como herramienta, se accedió a la siguiente información de la página web de IMDB.

    - Puntuacion de IMDB (en caso de que la tenga).

    - Dirección (director/a o directore/as de cada película).

    - Guionistas (de cada película).

    - Argumento.

    - Duración (en minutos).

    - Nombre de la película.


### Fase 3 

En esta fase se obtuvo información detallada de los 10 principales actores de cada una de las peliculas extraidas durante la FASE 1 utilizando Selenium como herramienta. La información se obtuvo de la página web de IMDB.

    - Nombre

    - Año de nacimiento

    - ¿Por qué es conocido?

    - ¿Qué hace?

    - Premios

### Fase 4

En esta fase se trabajó con la biblioteca Beautiful Soup para extrar información de la tabla de los premios Oscars desde 2015 hasta 2020. La tabla fue extraída del siguiente página web: [link_pagina](https://es.wikipedia.org/wiki/Premios_Óscar)
   
    - Fecha de la ceremonia

    - Mejor película

    - Mejor director

    - Mejor actor

    - Mejor actriz 

    
### Fase 5: 

En esta fase se pensó la estructura de una Base de Datos donde se almacenó toda la información recopilada, a través de tablas conectadas entre sí.

### Fase 6: 

En esta fase se insertaron todos los registros en la Base de Datos diseñada durante la FASE 5.

### Fase 7:

En esta útlima fase se realizaron consultas SQL para recuperar información específica y responder a las siguientes preguntas:

    1. ¿Qué géneros han recibido más premios Óscar?

    2. ¿Qué género es el mejor valorado en IMDB?

    3. ¿En qué año se estrenaron más películas?

    4. ¿En qué año se estrenaron mas cortos?

    5. ¿Cuál es la película mejor valorada en IMDB?

    6. ¿Cuál es el corto mejor valorado en IMDB?

    7. ¿Qué actor/actriz ha recibido más premios Oscars?

    8. ¿Hay algun actor/actriz o director/directora que haya recibido más de un premio Óscar?
    
    9. ¿Qué actor/actriz ha recibido más premios?

    10. ¿En qué trabajan los actores, además de reparto?

    11. ¿Quién es el actor más jóven?

    12. Encontrar películas con calificaciones del 7 al 10 en IMDB.
    
    13. Encontrar películas dirigidas por un Guillermo del Toro. 

    14. Obtener una lista de los dramas ganadores de un premio Oscar como mejor película.

Por último y en base a los resultados de las consultas realizadas, se extrajeron las conclusiones que han permitido al equipo proporcionar recomendaciones específicas para la promoción de nuevo contenido en la plataforma BHO.