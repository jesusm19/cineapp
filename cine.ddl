
CREATE TABLE Detalles
(
	id_detalle            INTEGER  NOT NULL ,
	director              VARCHAR2(20)  NULL ,
	actores               VARCHAR2(20)  NULL ,
	url_trailer           CHAR(18)  NULL ,
	sinopsis              CHAR(18)  NULL ,
	id_pelicula           INTEGER  NULL 
);



CREATE UNIQUE INDEX XPKDetalles ON Detalles
(id_detalle  ASC);



ALTER TABLE Detalles
	ADD CONSTRAINT  XPKDetalles PRIMARY KEY (id_detalle);



CREATE TABLE Horarios
(
	id_horario            INTEGER  NOT NULL ,
	fecha                 DATE  NULL ,
	hora                  VARCHAR2(20)  NULL ,
	id_sala               INTEGER  NULL 
);



CREATE UNIQUE INDEX XPKHorarios ON Horarios
(id_horario  ASC);



ALTER TABLE Horarios
	ADD CONSTRAINT  XPKHorarios PRIMARY KEY (id_horario);



CREATE TABLE Noticias
(
	id_noticia            INTEGER  NOT NULL ,
	titulo                VARCHAR2(20)  NULL ,
	detalle               VARCHAR2(20)  NULL ,
	estatus               VARCHAR2(20)  NULL ,
	id_pelicula           INTEGER  NOT NULL 
);



CREATE UNIQUE INDEX XPKNoticias ON Noticias
(id_noticia  ASC);



ALTER TABLE Noticias
	ADD CONSTRAINT  XPKNoticias PRIMARY KEY (id_noticia);



CREATE TABLE Peliculas
(
	id_pelicula           INTEGER  NOT NULL ,
	titulo                VARCHAR2(20)  NULL ,
	genero                VARCHAR2(20)  NULL ,
	clasificacion         VARCHAR2(20)  NULL ,
	duracion              INTEGER  NULL ,
	fecha_estreno         DATE  NULL ,
	estatus               VARCHAR2(20)  NULL 
);



CREATE UNIQUE INDEX XPKPeliculas ON Peliculas
(id_pelicula  ASC);



ALTER TABLE Peliculas
	ADD CONSTRAINT  XPKPeliculas PRIMARY KEY (id_pelicula);



CREATE TABLE Perfil
(
	id_perfil             INTEGER  NOT NULL ,
	descripcion           VARCHAR2(20)  NULL 
);



CREATE UNIQUE INDEX XPKPerfil ON Perfil
(id_perfil  ASC);



ALTER TABLE Perfil
	ADD CONSTRAINT  XPKPerfil PRIMARY KEY (id_perfil);



CREATE TABLE Rel_peliculas_horarios
(
	id_rel_peliculas_horarios  INTEGER  NOT NULL ,
	id_horario            INTEGER  NULL ,
	id_pelicula           INTEGER  NOT NULL 
);



CREATE UNIQUE INDEX XPKRel_peliculas_horarios ON Rel_peliculas_horarios
(id_rel_peliculas_horarios  ASC);



ALTER TABLE Rel_peliculas_horarios
	ADD CONSTRAINT  XPKRel_peliculas_horarios PRIMARY KEY (id_rel_peliculas_horarios);



CREATE TABLE Salas
(
	id_sala               INTEGER  NOT NULL ,
	nombre_sala           VARCHAR2(20)  NULL ,
	precio                INTEGER  NULL 
);



CREATE UNIQUE INDEX XPKSalas ON Salas
(id_sala  ASC);



ALTER TABLE Salas
	ADD CONSTRAINT  XPKSalas PRIMARY KEY (id_sala);



CREATE TABLE Usuarios
(
	id_usuario            INTEGER  NOT NULL ,
	id_perfil             INTEGER  NOT NULL ,
	primer_nombre         VARCHAR2(20)  NULL ,
	segundo_nombre        VARCHAR2(20)  NULL ,
	primer_apellido       VARCHAR2(20)  NULL ,
	segundo_apellido      VARCHAR2(20)  NULL ,
	usuario               VARCHAR2(20)  NULL ,
	contrasenia           VARCHAR2(20)  NULL ,
	email                 VARCHAR2(20)  NULL ,
	estatus               VARCHAR2(20)  NULL ,
	fecha_registro        DATE  NULL ,
	fecha_modificacion    CHAR(18)  NULL 
);



