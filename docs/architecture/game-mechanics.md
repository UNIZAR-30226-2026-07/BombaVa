# Mecánicas de Juego: Especificación Algorítmica

El comportamiento de BombaVa no es aleatorio; se rige por un motor de reglas determinista definido en `src/config/gameRules.js`.

## 1. Sistema de Coordenadas y Distancias

El tablero es un espacio bidimensional discreto. Para el cálculo de rangos (cañones y visión), el sistema utiliza la **Distancia de Manhattan** para simplificar la computación en el grid:

\[ d(P_1, P_2) = |x_1 - x_2| + |y_1 - y_2| \]

*   **Rango de Cañón**: Si \( d(Ship, Target) \le WeaponRange \), el impacto es válido.
*   **Visión**: Se aplica un radio de búsqueda circular sobre el grid para el filtrado de la Niebla de Guerra.

## 2. Cinemática de Unidades (Movimiento y Rotación)

### Traslación
El movimiento consume **1 Punto de Movimiento (MP)** por casilla. El motor valida la colisión consultando la tabla `SHIP_INSTANCE` para el `match_id` actual antes de actualizar la posición.

### Rotación
La rotación es un cambio de estado en el atributo `orientation` {N, S, E, W}. 

*   **Coste**: 2 MP.
*   **Lógica**: Se realiza un desplazamiento de 90° sobre el eje central de la instancia. En barcos de tamaño > 1 (Fragata, Acorazado), el motor recalcula las celdas ocupadas basándose en el "pivote" (proa).

## 3. Regeneración de Recursos

Al inicio de cada turno (`StatusService`), se aplica la siguiente fórmula de regeneración:

```javascript
// Lógica en src/modules/game/services/matchService.js
recursos.fuel = Math.min(MAX_FUEL, recursos.fuel + REGEN_FUEL);
recursos.ammo = RESET_AMMO; // La munición no es acumulable
```

## 4. Resolución de Proyectiles Dinámicos
Los torpedos poseen un vector de avance \( (v_x, v_y) \) derivado de la orientación del barco en el momento del disparo. Su resolución es **prioritaria** al inicio de la fase de resolución, antes de procesar las acciones del jugador activo.
