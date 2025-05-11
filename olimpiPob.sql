
INSERT INTO CATEGORIAS (idCat, nomCat) VALUES 
(1, 'Querubín (3-5 años)');

INSERT INTO CATEGORIAS (idCat, nomCat) VALUES
(2, 'Prebenjamín (1p-2p)');

INSERT INTO CATEGORIAS (idCat, nomCat) VALUES 
(3, 'Benjamín (3p-4p)');

INSERT INTO CATEGORIAS (idCat, nomCat) VALUES 
(4, 'Alevín (5p-6p)');

INSERT INTO DISCIPLINAS (idDis, nomDis) VALUES 
(1, 'Ajedrez');

INSERT INTO DISCIPLINAS (idDis, nomDis) VALUES 
(2, 'Béisbol');

INSERT INTO DISCIPLINAS (idDis, nomDis) VALUES 
(3, 'Bolos finlandeses');

INSERT INTO PISTAS (idPis, idPisPadre, nomPis, cubPis) VALUES 
(1, NULL, 'Pabellón Principal', 'S');

INSERT INTO PISTAS (idPis, idPisPadre, nomPis, cubPis) VALUES 
(2, 1, 'Pista Fútbol 3x3', 'S');

INSERT INTO PISTAS (idPis, idPisPadre, nomPis, cubPis) VALUES 
(3, 1, 'Pista Escenario', 'S');

INSERT INTO PISTAS (idPis, idPisPadre, nomPis, cubPis) VALUES 
(4, NULL, 'Zona Bolos Exterior', 'N');

INSERT INTO EQUIPOS (idEqu, oliEqu) VALUES 
(1, 'N'); -- María Valle 1

INSERT INTO EQUIPOS (idEqu, oliEqu) VALUES
(2, 'N'); -- La Inmaculada 1

INSERT INTO EQUIPOS (idEqu, oliEqu) VALUES
(3, 'N'); -- La Inmaculada 2

INSERT INTO EQUIPOS (idEqu, oliEqu) VALUES
(4, 'N'); -- Celestino Mutis 1

INSERT INTO EQUIPOS (idEqu, oliEqu) VALUES
(5, 'N'); -- Celestino Mutis 2

INSERT INTO EQUIPOS (idEqu, oliEqu) VALUES
(6, 'N'); -- María Valle 2

INSERT INTO EQUIPOS (idEqu, oliEqu) VALUES
(7, 'S'); -- Equipo Olímpico 1

INSERT INTO EQUIPOS (idEqu, oliEqu) VALUES
(8, 'N'); -- María Valle 3

INSERT INTO EQUIPOS (idEqu, oliEqu) VALUES
(9, 'N'); -- La Inmaculada 3

-- Querubín (3-5 años)
INSERT INTO PARTICIPANTES (idPar, curPar, cenPar, nomPar, neaePar, corPar) VALUES 
(1, '3a', 'María Valle', 'Lucía Pérez', 'N', 'lucia@tutor.com');

INSERT INTO PARTICIPANTES (idPar, curPar, cenPar, nomPar, neaePar, corPar) VALUES 
(2, '5a', 'La Inmaculada', 'Carlos Ruiz', 'S', 'carlos@tutor.com');

-- Prebenjamín (1p-2p)
INSERT INTO PARTICIPANTES (idPar, curPar, cenPar, nomPar, neaePar, corPar) VALUES 
(3, '1p', 'Celestino Mutis', 'Marta Sánchez', 'N', 'marta@tutor.com');

INSERT INTO PARTICIPANTES (idPar, curPar, cenPar, nomPar, neaePar, corPar) VALUES 
(4, '2p', 'María Valle', 'Javier López', 'N', 'javier@tutor.com');

-- Benjamín (3p-4p)
INSERT INTO PARTICIPANTES (idPar, curPar, cenPar, nomPar, neaePar, corPar) VALUES 
(5, '3p', 'La Inmaculada', 'Sofía Martín', 'N', 'sofia@tutor.com');

INSERT INTO PARTICIPANTES (idPar, curPar, cenPar, nomPar, neaePar, corPar) VALUES
(6, '4p', 'La Inmaculada', 'Pedro Gómez', 'N', 'pedro@tutor.com');

INSERT INTO PARTICIPANTES (idPar, curPar, cenPar, nomPar, neaePar, corPar) VALUES
(7, '3p', 'Celestino Mutis', 'Daniel Gómez', 'N', 'daniel@tutor.com');

