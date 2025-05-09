
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

CREATE TABLE PARTICIPANTES(
    idPar number primary key,
    curPar varchar2(2)  not null,
    cenPar varchar2(50) not null,
    nomPar varchar2(75) not null,
    neaePar char(1) not null 
        constraint ck_neaePar check (neaePar in ('S', 'N')),
    corPar varchar2(100) not null
);

CREATE TABLE ENCUENTROS(
    idEnc number primary key,
    estEnc char(1) not null
        constraint ck_estado check(estEnc in ('D', 'E', 'O')), --Haría falta control por trigger.
    finiEnc date not null,
    ffinEnc date not null,
    idPis number not null,
    idDis nu mber not null
);

COMMENT ON COLUMN ENCUENTROS.estEnc IS 'D: Disponible, E: En camino, O: Ocupado';

CREATE TABLE PISTAS(
    idPis number primary key,
    idPisPadre number,
    nomPis varchar2(25) not null,
    cubPis char(1) not null 
       constraint ck_cubPis check (cubPis in ('S', 'N'))
);

CREATE TABLE DISCIPLINAS(
    idDis number primary key,
    nomDis varchar2(50) not null
);

CREATE TABLE CATEGORIAS(
    idCat number primary key,
    nomCat varchar2(50)
    -- Posible tabla que relacione CICLO con Categoria.
);


CREATE TABLE VOLUNTARIOS(
    idVol number primary key,
    nomVol varchar2(50) not null
    -- Va a arbitrar??
);

CREATE TABLE ARBITROS(
    idArb number primary key,
    nomArb varchar2(50) not null
);


-- Hasta aquí, todas las entidades simples.








-- Tablas puente para las relaciones.

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
    idCic number not null,
    primary key (idDis, idCic)
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
ADD CONSTRAINT fk_div_cic 
    FOREIGN KEY (idCic) REFERENCES CICLOS(idCic);


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

 
   