# Módulo Inventory: El Puerto y la Flota

El módulo de Inventario gestiona la colección de unidades del usuario y la preparación táctica previa al combate.

## El Puerto (Gestión de Unidades)

El puerto permite al usuario interactuar con sus `UserShips`. Las responsabilidades incluyen:

*   **Equipamiento**: Vincular `WeaponTemplates` a los slots disponibles de cada barco.
*   **Progresión**: Gestión de niveles y estadísticas personalizadas (`custom_stats`).
*   **Arsenal**: Consulta de estadísticas de daño y coste de AP de cada arma disponible.

## Sistema de Decks (Mazos de Flota)

Un `FleetDeck` no es solo una lista de barcos, sino una **Formación de Despliegue**. 

### Reglas de Validación de Despliegue

El sistema impone restricciones estrictas en la creación de mazos para evitar ventajas injustas:

1.  **Zona de Despliegue**: Los barcos deben situarse en un área de \(15 \times 5\) casillas.
2.  **Costo de Suministros**: Cada `ShipTemplate` tiene un `supply_cost`. El mazo no puede superar el límite global del jugador.
3.  **No Solapamiento**: El servicio de inventario valida que las dimensiones de los barcos (ej. 1x5) no se crucen en el mini-tablero de despliegue.
4.  **Validación de Identidad**: El sistema verifica que los `userShipId` proporcionados pertenecen realmente al usuario autenticado.

## Flujo de Activación

Solo un mazo puede estar marcado como `is_active: true`. Cuando el [Módulo Game](./game.md) solicita iniciar una partida, consulta este mazo específico a través de la fachada de inventario.