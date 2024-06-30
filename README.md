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
Las tablas resultantes son:

#### CADETE
| PK/FK| NOMBRE | TIPO DE DATO |
|-------|----------|----------|
| PK    | id_cadete| INT   |
|       | dni_cadete  | VARCHAR   |
|       | nombre_cadete   | VARCHAR  |
|       | telefono_cadete   | VARCHAR  |

#### CLIENTE
| PK/FK| NOMBRE | TIPO DE DATO |
|-------|----------|----------|
| PK      | dni_cadete  | VARCHAR   |
|       | nombre_cliente   | VARCHAR  |
|       | telefono_cliente   | VARCHAR  |
|       | email_cliente   | VARCHAR  |
|       | direccion_cliente   | VARCHAR  |

#### DESPACHO
| PK/FK| NOMBRE | TIPO DE DATO |
|-------|----------|----------|
| PK      | dni_cadete  | VARCHAR   |
|       | nombre_cliente   | VARCHAR  |
|       | telefono_cliente   | VARCHAR  |
|       | email_cliente   | VARCHAR  |
|       | direccion_cliente   | VARCHAR  |

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

