EXECUTE reset_gerichsoft; 

-- Table: RESERVA
CREATE TABLE RESERVA (
    id int GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
    cliente_id int  NOT NULL,
    trabajador_id int DEFAULT '1',
    fecha_registro timestamp DEFAULT SYSDATE NOT NULL,
    fecha_destino timestamp  NOT NULL,
    monto_minimo decimal(4,2) NULL,
    activo char(1)  DEFAULT 'A',
    CONSTRAINT RESERVA_pk PRIMARY KEY (id)
) ;
COMMIT;

-- Table: RESERVA_DETALLE
CREATE TABLE RESERVA_DETALLE (
    id int  GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
    reserva_id int  NOT NULL,
    producto_id int  NOT NULL,
    cantidad int  NOT NULL,
    activo char(1) DEFAULT 'A',
    CONSTRAINT RESERVA_DETALLE_pk PRIMARY KEY (id)
) ;
COMMIT;

-- Table: VENTA
CREATE TABLE VENTA (
    id int  GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
    fecha date DEFAULT SYSDATE NOT NULL,
    cliente_id int  NOT NULL,
    trabajador_id int  NOT NULL,
    activo char(1)  DEFAULT 'A',
    CONSTRAINT VENTA_pk PRIMARY KEY (id)
) ;
COMMIT;

-- Table: VENTA_DETALLE
CREATE TABLE VENTA_DETALLE (
    id int  GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
    venta_id int  NOT NULL,
    producto_id int  NOT NULL,
    cantidad int  NOT NULL,
    activo char(1)  DEFAULT 'A',
    CONSTRAINT VENTA_DETALLE_pk PRIMARY KEY (id)
) ;
COMMIT;

-- Table: UBIGEO
CREATE TABLE UBIGEO (
    codigo char(6)  NOT NULL,
    departamento varchar2(80)  NOT NULL,
    provincia char(80)  NOT NULL,
    distrito varchar2(80)  NOT NULL,
    CONSTRAINT UBIGEO_pk PRIMARY KEY (codigo)
) ;
COMMIT;

-- Table: CLIENTE
CREATE TABLE CLIENTE (
    id int GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
    nombres varchar2(40)  NOT NULL,
    apellido_paterno varchar2(50)  NOT NULL,
    apellido_materno varchar2(50)  NOT NULL,
    dni char(8)  NOT NULL UNIQUE,
    celular char(11)  NOT NULL UNIQUE,
    email varchar2(80)  NOT NULL UNIQUE,
    domicilio varchar2(80)  NOT NULL,
    ubigeo_codigo char(6)  NOT NULL,
    activo CHAR(1) DEFAULT 'A',
    CONSTRAINT CLIENTE_pk PRIMARY KEY (id)
) ;
COMMIT;

-- Table: TRABAJADOR
CREATE TABLE TRABAJADOR (
    id int GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
    nombres varchar2(50)  NOT NULL,
    apellido_paterno varchar2(50)  NOT NULL,
    apellido_materno varchar2(50)  NOT NULL,
    dni char(8)  NOT NULL UNIQUE,
    celular char(11)  NOT NULL UNIQUE,
    activo char(1)  DEFAULT 'A',
    CONSTRAINT TRABAJADOR_pk PRIMARY KEY (id)
) ;
COMMIT;

-- Table: PRODUCTO
CREATE TABLE PRODUCTO (
    id int GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
    nombre varchar2(50) NOT NULL,
    descripcion varchar2(200) NOT NULL,
    precio decimal(8,2) NOT NULL,
    categoria char(1)  NOT NULL,
    stock int  NOT NULL,
    activo char(1) DEFAULT 'A',
    CONSTRAINT PRODUCTO_pk PRIMARY KEY (id)
) ;
COMMIT;

-- Reference: CLIENTE_UBIGEO (table: CLIENTE)
ALTER TABLE CLIENTE ADD CONSTRAINT CLIENTE_UBIGEO
    FOREIGN KEY (ubigeo_codigo)
    REFERENCES UBIGEO (codigo);
COMMIT;

-- Reference: RESERVA_CLIENTE (table: RESERVA)
ALTER TABLE RESERVA ADD CONSTRAINT RESERVA_CLIENTE
    FOREIGN KEY (cliente_id)
    REFERENCES CLIENTE (id);
COMMIT;

-- Reference: RESERVA_DETALLE_PRODUCTO (table: RESERVA_DETALLE)
ALTER TABLE RESERVA_DETALLE ADD CONSTRAINT RESERVA_DETALLE_PRODUCTO
    FOREIGN KEY (producto_id)
    REFERENCES PRODUCTO (id);
COMMIT;

-- Reference: RESERVA_DETALLE_RESERVA (table: RESERVA_DETALLE)
ALTER TABLE RESERVA_DETALLE ADD CONSTRAINT RESERVA_DETALLE_RESERVA
    FOREIGN KEY (reserva_id)
    REFERENCES RESERVA (id);
COMMIT;

-- Reference: RESERVA_TRABAJADOR (table: RESERVA)
ALTER TABLE RESERVA ADD CONSTRAINT RESERVA_TRABAJADOR
    FOREIGN KEY (trabajador_id)
    REFERENCES TRABAJADOR (id);
COMMIT;

