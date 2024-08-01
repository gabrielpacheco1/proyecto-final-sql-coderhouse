-- ****************************************************
-- ********************* VISTAS ***********************
-- ****************************************************

DROP VIEW IF EXISTS vista_detalle_pedido;
CREATE VIEW vista_detalle_pedido AS
SELECT 
    p.id_pedido,
    p.estado AS estado_pedido,
    d.fecha_despacho,
    d.fecha_recepcion,
    dist.fecha_entrega,
    c.dni_cadete,
    c.nombre_cadete,
    c.apellido_cadete
FROM 
    pedido p
LEFT JOIN 
    despacho d ON p.id_pedido = d.id_pedido
LEFT JOIN 
    distribucion dist ON p.id_pedido = dist.id_pedido
LEFT JOIN 
    cadete c ON dist.dni_cadete = c.dni_cadete;
    
-- -------------------------------------------------
DROP VIEW IF EXISTS vista_facturacion_tipo_pago;

CREATE VIEW vista_facturacion_tipo_pago AS
SELECT 
    fp.descripcion_forma_pago AS tipo_facturacion,
    COUNT(f.id_factura) AS cantidad_pedidos,
    SUM(f.monto_total) AS monto_total
FROM 
    facturacion f
JOIN 
    forma_pago fp ON f.id_forma_pago = fp.id_forma_pago
GROUP BY 
    fp.descripcion_forma_pago;

    
-- ----------------------------------------------
DROP VIEW IF EXISTS vista_pedidos_por_sucursal;

CREATE VIEW vista_pedidos_por_sucursal AS
SELECT 
    s.nombre_sucursal AS "Sucursal despacho",
    COUNT(p.id_pedido) AS cantidad_pedidos
FROM 
    pedido p
JOIN 
    sucursal s ON p.id_sucursal_origen = s.id_sucursal
GROUP BY 
    s.id_sucursal, s.nombre_sucursal;
    

-- ----------------------------------------------
DROP VIEW IF EXISTS vista_pedidos_destinados_a_sucursal;
CREATE VIEW vista_pedidos_destinados_a_sucursal AS
SELECT 
    s.id_sucursal,
    s.nombre_sucursal AS "Sucursal destino",
    COUNT(p.id_pedido) AS cantidad_pedidos
FROM 
    pedido p
JOIN 
    sucursal s ON p.id_sucursal_destino = s.id_sucursal
GROUP BY 
    s.id_sucursal, s.nombre_sucursal;

-- ****************************************************
-- ******************** FUNCIONES *********************
-- ****************************************************

-- Función que calcula la cantidad de pedidos realizados por un cliente
DROP FUNCTION IF EXISTS TotalPedidosPorCliente;
DELIMITER //

CREATE FUNCTION TotalPedidosPorCliente(dni_cliente_in VARCHAR(11))
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total_pedidos INT;
    SELECT COUNT(*)
    INTO total_pedidos
    FROM pedido
    WHERE pedido.dni_cliente = dni_cliente_in;
    RETURN total_pedidos;
END //

DELIMITER ;

-- ************************************************ --
-- Función que calcula el monto facturado en un rango de fechas

DELIMITER //

CREATE FUNCTION TotalFacturado(start_date DATE, end_date DATE)
RETURNS DOUBLE
DETERMINISTIC
BEGIN
    DECLARE total_facturado DOUBLE;
    SELECT SUM(monto_total)
    INTO total_facturado
    FROM facturacion
    WHERE fecha_facturacion BETWEEN start_date AND end_date;
    RETURN total_facturado;
END //

DELIMITER ;

-- ****************************************************
-- *********** PROCEDIMIENTOS ALMACENADOS *************
-- ****************************************************

DROP PROCEDURE IF EXISTS obtenerDetallePedido;

DELIMITER //

CREATE PROCEDURE obtenerDetallePedido (
    IN p_id_pedido INT
)
BEGIN
    SELECT 
        pedido.id_pedido,
        pedido.estado,
        cliente.nombre_cliente,
        cliente.apellido_cliente,
        cliente.email_cliente,
        cliente.telefono_cliente,
        destinatario.nombre_destinatario,
        destinatario.apellido_destinatario,
        destinatario.telefono_destinatario,
        destinatario.direccion_destinatario,
        s_o.nombre_sucursal AS sucursal_origen,
        despacho.fecha_despacho,
		s_d.nombre_sucursal AS sucursal_destino,
        despacho.fecha_recepcion
    FROM 
        pedido
    LEFT JOIN cliente ON pedido.dni_cliente = cliente.dni_cliente
    LEFT JOIN destinatario ON pedido.id_destinatario = destinatario.id_destinatario
    LEFT JOIN sucursal s_o ON pedido.id_sucursal_origen = s_o.id_sucursal
    LEFT JOIN sucursal s_d ON pedido.id_sucursal_destino = s_d.id_sucursal
    LEFT JOIN despacho ON pedido.id_pedido = despacho.id_pedido
    WHERE 
        pedido.id_pedido = p_id_pedido;
END //

DELIMITER ;
-- --------------------------------------------
DROP PROCEDURE IF EXISTS actualizarEstadoPedido;

DELIMITER //

CREATE PROCEDURE actualizarEstadoPedido (
    IN p_id_pedido INT,
    IN p_nuevo_estado ENUM('EN SUCURSAL ORIGEN', 'EN PREPARACIÓN', 'EN TRANSPORTE', 'EN SUCURSAL DESTINO', 'EN DISTRIBUCION', 'EN SUCURSAL DESTINO PARA SER RETIRADO', 'ENTREGADO')
)
BEGIN
    -- Actualizar el estado del pedido
    UPDATE pedido
    SET estado = p_nuevo_estado
    WHERE id_pedido = p_id_pedido;

    -- Registrar la fecha de actualización
    INSERT INTO actualizacion_estado_pedido (id_pedido, estado, fecha_actualizacion)
    VALUES (p_id_pedido, p_nuevo_estado, NOW());
END //

DELIMITER ;

-- Creacion de la tabla donde se guardará el registro de los cambios de estado 
CREATE TABLE actualizacion_estado_pedido (
    id_actualizacion INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT NOT NULL,
    estado ENUM('EN SUCURSAL ORIGEN', 'EN PREPARACIÓN', 'EN TRANSPORTE', 'EN SUCURSAL DESTINO', 'EN DISTRIBUCION', 'EN SUCURSAL DESTINO PARA SER RETIRADO', 'ENTREGADO') NOT NULL,
    fecha_actualizacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido)
);

-- ****************************************************
-- ******************** TRIGGERS **********************
-- ****************************************************

DELIMITER //

CREATE TRIGGER actualizar_estado_pedido
AFTER INSERT ON distribucion
FOR EACH ROW
BEGIN
    IF NEW.fecha_entrega IS NOT NULL THEN
        UPDATE pedido
        SET estado = 'ENTREGADO'
        WHERE id_pedido = NEW.id_pedido;
    END IF;
END //

DELIMITER ;

-- ****************************************************
DELIMITER //

CREATE TRIGGER registrar_fecha_creacion
AFTER INSERT ON pedido
FOR EACH ROW
BEGIN
    INSERT INTO registro_creacion_pedido (id_pedido, fecha_creacion)
    VALUES (NEW.id_pedido, CURRENT_TIMESTAMP);
END //

DELIMITER ;


-- Creacion de la tabla en la que se guarda el registro de creación
CREATE TABLE registro_creacion_pedido (
    id_registro INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT NOT NULL,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido)
);

