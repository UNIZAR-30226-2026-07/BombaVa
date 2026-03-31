# Manual de Extensibilidad

BombaVa ha sido diseñado siguiendo el principio de **Abierto/Cerrado (SOLID)**. Añadir contenido no requiere modificar el núcleo del motor, sino ampliar las plantillas y servicios.

## Añadir una Nueva Clase de Barco

Para añadir una unidad (ej. *Portaaviones*), siga este flujo de trabajo:

1.  **Definición en Bootstrap**: Añada un nuevo objeto en `src/shared/models/bootstrap.js` dentro del array `templatesData`.
    *   Defina `width` y `height` para la ocupación del grid.
    *   Asigne el `supply_cost` para el equilibrio de los Decks.
2.  **Lógica de Daño (Opcional)**: Si el barco tiene secciones críticas únicas, actualice el `DebuffService` en el [Módulo Engine](../domain/engine.md) para reconocer los nuevos índices de celdas.

## Implementar un Nuevo Tipo de Armamento

Si desea implementar un arma con comportamiento único (ej. *Pulso Electromagnético*):

### 1. Registro de Plantilla

Cree el registro en la tabla `WeaponTemplates` mediante un script de migración o en el bootstrap, definiendo el `type` como `CANNON` (instantáneo) o `PROJECTILE` (dinámico).

### 2. Implementación del Handler

Si el arma es dinámica, debe registrar su lógica de movimiento en el `CombatService`:

```javascript
// Ejemplo de trayectoria circular
export const calcularTrayectoriaEMP = (origen, radio) => {
    // Implementación lógica...
};
```

### 3. Integración en Sockets

Añada el listener correspondiente en `src/modules/engine/sockets/combat.js` para que el Frontend pueda invocar la acción.

## Trazabilidad de Cambios

Cualquier extensión debe mantener la interconexión con:

*   [Modelo de Datos](../architecture/persistence.md): Para asegurar la persistencia.
*   [Networking](../architecture/networking.md): Para la correcta traducción de coordenadas Norte/Sur.