-- Reference: VENTA_CLIENTE (table: VENTA)
ALTER TABLE VENTA ADD CONSTRAINT VENTA_CLIENTE
    FOREIGN KEY (cliente_id)
    REFERENCES CLIENTE (id);
COMMIT;

-- Reference: VENTA_DETALLE_PRODUCTO (table: VENTA_DETALLE)
ALTER TABLE VENTA_DETALLE ADD CONSTRAINT VENTA_DETALLE_PRODUCTO
    FOREIGN KEY (producto_id)
    REFERENCES PRODUCTO (id);
COMMIT;

-- Reference: VENTA_DETALLE_VENTA (table: VENTA_DETALLE)
ALTER TABLE VENTA_DETALLE ADD CONSTRAINT VENTA_DETALLE_VENTA
    FOREIGN KEY (venta_id)
    REFERENCES VENTA (id);
COMMIT;

-- Reference: VENTA_TRABAJADOR (table: VENTA)
ALTER TABLE VENTA ADD CONSTRAINT VENTA_TRABAJADOR
    FOREIGN KEY (trabajador_id)
    REFERENCES TRABAJADOR (id);
COMMIT;

--INSERCION DE REGISTRO MAESTRAS

-- Insertar registros UBIGEO
INSERT INTO UBIGEO (codigo, departamento, provincia, distrito) VALUES('140401', 'Lima', 'Cañete', 'San Vicente de Cañete');
INSERT INTO UBIGEO (codigo, departamento, provincia, distrito) VALUES('140402', 'Lima', 'Cañete', 'Calango');
INSERT INTO UBIGEO (codigo, departamento, provincia, distrito) VALUES('140403', 'Lima', 'Cañete', 'Cerro Azul');
INSERT INTO UBIGEO (codigo, departamento, provincia, distrito) VALUES('140404', 'Lima', 'Cañete', 'Coayllo');
INSERT INTO UBIGEO (codigo, departamento, provincia, distrito) VALUES('140405', 'Lima', 'Cañete', 'Chilca');
INSERT INTO UBIGEO (codigo, departamento, provincia, distrito) VALUES('140406', 'Lima', 'Cañete', 'Imperial');
INSERT INTO UBIGEO (codigo, departamento, provincia, distrito) VALUES('140407', 'Lima', 'Cañete', 'Lunahuaná');
INSERT INTO UBIGEO (codigo, departamento, provincia, distrito) VALUES('140408', 'Lima', 'Cañete', 'Mala');
INSERT INTO UBIGEO (codigo, departamento, provincia, distrito) VALUES('140409', 'Lima', 'Cañete', 'Nuevo Imperial');
INSERT INTO UBIGEO (codigo, departamento, provincia, distrito) VALUES('140410', 'Lima', 'Cañete', 'Pacarán');
INSERT INTO UBIGEO (codigo, departamento, provincia, distrito) VALUES('140411', 'Lima', 'Cañete', 'Quilmaná');
INSERT INTO UBIGEO (codigo, departamento, provincia, distrito) VALUES('140412', 'Lima', 'Cañete', 'San Antonio');
INSERT INTO UBIGEO (codigo, departamento, provincia, distrito) VALUES('140413', 'Lima', 'Cañete', 'San Luis');
INSERT INTO UBIGEO (codigo, departamento, provincia, distrito) VALUES('140414', 'Lima', 'Cañete', 'Santa Cruz de Flores');
INSERT INTO UBIGEO (codigo, departamento, provincia, distrito) VALUES('140415', 'Lima', 'Cañete', 'Zúñiga');
INSERT INTO UBIGEO (codigo, departamento, provincia, distrito) VALUES('140416', 'Lima', 'Cañete', 'Asia');
COMMIT;
      
