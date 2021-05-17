INSERT INTO rey_mago(nombre_rey_mago)
VALUES ('Melchor'), ('Gaspar'), ('Baltazar');
INSERT INTO comunidad_autonoma(nombre_comunidad_autonoma)
VALUES ('Madrid'), ('País Vasco'), ('Andalucía'), ('Aragón');
INSERT INTO municipio(nombre_municipio, id_comunidad_autonoma)
VALUES ('Madrid', 1), ('Bilbao', 2), ('Córdoba', 3), ('Zaragoza', 4), ('Sevilla', 3);
INSERT INTO barrio(nombre_barrio, id_municipio)
VALUES ('Cañada Real', 1),
('San Francisco', 2),
('San Pedro', 3),
('Delicias', 4),
('Polígono Sur', 5);
INSERT INTO grupo(id_barrio)
VALUES (3), (5), (1), (2), (4);  
INSERT INTO vecino(dni_vecino, nombre_vecino, apellido_paterno_vecino,
apellido_materno_vecino, id_rey_mago, id_grupo)
VALUES ('12345678A', 'Sergio', 'Elizondo', 'Rodríguez',
2, 2), ('36863952H', 'Diego', 'Rangel', 'Pardo',
3, 5), ('95826496K', 'Juan', 'Gomez', 'Rodríguez',
1, 3), ('92746584F', 'Gerardo', 'Fernández', 'Naranjo',
2, 2), ('45678753Y', 'Humberto', 'Martínez', 'Garza',
1, 3);
INSERT INTO evento(fecha_hora, calle_numero, id_grupo, id_barrio)
VALUES ('2021-06-08 12:35:29', 'Las Tenerías 206', 2, 3),
('2021-06-06 16:05:00', 'Laguna 107', 3, 5)
INSERT INTO regalo(nombre_regalo)
VALUES ('Carro de juguete'), ('Xbox'), ('Pelota');
INSERT INTO nino(nombre_nino, apellido_paterno_nino, apellido_materno_nino,
calle_numero, id_rey_mago, id_regalo, id_barrio, id_evento)
VALUES ('Juan', 'Rodríguez', 'Bernal', 'Lago de Jaco 120', 2, 1, 3, 1),
('Epigmenio', 'Reyes', 'Santana', 'El grano 211', 1, 3, 5, 2);
INSERT INTO convence(id_convencido, id_quien_convence)
VALUES ('36863952H', '12345678A'),
('45678753Y', '12345678A'),
('92746584F', '36863952H'),
('95826496K', '92746584F');