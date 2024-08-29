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