-- Insertar registros CLIENTE
INSERT INTO CLIENTE (nombres, apellido_paterno, apellido_materno, dni, celular, email, domicilio, ubigeo_codigo) VALUES ('Alicia','García','Campos','47812333','929 185 236','agarcia@gmail.com','Av. Paula Sotelo','140409');
INSERT INTO CLIENTE (nombres, apellido_paterno, apellido_materno, dni, celular, email, domicilio, ubigeo_codigo) VALUES ('Juana','Ávila','Chumpitaz','15487922','923 568 741','javila@gmail.com','Jr. Ignacio Alicea ','140402');
INSERT INTO CLIENTE (nombres, apellido_paterno, apellido_materno, dni, celular, email, domicilio, ubigeo_codigo) VALUES ('Oscar','Coronado','Vásquez','15253588','932 615 478','ocoronado@gmail.com','Cl. Axel Aranda','140403');
INSERT INTO CLIENTE (nombres, apellido_paterno, apellido_materno, dni, celular, email, domicilio, ubigeo_codigo) VALUES ('Luis','Barrios','Palomino','85213566','932 817 645','lbarrios@outlook.com','Cl. Juan José Meléndez','140409');
INSERT INTO CLIENTE (nombres, apellido_paterno, apellido_materno, dni, celular, email, domicilio, ubigeo_codigo) VALUES ('María','Tarazona','Mendoza','15482566','978 400 123','mtarazona@outlook.com','Urb. Isaac Olmos','140407');
INSERT INTO CLIENTE (nombres, apellido_paterno, apellido_materno, dni, celular, email, domicilio, ubigeo_codigo) VALUES ('Pedro','Sánchez','Dávila','15428211','941 533 268','psanchez@yahoo.com','Av. Juan Diego Rivero','140402');
INSERT INTO CLIENTE (nombres, apellido_paterno, apellido_materno, dni, celular, email, domicilio, ubigeo_codigo) VALUES ('Aldo','Torres','Zavala','47129533','958 866 221','atorres@yahoo.com','Urb. Juan José Portillo','140405');
INSERT INTO CLIENTE (nombres, apellido_paterno, apellido_materno, dni, celular, email, domicilio, ubigeo_codigo) VALUES ('Fiorella','Monteza','Alzamora','48171533','992 255 441','fmonteza@gmail.com','Cl. Josefina Guillen','140408');
INSERT INTO CLIENTE (nombres, apellido_paterno, apellido_materno, dni, celular, email, domicilio, ubigeo_codigo) VALUES ('Gloria','Linares','Rodríguez','15429866','954 415 950','gli@hotmail.com','Cl. Montserrat Sánchez','140403');
INSERT INTO CLIENTE (nombres, apellido_paterno, apellido_materno, dni, celular, email, domicilio, ubigeo_codigo) VALUES ('Esperanza','Stark','Parker','85251592','901 133 258','estark@yahoo.com','Urb. Juan José Portillo','140405');
INSERT INTO CLIENTE (nombres, apellido_paterno, apellido_materno, dni, celular, email, domicilio, ubigeo_codigo) VALUES ('Esmeralda','Sánchez','Lévano','15437783','918 253 554','Esmesan@gmail.com','Cl. Juan José Meléndez','140409');
INSERT INTO CLIENTE (nombres, apellido_paterno, apellido_materno, dni, celular, email, domicilio, ubigeo_codigo) VALUES ('Alexander','Vicente','Campos','15365377','912 873 460','Alexampos@gmail.com','Urb. Isaac Olmos','140407');
INSERT INTO CLIENTE (nombres, apellido_paterno, apellido_materno, dni, celular, email, domicilio, ubigeo_codigo) VALUES ('Maria','Chamorro','Vicente','73467458','913 466 467','Mariacha@gmail.com','Av. Paula Sotelo','140409');
INSERT INTO CLIENTE (nombres, apellido_paterno, apellido_materno, dni, celular, email, domicilio, ubigeo_codigo) VALUES ('Daniela','Cuzcano','Luyo','56478936','923 536 576','Daniluyo@yahoo.com','Av. Juan Diego Rivero','140402');
INSERT INTO CLIENTE (nombres, apellido_paterno, apellido_materno, dni, celular, email, domicilio, ubigeo_codigo) VALUES ('Carmen','Sánchez','Sánchez','15385177','926 327 843','Carmen@gmail.com','Cl. Juan José Meléndez','140409');
INSERT INTO CLIENTE (nombres, apellido_paterno, apellido_materno, dni, celular, email, domicilio, ubigeo_codigo) VALUES ('Miguel','Sánchez','De la cruz','87214363','907 547 644','Miguelcruz@outlook.com','Cl. Josefina Guillen','140408');
INSERT INTO CLIENTE (nombres, apellido_paterno, apellido_materno, dni, celular, email, domicilio, ubigeo_codigo) VALUES ('Yulissa','Vicente','Luyo','18923737','957 672 146','Yulissaluyo@hotmail.com','Cl. Axel Aranda','140403');
INSERT INTO CLIENTE (nombres, apellido_paterno, apellido_materno, dni, celular, email, domicilio, ubigeo_codigo) VALUES ('Raul','Vicente','Rojas','14564367','956 465 890','Raulrojas@gmail.com','Jr. Ignacio Alicea','140402');
INSERT INTO CLIENTE (nombres, apellido_paterno, apellido_materno, dni, celular, email, domicilio, ubigeo_codigo) VALUES ('Ruben','Ruiz','Quispe','15745889','918 746 334','rubenquispe@yahoo.com','Urb. Juan José Portillo','140405');
INSERT INTO CLIENTE (nombres, apellido_paterno, apellido_materno, dni, celular, email, domicilio, ubigeo_codigo) VALUES ('Alvaro','Alcala','Quispe','15545889','918 746 367','Alvaroalcala@outlook.es','Urb. Juan José Portillo','140405');
INSERT INTO CLIENTE (nombres, apellido_paterno, apellido_materno, dni, celular, email, domicilio, ubigeo_codigo) VALUES ('Ruben','Ruiz','Mesa','15744588','918 747 654','rubenruiz@yahoo.com','Urb. Vicente','140405');
INSERT INTO CLIENTE (nombres, apellido_paterno, apellido_materno, dni, celular, email, domicilio, ubigeo_codigo) VALUES ('Cristhian','Contreras','Barrios','15438799','915 112 334','crisbarrios@yahoo.com','Urb. Juan José Portillo','140405');
COMMIT;

