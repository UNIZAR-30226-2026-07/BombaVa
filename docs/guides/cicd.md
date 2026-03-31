# Pipeline de Despliegue Continuo

BombaVa utiliza un modelo de despliegue automatizado basado en ramas de Git.

## Entornos

| Entorno | Rama | Plataforma | Propósito |
| :--- | :--- | :--- | :--- |
| **Producción** | `main` | Render (Backend) / Vercel (Web) | Versión estable para usuarios finales. |
| **Staging** | `develop` | Render (Preview) | Pruebas de integración pre-release. |

## Proceso de Build
1.  **Dockerization**: El archivo `Dockerfile` en la raíz del backend genera una imagen optimizada basada en `node:20-alpine`.
2.  **Migraciones**: Al detectar un nuevo despliegue, Render ejecuta automáticamente `make seed` para asegurar que las plantillas de armas y barcos están actualizadas.
3.  **Health-Check**: El sistema no entra en tráfico hasta que el endpoint `GET /` responde con éxito.
