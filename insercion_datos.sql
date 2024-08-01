-- Insertar registros en la tabla alcance
INSERT INTO alcance (descripcion_alcance) 
VALUES 
('LOCAL'),
('REGIONAL'),
('NACIONAL CORTA DIST'),
('NACIONAL LARGA DIST');

-- Insertar registros en la tabla cadete
INSERT INTO cadete (dni_cadete, nombre_cadete, apellido_cadete, telefono_cliente) VALUES
('20345678', 'Juan', 'Pérez', '011-1234-5678'),
('21345678', 'María', 'Gómez', '011-2345-6789'),
('22345678', 'Carlos', 'Fernández', '011-3456-7890'),
('23345678', 'Ana', 'Martínez', '011-4567-8901'),
('24345678', 'Luis', 'López', '011-5678-9012'),
('25345678', 'Marta', 'González', '011-6789-0123'),
('26345678', 'José', 'Rodríguez', '011-7890-1234'),
('27345678', 'Laura', 'Sánchez', '011-8901-2345'),
('28345678', 'Pedro', 'García', '011-9012-3456'),
('29345678', 'Sofía', 'Ramírez', '011-0123-4567');

-- Insertar registros en la tabla cliente
INSERT INTO cliente (dni_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente, direccion_cliente) VALUES
('30345678', 'Lucas', 'Pérez', 'lucas.perez@example.com', '011-1234-5678', 'Calle Falsa 123'),
('31345678', 'Martina', 'Gómez', 'martina.gomez@example.com', '011-2345-6789', 'Avenida Siempre Viva 456'),
('32345678', 'Javier', 'Fernández', 'javier.fernandez@example.com', '011-3456-7890', 'Boulevard del Sol 789'),
('33345678', 'Florencia', 'Martínez', 'florencia.martinez@example.com', '011-4567-8901', 'Pasaje de las Flores 101'),
('34345678', 'Diego', 'López', 'diego.lopez@example.com', '011-5678-9012', 'Calle del Río 202'),
('35345678', 'Camila', 'González', 'camila.gonzalez@example.com', '011-6789-0123', 'Avenida Libertad 303'),
('36345678', 'Rodrigo', 'Rodríguez', 'rodrigo.rodriguez@example.com', '011-7890-1234', 'Calle de la Paz 404'),
('37345678', 'Juliana', 'Sánchez', 'juliana.sanchez@example.com', '011-8901-2345', 'Pasaje del Bosque 505'),
('38345678', 'Emiliano', 'García', 'emiliano.garcia@example.com', '011-9012-3456', 'Boulevard de los Sueños 606'),
('39345678', 'Sabrina', 'Ramírez', 'sabrina.ramirez@example.com', '011-0123-4567', 'Calle de los Pinos 707'),
('40345678', 'Mateo', 'Molina', 'mateo.molina@example.com', '011-1234-6789', 'Avenida de los Árboles 808'),
('41345678', 'Valentina', 'Castro', 'valentina.castro@example.com', '011-2345-7890', 'Calle del Lago 909'),
('42345678', 'Tomás', 'Ríos', 'tomas.rios@example.com', '011-3456-8901', 'Pasaje del Arroyo 1010'),
('43345678', 'Milagros', 'Vega', 'milagros.vega@example.com', '011-4567-9012', 'Avenida del Parque 1111'),
('44345678', 'Santiago', 'Herrera', 'santiago.herrera@example.com', '011-5678-0123', 'Calle del Campo 1212');