-- Insertar registros TRABAJADOR
INSERT INTO TRABAJADOR (nombres, apellido_paterno, apellido_materno, dni, celular) VALUES('Jeferson','Mauricio','Sanchez','73954835','918 304 550');
INSERT INTO TRABAJADOR (nombres, apellido_paterno, apellido_materno, dni, celular) VALUES('Pedro','Porras','Luyo','73183575','986 062 248');
INSERT INTO TRABAJADOR (nombres, apellido_paterno, apellido_materno, dni, celular) VALUES('Edy Anthony','Beingolea','Castro','76564965','952 359 226');
INSERT INTO TRABAJADOR (nombres, apellido_paterno, apellido_materno, dni, celular) VALUES('Maria De Los Angeles ','Guando','Campos ','76519749','926 806 121');
INSERT INTO TRABAJADOR (nombres, apellido_paterno, apellido_materno, dni, celular) VALUES('Luis Alberto','Juscamayta','Huaman','76439535','935 001 857');
INSERT INTO TRABAJADOR (nombres, apellido_paterno, apellido_materno, dni, celular) VALUES('Angelo Rodrigo','La Madrid','Escalante','76093144','931 276 512');
INSERT INTO TRABAJADOR (nombres, apellido_paterno, apellido_materno, dni, celular) VALUES('Kimberling Emilia','Lipa','Yactayo','71093166','944 176 856');
INSERT INTO TRABAJADOR (nombres, apellido_paterno, apellido_materno, dni, celular) VALUES('Cinthia','Mayuri','Chamarro','45849584','979 653 253');
INSERT INTO TRABAJADOR (nombres, apellido_paterno, apellido_materno, dni, celular) VALUES('Anthony Ruben','Monteza','Caton','70669421','939 142 260');
INSERT INTO TRABAJADOR (nombres, apellido_paterno, apellido_materno, dni, celular) VALUES('Gian Alexander','Nuñez','Saenz','75834813','921 176 693');
INSERT INTO TRABAJADOR (nombres, apellido_paterno, apellido_materno, dni, celular) VALUES('Pedro Stward','Orellana','Hurtado','71587412','979 926 882');
INSERT INTO TRABAJADOR (nombres, apellido_paterno, apellido_materno, dni, celular) VALUES('Erick Joel','Portuguez','Zavala','72530589','981 774 991');
INSERT INTO TRABAJADOR (nombres, apellido_paterno, apellido_materno, dni, celular) VALUES('Max Sergi','Ramirez','Damian','72720474','951 878 860');
INSERT INTO TRABAJADOR (nombres, apellido_paterno, apellido_materno, dni, celular) VALUES('Jhonn Anderson','Sotomayor','Sanchez','73713789','958 768 412');
INSERT INTO TRABAJADOR (nombres, apellido_paterno, apellido_materno, dni, celular) VALUES('Rodrigo Roberto','Vicente','Malasquez','76806846','968 036 204');
INSERT INTO TRABAJADOR (nombres, apellido_paterno, apellido_materno, dni, celular) VALUES('Jonas','Zubieta','Leon','74032418','903 858 946');
INSERT INTO TRABAJADOR (nombres, apellido_paterno, apellido_materno, dni, celular) VALUES('Abel Jeremias','Huamani','Espinoza','77436585','922 887 754');
INSERT INTO TRABAJADOR (nombres, apellido_paterno, apellido_materno, dni, celular) VALUES('Jhanpool Esteban','Cupe','Perez','76473233','906 852 756');
INSERT INTO TRABAJADOR (nombres, apellido_paterno, apellido_materno, dni, celular) VALUES('Maria','Ester','Gamero','73932835','986 846 232');
INSERT INTO TRABAJADOR (nombres, apellido_paterno, apellido_materno, dni, celular) VALUES('Alvaro','Cortez','Capcha','73104535','983 446 252');
INSERT INTO TRABAJADOR (nombres, apellido_paterno, apellido_materno, dni, celular) VALUES('Jesus Moises','Carbonel','Alcala','73918535','943 705 795');
INSERT INTO TRABAJADOR (nombres, apellido_paterno, apellido_materno, dni, celular) VALUES('Piero Asmir','Sanchez','Levano','78749322','925 532 195');
COMMIT;

