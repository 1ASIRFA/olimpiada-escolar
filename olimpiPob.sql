
INSERT INTO CATEGORIAS (idCat, nomCat) VALUES 
(1, 'Querubín (3-5 años)'),
(2, 'Prebenjamín (1p-2p)'),
(3, 'Benjamín (3p-4p)'),
(4, 'Alevín (5p-6p)');

INSERT INTO DISCIPLINAS (idDis, nomDis) VALUES 
(1, 'Ajedrez'),
(2, 'Béisbol'),
(3, 'Bolos finlandeses');

INSERT INTO PISTAS (idPis, idPisPadre, nomPis, cubPis) VALUES 
(1, NULL, 'Pabellón Principal', 'S'),
(2, 1, 'Pista Fútbol 3x3', 'S'),
(3, 1, 'Pista Escenario', 'S'),
(4, NULL, 'Zona Bolos Exterior', 'N');

INSERT INTO EQUIPOS (idEqu, oliEqu) VALUES 
(1, 'N'), -- María Valle 1
(2, 'N'), -- La Inmaculada 1
(3, 'N'), -- La Inmaculada 2
(4, 'N'), -- Celestino Mutis 1
(5, 'N'), -- Celestino Mutis 2
(6, 'N'), -- María Valle 2
(7, 'S'), -- Equipo Olímpico 1
(8, 'N'), -- María Valle 3
(9, 'N'); -- La Inmaculada 3

-- Querubín (3-5 años)
INSERT INTO PARTICIPANTES (idPar, curPar, cenPar, nomPar, neaePar, corPar) VALUES 
(1, '3a', 'María Valle', 'Lucía Pérez', 'N', 'lucia@tutor.com'),
(2, '5a', 'La Inmaculada', 'Carlos Ruiz', 'S', 'carlos@tutor.com');

-- Prebenjamín (1p-2p)
INSERT INTO PARTICIPANTES (idPar, curPar, cenPar, nomPar, neaePar, corPar) VALUES 
(3, '1p', 'Celestino Mutis', 'Marta Sánchez', 'N', 'marta@tutor.com'),
(4, '2p', 'María Valle', 'Javier López', 'N', 'javier@tutor.com');

-- Benjamín (3p-4p)
INSERT INTO PARTICIPANTES (idPar, curPar, cenPar, nomPar, neaePar, corPar) VALUES 
(5, '3p', 'La Inmaculada', 'Sofía Martín', 'N', 'sofia@tutor.com'),
(6, '4p', 'La Inmaculada', 'Pedro Gómez', 'N', 'pedro@tutor.com'),
(7, '3p', 'Celestino Mutis', 'Daniel Gómez', 'N', 'daniel@tutor.com'),
(8, '4p', 'Celestino Mutis', 'Elena Castro', 'N', 'elena@tutor.com');

-- Alevín (5p-6p)
INSERT INTO PARTICIPANTES (idPar, curPar, cenPar, nomPar, neaePar, corPar) VALUES 
(9, '5p', 'María Valle', 'Ana Torres', 'N', 'ana@tutor.com'),
(10, '6p', 'La Inmaculada', 'Pablo Díaz', 'N', 'pablo@tutor.com');

INSERT INTO VOLUNTARIOS (idVol, nomVol, arbVol) VALUES 
(1, 'Luis Fernández', 'S'),
(2, 'Marta Rodríguez', 'N'),
(3, 'Carlos Sánchez', 'S'),
(4, 'Sofía López', 'N');

INSERT INTO ARBITROS (idArb, nomArb) VALUES 
(1, 'Juan Martínez'),
(2, 'Laura García'),
(3, 'Pedro Jiménez'),
(4, 'Elena Ruiz');

-- Ajedrez Alevín
INSERT INTO ENCUENTROS (idEnc, estEnc, finiEnc, ffinEnc, idPis, idDis) VALUES 
(1, 'D', TO_DATE('15-10-26 10:00', 'DD-MM-YY HH24:MI'), TO_DATE('15-10-26 10:30', 'DD-MM-YY HH24:MI'), 3, 1);

-- Béisbol Benjamín
INSERT INTO ENCUENTROS (idEnc, estEnc, finiEnc, ffinEnc, idPis, idDis) VALUES 
(2, 'E', TO_DATE('15-10-26 12:00', 'DD-MM-YY HH24:MI'), TO_DATE('15-10-26 12:30', 'DD-MM-YY HH24:MI'), 2, 2);

-- Bolos Prebenjamín
INSERT INTO ENCUENTROS (idEnc, estEnc, finiEnc, ffinEnc, idPis, idDis) VALUES 
(3, 'O', TO_DATE('15-10-26 14:00', 'DD-MM-YY HH24:MI'), TO_DATE('15-10-26 14:30', 'DD-MM-YY HH24:MI'), 4, 3);

INSERT INTO PLANTILLAS (idEqu, idPar) VALUES 
(1, 9),
(2, 10),
(3, 5),
(3, 6),
(4, 7),
(4, 8),
(5, 3),
(6, 4),
(7, 3), 
(7, 4);

INSERT INTO PARTIDOS (idEnc, idEqu) VALUES 
(1, 1), 
(1, 2),
(2, 3), 
(2, 4),
(3, 5), 
(3, 7);

INSERT INTO DIVISIONES (idDis, idCat) VALUES 
(1, 1), 
(1, 2), 
(1, 3), 
(1, 4),
(2, 1), 
(2, 2), 
(2, 3), 
(2, 4),
(3, 1), 
(3, 2), 
(3, 3), 
(3, 4);

INSERT INTO STAFF (idVol, idDis) VALUES 
(1, 1),
(3, 2);

INSERT INTO COLEGIADOS (idArb, idDis) VALUES 
(1, 2),
(4, 3);