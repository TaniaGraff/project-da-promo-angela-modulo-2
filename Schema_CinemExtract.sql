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

DROP table oscars3;

CREATE table oscars2(
id_ceremonia INT NOT NULL AUTO_INCREMENT,
año_ceremonia INT NOT NULL,
mejor_pelicula VARCHAR(200) NOT NULL,
mejor_director VARCHAR(200) NOT NULL,
mejor_actor VARCHAR(200) NOT NULL,
mejor_actriz VARCHAR(200) NOT NULL,
PRIMARY KEY (id_ceremonia));

INSERT INTO oscars2(año_ceremonia, mejor_pelicula, mejor_director, mejor_actor, mejor_actriz)
VALUES 
(2015, ' Birdman or (The Unexpected Virtue of Ignorance)', ' A. G. Inarritu', 'E. Redmayne',' J. Moore'),
(2016, ' Spotlight', ' A. G. Inarritu', 'L. DiCaprio', ' B. Larson'),
(2017, ' Moonlight', ' D. Chazelle', 'C. Affleck', ' E. Stone'),
(2018, ' The Shape of Water', ' G. del Toro', 'G. Oldman', ' F. McDormand'),
(2019, ' Green Book', ' A. Cuaron', 'R. Malek', ' O. Colman'),
(2020, ' Parasite', ' Bong J.', 'J. Phoenix', ' R. Zellweger');