CREATE UNIQUE INDEX XPKUsuarios ON Usuarios
(id_usuario  ASC,id_perfil  ASC);



ALTER TABLE Usuarios
	ADD CONSTRAINT  XPKUsuarios PRIMARY KEY (id_usuario,id_perfil);



ALTER TABLE Detalles
	ADD (CONSTRAINT  R_3 FOREIGN KEY (id_pelicula) REFERENCES Peliculas(id_pelicula) ON DELETE SET NULL);



ALTER TABLE Horarios
	ADD (CONSTRAINT  R_11 FOREIGN KEY (id_sala) REFERENCES Salas(id_sala) ON DELETE SET NULL);



ALTER TABLE Noticias
	ADD (CONSTRAINT  R_9 FOREIGN KEY (id_pelicula) REFERENCES Peliculas(id_pelicula));



ALTER TABLE Rel_peliculas_horarios
	ADD (CONSTRAINT  R_5 FOREIGN KEY (id_pelicula) REFERENCES Peliculas(id_pelicula));



ALTER TABLE Rel_peliculas_horarios
	ADD (CONSTRAINT  R_7 FOREIGN KEY (id_horario) REFERENCES Horarios(id_horario) ON DELETE SET NULL);



ALTER TABLE Usuarios
	ADD (CONSTRAINT  R_2 FOREIGN KEY (id_perfil) REFERENCES Perfil(id_perfil));



CREATE  TRIGGER tI_Detalles BEFORE INSERT ON Detalles for each row
-- ERwin Builtin Thu Mar 08 12:34:11 2018
-- INSERT trigger on Detalles 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin Thu Mar 08 12:34:11 2018 */
    /* Peliculas  Detalles on child insert set null */
    /* ERWIN_RELATION:CHECKSUM="0000fd78", PARENT_OWNER="", PARENT_TABLE="Peliculas"
    CHILD_OWNER="", CHILD_TABLE="Detalles"
    P2C_VERB_PHRASE="R/3", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_3", FK_COLUMNS="id_pelicula" */
    UPDATE Detalles
      SET
        /* %SetFK(Detalles,NULL) */
        Detalles.id_pelicula = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM Peliculas
            WHERE
              /* %JoinFKPK(:%New,Peliculas," = "," AND") */
              :new.id_pelicula = Peliculas.id_pelicula
        ) 
        /* %JoinPKPK(Detalles,:%New," = "," AND") */
         and Detalles.id_detalle = :new.id_detalle;


-- ERwin Builtin Thu Mar 08 12:34:11 2018
END;
/

CREATE  TRIGGER tU_Detalles AFTER UPDATE ON Detalles for each row
-- ERwin Builtin Thu Mar 08 12:34:11 2018
-- UPDATE trigger on Detalles 
DECLARE NUMROWS INTEGER;
BEGIN
  /* ERwin Builtin Thu Mar 08 12:34:11 2018 */
  /* Peliculas  Detalles on child update no action */
  /* ERWIN_RELATION:CHECKSUM="0000ff75", PARENT_OWNER="", PARENT_TABLE="Peliculas"
    CHILD_OWNER="", CHILD_TABLE="Detalles"
    P2C_VERB_PHRASE="R/3", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_3", FK_COLUMNS="id_pelicula" */
  SELECT count(*) INTO NUMROWS
    FROM Peliculas
    WHERE
      /* %JoinFKPK(:%New,Peliculas," = "," AND") */
      :new.id_pelicula = Peliculas.id_pelicula;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    :new.id_pelicula IS NOT NULL AND
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update Detalles because Peliculas does not exist.'
    );
  END IF;


-- ERwin Builtin Thu Mar 08 12:34:11 2018
END;
/


