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