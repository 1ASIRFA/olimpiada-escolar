
-- Posibles Añadidos.

-----------------
-- ARBITRAJES (Asignación de árbitros/voluntarios a encuentros)
-----------------
CREATE TABLE ARBITRAJES (
    idEnc NUMBER PRIMARY KEY,
    idArb NUMBER,
    idVol NUMBER,
    CONSTRAINT fk_arbitraje_enc FOREIGN KEY (idEnc) REFERENCES ENCUENTROS(idEnc),
    CONSTRAINT fk_arbitraje_arb FOREIGN KEY (idArb) REFERENCES ARBITROS(idArb),
    CONSTRAINT fk_arbitraje_vol FOREIGN KEY (idVol) REFERENCES VOLUNTARIOS(idVol),
    CONSTRAINT ck_arbitraje_exclusivo CHECK (
        (idArb IS NOT NULL AND idVol IS NULL) OR 
        (idArb IS NULL AND idVol IS NOT NULL)
);

-- Encuentro 1 (Ajedrez): Sin árbitro → Usa voluntario Luis
INSERT INTO ARBITRAJES (idEnc, idVol) VALUES (1, 1);

-- Encuentro 2 (Béisbol): Con árbitro Juan
INSERT INTO ARBITRAJES (idEnc, idArb) VALUES (2, 1);

-- Encuentro 3 (Bolos): Sin árbitro asignado → Usa voluntario Luis (aunque Sofía está en COLEGIADOS, se omite para ejemplo)
INSERT INTO ARBITRAJES (idEnc, idVol) VALUES (3, 1);

-- Arbitraje:
-- Si no hay árbitro asignado a la disciplina (COLEGIADOS), se usa un voluntario con arbVol='S' (ARBITRAJES).
-- Ejemplo: En Ajedrez (sin árbitro en COLEGIADOS), se asigna al voluntario Luis (idVol=1).