INSERT INTO PARTICIPANTES (idPar, curPar, cenPar, nomPar, neaePar, corPar) VALUES
(8, '4p', 'Celestino Mutis', 'Elena Castro', 'N', 'elena@tutor.com');

-- Alevín (5p-6p)
INSERT INTO PARTICIPANTES (idPar, curPar, cenPar, nomPar, neaePar, corPar) VALUES 
(9, '5p', 'María Valle', 'Ana Torres', 'N', 'ana@tutor.com');

INSERT INTO PARTICIPANTES (idPar, curPar, cenPar, nomPar, neaePar, corPar) VALUES
(10, '6p', 'La Inmaculada', 'Pablo Díaz', 'N', 'pablo@tutor.com');

INSERT INTO VOLUNTARIOS (idVol, nomVol, arbVol) VALUES 
(1, 'Luis Fernández', 'S');

INSERT INTO VOLUNTARIOS (idVol, nomVol, arbVol) VALUES
(2, 'Marta Rodríguez', 'N');

INSERT INTO VOLUNTARIOS (idVol, nomVol, arbVol) VALUES
(3, 'Carlos Sánchez', 'S');

INSERT INTO VOLUNTARIOS (idVol, nomVol, arbVol) VALUES
(4, 'Sofía López', 'N');

INSERT INTO ARBITROS (idArb, nomArb) VALUES 
(1, 'Juan Martínez');

INSERT INTO ARBITROS (idArb, nomArb) VALUES
(2, 'Laura García');

INSERT INTO ARBITROS (idArb, nomArb) VALUES
(3, 'Pedro Jiménez');

INSERT INTO ARBITROS (idArb, nomArb) VALUES
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
(1, 9);

INSERT INTO PLANTILLAS (idEqu, idPar) VALUES
(2, 10);

INSERT INTO PLANTILLAS (idEqu, idPar) VALUES
(3, 5);

INSERT INTO PLANTILLAS (idEqu, idPar) VALUES
(3, 6);

INSERT INTO PLANTILLAS (idEqu, idPar) VALUES
(4, 7);

INSERT INTO PLANTILLAS (idEqu, idPar) VALUES
(4, 8);

INSERT INTO PLANTILLAS (idEqu, idPar) VALUES
(5, 3);

INSERT INTO PLANTILLAS (idEqu, idPar) VALUES
(6, 4);

INSERT INTO PLANTILLAS (idEqu, idPar) VALUES
(7, 3);

INSERT INTO PLANTILLAS (idEqu, idPar) VALUES
(7, 4);

INSERT INTO PARTIDOS (idEnc, idEqu) VALUES 
(1, 1);

INSERT INTO PARTIDOS (idEnc, idEqu) VALUES 
(1, 2);

INSERT INTO PARTIDOS (idEnc, idEqu) VALUES 
(2, 3);

INSERT INTO PARTIDOS (idEnc, idEqu) VALUES 
(2, 4);

INSERT INTO PARTIDOS (idEnc, idEqu) VALUES 
(3, 5);

INSERT INTO PARTIDOS (idEnc, idEqu) VALUES 
(3, 7);

INSERT INTO DIVISIONES (idDis, idCat) VALUES 
(1, 1);

INSERT INTO DIVISIONES (idDis, idCat) VALUES
(1, 2);

INSERT INTO DIVISIONES (idDis, idCat) VALUES
(1, 3);

INSERT INTO DIVISIONES (idDis, idCat) VALUES
(1, 4);

INSERT INTO DIVISIONES (idDis, idCat) VALUES
(2, 1);

INSERT INTO DIVISIONES (idDis, idCat) VALUES
(2, 2);

INSERT INTO DIVISIONES (idDis, idCat) VALUES
(2, 3);

INSERT INTO DIVISIONES (idDis, idCat) VALUES
(2, 4);

INSERT INTO DIVISIONES (idDis, idCat) VALUES
(3, 1);

INSERT INTO DIVISIONES (idDis, idCat) VALUES
(3, 2);

INSERT INTO DIVISIONES (idDis, idCat) VALUES
(3, 3);

INSERT INTO DIVISIONES (idDis, idCat) VALUES
(3, 4);

INSERT INTO STAFF (idVol, idDis) VALUES 
(1, 1);

INSERT INTO STAFF (idVol, idDis) VALUES
(3, 2);

INSERT INTO COLEGIADOS (idArb, idDis) VALUES 
(1, 2);

INSERT INTO COLEGIADOS (idArb, idDis) VALUES
(4, 3);