CREATE  TRIGGER tI_Horarios BEFORE INSERT ON Horarios for each row
-- ERwin Builtin Thu Mar 08 12:34:11 2018
-- INSERT trigger on Horarios 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin Thu Mar 08 12:34:11 2018 */
    /* Salas  Horarios on child insert set null */
    /* ERWIN_RELATION:CHECKSUM="0000f8bd", PARENT_OWNER="", PARENT_TABLE="Salas"
    CHILD_OWNER="", CHILD_TABLE="Horarios"
    P2C_VERB_PHRASE="R/11", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_11", FK_COLUMNS="id_sala" */
    UPDATE Horarios
      SET
        /* %SetFK(Horarios,NULL) */
        Horarios.id_sala = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM Salas
            WHERE
              /* %JoinFKPK(:%New,Salas," = "," AND") */
              :new.id_sala = Salas.id_sala
        ) 
        /* %JoinPKPK(Horarios,:%New," = "," AND") */
         and Horarios.id_horario = :new.id_horario;


-- ERwin Builtin Thu Mar 08 12:34:11 2018
END;
/

CREATE  TRIGGER tD_Horarios AFTER DELETE ON Horarios for each row
-- ERwin Builtin Thu Mar 08 12:34:11 2018
-- DELETE trigger on Horarios 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin Thu Mar 08 12:34:11 2018 */
    /* Horarios  Rel_peliculas_horarios on parent delete set null */
    /* ERWIN_RELATION:CHECKSUM="0000e414", PARENT_OWNER="", PARENT_TABLE="Horarios"
    CHILD_OWNER="", CHILD_TABLE="Rel_peliculas_horarios"
    P2C_VERB_PHRASE="R/7", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_7", FK_COLUMNS="id_horario" */
    UPDATE Rel_peliculas_horarios
      SET
        /* %SetFK(Rel_peliculas_horarios,NULL) */
        Rel_peliculas_horarios.id_horario = NULL
      WHERE
        /* %JoinFKPK(Rel_peliculas_horarios,:%Old," = "," AND") */
        Rel_peliculas_horarios.id_horario = :old.id_horario;


-- ERwin Builtin Thu Mar 08 12:34:11 2018
END;
/

CREATE  TRIGGER tU_Horarios AFTER UPDATE ON Horarios for each row
-- ERwin Builtin Thu Mar 08 12:34:11 2018
-- UPDATE trigger on Horarios 
DECLARE NUMROWS INTEGER;
BEGIN
  /* Horarios  Rel_peliculas_horarios on parent update set null */
  /* ERWIN_RELATION:CHECKSUM="000213e2", PARENT_OWNER="", PARENT_TABLE="Horarios"
    CHILD_OWNER="", CHILD_TABLE="Rel_peliculas_horarios"
    P2C_VERB_PHRASE="R/7", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_7", FK_COLUMNS="id_horario" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.id_horario <> :new.id_horario
  THEN
    UPDATE Rel_peliculas_horarios
      SET
        /* %SetFK(Rel_peliculas_horarios,NULL) */
        Rel_peliculas_horarios.id_horario = NULL
      WHERE
        /* %JoinFKPK(Rel_peliculas_horarios,:%Old," = ",",") */
        Rel_peliculas_horarios.id_horario = :old.id_horario;
  END IF;

  /* ERwin Builtin Thu Mar 08 12:34:11 2018 */
  /* Salas  Horarios on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Salas"
    CHILD_OWNER="", CHILD_TABLE="Horarios"
    P2C_VERB_PHRASE="R/11", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_11", FK_COLUMNS="id_sala" */
  SELECT count(*) INTO NUMROWS
    FROM Salas
    WHERE
      /* %JoinFKPK(:%New,Salas," = "," AND") */
      :new.id_sala = Salas.id_sala;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    :new.id_sala IS NOT NULL AND
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update Horarios because Salas does not exist.'
    );
  END IF;


-- ERwin Builtin Thu Mar 08 12:34:11 2018
END;
/


