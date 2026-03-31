# Arquitectura: Monolito Modular

El Backend de BombaVa se organiza en **Dominios de Dominio**, cada uno encapsulado para minimizar el acoplamiento. La comunicación entre módulos se rige por el patrón **Facade (Fachada)**.

## Estructura de un Módulo

Cada módulo dentro de `src/modules/` mantiene la siguiente estructura interna:

*   **Controllers**: Manejan la lógica de entrada (HTTP/Socket).
*   **Services**: Contienen la lógica de negocio pura y cálculos.
*   **DAO (Data Access Object)**: Encapsula las consultas a la base de datos.
*   **Models**: Define los esquemas de Sequelize.
*   **index.js (Fachada)**: El único punto de entrada permitido para otros módulos.

## Protocolo de Comunicación Híbrido

El sistema separa las responsabilidades de red según la inmediatez requerida:

### 1. API REST (Síncrona/Asíncrona)

Utilizada para operaciones que no requieren sincronización en tiempo real entre dos jugadores:

*   Gestión de perfiles y ranking.
*   Configuración de la flota en el Puerto.
*   Consulta de historial de partidas.

### 2. WebSockets (Tiempo Real)

Utilizada para la fase activa de combate:

*   Eventos de movimiento y rotación.
*   Ejecución de ataques y resolución de impactos.
*   Chat y gestión de turnos.

## Trazabilidad de Fachadas

| Módulo | Responsabilidad Principal | Interdependencia |
| :--- | :--- | :--- |
| **Auth** | Identidad y JWT | Requerido por todos (Middleware) |
| **Inventory** | Decks y barcos del usuario | Consultado por Game al iniciar |
| **Engine** | Física, colisiones y daño | Núcleo de Game |
| **Game** | Lobbies y orquestación de turnos | Coordina Engine e Inventory |
