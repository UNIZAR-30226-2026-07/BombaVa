# Estrategia de Testing y Calidad

El proyecto BombaVa sigue una política estricta de **Tests Colocalizados** gestionados por el framework **Jest**.

## Niveles de Prueba

### 1. Tests Unitarios (`*.test.js`)
*   **Objetivo**: Validar funciones puras (cálculos de daño, regeneración de recursos, traducción de coordenadas).
*   **Aislamiento**: No tienen dependencia de la base de datos. Utilizan Mocks para las fachadas de otros módulos.
*   **Ubicación**: Junto al archivo de lógica que testean.

### 2. Tests de Integración (`*.int.test.js`)
*   **Objetivo**: Validar el flujo completo entre el controlador, el servicio y la persistencia real en PostgreSQL.
*   **Entorno**: Se ejecutan dentro de contenedores Docker para garantizar un esquema de base de datos limpio mediante `sequelize.sync({ force: true })`.

## Flujo de Integración Continua (CI)

Cada **Pull Request** dispara automáticamente una acción de GitHub (`.github/workflows/node-ci.yml`) que realiza los siguientes pasos:

1.  **Linting**: Verificación de estándares de código (formato de variables, ausencia de `ñ`).
2.  **Infraestructura**: Levanta una instancia efímera de PostgreSQL.
3.  **Ejecución**: Corre `npm test` y bloquea el merge si la cobertura baja del umbral definido o si algún test falla.

## Comandos de Validación
*   `npm run test:unit`: Ejecuta solo lógica de negocio.
*   `npm run test:int`: Ejecuta flujo completo con DB.
