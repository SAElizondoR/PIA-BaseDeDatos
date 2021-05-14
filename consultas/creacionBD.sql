CREATE DATABASE ReyesMagos;
GO
USE ReyesMagos;
CREATE TABLE vecino(
    dni_vecino CHAR(9) NOT NULL,
    nombre_vecino VARCHAR(40),
    apellido_paterno_vecino VARCHAR(40),
    apellido_materno_vecino VARCHAR(40),
    id_rey_mago INT,
    id_grupo INT,
    PRIMARY KEY(dni_vecino),
    FOREIGN KEY(id_rey_mago) REFERENCES rey_mago(id_rey_mago),
    FOREIGN KEY(id_grupo) REFERENCES grupo(id_grupo)
);
CREATE TABLE rey_mago(
    id_rey_mago INT NOT NULL,
    nombre_rey_mago VARCHAR(9),
    PRIMARY KEY(id_rey_mago)
);
CREATE TABLE grupo(
    id_grupo INT NOT NULL,
    numero_integrantes_grupo INT,
    id_barrio INT,
    PRIMARY KEY(id_grupo),
    FOREIGN KEY(id_barrio) REFERENCES barrio(id_barrio)
);
CREATE TABLE niño(
    id_niño INT NOT NULL,
    nombre_niño VARCHAR(40),
    apellido_paterno_niño VARCHAR(40),
    apellido_materno_niño VARCHAR(40),
    calle_numero VARCHAR(50),
    id_rey_mago INT,
    id_regalo INT,
    id_barrio INT,
    id_evento INT,
    PRIMARY KEY(id_niño),
    FOREIGN KEY(id_rey_mago) REFERENCES rey_mago(id_rey_mago),
    FOREIGN KEY(id_regalo) REFERENCES regalo(id_regalo),
    FOREIGN KEY(id_barrio) REFERENCES barrio(id_barrio),
    FOREIGN KEY(id_evento) REFERENCES evento(id_evento)
);
CREATE TABLE regalo(
    id_regalo INT NOT NULL,
    nombre_regalo VARCHAR(40),
    PRIMARY KEY(id_regalo)
);
CREATE TABLE barrio(
    id_barrio INT NOT NULL,
    nombre_barrio VARCHAR(50),
    id_municipio INT,
    id_comunidad_autonoma INT,
    PRIMARY KEY(id_barrio),
    FOREIGN KEY(id_municipio) REFERENCES municipio(id_municipio)
);
CREATE TABLE municipio(
    id_municipio INT NOT NULL,
    nombre_municipio VARCHAR(50),
    PRIMARY KEY(id_municipio)
);
CREATE TABLE comunidad_autonoma(
    id_comunidad_autonoma INT NOT NULL,
    nombre_comunidad_autonoma VARCHAR(50),
    PRIMARY KEY(id_comunidad_autonoma)
);
CREATE TABLE evento(
    id_evento INT NOT NULL,
    fecha_hora DATETIME2,
    calle_numero VARCHAR(50),
    id_grupo INT NOT NULL,
    id_barrio INT NOT NULL,
    PRIMARY KEY(id_evento)
);
CREATE TABLE convence(
    id_convencido INT NOT NULL,
    id_quien_convence INT,
    PRIMARY KEY(id_convencido),
    FOREIGN KEY(id_convencido) REFERENCES vecino(dni_vecino),
    FOREIGN KEY(id_quien_convence) REFERENCES vecino(dni_vecino)
)