CREATE  TRIGGER tI_Noticias BEFORE INSERT ON Noticias for each row
-- ERwin Builtin Thu Mar 08 12:34:11 2018
-- INSERT trigger on Noticias 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin Thu Mar 08 12:34:11 2018 */
    /* Peliculas  Noticias on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="0000f6be", PARENT_OWNER="", PARENT_TABLE="Peliculas"
    CHILD_OWNER="", CHILD_TABLE="Noticias"
    P2C_VERB_PHRASE="R/9", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_9", FK_COLUMNS="id_pelicula" */
    SELECT count(*) INTO NUMROWS
      FROM Peliculas
      WHERE
        /* %JoinFKPK(:%New,Peliculas," = "," AND") */
        :new.id_pelicula = Peliculas.id_pelicula;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert Noticias because Peliculas does not exist.'
      );
    END IF;


-- ERwin Builtin Thu Mar 08 12:34:11 2018
END;
/

CREATE  TRIGGER tU_Noticias AFTER UPDATE ON Noticias for each row
-- ERwin Builtin Thu Mar 08 12:34:11 2018
-- UPDATE trigger on Noticias 
DECLARE NUMROWS INTEGER;
BEGIN
  /* ERwin Builtin Thu Mar 08 12:34:11 2018 */
  /* Peliculas  Noticias on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="0000f860", PARENT_OWNER="", PARENT_TABLE="Peliculas"
    CHILD_OWNER="", CHILD_TABLE="Noticias"
    P2C_VERB_PHRASE="R/9", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_9", FK_COLUMNS="id_pelicula" */
  SELECT count(*) INTO NUMROWS
    FROM Peliculas
    WHERE
      /* %JoinFKPK(:%New,Peliculas," = "," AND") */
      :new.id_pelicula = Peliculas.id_pelicula;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update Noticias because Peliculas does not exist.'
    );
  END IF;


-- ERwin Builtin Thu Mar 08 12:34:11 2018
END;
/


CREATE  TRIGGER tD_Peliculas AFTER DELETE ON Peliculas for each row
-- ERwin Builtin Thu Mar 08 12:34:11 2018
-- DELETE trigger on Peliculas 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin Thu Mar 08 12:34:11 2018 */
    /* Peliculas  Detalles on parent delete set null */
    /* ERWIN_RELATION:CHECKSUM="0002d0f2", PARENT_OWNER="", PARENT_TABLE="Peliculas"
    CHILD_OWNER="", CHILD_TABLE="Detalles"
    P2C_VERB_PHRASE="R/3", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_3", FK_COLUMNS="id_pelicula" */
    UPDATE Detalles
      SET
        /* %SetFK(Detalles,NULL) */
        Detalles.id_pelicula = NULL
      WHERE
        /* %JoinFKPK(Detalles,:%Old," = "," AND") */
        Detalles.id_pelicula = :old.id_pelicula;

    /* ERwin Builtin Thu Mar 08 12:34:11 2018 */
    /* Peliculas  Rel_peliculas_horarios on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Peliculas"
    CHILD_OWNER="", CHILD_TABLE="Rel_peliculas_horarios"
    P2C_VERB_PHRASE="R/5", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_5", FK_COLUMNS="id_pelicula" */
    SELECT count(*) INTO NUMROWS
      FROM Rel_peliculas_horarios
      WHERE
        /*  %JoinFKPK(Rel_peliculas_horarios,:%Old," = "," AND") */
        Rel_peliculas_horarios.id_pelicula = :old.id_pelicula;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete Peliculas because Rel_peliculas_horarios exists.'
      );
    END IF;

    /* ERwin Builtin Thu Mar 08 12:34:11 2018 */
    /* Peliculas  Noticias on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Peliculas"
    CHILD_OWNER="", CHILD_TABLE="Noticias"
    P2C_VERB_PHRASE="R/9", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_9", FK_COLUMNS="id_pelicula" */
    SELECT count(*) INTO NUMROWS
      FROM Noticias
      WHERE
        /*  %JoinFKPK(Noticias,:%Old," = "," AND") */
        Noticias.id_pelicula = :old.id_pelicula;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete Peliculas because Noticias exists.'
      );
    END IF;


-- ERwin Builtin Thu Mar 08 12:34:11 2018
END;
/

