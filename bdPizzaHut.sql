DROP DATABASE DBPIZZAHUT;
USE MASTER;
CREATE DATABASE DBPIZZAHUT;
GO
USE DBPIZZAHUT;
set language spanish;

CREATE TABLE CLIENTE (
    IDCLI int  NOT NULL IDENTITY(1,1),
    NOMCLI varchar(20)  NOT NULL,
    APECLI varchar(20)  NOT NULL,
    DNICLI char(8)  NOT NULL,
    PASCLI varchar(20)  NOT NULL,
    TELCLI char(9)  NOT NULL,
	EMACLI varchar(60) NOT NULL,
	CODUBI char(6) NOT NULL,
    CONSTRAINT CLIENTE_pk PRIMARY KEY  (IDCLI)
);

-- Table: EMPLEADO
CREATE TABLE EMPLEADO (
    IDEMP int  NOT NULL IDENTITY(1,1),
    NOMEMP varchar(20)  NOT NULL,
    APEEMP varchar(20)  NOT NULL,
    DNIEMP char(8)  NOT NULL,
    PASEMP varchar(20)  NOT NULL,
    TELEMP char(9)  NOT NULL,
	EMAEMP varchar(60) NOT NULL,
	CODUBI char(6) NOT NULL,
    CONSTRAINT EMPLEADO_pk PRIMARY KEY  (IDEMP)
);

-- Table: PIZZA
CREATE TABLE PIZZA (
    IDPIZZ int  NOT NULL IDENTITY(1,1),
    NOMPIZ varchar(20)  NOT NULL,
    FECPIZ date  NOT NULL,
    PREPIZ int  NOT NULL,
    CONSTRAINT PIZZA_pk PRIMARY KEY  (IDPIZZ)
);

-- Table: UBIGEO
CREATE TABLE UBIGEO (
    CODUBI char(6)  NOT NULL,
    DEPUBI varchar(60)  NOT NULL,
    PROUBI varchar(60)  NOT NULL,
    DISUBI varchar(60)  NOT NULL,
    CONSTRAINT UBIGEO_pk PRIMARY KEY  (CODUBI)
);

-- Table: VENTA
CREATE TABLE VENTA (
    IDVEN int  NOT NULL IDENTITY(1,1),
    FECVEN date  NOT NULL,
    IDEMP int  NOT NULL,
    IDCLI int  NOT NULL,
    CONSTRAINT VENTA_pk PRIMARY KEY  (IDVEN)
);

-- Table: VENTA_DETALLE
CREATE TABLE VENTA_DETALLE (
    IDVENDET int  NOT NULL IDENTITY(1,1),
    CANMED int  NOT NULL,
    IDPIZZ int  NOT NULL,
	IDVEN int NOT NULL,
    CONSTRAINT VENTA_DETALLE_pk PRIMARY KEY  (IDVENDET)
);

-- foreign keys
-- Reference: CLIENTE_UBIGEO (table: CLIENTE)
ALTER TABLE CLIENTE ADD CONSTRAINT CLIENTE_UBIGEO
    FOREIGN KEY (CODUBI)
    REFERENCES UBIGEO (CODUBI);

-- Reference: EMPLEADO_UBIGEO (table: EMPLEADO)
ALTER TABLE EMPLEADO ADD CONSTRAINT EMPLEADO_UBIGEO
    FOREIGN KEY (CODUBI)
    REFERENCES UBIGEO (CODUBI);

-- Reference: VENTA_CLIENTE (table: VENTA)
ALTER TABLE VENTA ADD CONSTRAINT VENTA_CLIENTE
    FOREIGN KEY (IDCLI)
    REFERENCES CLIENTE (IDCLI);

-- Reference: VENTA_DETALLE_PIZZA (table: VENTA_DETALLE)
ALTER TABLE VENTA_DETALLE ADD CONSTRAINT VENTA_DETALLE_PIZZA
    FOREIGN KEY (IDPIZZ)
    REFERENCES PIZZA (IDPIZZ);

-- Reference: VENTA_DETALLE_VENTA (table: VENTA_DETALLE)
ALTER TABLE VENTA_DETALLE ADD CONSTRAINT VENTA_DETALLE_VENTA
    FOREIGN KEY (IDVEN)
    REFERENCES VENTA (IDVEN);

-- Reference: VENTA_EMPLEADO (table: VENTA)
ALTER TABLE VENTA ADD CONSTRAINT VENTA_EMPLEADO
    FOREIGN KEY (IDEMP)
    REFERENCES EMPLEADO (IDEMP);

	INSERT INTO UBIGEO (CODUBI,DEPUBI,PROUBI,DISUBI)
VALUES  ('110107','ICA','ICA','PUEBLO NUEVO '),
		('110204','ICA','CHINCHA','CHINCHA BAJA'),
		('110304','ICA','NAZCA','MARCONA'),
		('110205','ICA','CHINCHA','EL CARMEN'),

		('130201', 'LA LIBERTAD', 'ASCOPE', 'ASCOPE'),
		('130202', 'LA LIBERTAD', 'ASCOPE', 'CHICAMA'),
		('130203', 'LA LIBERTAD', 'ASCOPE', 'CHOCOPE'),
		('130204', 'LA LIBERTAD', 'ASCOPE', 'MAGDALENA DE CAO'),
		('130206', 'LA LIBERTAD', 'ASCOPE', 'RAZURI'),
		('130402', 'LA LIBERTAD', 'CHEPEN', 'PACANGA'),
		('130403', 'LA LIBERTAD', 'CHEPEN', 'PUEBLO NUEVO'),
		('130501', 'LA LIBERTAD', 'JULCAN', 'JULCAN'),
		('130601', 'LA LIBERTAD', 'OTUZCO', 'OTUZCO'),
		('130613', 'LA LIBERTAD', 'OTUZCO', 'SINSICAP'); 