-- Insertar registros en la tabla destinatario
INSERT INTO destinatario (dni_destinatario, nombre_destinatario, apellido_destinatario, telefono_destinatario, direccion_destinatario) VALUES
('35123456', 'Luis', 'Pérez', '011-1234-5678', 'Calle Falsa 123'),
('35123457', 'Ana', 'Gómez', '011-2345-6789', 'Avenida Siempre Viva 234'),
('35123458', 'Carlos', 'Fernández', '011-3456-7890', 'Boulevard del Sol 345'),
('35123459', 'María', 'Martínez', '011-4567-8901', 'Pasaje de las Flores 456'),
('35123460', 'Jorge', 'López', '011-5678-9012', 'Calle del Río 567'),
('35123461', 'Laura', 'González', '011-6789-0123', 'Avenida Libertad 678'),
('35123462', 'Ricardo', 'Rodríguez', '011-7890-1234', 'Calle de la Paz 789'),
('35123463', 'Marta', 'Sánchez', '011-8901-2345', 'Pasaje del Bosque 890'),
('35123464', 'Emilio', 'García', '011-9012-3456', 'Boulevard de los Sueños 901'),
('35123465', 'Claudia', 'Ramírez', '011-0123-4567', 'Calle de los Pinos 012'),
('35123466', 'Miguel', 'Molina', '011-1234-6789', 'Avenida de los Árboles 123'),
('35123467', 'Rosa', 'Castro', '011-2345-7890', 'Calle del Lago 234'),
('35123468', 'Fernando', 'Ríos', '011-3456-8901', 'Pasaje del Arroyo 345'),
('35123469', 'Patricia', 'Vega', '011-4567-9012', 'Avenida del Parque 456'),
('35123470', 'Santiago', 'Herrera', '011-5678-0123', 'Calle del Campo 567');

-- Insertar registros en la tabla forma_pago
INSERT INTO forma_pago (descripcion_forma_pago) VALUES
('Efectivo'),
('Tarjeta de Crédito'),
('Tarjeta de Débito'),
('Transferencia Bancaria');

-- Insertar registros en la tabla sucursal
INSERT INTO sucursal (nombre_sucursal, direccion_sucursal) VALUES
('Sucursal Buenos Aires Centro', 'Avenida Corrientes 1234, Buenos Aires'),
('Sucursal Córdoba Centro', 'Calle 27 de Abril 567, Córdoba'),
('Sucursal Rosario', 'Avenida Pellegrini 891, Rosario'),
('Sucursal Mendoza', 'Calle San Martín 456, Mendoza'),
('Sucursal Tucumán', 'Avenida Mate de Luna 789, San Miguel de Tucumán'),
('Sucursal Salta', 'Calle Buenos Aires 321, Salta'),
('Sucursal La Plata', 'Avenida 7 456, La Plata'),
('Sucursal San Juan', 'Calle Rivadavia 654, San Juan'),
('Sucursal Neuquén', 'Avenida Argentina 987, Neuquén'),
('Sucursal Bahía Blanca', 'Calle Donado 123, Bahía Blanca');

-- Insertar registros en la tabla tarifa
INSERT INTO tarifa (descripcion_tarifa, peso_max, dimensiones, costo) VALUES
('CHICO', 1, '30x30x30 cm', 100.00),
('MEDIANO', 5, '50x50x50 cm', 250.00),
('GRANDE', 10, '70x70x70 cm', 400.00);

-- Insertar registros en la tabla pedido
INSERT INTO pedido (estado, cantidad_paquetes, dni_cliente, id_destinatario, id_sucursal_origen, id_sucursal_destino, id_alcance) VALUES
('EN SUCURSAL ORIGEN', 1, '30345678', 1, 1, 2, 2),
('EN PREPARACIÓN', 2, '31345678', 2, 2, 2, 1),
('EN TRANSPORTE', 3, '32345678', 3, 3, 4, 3),
('EN PREPARACIÓN', 2, '39345678', 1, 2, 1, 2),
('EN SUCURSAL ORIGEN', 1, '31345678', 10, 2, 3, 2),
('EN TRANSPORTE', 3, '35345678', 11, 4, 3, 3),
('EN DISTRIBUCION', 4, '43345678', 4, 4, 5, 3),
('ENTREGADO', 5, '41345678', 5, 5, 6, 2),
('EN PREPARACIÓN', 2, '39345678', 14, 1, 2, 2),
('EN SUCURSAL ORIGEN', 1, '31345678', 12, 2, 9, 3),
('EN TRANSPORTE', 3, '35345678', 8, 10, 3, 2),
('ENTREGADO', 5, '41345678', 11, 6, 5, 2),
('EN SUCURSAL ORIGEN', 1, '31345678', 7, 2, 6, 3),
('ENTREGADO', 5, '41345678', 12, 9, 8, 2),
('EN TRANSPORTE', 3, '35345678', 1, 1, 1, 1),
('EN PREPARACIÓN', 2, '39345678', 6, 2, 1, 2),
('EN DISTRIBUCION', 4, '43345678', 9, 4, 8, 2),
('ENTREGADO', 5, '43345678', 15, 6, 9, 3);

