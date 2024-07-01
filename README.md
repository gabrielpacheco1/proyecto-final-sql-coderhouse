# proyecto-final-sql-coderhouse

## Temática del proyecto
Empresa en pleno crecimiento dedicada a realizar encomiendas a nivel nacional necesita informatizar su sistema de envío de paquetes y facturación.

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
| PK/FK| NOMBRE | TIPO DE DATO |
|-------|----------|----------|
| PK      | id_alcance  | INT   |
|       | descripcion_alcance   | ENUM  |

#### CADETE
| PK/FK| NOMBRE | TIPO DE DATO |
|-------|----------|----------|
| PK      | dni_cadete  | VARCHAR   |
|       | nombre_cadete   | VARCHAR  |
|       | apellido_cadete   | VARCHAR  |
|       | telefono_cadete   | VARCHAR  |

#### CLIENTE
| PK/FK| NOMBRE | TIPO DE DATO |
|-------|----------|----------|
| PK      | dni_cadete  | VARCHAR   |
|       | nombre_cliente   | VARCHAR  |
|       | apellido_cliente   | VARCHAR  |
|       | email_cliente   | VARCHAR  |
|       | telefono_cliente   | VARCHAR  |
|       | direccion_cliente   | VARCHAR  |

#### DESPACHO
| PK/FK| NOMBRE | TIPO DE DATO |
|-------|----------|----------|
| PK      | id_despacho  | VARCHAR   |
| FK      | id_pedido   | INT  |
| FK      | id_sucursal   | INT  |
|       | fecha_despacho   | TIMESTAMP  |
|       | fecha_recepcion   | TIMESTAMP  |
|       | encargado_transporte   | TIMESTAMP  |

#### DESTINATARIO
| PK/FK| NOMBRE | TIPO DE DATO |
|-------|----------|----------|
| PK      | id_destinatario  | INT   |
|       | dni_destinatario   | VARCHAR  |
|       | nombre_destinatario   | VARCHAR  |
|       | apellido_destinatario  | VARCHAR  |
|       | telefono_destinatario | VARCHAR  |
|       | direccion_destinatario  | VARCHAR  |

#### DISTRIBUCION
| PK/FK| NOMBRE | TIPO DE DATO |
|-------|----------|----------|
| PK  |   id_distribucion| INT|
| FK  | 	id_pedido| INT|
| FK  |	dni_cadete| VARCHAR|
|   |	fecha_entrega| TIMESTAMP|

#### FACTURACION
| PK/FK| NOMBRE | TIPO DE DATO |
|-------|----------|----------|
|PK   |id_factura | INT|
| FK  |id_pedido | INT|
| FK  |id_forma_pago | INT|
|   |fecha_facturacion | TIMESTAMP|
|   |monto_total | DOUBLE|

#### FORMA_PAGO
| PK/FK| NOMBRE | TIPO DE DATO |
|-------|----------|----------|
| PK  |	id_forma_pago | INT|
|   | 	descripcion_forma_pago | VARCHAR|

#### PAQUETE
| PK/FK| NOMBRE | TIPO DE DATO |
|-------|----------|----------|
| PK   |	id_paquete  | INT |
| FK  | 	id_pedido   | INT |
| FK  |	id_tarifa   | INT |

#### PEDIDO
| PK/FK| NOMBRE | TIPO DE DATO |
|-------|----------|----------|
| PK   |	id_pedido | INT |
|   | 	estado | ENUM |
|   |	cantidad_paquetes | INT |
| FK   |	dni_cliente | VARCHAR |
| FK  |    id_destinatario | INT |
| FK  |	id_sucursal_origen | INT |
| FK  |	id_sucursal_destino | INT |
| FK  | 	id_alcance | INT |

#### SUCURSAL
| PK/FK| NOMBRE | TIPO DE DATO |
|-------|----------|----------|
| PK   |	id_sucursal    | INT |
|   | 	nombre_sucursal    | VARCHAR |
|   |	direccion_sucursal | VARCHAR |

#### TARIFA
| PK/FK| NOMBRE | TIPO DE DATO |
|-------|----------|----------|
| PK  |	id_tarifa   | INT |
|   | 	descripcion_tarifa  | ENUM |
|   |	peso_max    | INT |
|   |	dimensiones | VARCHAR |
|   |	costo   | FLOAT |

## Estructura e ingesta de datos

## Objetos de la base de datos

## Roles y permisos
admin: control total


## Back up de la base de datos

## Herramientas y tecnologias usadas
MySQL Workbench
DBeaver

## Como levantar el proyecto en CodeSpaces GitHub
* env: Archivo con contraseñas y data secretas
* Makefile: Abstracción de creacción del proyecto
* docker-compose.yml: Permite generar las bases de datos en forma de contenedores

#### Pasos para arrancar el proyecto