INSERT INTO CLIENTE (NOMCLI, APECLI, DNICLI, PASCLI,TELCLI,EMACLI,CODUBI)
VALUES   ('Abel', 'Mamani','77436585','ABS','963214587','abel@gmail.com','130613'),
		('Jhanpool', 'Pancrasio','22455689','ABS','987456123','Jhanpool@gmail.com','130601'),
		('Paul' , 'Quispe','78965321','ABS','951236478','Paul@gmail.com','130501'),
		('Jemina' ,'Asuncion','74852396','ABS','985632147','Jemina@gmail.com','130403'),
		('Cecilia' ,'Caceres','75214596','ABS','963214785','Cecilia@gmail.com','130402'),
		('Esteban' ,'Rigoberto','76325894','ABS','987563214','Esteban@gmail.com','130206'),
		('Macarena' ,'Bautista','75315982','ABS','987451263','Macarena@gmail.com','130204'),
		('Jeremias' ,'Pantano','25413698','ABS','978456123','Jeremias@gmail.com','130203'),
		('Aria' ,'Hurtado','23456987','ABS','951427863','Aria@gmail.com','130202'),
		('Pedro' ,'Castle','73156489','ABS','932145687','Pedro@gmail.com','130201');


	INSERT INTO EMPLEADO(NOMEMP, APEEMP, DNIEMP, PASEMP,TELEMP,EMAEMP,CODUBI)
VALUES   ('Jorge', 'Palomino','77436585','ABS','963214587','abel@gmail.com','130613'),
		('Sanchez', 'Cuadros','22455689','ABS','987456123','Jhanpool@gmail.com','130601'),
		('Jorge' , 'Benavides','78965321','ABS','951236478','Paul@gmail.com','130501'),
		('Felipe' ,'Cuellar','74852396','ABS','985632147','Jemina@gmail.com','130403'),
		('Alexa' ,'Rodriguez','75214596','ABS','963214785','Cecilia@gmail.com','130402'),
		('Felipe' ,'Castro','76325894','ABS','987563214','Esteban@gmail.com','130206'),
		('Lucas' ,'Peralta','75315982','ABS','987451263','Macarena@gmail.com','130204'),
		('Francisco' ,'Julian','25413698','ABS','978456123','Jeremias@gmail.com','130203'),
		('Cristopher' ,'Marcos','23456987','ABS','951427863','Aria@gmail.com','130202'),
		('Lucio' ,'artica','73156489','ABS','932145687','Pedro@gmail.com','130201');

	INSERT INTO PIZZA(NOMPIZ, FECPIZ, PREPIZ)
	VALUES
	('HAWAYANA','04/04/22','25'),
	('PEPERONI','05/04/22','30'),
	('PIÑA','06/04/22','27'),
	('CACERA','07/04/22','30');

INSERT INTO VENTA (FECVEN,IDEMP,IDCLI)
	VALUES  ('22/04/22','1','1'),
			('22/05/22','2','2'),
			('22/03/22','1','3');

INSERT INTO VENTA_DETALLE(CANMED,IDPIZZ,IDVEN)
VALUES  ('10','1','1'),
		('5','2','2'),
		('2','3','1');



/* Procedimiento almacenado para Insertar Clientes y que no haya duplicado de DNI */
CREATE PROCEDURE spInsertCliente
    (
        @nombreCli      VARCHAR(20),
        @apellidoCli    VARCHAR(20),
        @dniCli         CHAR(6),
		@passCli		VARCHAR(20),
		@telCli         CHAR(9),
		@emaCli			VARCHAR(60),
		@codUbi			CHAR(6)
    )
AS
    BEGIN
    SET NOCOUNT ON
        BEGIN TRY
        begin tran;
            IF(SELECT COUNT(*) FROM dbo.CLIENTE AS C WHERE C.DNICLI = @dniCli) = 1
                ROLLBACK TRAN;
            ELSE
                INSERT INTO dbo.CLIENTE
                    (NOMCLI, APECLI, DNICLI, PASCLI, TELCLI, EMACLI, CODUBI)
                VALUES
                    (@nombreCli, @apellidoCli, @dniCli ,@passCli, @telCli, @emaCli, @codUbi)
        COMMIT TRAN;
        END TRY
        BEGIN CATCH
            SELECT 'El cliente ya existe.' AS 'ERROR'
            IF @@TRANCOUNT > 0 ROLLBACK TRAN;
        END CATCH
    END
GO

-- Listar los datos de los productos con los datos de los clientes a los que se ha realizado la venta, incluyendo el detalle de la venta.
CREATE VIEW vClienteProducto
AS
SELECT 
	VD.CANMED AS 'Cantidad de la pizza',
	P.NOMPIZ AS 'Nombre de la pizza',
	P.PREPIZ AS 'Precio de la pizza',
	C.NOMCLI AS 'Nombre del Cliente',
	C.APECLI AS 'Apellido del Cliente'
FROM VENTA_DETALLE AS VD
	INNER JOIN PIZZA AS P ON
	P.IDPIZZ = VD.IDPIZZ
	INNER JOIN VENTA AS V ON
	V.IDVEN = VD.IDVEN
	INNER JOIN CLIENTE AS C ON
	C.IDCLI = V.IDCLI
GO