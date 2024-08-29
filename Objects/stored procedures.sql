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