CREATE  TRIGGER tU_Peliculas AFTER UPDATE ON Peliculas for each row
-- ERwin Builtin Thu Mar 08 12:34:11 2018
-- UPDATE trigger on Peliculas 
DECLARE NUMROWS INTEGER;
BEGIN
  /* Peliculas  Detalles on parent update set null */
  /* ERWIN_RELATION:CHECKSUM="00035180", PARENT_OWNER="", PARENT_TABLE="Peliculas"
    CHILD_OWNER="", CHILD_TABLE="Detalles"
    P2C_VERB_PHRASE="R/3", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_3", FK_COLUMNS="id_pelicula" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.id_pelicula <> :new.id_pelicula
  THEN
    UPDATE Detalles
      SET
        /* %SetFK(Detalles,NULL) */
        Detalles.id_pelicula = NULL
      WHERE
        /* %JoinFKPK(Detalles,:%Old," = ",",") */
        Detalles.id_pelicula = :old.id_pelicula;
  END IF;

  /* ERwin Builtin Thu Mar 08 12:34:11 2018 */
  /* Peliculas  Rel_peliculas_horarios on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Peliculas"
    CHILD_OWNER="", CHILD_TABLE="Rel_peliculas_horarios"
    P2C_VERB_PHRASE="R/5", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_5", FK_COLUMNS="id_pelicula" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.id_pelicula <> :new.id_pelicula
  THEN
    SELECT count(*) INTO NUMROWS
      FROM Rel_peliculas_horarios
      WHERE
        /*  %JoinFKPK(Rel_peliculas_horarios,:%Old," = "," AND") */
        Rel_peliculas_horarios.id_pelicula = :old.id_pelicula;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update Peliculas because Rel_peliculas_horarios exists.'
      );
    END IF;
  END IF;

  /* ERwin Builtin Thu Mar 08 12:34:11 2018 */
  /* Peliculas  Noticias on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Peliculas"
    CHILD_OWNER="", CHILD_TABLE="Noticias"
    P2C_VERB_PHRASE="R/9", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_9", FK_COLUMNS="id_pelicula" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.id_pelicula <> :new.id_pelicula
  THEN
    SELECT count(*) INTO NUMROWS
      FROM Noticias
      WHERE
        /*  %JoinFKPK(Noticias,:%Old," = "," AND") */
        Noticias.id_pelicula = :old.id_pelicula;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update Peliculas because Noticias exists.'
      );
    END IF;
  END IF;


-- ERwin Builtin Thu Mar 08 12:34:11 2018
END;
/


CREATE  TRIGGER tD_Perfil AFTER DELETE ON Perfil for each row
-- ERwin Builtin Thu Mar 08 12:34:11 2018
-- DELETE trigger on Perfil 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin Thu Mar 08 12:34:11 2018 */
    /* Perfil  Usuarios on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="0000e1e6", PARENT_OWNER="", PARENT_TABLE="Perfil"
    CHILD_OWNER="", CHILD_TABLE="Usuarios"
    P2C_VERB_PHRASE="R/2", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_2", FK_COLUMNS="id_perfil" */
    SELECT count(*) INTO NUMROWS
      FROM Usuarios
      WHERE
        /*  %JoinFKPK(Usuarios,:%Old," = "," AND") */
        Usuarios.id_perfil = :old.id_perfil;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete Perfil because Usuarios exists.'
      );
    END IF;


-- ERwin Builtin Thu Mar 08 12:34:11 2018
END;
/

CREATE  TRIGGER tU_Perfil AFTER UPDATE ON Perfil for each row
-- ERwin Builtin Thu Mar 08 12:34:11 2018
-- UPDATE trigger on Perfil 
DECLARE NUMROWS INTEGER;
BEGIN
  /* ERwin Builtin Thu Mar 08 12:34:11 2018 */
  /* Perfil  Usuarios on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="000108df", PARENT_OWNER="", PARENT_TABLE="Perfil"
    CHILD_OWNER="", CHILD_TABLE="Usuarios"
    P2C_VERB_PHRASE="R/2", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_2", FK_COLUMNS="id_perfil" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.id_perfil <> :new.id_perfil
  THEN
    SELECT count(*) INTO NUMROWS
      FROM Usuarios
      WHERE
        /*  %JoinFKPK(Usuarios,:%Old," = "," AND") */
        Usuarios.id_perfil = :old.id_perfil;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update Perfil because Usuarios exists.'
      );
    END IF;
  END IF;


