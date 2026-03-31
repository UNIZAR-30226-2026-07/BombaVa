# Guía de Instalación y Desarrollo

El ecosistema BombaVa utiliza **Docker** para garantizar la paridad entre los entornos de desarrollo, integración (CI) y producción. La gestión del ciclo de vida del software se realiza a través de un **Makefile Maestro**.

## Requisitos Previos

*   Docker Engine v24.0+ y Docker Compose.
*   Node.js v20+ (para ejecución local de tests).
*   Herramienta `make`.

## Puesta en Marcha (Fast-Track)

Para levantar el entorno completo (Base de Datos + Backend + Migraciones), ejecute:

```bash
make run
```

Este comando orquesta las siguientes acciones:

1.  Levanta un contenedor de **PostgreSQL 16**.
2.  Ejecuta `sequelize db:migrate` para establecer el esquema.
3.  Lanza el proceso `nodemon` con hot-reload en el puerto 3000.

## Comandos del Makefile

| Comando | Acción |
| :--- | :--- |
| `make install` | Instalación limpia de dependencias mediante `npm ci`. |
| `make test` | Ejecución de la suite completa de tests (Unit + Integration). |
| `make seed` | Puebla la base de datos con plantillas de barcos y armas base. |
| `make infra-down` | Detiene y elimina los contenedores y volúmenes de datos. |

## Variables de Entorno

El sistema requiere un archivo `.env` en la raíz del backend con la siguiente configuración mínima:

*   `DATABASE_URL`: URI de conexión a Postgres.
*   `JWT_SECRET`: Semilla para la firma de tokens.
*   `PORT`: Puerto de escucha del servidor (Default: 3000).
