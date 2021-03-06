CREATE DATABASE ReyesMagos;
GO
USE ReyesMagos;
GO
CREATE TABLE rey_mago
(
    id_rey_mago    INT IDENTITY(1,1),
    nombre_rey_mago VARCHAR(9),
    PRIMARY KEY (id_rey_mago),
    CONSTRAINT revNombreReyMago
        CHECK (nombre_rey_mago IN ('Melchor', 'Gaspar', 'Baltazar'))
);
CREATE TABLE comunidad_autonoma
(
    id_comunidad_autonoma     INT IDENTITY(1,1),
    nombre_comunidad_autonoma VARCHAR(50),
    PRIMARY KEY (id_comunidad_autonoma)
);
CREATE TABLE municipio
(
    id_municipio     INT IDENTITY(1,1),
    nombre_municipio VARCHAR(50),
    id_comunidad_autonoma INT,
    PRIMARY KEY (id_municipio),
    FOREIGN KEY (id_comunidad_autonoma) REFERENCES comunidad_autonoma(id_comunidad_autonoma)
    ON DELETE CASCADE
);
CREATE TABLE barrio
(
    id_barrio             INT IDENTITY(1,1),
    nombre_barrio         VARCHAR(50),
    id_municipio          INT,
    PRIMARY KEY (id_barrio),
    FOREIGN KEY (id_municipio) REFERENCES municipio (id_municipio)
    ON DELETE CASCADE
);
CREATE TABLE grupo
(
    id_grupo                 INT IDENTITY(1,1),
    numero_integrantes_grupo INT DEFAULT 0,
    id_barrio                INT,
    PRIMARY KEY (id_grupo),
    FOREIGN KEY (id_barrio) REFERENCES barrio (id_barrio)
    ON DELETE SET NULL
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
    FOREIGN KEY (id_rey_mago) REFERENCES rey_mago (id_rey_mago)
    ON DELETE SET NULL,
    FOREIGN KEY (id_grupo) REFERENCES grupo (id_grupo),
    CONSTRAINT revDni
        CHECK (dni_vecino LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][A-Z]'),
);
CREATE TABLE evento
(
    id_evento    INT IDENTITY(1,1),
    fecha_hora   DATETIME2,
    calle_numero VARCHAR(50),
    id_grupo     INT,
    id_barrio    INT,
    PRIMARY KEY (id_evento),
    FOREIGN KEY (id_grupo) REFERENCES grupo (id_grupo)
    ON DELETE SET NULL,
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
    FOREIGN KEY (id_rey_mago) REFERENCES rey_mago (id_rey_mago)
    ON DELETE SET NULL,
    FOREIGN KEY (id_regalo) REFERENCES regalo (id_regalo)
    ON DELETE SET NULL,
    FOREIGN KEY (id_barrio) REFERENCES barrio (id_barrio)
    ON DELETE SET NULL,
    FOREIGN KEY (id_evento) REFERENCES evento (id_evento),
    CONSTRAINT revCalleNino CHECK (calle_numero LIKE '%[0-9]')
);
CREATE TABLE convence
(
    id_convencido     CHAR(9) NOT NULL,
    id_quien_convence CHAR(9),
    PRIMARY KEY (id_convencido),
    FOREIGN KEY (id_convencido) REFERENCES vecino (dni_vecino)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
    FOREIGN KEY (id_quien_convence) REFERENCES vecino (dni_vecino)
);
GO
CREATE VIEW eventos_programados AS
SELECT id_evento, fecha_hora, calle_numero, id_grupo, nombre_barrio, nombre_municipio
FROM evento
INNER JOIN barrio
ON (evento.id_barrio = barrio.id_barrio)
INNER JOIN municipio
ON (barrio.id_municipio = municipio.id_municipio)
WHERE fecha_hora >= GETDATE()
GO
CREATE INDEX indice_vista
ON nino(id_regalo)