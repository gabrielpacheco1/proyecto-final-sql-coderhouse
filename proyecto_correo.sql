CREATE DATABASE 
	IF NOT EXISTS correo_db;
    
USE correo_db;

-- TABLAS

CREATE TABLE alcance(
	id_alcance INT NOT NULL AUTO_INCREMENT PRIMARY KEY
, 	descripcion_alcance ENUM('LOCAL', 'REGIONAL', 'NACIONAL CORTA DIST', 'NACIONAL LARGA DIST') NOT NULL
);

CREATE TABLE cadete(
	dni_cadete VARCHAR(11) NOT NULL PRIMARY KEY
, 	nombre_cadete VARCHAR(30) NOT NULL
,	apellido_cadete VARCHAR(30) NOT NULL
,   telefono_cliente VARCHAR(25)
);

CREATE TABLE cliente(
	dni_cliente VARCHAR(11) NOT NULL PRIMARY KEY
, 	nombre_cliente VARCHAR(30) NOT NULL
,	apellido_cliente VARCHAR(30) NOT NULL
,	email_cliente VARCHAR(60) UNIQUE
,   telefono_cliente VARCHAR(25)
,	direccion_cliente VARCHAR(45) 
);

CREATE TABLE despacho(
	id_despacho INT NOT NULL AUTO_INCREMENT PRIMARY KEY
, 	id_pedido INT NOT NULL
,	id_sucursal INT NOT NULL
,	fecha_despacho TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
,   fecha_recepcion TIMESTAMP NULL
,	encargado_transporte VARCHAR(40)
) COMMENT "Registra los datos del despacho del pedido";

CREATE TABLE destinatario(
	id_destinatario INT NOT NULL AUTO_INCREMENT PRIMARY KEY
,	dni_destinatario VARCHAR(11) NOT NULL
, 	nombre_destinatario VARCHAR(30) NOT NULL
,	apellido_destinatario VARCHAR(30) NOT NULL
,   telefono_destinatario VARCHAR(25)
,	direccion_destinatario VARCHAR(45) NOT NULL
);

CREATE TABLE distribucion(
	id_distribucion INT NOT NULL AUTO_INCREMENT PRIMARY KEY
, 	id_pedido INT NOT NULL
,	dni_cadete VARCHAR(11)
,	fecha_entrega TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE facturacion(
	id_factura INT NOT NULL AUTO_INCREMENT PRIMARY KEY
,	id_pedido INT NOT NULL
,	id_forma_pago INT NOT NULL
,	fecha_facturacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
, 	monto_total DOUBLE
);

CREATE TABLE forma_pago(
	id_forma_pago INT NOT NULL AUTO_INCREMENT PRIMARY KEY
, 	descripcion_forma_pago VARCHAR(30) NOT NULL
);

CREATE TABLE paquete(
	id_paquete INT NOT NULL AUTO_INCREMENT PRIMARY KEY
, 	id_pedido INT NOT NULL
,	id_tarifa INT NOT NULL
);

CREATE TABLE pedido(
	id_pedido INT NOT NULL AUTO_INCREMENT PRIMARY KEY
, 	estado ENUM ('EN SUCURSAL ORIGEN', 'EN PREPARACIÓN', 'EN TRANSPORTE', 'EN SUCURSAL DESTINO'
		, 'EN DISTRIBUCION', 'EN SUCURSAL DESTINO PARA SER RETIRADO', 'ENTREGADO') NOT NULL DEFAULT 'EN PREPARACIÓN'
,	cantidad_paquetes INT NOT NULL
,	dni_cliente VARCHAR(11) NOT NULL
,   id_destinatario INT NOT NULL
,	id_sucursal_origen INT NOT NULL
,	id_sucursal_destino INT NOT NULL
, 	id_alcance INT NOT NULL
) COMMENT "Registra los datos del despacho del pedido";

CREATE TABLE sucursal(
	id_sucursal INT NOT NULL AUTO_INCREMENT PRIMARY KEY
, 	nombre_sucursal VARCHAR(30) NOT NULL
,	direccion_sucursal VARCHAR(60)
);

CREATE TABLE tarifa(
	id_tarifa INT NOT NULL AUTO_INCREMENT PRIMARY KEY
, 	descripcion_tarifa ENUM('CHICO', 'MEDIANO', 'GRANDE') NOT NULL
,	peso_max INT NOT NULL
,	dimensiones VARCHAR(30) NOT NULL
,	costo FLOAT
) COMMENT "Registra el costo del envio del paquete dependiendo de sus dimensiones y peso";

-- CONSTRAINTS

ALTER TABLE despacho
ADD CONSTRAINT fk_despacho_pedido
FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido);

ALTER TABLE distribucion
ADD CONSTRAINT fk_distribucion_pedido
FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido);

ALTER TABLE distribucion
ADD CONSTRAINT fk_distribucion_cadete
FOREIGN KEY (dni_cadete) REFERENCES cadete(dni_cadete);

ALTER TABLE facturacion
ADD CONSTRAINT fk_facturacion_pedido
FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido);

ALTER TABLE facturacion
ADD CONSTRAINT fk_facturacion_forma_pago
FOREIGN KEY (id_forma_pago) REFERENCES forma_pago(id_forma_pago);

ALTER TABLE paquete
ADD CONSTRAINT fk_paquete_pedido
FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido);

ALTER TABLE paquete
ADD CONSTRAINT fk_paquete_tarifa
FOREIGN KEY (id_tarifa) REFERENCES tarifa(id_tarifa);


ALTER TABLE pedido
ADD CONSTRAINT fk_pedido_cliente
FOREIGN KEY (dni_cliente) REFERENCES cliente(dni_cliente);

ALTER TABLE pedido
ADD CONSTRAINT fk_pedido_destinatario
FOREIGN KEY (id_destinatario) REFERENCES destinatario(id_destinatario);

ALTER TABLE pedido
ADD CONSTRAINT fk_pedido_sucursal_origen
FOREIGN KEY (id_sucursal_origen) REFERENCES sucursal(id_sucursal);

ALTER TABLE pedido
ADD CONSTRAINT fk_pedido_sucursal_destino
FOREIGN KEY (id_sucursal_destino) REFERENCES sucursal(id_sucursal);

ALTER TABLE pedido
ADD CONSTRAINT fk_pedido_alcance
FOREIGN KEY (id_alcance) REFERENCES alcance(id_alcance);