-- Insertar registros PRODUCTO
INSERT INTO PRODUCTO (nombre, descripcion, precio, categoria, stock) VALUES('Papa a la huancaina','Rica entrada tradicional',10.00,'E','10');
INSERT INTO PRODUCTO (nombre, descripcion, precio, categoria, stock) VALUES('Pollo al cilindro','El rico pollo al cilindro',20.00,'S','10');
INSERT INTO PRODUCTO (nombre, descripcion, precio, categoria, stock) VALUES('Chancho al cilindro','El rico chancho al cilindro',30.00,'S','10');
INSERT INTO PRODUCTO (nombre, descripcion, precio, categoria, stock) VALUES('Sopa seca de Camarón','La tipica comida sopa seca de Lunahuana con el rico camaron',40.00,'S','10');
INSERT INTO PRODUCTO (nombre, descripcion, precio, categoria, stock) VALUES('Picante de Camarón','El rico camaron con el toque picante que nos gusta',40.00,'S','10');
INSERT INTO PRODUCTO (nombre, descripcion, precio, categoria, stock) VALUES('Caldo de gallina','Rica sopa para empezar la comida',12.00,'E','10');
INSERT INTO PRODUCTO (nombre, descripcion, precio, categoria, stock) VALUES('Ceviche de Camarón','El rico camaron sin cascara con el toque de ceviche',40.00,'S','10');
INSERT INTO PRODUCTO (nombre, descripcion, precio, categoria, stock) VALUES('Porcion de yuca','Porcion de 12 yuquitas fritas',10.00,'E','10');
INSERT INTO PRODUCTO (nombre, descripcion, precio, categoria, stock) VALUES('Chupe de Camarón','Un rico caldo de camarones',40.00,'S','10');
INSERT INTO PRODUCTO (nombre, descripcion, precio, categoria, stock) VALUES('Lomo saltado Fino','La rica carne en un lomo saltado',35.00,'S','10');
INSERT INTO PRODUCTO (nombre, descripcion, precio, categoria, stock) VALUES('Bisteck a lo pobre','El clasico y sabroso plato a lo pobre',35.00,'S','10');
INSERT INTO PRODUCTO (nombre, descripcion, precio, categoria, stock) VALUES('Trucha frita','La trucha de agua dulce con su toque frito dorado',25.00,'S','10');
INSERT INTO PRODUCTO (nombre, descripcion, precio, categoria, stock) VALUES('Trucha al ajo','La trucha sasonada con el toque de ajo',25.00,'S','10');
INSERT INTO PRODUCTO (nombre, descripcion, precio, categoria, stock) VALUES('Ensalada mixta','Combinacion de verduras',10.00,'E','10');
INSERT INTO PRODUCTO (nombre, descripcion, precio, categoria, stock) VALUES('Cuy frito','El rico rodeedor del Peru frito con toque lunahuanense',50.00,'S','10');
INSERT INTO PRODUCTO (nombre, descripcion, precio, categoria, stock) VALUES('Picante de cuy','El rico cuy con el toque picante',50.00,'S','10');
INSERT INTO PRODUCTO (nombre, descripcion, precio, categoria, stock) VALUES('Porcion de tequeños','Tequeños con cremas',10.00,'E','10');
INSERT INTO PRODUCTO (nombre, descripcion, precio, categoria, stock) VALUES('Chicharron de cuy','El rico cuy ahora como chicharron',50.00,'S','10');
INSERT INTO PRODUCTO (nombre, descripcion, precio, categoria, stock) VALUES('Causa Rellena','Rica causa de pollo',10.00,'E','10');
INSERT INTO PRODUCTO (nombre, descripcion, precio, categoria, stock) VALUES('Chaufa de Pollo','El clasico y rico chaufa de pollo',25.00,'S','10');
INSERT INTO PRODUCTO (nombre, descripcion, precio, categoria, stock) VALUES('Milanesa','La rica milanesa de casa',25.00,'S','10');
INSERT INTO PRODUCTO (nombre, descripcion, precio, categoria, stock) VALUES('Chicharron de Pollo','EL delicioso chicharron de pollo',25.00,'S','10');
INSERT INTO PRODUCTO (nombre, descripcion, precio, categoria, stock) VALUES('Pollo frito','El delicio pollo frito',25.00,'S','10');
INSERT INTO PRODUCTO (nombre, descripcion, precio, categoria, stock) VALUES('Apanado','El rico pollo apanado',35.00,'S','10');
INSERT INTO PRODUCTO (nombre, descripcion, precio, categoria, stock) VALUES('Trucha a la plancha','La rica trucha mas saludable a la plancha',30.00,'S','10');
INSERT INTO PRODUCTO (nombre, descripcion, precio, categoria, stock) VALUES('Suprema','Un plato misterioso',25.00,'S','10');
COMMIT;


--INSERCION DE REGISTRO TRANSACCIONAL

-- Insertar registros RESERVA
INSERT INTO RESERVA (cliente_id,fecha_destino) VALUES ('1','22-05-2023 02:30:00 PM');
INSERT INTO RESERVA (cliente_id,fecha_destino) VALUES ('4','12-01-2023 12:00:00 PM');
INSERT INTO RESERVA (cliente_id,fecha_destino) VALUES ('6','16-03-2023 02:30:00 PM');
INSERT INTO RESERVA (cliente_id,fecha_destino) VALUES ('7','21-04-2023 03:00:00 PM');
INSERT INTO RESERVA (cliente_id,fecha_destino) VALUES ('2','26-05-2023 02:30:00 PM');
INSERT INTO RESERVA (cliente_id,fecha_destino) VALUES ('3','11-01-2023 11:30:00 AM');
INSERT INTO RESERVA (cliente_id,fecha_destino) VALUES ('6','15-07-2023 01:00:00 PM');
INSERT INTO RESERVA (cliente_id,fecha_destino) VALUES ('9','19-08-2023 02:30:00 PM');
INSERT INTO RESERVA (cliente_id,fecha_destino) VALUES ('2','09-05-2023 12:30:00 PM');
INSERT INTO RESERVA (cliente_id,fecha_destino) VALUES ('1','01-05-2023 01:00:00 PM');
INSERT INTO RESERVA (cliente_id,fecha_destino) VALUES ('3','02-10-2023 02:30:00 PM');
INSERT INTO RESERVA (cliente_id,fecha_destino) VALUES ('4','15-05-2023 01:00:00 PM');
INSERT INTO RESERVA (cliente_id,fecha_destino) VALUES ('9','14-11-2023 12:00:00 PM');
INSERT INTO RESERVA (cliente_id,fecha_destino) VALUES ('8','19-03-2023 11:30:00 AM');
INSERT INTO RESERVA (cliente_id,fecha_destino) VALUES ('4','17-04-2023 11:00:00 AM');
INSERT INTO RESERVA (cliente_id,fecha_destino) VALUES ('8','30-08-2023 02:30:00 PM');
INSERT INTO RESERVA (cliente_id,fecha_destino) VALUES ('11','15-07-2023 04:00:00 PM');
INSERT INTO RESERVA (cliente_id,fecha_destino) VALUES ('17','12-03-2023 03:30:00 PM');
INSERT INTO RESERVA (cliente_id,fecha_destino) VALUES ('14','21-06-2023 02:30:00 PM');
INSERT INTO RESERVA (cliente_id,fecha_destino) VALUES ('12','12-08-2023 12:00:00 PM');
COMMIT;