-- ERwin Builtin Thu Mar 08 12:34:11 2018
END;
/


CREATE  TRIGGER tI_Rel_peliculas_horarios BEFORE INSERT ON Rel_peliculas_horarios for each row
-- ERwin Builtin Thu Mar 08 12:34:11 2018
-- INSERT trigger on Rel_peliculas_horarios 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin Thu Mar 08 12:34:11 2018 */
    /* Peliculas  Rel_peliculas_horarios on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="000260bb", PARENT_OWNER="", PARENT_TABLE="Peliculas"
    CHILD_OWNER="", CHILD_TABLE="Rel_peliculas_horarios"
    P2C_VERB_PHRASE="R/5", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_5", FK_COLUMNS="id_pelicula" */
    SELECT count(*) INTO NUMROWS
      FROM Peliculas
      WHERE
        /* %JoinFKPK(:%New,Peliculas," = "," AND") */
        :new.id_pelicula = Peliculas.id_pelicula;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert Rel_peliculas_horarios because Peliculas does not exist.'
      );
    END IF;

    /* ERwin Builtin Thu Mar 08 12:34:11 2018 */
    /* Horarios  Rel_peliculas_horarios on child insert set null */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Horarios"
    CHILD_OWNER="", CHILD_TABLE="Rel_peliculas_horarios"
    P2C_VERB_PHRASE="R/7", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_7", FK_COLUMNS="id_horario" */
    UPDATE Rel_peliculas_horarios
      SET
        /* %SetFK(Rel_peliculas_horarios,NULL) */
        Rel_peliculas_horarios.id_horario = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM Horarios
            WHERE
              /* %JoinFKPK(:%New,Horarios," = "," AND") */
              :new.id_horario = Horarios.id_horario
        ) 
        /* %JoinPKPK(Rel_peliculas_horarios,:%New," = "," AND") */
         and Rel_peliculas_horarios.id_rel_peliculas_horarios = :new.id_rel_peliculas_horarios;


-- ERwin Builtin Thu Mar 08 12:34:11 2018
END;
/

CREATE  TRIGGER tU_Rel_peliculas_horarios AFTER UPDATE ON Rel_peliculas_horarios for each row
-- ERwin Builtin Thu Mar 08 12:34:11 2018
-- UPDATE trigger on Rel_peliculas_horarios 
DECLARE NUMROWS INTEGER;
BEGIN
  /* ERwin Builtin Thu Mar 08 12:34:11 2018 */
  /* Peliculas  Rel_peliculas_horarios on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00023474", PARENT_OWNER="", PARENT_TABLE="Peliculas"
    CHILD_OWNER="", CHILD_TABLE="Rel_peliculas_horarios"
    P2C_VERB_PHRASE="R/5", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_5", FK_COLUMNS="id_pelicula" */
  SELECT count(*) INTO NUMROWS
    FROM Peliculas
    WHERE
      /* %JoinFKPK(:%New,Peliculas," = "," AND") */
      :new.id_pelicula = Peliculas.id_pelicula;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update Rel_peliculas_horarios because Peliculas does not exist.'
    );
  END IF;

  /* ERwin Builtin Thu Mar 08 12:34:11 2018 */
  /* Horarios  Rel_peliculas_horarios on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Horarios"
    CHILD_OWNER="", CHILD_TABLE="Rel_peliculas_horarios"
    P2C_VERB_PHRASE="R/7", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_7", FK_COLUMNS="id_horario" */
  SELECT count(*) INTO NUMROWS
    FROM Horarios
    WHERE
      /* %JoinFKPK(:%New,Horarios," = "," AND") */
      :new.id_horario = Horarios.id_horario;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    :new.id_horario IS NOT NULL AND
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update Rel_peliculas_horarios because Horarios does not exist.'
    );
  END IF;


