# Gestión de Errores y Excepciones

BombaVa implementa un sistema unificado de gestión de errores que garantiza que los fallos en el Backend no "rompan" el flujo del Frontend.

## 1. Errores en API REST
El sistema utiliza el `errorMiddleware.js` para capturar cualquier excepción no controlada y formatearla en JSON:

```json
{
  "message": "Descripción legible del error",
  "stack": "Solo disponible en entorno de desarrollo"
}
```

### Códigos de Estado Estándar
*   **400 (Bad Request)**: Fallo en validación de `express-validator` (ej. email mal formado).
*   **401 (Unauthorized)**: JWT inválido o expirado.
*   **403 (Forbidden)**: Intento de mover un barco que no pertenece al usuario.
*   **404 (Not Found)**: Recurso (barco, mazo, partida) inexistente.

## 2. Errores en WebSockets
Dado que los Sockets no utilizan códigos HTTP, el servidor emite un evento reservado: `game:error`.

### Estructura del Mensaje
```javascript
socket.emit('game:error', {
    message: "No tienes suficiente combustible para esta acción",
    code: "INSUFFICIENT_RESOURCES"
});
```

## 3. Transaccionalidad y Rollback
Para errores críticos durante el combate (ej. fallo de red en mitad de un ataque), el sistema utiliza **Sequelize Transactions**. Si una parte de la actualización de vida falla, se revierte automáticamente el consumo de munición, manteniendo la paridad de datos.
