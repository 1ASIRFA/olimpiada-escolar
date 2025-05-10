
set echo on
set serveroutput on
alter session set NLS_DATE_FORMAT='DD-MM-YY';
select current_timestamp from DUAL;
drop user OLIMPI cascade;
create user OLIMPI identified by oli
    default tablespace USERS
	quota 100M on USERS;
grant create session, create table, create procedure, create trigger to OLIMPI;
grant create public synonym, create sequence, create view to OLIMPI;

connect OLIMPI/oli@10.1.3.156 -- MV Álvaro

-- connect OLIMPI/oli@

-- CREACIÓN DE TABLAS.

CREATE TABLE EQUIPOS(
    idEqu number primary key,
    oliEqu char(1) not null 
        constraint ck_oliEqu check (oliEqu in ('S', 'N'))
);

COMMENT ON COLUMN EQUIPOS.oliEqu IS 'Equipo olímpico.';

CREATE TABLE PARTICIPANTES(
    idPar number primary key,
    curPar varchar2(2)  not null,
    cenPar varchar2(50) not null,
    nomPar varchar2(75) not null,
    neaePar char(1) not null 
        constraint ck_neaePar check (neaePar in ('S', 'N')),
    corPar varchar2(100) not null
);

COMMENT ON COLUMN PARTICIPANTES.neaePar IS 'El participante necesita atención especial personalizada.';
COMMENT ON COLUMN PARTICIPANTES.curPar IS '3a, 4a y 5a para participantes de educación infantil. 1p, 2p, 3p, 4p, 5p y 6p para participantes en educación primaria';
COMMENT ON COLUMN PARTICIPANTES.corPar IS 'Correo electrónico asociado al participante (puede ser de su padre, madre o tutor legal).';

CREATE TABLE ENCUENTROS(
    idEnc number primary key,
    estEnc char(1) not null
        constraint ck_estado check(estEnc in ('D', 'E', 'O')), --Haría falta control por trigger.
    finiEnc date not null,
    ffinEnc date not null,
    idPis number not null,
    idDis number not null
);

COMMENT ON COLUMN ENCUENTROS.estEnc IS 'Estados: D: Disponible, E: En camino y O: Ocupado.';

CREATE TABLE PISTAS(
    idPis number primary key,
    idPisPadre number,
    nomPis varchar2(25) not null,
    cubPis char(1) not null 
       constraint ck_cubPis check (cubPis in ('S', 'N'))
);

COMMENT ON COLUMN PISTAS.cubPis IS 'Posibilidad de pista cubierta.';

CREATE TABLE DISCIPLINAS(
    idDis number primary key,
    nomDis varchar2(50) not null
);

CREATE TABLE CATEGORIAS(
    idCat number primary key,
    nomCat varchar2(50) not null
);

CREATE TABLE VOLUNTARIOS(
    idVol number primary key,
    nomVol varchar2(50) not null,
    arbVol char(1) not null
        constraint ck_arbVol check(arbVol in ('S', 'N'))
);

COMMENT ON COLUMN VOLUNTARIOS.arbVol IS 'El voluntario arbitrará el encuentro. Sólo será posible si no hay árbitro asociado al encuentro.';

CREATE TABLE ARBITROS(
    idArb number primary key,
    nomArb varchar2(50) not null
);


CREATE TABLE PARTIDOS(
    idEnc number not null,
    idEqu number not null,
    primary key (idEnc, idEqu)
);

CREATE TABLE PLANTILLAS(
    idEqu number not null,
    idPar number not null,
    primary key (idEqu, idPar)
);

CREATE TABLE DIVISIONES(
    idDis number not null,
    idCat number not null,
    primary key (idDis, idCat)
);

CREATE TABLE STAFF(
    idVol number not null,
    idDis number not null,
    primary key (idVol, idDis)
);

CREATE TABLE COLEGIADOS(
    idArb number not null,
    idDis number not null,
    primary key (idArb, idDis)
);
 
-- ALTER CK PARTICIPANTES

ALTER TABLE PARTICIPANTES 
ADD CONSTRAINT ck_corPar 
    CHECK (corPar LIKE '%@%.%');

-- ALTER FK ENCUENTROS

ALTER TABLE ENCUENTROS
ADD CONSTRAINT fk_enc_pis 
    FOREIGN KEY (idPis) REFERENCES PISTAS(idPis);

ALTER TABLE ENCUENTROS
ADD CONSTRAINT fk_enc_dis 
    FOREIGN KEY (idDis) REFERENCES DISCIPLINAS(idDis);

-- CHECK ADICIONAL

ALTER TABLE ENCUENTROS
ADD CONSTRAINT ck_fecEnc 
    CHECK (ffinEnc > finiEnc);

-- UNIQUE DISCIPLINAS

ALTER TABLE DISCIPLINAS 
ADD CONSTRAINT uk_nomDis 
    UNIQUE(nomDis);

-- ALTER FK PISTAS

ALTER TABLE PISTAS
ADD CONSTRAINT fk_pisPad 
    FOREIGN KEY (idPisPadre) REFERENCES PISTAS(idPis);

-- ALTER FK PARTIDO

ALTER TABLE PARTIDOS
ADD CONSTRAINT fk_par_enc
    FOREIGN KEY (idEnc) REFERENCES ENCUENTROS(idEnc);

ALTER TABLE PARTIDOS
ADD CONSTRAINT fk_par_equ 
    FOREIGN KEY (idEqu) REFERENCES EQUIPOS(idEqu);

-- ALTER FK PLANTILLA

ALTER TABLE PLANTILLAS
ADD CONSTRAINT fk_pla_equ 
    FOREIGN KEY (idEqu) REFERENCES EQUIPOS(idEqu);

ALTER TABLE PLANTILLAS
ADD CONSTRAINT fk_pla_par
    FOREIGN KEY (idPar) REFERENCES PARTICIPANTES(idPar);

-- ALTER FK DIVISION 

ALTER TABLE DIVISIONES
ADD CONSTRAINT fk_div_dis 
    FOREIGN KEY (idDis) REFERENCES DISCIPLINAS(idDis);

ALTER TABLE DIVISIONES
ADD CONSTRAINT fk_div_cat 
    FOREIGN KEY (idCat) REFERENCES CATEGORIAS(idCat);

-- ALTER FK STAFF

ALTER TABLE STAFF
ADD CONSTRAINT fk_sta_vol 
    FOREIGN KEY (idVol) REFERENCES VOLUNTARIOS(idVol);

ALTER TABLE STAFF
ADD CONSTRAINT fk_sta_dis 
    FOREIGN KEY (idDis) REFERENCES DISCIPLINAS(idDis);

-- ALTER FK COLEGIADO

ALTER TABLE COLEGIADOS
ADD CONSTRAINT fk_col_arb
    FOREIGN KEY (idArb) REFERENCES ARBITROS(idArb);

ALTER TABLE COLEGIADOS
ADD CONSTRAINT fk_col_dis
    FOREIGN KEY (idDis) REFERENCES DISCIPLINAS(idDis);

 
   