-- Insertar registros RESERVA_DETALLE
INSERT INTO RESERVA_DETALLE (reserva_id, producto_id, cantidad) VALUES (1,12,1);
INSERT INTO RESERVA_DETALLE (reserva_id, producto_id, cantidad) VALUES (1,1,1);
INSERT INTO RESERVA_DETALLE (reserva_id, producto_id, cantidad) VALUES (2,2,2);
INSERT INTO RESERVA_DETALLE (reserva_id, producto_id, cantidad) VALUES (2,5,1);
INSERT INTO RESERVA_DETALLE (reserva_id, producto_id, cantidad) VALUES (3,1,3);
INSERT INTO RESERVA_DETALLE (reserva_id, producto_id, cantidad) VALUES (3,5,3);
INSERT INTO RESERVA_DETALLE (reserva_id, producto_id, cantidad) VALUES (3,4,1);
INSERT INTO RESERVA_DETALLE (reserva_id, producto_id, cantidad) VALUES (4,7,1);
INSERT INTO RESERVA_DETALLE (reserva_id, producto_id, cantidad) VALUES (4,8,2);
INSERT INTO RESERVA_DETALLE (reserva_id, producto_id, cantidad) VALUES (4,6,3);
INSERT INTO RESERVA_DETALLE (reserva_id, producto_id, cantidad) VALUES (4,9,1);
INSERT INTO RESERVA_DETALLE (reserva_id, producto_id, cantidad) VALUES (5,11,2);
INSERT INTO RESERVA_DETALLE (reserva_id, producto_id, cantidad) VALUES (5,11,1);
INSERT INTO RESERVA_DETALLE (reserva_id, producto_id, cantidad) VALUES (5,11,1);
INSERT INTO RESERVA_DETALLE (reserva_id, producto_id, cantidad) VALUES (5,11,1);
INSERT INTO RESERVA_DETALLE (reserva_id, producto_id, cantidad) VALUES (5,11,3);
INSERT INTO RESERVA_DETALLE (reserva_id, producto_id, cantidad) VALUES (5,11,1);
INSERT INTO RESERVA_DETALLE (reserva_id, producto_id, cantidad) VALUES (6,1,1);
INSERT INTO RESERVA_DETALLE (reserva_id, producto_id, cantidad) VALUES (6,2,1);
INSERT INTO RESERVA_DETALLE (reserva_id, producto_id, cantidad) VALUES (6,4,2);
INSERT INTO RESERVA_DETALLE (reserva_id, producto_id, cantidad) VALUES (6,6,1);
INSERT INTO RESERVA_DETALLE (reserva_id, producto_id, cantidad) VALUES (6,7,1);
INSERT INTO RESERVA_DETALLE (reserva_id, producto_id, cantidad) VALUES (6,3,1);
INSERT INTO RESERVA_DETALLE (reserva_id, producto_id, cantidad) VALUES (6,13,1);
INSERT INTO RESERVA_DETALLE (reserva_id, producto_id, cantidad) VALUES (6,8,2);
INSERT INTO RESERVA_DETALLE (reserva_id, producto_id, cantidad) VALUES (6,12,1);
INSERT INTO RESERVA_DETALLE (reserva_id, producto_id, cantidad) VALUES (6,14,1);
INSERT INTO RESERVA_DETALLE (reserva_id, producto_id, cantidad) VALUES (7,14,9);
INSERT INTO RESERVA_DETALLE (reserva_id, producto_id, cantidad) VALUES (8,18,7);
INSERT INTO RESERVA_DETALLE (reserva_id, producto_id, cantidad) VALUES (9,9,6);
INSERT INTO RESERVA_DETALLE (reserva_id, producto_id, cantidad) VALUES (10,11,11);
INSERT INTO RESERVA_DETALLE (reserva_id, producto_id, cantidad) VALUES (11,7,3);
INSERT INTO RESERVA_DETALLE (reserva_id, producto_id, cantidad) VALUES (12,1,4);
INSERT INTO RESERVA_DETALLE (reserva_id, producto_id, cantidad) VALUES (12,4,4);
INSERT INTO RESERVA_DETALLE (reserva_id, producto_id, cantidad) VALUES (12,6,1);
INSERT INTO RESERVA_DETALLE (reserva_id, producto_id, cantidad) VALUES (13,3,7);
INSERT INTO RESERVA_DETALLE (reserva_id, producto_id, cantidad) VALUES (14,1,6);
INSERT INTO RESERVA_DETALLE (reserva_id, producto_id, cantidad) VALUES (15,10,8);
INSERT INTO RESERVA_DETALLE (reserva_id, producto_id, cantidad) VALUES (16,15,7);
INSERT INTO RESERVA_DETALLE (reserva_id, producto_id, cantidad) VALUES (17,12,6);
INSERT INTO RESERVA_DETALLE (reserva_id, producto_id, cantidad) VALUES (18,17,5);
INSERT INTO RESERVA_DETALLE (reserva_id, producto_id, cantidad) VALUES (19,19,4);
INSERT INTO RESERVA_DETALLE (reserva_id, producto_id, cantidad) VALUES (20,2,10);
COMMIT;