-- ERwin Builtin Thu Mar 08 12:34:11 2018
END;
/


CREATE  TRIGGER tD_Salas AFTER DELETE ON Salas for each row
-- ERwin Builtin Thu Mar 08 12:34:11 2018
-- DELETE trigger on Salas 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin Thu Mar 08 12:34:11 2018 */
    /* Salas  Horarios on parent delete set null */
    /* ERWIN_RELATION:CHECKSUM="0000ba3a", PARENT_OWNER="", PARENT_TABLE="Salas"
    CHILD_OWNER="", CHILD_TABLE="Horarios"
    P2C_VERB_PHRASE="R/11", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_11", FK_COLUMNS="id_sala" */
    UPDATE Horarios
      SET
        /* %SetFK(Horarios,NULL) */
        Horarios.id_sala = NULL
      WHERE
        /* %JoinFKPK(Horarios,:%Old," = "," AND") */
        Horarios.id_sala = :old.id_sala;


-- ERwin Builtin Thu Mar 08 12:34:11 2018
END;
/

CREATE  TRIGGER tU_Salas AFTER UPDATE ON Salas for each row
-- ERwin Builtin Thu Mar 08 12:34:11 2018
-- UPDATE trigger on Salas 
DECLARE NUMROWS INTEGER;
BEGIN
  /* Salas  Horarios on parent update set null */
  /* ERWIN_RELATION:CHECKSUM="0000db4c", PARENT_OWNER="", PARENT_TABLE="Salas"
    CHILD_OWNER="", CHILD_TABLE="Horarios"
    P2C_VERB_PHRASE="R/11", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_11", FK_COLUMNS="id_sala" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.id_sala <> :new.id_sala
  THEN
    UPDATE Horarios
      SET
        /* %SetFK(Horarios,NULL) */
        Horarios.id_sala = NULL
      WHERE
        /* %JoinFKPK(Horarios,:%Old," = ",",") */
        Horarios.id_sala = :old.id_sala;
  END IF;


-- ERwin Builtin Thu Mar 08 12:34:11 2018
END;
/


CREATE  TRIGGER tI_Usuarios BEFORE INSERT ON Usuarios for each row
-- ERwin Builtin Thu Mar 08 12:34:11 2018
-- INSERT trigger on Usuarios 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin Thu Mar 08 12:34:11 2018 */
    /* Perfil  Usuarios on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="0000e83e", PARENT_OWNER="", PARENT_TABLE="Perfil"
    CHILD_OWNER="", CHILD_TABLE="Usuarios"
    P2C_VERB_PHRASE="R/2", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_2", FK_COLUMNS="id_perfil" */
    SELECT count(*) INTO NUMROWS
      FROM Perfil
      WHERE
        /* %JoinFKPK(:%New,Perfil," = "," AND") */
        :new.id_perfil = Perfil.id_perfil;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert Usuarios because Perfil does not exist.'
      );
    END IF;


-- ERwin Builtin Thu Mar 08 12:34:11 2018
END;
/

CREATE  TRIGGER tU_Usuarios AFTER UPDATE ON Usuarios for each row
-- ERwin Builtin Thu Mar 08 12:34:11 2018
-- UPDATE trigger on Usuarios 
DECLARE NUMROWS INTEGER;
BEGIN
  /* ERwin Builtin Thu Mar 08 12:34:11 2018 */
  /* Perfil  Usuarios on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="0000e908", PARENT_OWNER="", PARENT_TABLE="Perfil"
    CHILD_OWNER="", CHILD_TABLE="Usuarios"
    P2C_VERB_PHRASE="R/2", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_2", FK_COLUMNS="id_perfil" */
  SELECT count(*) INTO NUMROWS
    FROM Perfil
    WHERE
      /* %JoinFKPK(:%New,Perfil," = "," AND") */
      :new.id_perfil = Perfil.id_perfil;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update Usuarios because Perfil does not exist.'
    );
  END IF;


-- ERwin Builtin Thu Mar 08 12:34:11 2018
END;
/

