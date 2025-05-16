-- 1. Mostrar los nombres de los participantes y el centro al que pertenecen

SELECT nomPar, cenPar
FROM PARTICIPANTE;

-- 2. Listar las disciplinas y el estado del encuentro al que pertenecen

SELECT D.nomDis, E.estEnc
FROM DISCIPLINA D
JOIN ENCUENTRO E ON D.idEnc = E.idEnc;

-- 3. Obtener los nombres de los participantes por equipo

SELECT EP.idEqu, P.nomPar
FROM EQU_PAR EP
JOIN PARTICIPANTE P ON EP.idPar = P.idPar
ORDER BY EP.idEqu;

-- 4. Ver en qué pista se juega cada encuentro y si tiene pista hija

SELECT P1.nomPis AS pista, P2.nomPis AS subpista
FROM PISTA P1
LEFT JOIN PISTA P2 ON P2.idPisPadre = P1.idPis;

-- 5. Contar cuántos equipos participan en cada encuentro

SELECT idEnc, COUNT(idEqu) AS total_equipos
FROM ENC_EQU
GROUP BY idEnc;

-- 6. 

SELECT D.nomDis
FROM DISCIPLINA D
JOIN DIS_CIC DC ON D.idDis = DC.idDis
WHERE DC.idCic = 3;

-- 7. Ver todos los equipos con sus encuentros y la disciplina que se juega

SELECT EQ.idEqu, ENC.idEnc, D.nomDis
FROM EQUIPO EQ
JOIN ENC_EQU EE ON EQ.idEqu = EE.idEqu
JOIN ENCUENTRO ENC ON EE.idEnc = ENC.idEnc
JOIN DISCIPLINA D ON ENC.idEnc = D.idEnc;

-- 8. Mostrar todas las pistas donde se juega ‘Fútbol’

SELECT P.nomPis
FROM PISTA P
JOIN ENCUENTRO E ON P.idEnc = E.idEnc
JOIN DISCIPLINA D ON E.idEnc = D.idEnc
WHERE D.nomDis = 'Fútbol';
