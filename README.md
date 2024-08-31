# proyecto-final-sql-coderhouse

## Temática del proyecto
Una empresa en pleno crecimiento dedicada a realizar encomiendas a nivel nacional necesita informatizar su sistema de envío de paquetes y facturación, debido a que hasta el momento tiene todos la información de los clientes, pedidos realizados, despachos, etc. en papel.

## Modelo de negocio
El negocio consiste en los siguientes procesos:
Una persona envía un paquete (conformado por uno o más bultos) desde una sucursal a otra. Los envíos se cobran dependiendo de la cantidad de bultos y la distancia.
El cliente puede pagar ese envío con diferentes medios de pago.
El cliente tendrá la posibiidad de hacer un seguimiento del estado de su envío en una página web usando un código único provisto por la empresa.
La distribución de paquetes en sucursal de destino se realiza por medio de cadetes.

## Diagrama entidad relacion (DER)
![Diagrama de entidad relación](https://github.com/gabrielpacheco1/proyecto-final-sql-coderhouse/blob/main/DER2.png)

## Listado de tablas y descripcion
Luego de algunas minimas modificaciones, tomando en cuenta el DER, las tablas resultantes son:

#### ALCANCE
Define las distancias de los envíos, las cuales son: local, regional, nacional corta dist y nacional larga dist. 
| PK/FK| NOMBRE | TIPO DE DATO |
|-------|----------|----------|
| PK      | id_alcance  | INT   |
|       | descripcion_alcance   | ENUM  |

#### CADETE
Datos personales de los encargados de la distribución de los paquetes.
| PK/FK| NOMBRE | TIPO DE DATO |
|-------|----------|----------|
| PK      | dni_cadete  | VARCHAR   |
|       | nombre_cadete   | VARCHAR  |
|       | apellido_cadete   | VARCHAR  |
|       | telefono_cadete   | VARCHAR  |

#### CLIENTE
Datos personales de las personas que realizan envíos.
| PK/FK| NOMBRE | TIPO DE DATO |
|-------|----------|----------|
| PK      | dni_cadete  | VARCHAR   |
|       | nombre_cliente   | VARCHAR  |
|       | apellido_cliente   | VARCHAR  |
|       | email_cliente   | VARCHAR  |
|       | telefono_cliente   | VARCHAR  |
|       | direccion_cliente   | VARCHAR  |

#### DESPACHO
Registra los envíos de una sucursal a otra.
| PK/FK| NOMBRE | TIPO DE DATO |
|-------|----------|----------|
| PK      | id_despacho  | VARCHAR   |
| FK      | id_pedido   | INT  |
| FK      | id_sucursal   | INT  |
|       | fecha_despacho   | TIMESTAMP  |
|       | fecha_recepcion   | TIMESTAMP  |
|       | encargado_transporte   | TIMESTAMP  |

#### DESTINATARIO
Datos personales de la persona que debe recibir el envío.
| PK/FK| NOMBRE | TIPO DE DATO |
|-------|----------|----------|
| PK      | id_destinatario  | INT   |
| I      | dni_destinatario   | VARCHAR  |
|       | nombre_destinatario   | VARCHAR  |
|       | apellido_destinatario  | VARCHAR  |
|       | telefono_destinatario | VARCHAR  |
|       | direccion_destinatario  | VARCHAR  |

#### DISTRIBUCION
Registra datos de la distribución de los envíos que llevan a cabo los cadetes.
| PK/FK| NOMBRE | TIPO DE DATO |
|-------|----------|----------|
| PK  |   id_distribucion| INT|
| FK  | 	id_pedido| INT|
| FK  |	dni_cadete| VARCHAR|
|   |	fecha_entrega| TIMESTAMP|

#### FACTURACION
Datos de la factura de un pedido.
| PK/FK| NOMBRE | TIPO DE DATO |
|-------|----------|----------|
|PK   |id_factura | INT|
| FK  |id_pedido | INT|
| FK  |id_forma_pago | INT|
|   |fecha_facturacion | TIMESTAMP|
|   |monto_total | DOUBLE|

#### FORMA_PAGO
Almacena los tipos de forma de pago para realizar un envío.
| PK/FK| NOMBRE | TIPO DE DATO |
|-------|----------|----------|
| PK  |	id_forma_pago | INT|
|   | 	descripcion_forma_pago | VARCHAR|

#### PAQUETE
Almacena los paquetes que fueron enviados.
| PK/FK| NOMBRE | TIPO DE DATO |
|-------|----------|----------|
| PK   |	id_paquete  | INT |
| FK  | 	id_pedido   | INT |
| FK  |	id_tarifa   | INT |

#### PEDIDO
Registra la información general de los pedidos que realizan los clientes.
| PK/FK| NOMBRE | TIPO DE DATO |
|-------|----------|----------|
| PK   |	id_pedido | INT |
| I  | 	estado | ENUM |
|   |	cantidad_paquetes | INT |
| FK   |	dni_cliente | VARCHAR |
| FK  |    id_destinatario | INT |
| FK  |	id_sucursal_origen | INT |
| FK  |	id_sucursal_destino | INT |
| FK  | 	id_alcance | INT |

#### SUCURSAL
Registra las sucursales de la empresa.
| PK/FK| NOMBRE | TIPO DE DATO |
|-------|----------|----------|
| PK   |	id_sucursal    | INT |
|   | 	nombre_sucursal    | VARCHAR |
|   |	direccion_sucursal | VARCHAR |

#### TARIFA
Almacena los distintos tipos de tarifa de los paquetes, que dependen de su peso y dimensiones.
| PK/FK| NOMBRE | TIPO DE DATO |
|-------|----------|----------|
| PK  |	id_tarifa   | INT |
|   | 	descripcion_tarifa  | ENUM |
|   |	peso_max    | INT |
|   |	dimensiones | VARCHAR |
|   |	costo   | FLOAT |

## EER generado en MySQL
![MySQL EER](https://github.com/gabrielpacheco1/proyecto-final-sql-coderhouse/blob/main/eer.png)

## Vistas
El listado de vistas creados es el siguiente:
#### vista_detalle_pedido
Esta vista proporciona un resumen detallado de cada pedido, incluyendo su estado, las fechas relevantes del despacho y entrega, así como la información del cadete asignado. Es útil para monitorear el estado y progreso de los pedidos.

Tablas que la componen: 
pedido (p), despacho (d), distribucion (dist), cadete (c).

```sql
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
```

#### vista_facturacion_tipo_pago
Esta vista muestra un resumen de la cantidad de pedidos y el monto total facturado para cada tipo de forma de pago. Es útil para analizar la distribución y popularidad de los diferentes métodos de pago.

Tablas que la componen: 
facturacion (f), forma_pago (fp).

```sql
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
```

#### vista_pedidos_por_sucursal
Esta vista proporciona un conteo de los pedidos despachados desde cada sucursal. Es útil para entender el volumen de operaciones y la carga de trabajo de cada sucursal.

Tablas que la componen: 
pedido (p), sucursal (s).

```sql
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
```

#### vista_pedidos_destinados_a_sucursal
Esta vista proporciona un conteo de los pedidos destinados a cada sucursal. Es útil para entender el destino final de los pedidos y la carga de trabajo esperada en cada sucursal de destino.

Tablas que la componen: 
pedido (p), sucursal (s).

```sql
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
```

## Funciones
Las funciones creadas son las siguientes:
#### TotalPedidosPorCliente
La función TotalPedidosPorCliente se utiliza para calcular la cantidad de pedidos realizados por un cliente específico. Esta función es útil para obtener un resumen rápido del número total de pedidos que un cliente ha realizado, lo que puede ser relevante para análisis de comportamiento del cliente, recompensas de lealtad, o simplemente para gestionar el historial de pedidos.

Datos o tablas que Manipula:

Tablas: pedido

Columnas: dni_cliente

```sql
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
```

#### TotalFacturado
La función TotalFacturado calcula el monto total facturado en un rango de fechas especificado. Esta función es útil para generar informes financieros, auditorías, y análisis de ingresos en periodos específicos. Ayuda a entender el flujo de ingresos en diferentes intervalos de tiempo, lo que es crucial para la planificación y estrategia financiera.

Datos o tablas que Manipula:

Tablas: facturacion

Columnas: fecha_facturacion, monto_total

```sql
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
```

## Procedimientos almacenados
Los procedimientos almacenados creados son:
#### obtenerDetallePedido
El procedimiento almacenado obtenerDetallePedido se utiliza para obtener detalles completos sobre un pedido específico. Este procedimiento facilita la recuperación de información detallada de un pedido, incluyendo datos del cliente, del destinatario, de la sucursal de origen, la sucursal de destino y fechas relevantes del despacho.

Este procedimiento permite a los usuarios del sistema acceder rápidamente a toda la información relevante sobre un pedido en particular, mejorando la eficiencia en la gestión de pedidos y el servicio al cliente.

Tablas que interactúan: pedido, cliente, destinatario, sucursal, despacho

```sql
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
END
```

#### actualizarEstadoPedido
El procedimiento almacenado actualizarEstadoPedido se utiliza para actualizar el estado de un pedido específico y registrar esta actualización en una tabla de historial. Este procedimiento permite mantener un registro detallado de todas las actualizaciones de estado de los pedidos, lo que es útil para auditorías y seguimiento del estado de los pedidos.

Este procedimiento asegura que todas las actualizaciones de estado de los pedidos sean registradas automáticamente, proporcionando una trazabilidad completa del historial de cambios de estado de cada pedido. Esto es esencial para el seguimiento de pedidos, gestión de incidencias y análisis de desempeño operativo.

Tablas que interactúan: pedido, actualizacion_estado_pedido (tabla creada para registrar los cambios de estado)

```sql
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
END
```

## Triggers
Los triggers creados son:

#### Trigger actualizar_estado_pedido
Este trigger se activa después de que se inserte un nuevo registro en la tabla distribucion. Su función principal es actualizar el estado del pedido correspondiente a "ENTREGADO" en la tabla pedido si el campo fecha_entrega en la tabla distribucion tiene un valor no nulo.

Automatiza la actualización del estado del pedido cuando se registra la fecha de entrega, garantizando que la información en la base de datos se mantenga consistente y actualizada sin necesidad de intervención manual. Esto es crucial para reflejar correctamente el estado final del pedido.

Tablas que interactúan: distribucion, pedido.

```sql
CREATE TRIGGER actualizar_estado_pedido
AFTER INSERT ON distribucion
FOR EACH ROW
BEGIN
    IF NEW.fecha_entrega IS NOT NULL THEN
        UPDATE pedido
        SET estado = 'ENTREGADO'
        WHERE id_pedido = NEW.id_pedido;
    END IF;
END
```

#### Trigger registrar_fecha_creacion
Este trigger se activa después de que se inserte un nuevo registro en la tabla pedido. Su función principal es registrar la fecha y hora de creación de cada pedido en una tabla separada llamada registro_creacion_pedido.

Mantiene un registro preciso de cuándo se creó cada pedido, lo cual es útil para auditorías, análisis de tiempos de procesamiento y seguimiento histórico de los pedidos.

Tablas que interactúan: pedido, registro_creacion_pedido (tabla creada para almacenar datos de la creación del pedido).

```sql
CREATE TRIGGER registrar_fecha_creacion
AFTER INSERT ON pedido
FOR EACH ROW
BEGIN
    INSERT INTO registro_creacion_pedido (id_pedido, fecha_creacion)
    VALUES (NEW.id_pedido, CURRENT_TIMESTAMP);
END
```

## Usuarios
Los usuarios que pueden interactuar con la base de datos son:

#### Usuario admin
Este usuario tiene todos los privilegios y puede realizar cualquier operación en la base de datos.

```sql
CREATE USER 'admin'@'localhost' IDENTIFIED BY 'password_admin';
GRANT ALL PRIVILEGES ON correo_db.* TO 'admin'@'localhost' WITH GRANT OPTION;
```

#### Usuario cadete_user
Este usuario tiene permisos limitados para gestionar los datos relacionados con la entrega de pedidos.

```sql
CREATE USER 'cadete_user'@'localhost' IDENTIFIED BY 'CadetePassword123';
GRANT SELECT, UPDATE ON correo_db.distribucion TO 'cadete_user'@'localhost';
GRANT SELECT ON correo_db.pedido TO 'cadete_user'@'localhost';
GRANT SELECT ON correo_db.vista_detalle_pedido TO 'cadete_user'@'localhost';
```

#### Usuario gerente_ventas
Este usuario tiene acceso a los datos relacionados con ventas y facturación.

```sql
CREATE USER 'gerente_ventas'@'localhost' IDENTIFIED BY 'VentasPassword123';
GRANT SELECT, INSERT, UPDATE ON correo_db.facturacion TO 'gerente_ventas'@'localhost';
GRANT SELECT ON correo_db.pedido TO 'gerente_ventas'@'localhost';
GRANT SELECT ON correo_db.vista_facturacion_tipo_pago TO 'gerente_ventas'@'localhost';
GRANT SELECT ON correo_db.vista_pedidos_por_sucursal TO 'gerente_ventas'@'localhost';
GRANT SELECT ON correo_db.vista_pedidos_destinados_a_sucursal TO 'gerente_ventas'@'localhost';
GRANT EXECUTE ON PROCEDURE obtenerDetallePedido TO 'gerente_ventas'@'localhost';
```

#### Usuario adm_user
Este usuario administrativo tiene permisos para gestionar pedidos y datos de clientes

```sql
CREATE USER 'adm_user'@'localhost' IDENTIFIED BY 'AdmPassword123';
GRANT SELECT, INSERT, UPDATE, DELETE ON correo_db.pedido TO 'adm_user'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON correo_db.cliente TO 'adm_user'@'localhost';
GRANT SELECT ON correo_db.vista_detalle_pedido TO 'adm_user'@'localhost';
GRANT SELECT ON correo_db.vista_facturacion_tipo_pago TO 'adm_user'@'localhost';
GRANT SELECT ON correo_db.vista_pedidos_por_sucursal TO 'adm_user'@'localhost';
GRANT SELECT ON correo_db.vista_pedidos_destinados_a_sucursal TO 'adm_user'@'localhost';
GRANT EXECUTE ON PROCEDURE obtenerDetallePedido TO 'adm_user'@'localhost';
```

#### Usuario auditor_user
Este usuario tiene permisos solo para consultar datos en la base de datos.

```sql
CREATE USER 'auditor_user'@'localhost' IDENTIFIED BY 'AuditorPassword123';
GRANT SELECT ON correo_db.* TO 'auditor_user'@'localhost';
```
