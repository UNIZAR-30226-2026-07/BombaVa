# BombaVa - Orquestador

Este repositorio actúa como el núcleo central del proyecto **BombaVa**. No contiene lógica de negocio, sino que coordina la infraestructura, la documentación técnica y la integración de los tres componentes principales del ecosistema.

## Estructura del Ecosistema

BombaVa se divide en tres repositorios independientes vinculados a este orquestador:

1.  **[Backend](https://github.com/UNIZAR-30226-2026-07/BombaVa-Backend)**: Motor de juego (Node.js), WebSockets y persistencia.
2.  **[Frontend Web](https://github.com/UNIZAR-30226-2026-07/BombaVa-FrontendWeb)**: Interfaz táctica para navegadores (React).
3.  **[Frontend Móvil](https://github.com/UNIZAR-30226-2026-07/BombaVa-FrontendMovil)**: Cliente nativo para dispositivos Android (Java).

## Requisitos del Sistema

Para operar este orquestador, se requiere:
*   **Docker & Docker Compose**: Para la base de datos y contenedores.
*   **Node.js v20+**: Para ejecución de servicios y herramientas de build.
*   **Make**: Interfaz unificada de comandos.
*   **Python 3.10+**: Únicamente para la previsualización de la documentación técnica.

## Guía de Inicio Rápido

### 1. Clonar el proyecto completo
Este repositorio utiliza submódulos. Para clonar todo el ecosistema de un solo golpe:

```bash
git clone --recursive https://github.com/UNIZAR-30226-2026-07/BombaVa.git
```

### 2. Instalación de dependencias
El comando maestro instalará los módulos necesarios en Backend, Web y Documentación:

```bash
make setup-all
```

### 3. Ejecución del entorno
Para levantar la base de datos y el servidor de backend en modo desarrollo:

```bash
make run-dev
```

## Documentación Técnica
La arquitectura detallada, los diagramas de secuencia y la especificación de la API se encuentran en la carpeta `/docs`. Para ver la documentación en formato web local:

```bash
make docs-serve
```
