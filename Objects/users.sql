USE correo_db;

-- Usuario 'admin'
-- Este usuario tiene todos los privilegios y puede realizar cualquier operación en la base de datos.

CREATE USER 'admin'@'localhost' IDENTIFIED BY 'password_admin';
GRANT ALL PRIVILEGES ON correo_db.* TO 'admin'@'localhost' WITH GRANT OPTION;


-- Usuario 'cadete'
-- Este usuario tiene permisos limitados para gestionar los datos relacionados con la entrega de pedidos.

CREATE USER 'cadete_user'@'localhost' IDENTIFIED BY 'CadetePassword123';
GRANT SELECT, UPDATE ON correo_db.distribucion TO 'cadete_user'@'localhost';
GRANT SELECT ON correo_db.pedido TO 'cadete_user'@'localhost';
GRANT SELECT ON correo_db.vista_detalle_pedido TO 'cadete_user'@'localhost';


-- Usuario 'gerente_ventas'
-- Este usuario tiene acceso a los datos relacionados con ventas y facturación.

CREATE USER 'gerente_ventas'@'localhost' IDENTIFIED BY 'VentasPassword123';
GRANT SELECT, INSERT, UPDATE ON correo_db.facturacion TO 'gerente_ventas'@'localhost';
GRANT SELECT ON correo_db.pedido TO 'gerente_ventas'@'localhost';
GRANT SELECT ON correo_db.vista_facturacion_tipo_pago TO 'gerente_ventas'@'localhost';
GRANT SELECT ON correo_db.vista_pedidos_por_sucursal TO 'gerente_ventas'@'localhost';
GRANT SELECT ON correo_db.vista_pedidos_destinados_a_sucursal TO 'gerente_ventas'@'localhost';


-- Usuario 'adm_user'
-- Este usuario tiene permisos para gestionar pedidos y datos de clientes

CREATE USER 'adm_user'@'localhost' IDENTIFIED BY 'AdmPassword123';
GRANT SELECT, INSERT, UPDATE, DELETE ON correo_db.pedido TO 'adm_user'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON correo_db.cliente TO 'adm_user'@'localhost';
GRANT SELECT ON correo_db.vista_detalle_pedido TO 'adm_user'@'localhost';
GRANT SELECT ON correo_db.vista_facturacion_tipo_pago TO 'adm_user'@'localhost';
GRANT SELECT ON correo_db.vista_pedidos_por_sucursal TO 'adm_user'@'localhost';
GRANT SELECT ON correo_db.vista_pedidos_destinados_a_sucursal TO 'adm_user'@'localhost';


-- Usuario 'auditor_user'
-- Este usuario tiene permisos solo para consultar datos en la base de datos.

CREATE USER 'auditor_user'@'localhost' IDENTIFIED BY 'AuditorPassword123';
GRANT SELECT ON correo_db.* TO 'auditor_user'@'localhost';


FLUSH PRIVILEGES;
