/* CREATE DATABASE ReyesMagos;
GO */
USE ReyesMagos;
GO
/* CREATE TABLE rey_mago
(
    id_rey_mago    INT IDENTITY(1,1),
    nombre_rey_mago VARCHAR(9),
    PRIMARY KEY (id_rey_mago),
    CONSTRAINT revNombreReyMago
        CHECK (nombre_rey_mago IN ('Melchor', 'Gaspar', 'Baltazar'))
);
CREATE TABLE municipio
(
    id_municipio     INT IDENTITY(1,1),
    nombre_municipio VARCHAR(50),
    PRIMARY KEY (id_municipio)
);
CREATE TABLE comunidad_autonoma
(
    id_comunidad_autonoma     INT IDENTITY(1,1),
    nombre_comunidad_autonoma VARCHAR(50),
    PRIMARY KEY (id_comunidad_autonoma)
);
CREATE TABLE barrio
(
    id_barrio             INT IDENTITY(1,1),
    nombre_barrio         VARCHAR(50),
    id_municipio          INT,
    id_comunidad_autonoma INT,
    PRIMARY KEY (id_barrio),
    FOREIGN KEY (id_municipio) REFERENCES municipio (id_municipio)
    FOREIGN KEY (id_comunidad_autonoma) REFERENCES comunidad_autonoma(id_comunidad_autonoma)
);
CREATE TABLE grupo
(
    id_grupo                 INT IDENTITY(1,1),
    numero_integrantes_grupo INT DEFAULT 0,
    id_barrio                INT,
    PRIMARY KEY (id_grupo),
    FOREIGN KEY (id_barrio) REFERENCES barrio (id_barrio)
);
CREATE TABLE vecino
(
    dni_vecino              CHAR(9) NOT NULL,
    nombre_vecino           VARCHAR(40),
    apellido_paterno_vecino VARCHAR(40),
    apellido_materno_vecino VARCHAR(40),
    id_rey_mago             INT,
    id_grupo                INT,
    PRIMARY KEY (dni_vecino),
    FOREIGN KEY (id_rey_mago) REFERENCES rey_mago (id_rey_mago),
    FOREIGN KEY (id_grupo) REFERENCES grupo (id_grupo),
    CONSTRAINT revDni
        CHECK (dni_vecino LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][A-Z]'),
);
CREATE TABLE evento
(
    id_evento    INT IDENTITY(1,1),
    fecha_hora   DATETIME2,
    calle_numero VARCHAR(50),
    id_grupo     INT NOT NULL,
    id_barrio    INT NOT NULL,
    PRIMARY KEY (id_evento),
    FOREIGN KEY (id_grupo) REFERENCES grupo (id_grupo),
    FOREIGN KEY (id_barrio) REFERENCES barrio (id_barrio),
    CONSTRAINT mismaDireccion UNIQUE (fecha_hora, calle_numero, id_barrio),
    CONSTRAINT mismaFecha UNIQUE (fecha_hora, id_grupo),
    CONSTRAINT revCalleEvento CHECK (calle_numero LIKE '%[0-9]')
);
CREATE TABLE regalo
(
    id_regalo     INT IDENTITY(1,1),
    nombre_regalo VARCHAR(40),
    PRIMARY KEY (id_regalo)
);
CREATE TABLE nino
(
    id_nino               INT IDENTITY(1,1),
    nombre_nino           VARCHAR(40),
    apellido_paterno_nino VARCHAR(40),
    apellido_materno_nino VARCHAR(40),
    calle_numero          VARCHAR(50),
    id_rey_mago           INT,
    id_regalo             INT,
    id_barrio             INT,
    id_evento             INT,
    PRIMARY KEY (id_nino),
    FOREIGN KEY (id_rey_mago) REFERENCES rey_mago (id_rey_mago),
    FOREIGN KEY (id_regalo) REFERENCES regalo (id_regalo),
    FOREIGN KEY (id_barrio) REFERENCES barrio (id_barrio),
    FOREIGN KEY (id_evento) REFERENCES evento (id_evento),
    CONSTRAINT revCalleNino CHECK (calle_numero LIKE '%[0-9]')
);
CREATE TABLE convence
(
    id_convencido     CHAR(9) NOT NULL,
    id_quien_convence CHAR(9),
    PRIMARY KEY (id_convencido),
    FOREIGN KEY (id_convencido) REFERENCES vecino (dni_vecino),
    FOREIGN KEY (id_quien_convence) REFERENCES vecino (dni_vecino)
);
INSERT INTO rey_mago(nombre_rey_mago)
VALUES ('Melchor'), ('Gaspar'), ('Baltazar');
INSERT INTO municipio(nombre_municipio)
VALUES ('Madrid'), ('Bilbao'), ('Córdoba'), ('Zaragoza'), ('Sevilla');
INSERT INTO comunidad_autonoma(nombre_comunidad_autonoma)
VALUES ('Madrid'), ('País Vasco'), ('Andalucía'), ('Aragón');
INSERT INTO barrio(nombre_barrio, id_municipio, id_comunidad_autonoma)
VALUES ('Cañada Real', 1, 1),
('San Francisco', 2, 2),
('San Pedro', 3, 3),
('Delicias', 4, 4),
('Polígono Sur', 5, 3)
INSERT INTO grupo(id_barrio)
VALUES (3);
INSERT INTO grupo(id_barrio)
VALUES (5);
INSERT INTO grupo(id_barrio)
VALUES (1);
INSERT INTO grupo(id_barrio)
VALUES (2);
INSERT INTO grupo(id_barrio)
VALUES (4);  
INSERT INTO vecino(dni_vecino, nombre_vecino, apellido_paterno_vecino,
apellido_materno_vecino, id_rey_mago, id_grupo)
VALUES ('12345678A', 'Sergio', 'Elizondo', 'Rodríguez',
2, 2)
INSERT INTO vecino(dni_vecino, nombre_vecino, apellido_paterno_vecino,
apellido_materno_vecino, id_rey_mago, id_grupo)
VALUES ('36863952H', 'Diego', 'Rangel', 'Pardo',
3, 5)
INSERT INTO vecino(dni_vecino, nombre_vecino, apellido_paterno_vecino,
apellido_materno_vecino, id_rey_mago, id_grupo)
VALUES ('95826496K', 'Juan', 'Gomez', 'Rodríguez',
1, 3)
INSERT INTO vecino(dni_vecino, nombre_vecino, apellido_paterno_vecino,
apellido_materno_vecino, id_rey_mago, id_grupo)
VALUES ('92746584F', 'Gerardo', 'Fernández', 'Naranjo',
2, 2)
INSERT INTO vecino(dni_vecino, nombre_vecino, apellido_paterno_vecino,
apellido_materno_vecino, id_rey_mago, id_grupo)
VALUES ('45678753Y', 'Humberto', 'Martínez', 'Garza',
1, 3)
INSERT INTO evento(fecha_hora, calle_numero, id_grupo, id_barrio)
VALUES ('2021-06-08 12:35:29', 'Las Tenerías 206', 2, 3)
INSERT INTO evento(fecha_hora, calle_numero, id_grupo, id_barrio)
VALUES ('2021-06-06 16:05:00', 'Laguna 107', 3, 5)
CREATE VIEW eventos_programados AS
SELECT fecha_hora, calle_numero, id_grupo, nombre_barrio, nombre_municipio
FROM evento
INNER JOIN barrio
ON (evento.id_barrio = barrio.id_barrio)
INNER JOIN municipio
ON (barrio.id_municipio = municipio.id_municipio)
WHERE fecha_hora >= GETDATE()*/