-- Insertar registros VENTA
INSERT INTO VENTA (cliente_id, trabajador_id) VALUES (1,1);
INSERT INTO VENTA (cliente_id, trabajador_id) VALUES (11,11);
INSERT INTO VENTA (cliente_id, trabajador_id) VALUES (2,2);
INSERT INTO VENTA (cliente_id, trabajador_id) VALUES (3,3);
INSERT INTO VENTA (cliente_id, trabajador_id) VALUES (19,19);
INSERT INTO VENTA (cliente_id, trabajador_id) VALUES (4,4);
INSERT INTO VENTA (cliente_id, trabajador_id) VALUES (5,5);
INSERT INTO VENTA (cliente_id, trabajador_id) VALUES (14,14);
INSERT INTO VENTA (cliente_id, trabajador_id) VALUES (6,6);
INSERT INTO VENTA (cliente_id, trabajador_id) VALUES (7,7);
INSERT INTO VENTA (cliente_id, trabajador_id) VALUES (21,21);
INSERT INTO VENTA (cliente_id, trabajador_id) VALUES (8,8);
INSERT INTO VENTA (cliente_id, trabajador_id) VALUES (9,9);
INSERT INTO VENTA (cliente_id, trabajador_id) VALUES (17,17);
INSERT INTO VENTA (cliente_id, trabajador_id) VALUES (10,10);
INSERT INTO VENTA (cliente_id, trabajador_id) VALUES (12,12);
INSERT INTO VENTA (cliente_id, trabajador_id) VALUES (13,13);
INSERT INTO VENTA (cliente_id, trabajador_id) VALUES (15,15);
INSERT INTO VENTA (cliente_id, trabajador_id) VALUES (16,16);
INSERT INTO VENTA (cliente_id, trabajador_id) VALUES (18,18);
INSERT INTO VENTA (cliente_id, trabajador_id) VALUES (20,20);
INSERT INTO VENTA (cliente_id, trabajador_id) VALUES (22,22);
COMMIT;

-- Insertar registros VENTA_DETALLE
INSERT INTO VENTA_DETALLE (producto_id, cantidad, venta_id) VALUES (1,3,1);
INSERT INTO VENTA_DETALLE (producto_id, cantidad, venta_id) VALUES (2,1,2);
INSERT INTO VENTA_DETALLE (producto_id, cantidad, venta_id) VALUES (4,3,2);
INSERT INTO VENTA_DETALLE (producto_id, cantidad, venta_id) VALUES (3,3,3);
INSERT INTO VENTA_DETALLE (producto_id, cantidad, venta_id) VALUES (4,2,4);
INSERT INTO VENTA_DETALLE (producto_id, cantidad, venta_id) VALUES (5,1,5);
INSERT INTO VENTA_DETALLE (producto_id, cantidad, venta_id) VALUES (6,2,6);
INSERT INTO VENTA_DETALLE (producto_id, cantidad, venta_id) VALUES (7,4,7);
INSERT INTO VENTA_DETALLE (producto_id, cantidad, venta_id) VALUES (8,5,8);
INSERT INTO VENTA_DETALLE (producto_id, cantidad, venta_id) VALUES (9,6,9);
INSERT INTO VENTA_DETALLE (producto_id, cantidad, venta_id) VALUES (10,2,10);
INSERT INTO VENTA_DETALLE (producto_id, cantidad, venta_id) VALUES (11,2,11);
INSERT INTO VENTA_DETALLE (producto_id, cantidad, venta_id) VALUES (12,1,12);
INSERT INTO VENTA_DETALLE (producto_id, cantidad, venta_id) VALUES (13,3,13);
INSERT INTO VENTA_DETALLE (producto_id, cantidad, venta_id) VALUES (14,4,14);
INSERT INTO VENTA_DETALLE (producto_id, cantidad, venta_id) VALUES (15,2,15);
INSERT INTO VENTA_DETALLE (producto_id, cantidad, venta_id) VALUES (16,3,16);
INSERT INTO VENTA_DETALLE (producto_id, cantidad, venta_id) VALUES (17,1,17);
INSERT INTO VENTA_DETALLE (producto_id, cantidad, venta_id) VALUES (18,4,18);
INSERT INTO VENTA_DETALLE (producto_id, cantidad, venta_id) VALUES (19,2,19);
INSERT INTO VENTA_DETALLE (producto_id, cantidad, venta_id) VALUES (20,2,20);
COMMIT;



--/  SELECT * FROM UBIGEO;

--/  SELECT * FROM CLIENTE;

--/  SELECT * FROM TRABAJADOR;

--/  SELECT * FROM PRODUCTO;

--/  SELECT * FROM VENTA;

--/  SELECT * FROM VENTA_DETALLE;

--/  SELECT * FROM RESERVA;

