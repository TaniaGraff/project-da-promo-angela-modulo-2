CREATE SCHEMA cinema_extract;
USE cinema_extract;

CREATE table oscars(
id_ceremonia INT NOT NULL AUTO_INCREMENT,
año_ceremonia INT NOT NULL,
mejor_pelicula VARCHAR(200) NOT NULL,
id_pelicula INT NOT NULL,
mejor_director VARCHAR(200) NOT NULL,
id_director INT NOT NULL,
mejor_actor VARCHAR(200) NOT NULL,
id_actor INT NOT NULL,
mejor_actriz VARCHAR(200) NOT NULL,
id_actiz INT NOT NULL,
PRIMARY KEY (id_ceremonia));

CREATE table oscars2(
id_ceremonia INT NOT NULL AUTO_INCREMENT,
año_ceremonia INT NOT NULL,
mejor_pelicula VARCHAR(200) NOT NULL,
mejor_director VARCHAR(200) NOT NULL,
mejor_actor VARCHAR(200) NOT NULL,
mejor_actriz VARCHAR(200) NOT NULL,
PRIMARY KEY (id_ceremonia));

DROP table oscars2; 