-- Insertar registros en la tabla facturacion
INSERT INTO facturacion (id_pedido, id_forma_pago, fecha_facturacion, monto_total) VALUES
(1, 1, '2023-01-01 10:00:00', 500.00),
(2, 2, '2023-02-01 11:00:00', 1500.00),
(3, 3, '2023-03-01 12:00:00', 1200.00),
(4, 1, '2023-04-01 09:00:00', 800.00),
(5, 2, '2023-05-01 10:30:00', 1000.00),
(6, 3, '2023-06-01 14:00:00', 1600.00),
(7, 1, '2023-07-01 13:00:00', 2000.00),
(8, 2, '2023-08-01 15:00:00', 2500.00),
(9, 3, '2023-09-01 16:00:00', 1100.00),
(10, 1, '2023-10-01 17:00:00', 900.00),
(11, 2, '2023-11-01 18:00:00', 1300.00),
(12, 3, '2023-12-01 19:00:00', 1400.00),
(13, 1, '2023-12-15 20:00:00', 1500.00),
(14, 2, '2024-01-01 21:00:00', 1800.00),
(15, 3, '2024-02-01 22:00:00', 1700.00),
(16, 1, '2024-03-01 23:00:00', 1900.00),
(17, 2, '2024-04-01 08:00:00', 2100.00),
(18, 3, '2024-05-01 07:00:00', 2200.00);

-- Insertar registros en la tabla despacho
INSERT INTO despacho (id_pedido, id_sucursal, fecha_despacho, fecha_recepcion, encargado_transporte) VALUES
(3, 3, '2023-03-02 10:00:00', NULL, 'Juan Perez'),
(6, 4, '2023-06-02 12:00:00', NULL, 'Carlos Sanchez'),
(7, 4, '2023-07-02 11:00:00', '2023-07-04 09:00:00', 'Luis Martinez'),
(8, 5, '2023-08-02 15:00:00', '2023-08-05 16:00:00', 'Jorge Ramirez'),
(11, 10, '2023-11-02 10:00:00', NULL, 'Pedro Fernandez'),
(12, 6, '2023-12-02 12:00:00', '2023-12-04 11:00:00', 'Miguel Lopez'),
(13, 2, '2023-12-16 10:00:00', NULL, 'Roberto Gomez'),
(14, 9, '2024-01-02 11:00:00', '2024-01-04 12:00:00', 'Mario Diaz'),
(15, 1, '2024-02-02 13:00:00', NULL, 'Fernando Castro'),
(17, 4, '2024-04-02 15:00:00', '2024-04-05 14:00:00', 'Sergio Torres'),
(18, 6, '2024-05-02 16:00:00', '2024-05-04 16:00:00', 'Ramon Ruiz');

-- Insertar registros en la tabla distribucion
INSERT INTO distribucion (id_pedido, dni_cadete, fecha_entrega) VALUES
(7, '20345678', NULL),
(8, '27345678', '2023-08-06 18:00:00'),
(12, '22345678', '2023-12-05 14:00:00'),
(14, '28345678', '2024-01-05 14:00:00'),
(17, '26345678', NULL),
(18, '24345678', '2024-05-05 17:00:00');