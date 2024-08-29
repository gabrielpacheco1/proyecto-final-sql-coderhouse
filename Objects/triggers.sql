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