--/  SELECT * FROM RESERVA_DETALLE;


-- VISTAS

-- Vista de tabla: CLIENTE
CREATE VIEW vCliente AS
SELECT
    LPAD(id, 4, '0') as "Id",
    dni as "Dni",
    apellido_paterno || ' ' || apellido_materno || ', ' || nombres as "Cliente",
    celular as "Celular",
    email as "Email",
    domicilio as "Domicilio",
    case
        when ubigeo_codigo is not null then ubigeo.distrito
        else 'Desconocido'
    end as "Distrito",
    case
        when activo = 'A' then 'Activo'
        when activo = 'I' then 'Inactivo'
        else 'Desconocido'
    end as "Estado"
FROM CLIENTE
INNER JOIN UBIGEO ON UBIGEO.codigo = CLIENTE.ubigeo_codigo;
COMMIT;

-- Vista de tabla: TRABAJADOR
CREATE VIEW vTrabajador AS
SELECT
    LPAD(id, 4, '0') as "Id",
    dni as "Dni",
    apellido_paterno || ' ' || apellido_materno || ', ' || nombres as "Cliente",
    celular as "Celular",
    case
        when activo = 'A' then 'Activo'
        when activo = 'I' then 'Inactivo'
        else 'Desconocido'
    end as "Estado"
FROM TRABAJADOR;
COMMIT;

-- Vista de tabla: PRODUCTO
CREATE VIEW vProducto AS
SELECT
    LPAD(id, 3, '0') as "Id",
    nombre as "Producto",
    descripcion as "Descripcion",
    'S/' || TO_CHAR(precio, 'FM999990.00') as "Precio",
    case
        when categoria = 'E' then 'Entradas'
        when categoria = 'S' then 'Segundos'
        when categoria = 'B' then 'Bebidas'
        else 'Desconocido'
        end as "Categoria",
    stock as "Stock",
    case
        when activo = 'A' then 'Activo'
        when activo = 'I' then 'Inactivo'
        else 'Desconocido'
    end as "Estado"
FROM PRODUCTO;
COMMIT;

-- Vista de tabla: VENTA
CREATE VIEW vVenta AS
SELECT
   LPAD(venta.id, 5, '0') as "Id",
   fecha as "Fecha",
   CASE
        WHEN cliente_id IS NOT NULL THEN cliente.apellido_paterno || ' ' || cliente.apellido_materno || ', ' || cliente.nombres
        ELSE 'Desconocido'
    END as "Cliente",
   CASE
        WHEN trabajador_id IS NOT NULL THEN trabajador.apellido_paterno || ' ' || trabajador.apellido_materno || ', ' || trabajador.nombres
        ELSE 'Desconocido'
    END as "Trabajador",
   'S/' || TO_CHAR(SUM(producto.precio * venta_detalle.cantidad), 'FM999990.00') as "Total"

FROM VENTA
INNER JOIN CLIENTE ON venta.cliente_id = cliente.id
INNER JOIN TRABAJADOR ON venta.trabajador_id = trabajador.id
INNER JOIN VENTA_DETALLE ON venta.id = venta_detalle.venta_id
INNER JOIN PRODUCTO ON venta_detalle.producto_id = producto.id
GROUP BY venta.id, fecha, cliente_id, cliente.apellido_paterno, cliente.apellido_materno, cliente.nombres, trabajador_id, trabajador.apellido_paterno, trabajador.apellido_materno, trabajador.nombres;
COMMIT;

-- Vista de tabla: RESERVA
CREATE VIEW vReserva AS
SELECT
   LPAD(reserva.id, 5, '0') as "Id",
   CASE
        WHEN cliente_id IS NOT NULL THEN cliente.apellido_paterno || ' ' || cliente.apellido_materno || ', ' || cliente.nombres
        ELSE 'Desconocido'
    END as "Cliente",
   CASE
        WHEN trabajador_id IS NOT NULL THEN trabajador.apellido_paterno || ' ' || trabajador.apellido_materno || ', ' || trabajador.nombres
        ELSE 'Desconocido'
    END as "Trabajador",
    TO_CHAR(fecha_destino, 'DD-MM HH24:MI:SS') as "Fecha reservada",
    TO_CHAR(fecha_registro, 'DD-MM HH24:MI:SS') as "Registro reserva",
   'S/' || TO_CHAR(SUM(producto.precio * reserva_detalle.cantidad), 'FM999990.00') as "Total"
FROM RESERVA
INNER JOIN CLIENTE ON reserva.cliente_id = cliente.id
INNER JOIN TRABAJADOR ON reserva.trabajador_id = trabajador.id
INNER JOIN RESERVA_DETALLE ON reserva.id = reserva_detalle.reserva_id
INNER JOIN PRODUCTO ON reserva_detalle.producto_id = producto.id
GROUP BY reserva.id, fecha_destino, fecha_registro, cliente_id, trabajador_id, cliente.apellido_paterno, cliente.apellido_materno, cliente.nombres, trabajador.apellido_paterno, trabajador.apellido_materno, trabajador.nombres;
COMMIT;


--/  SELECT * FROM vCliente;

--/  SELECT * FROM vTrabajador;

--/  SELECT * FROM vProducto;

--/  SELECT * FROM vVenta;

--/  SELECT * FROM vReserva;