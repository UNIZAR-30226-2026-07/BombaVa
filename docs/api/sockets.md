# Especificación de WebSockets (Socket.io)

La comunicación por WebSockets es el sistema nervioso del combate táctico.

## Eventos de Entrada (Cliente -> Servidor)

| Evento | Payload | Descripción |
| :--- | :--- | :--- |
| `lobby:create` | `null` | Solicita un nuevo código de sala. |
| `ship:move` | `{"shipId": "UUID", "direction": "N"}` | Intento de traslación. |
| `ship:attack:cannon` | `{"shipId": "UUID", "target": {"x": 5, "y": 7}}` | Disparo instantáneo. |

## Eventos de Salida (Servidor -> Cliente)

### 1. Actualización de Visión (`match:vision_update`)
Es el evento más denso. Define qué ve el jugador.

**Ejemplo de JSON:**
```json
{
  "myFleet": [
    {
      "id": "u-123",
      "x": 5, "y": 2,
      "orientation": "N",
      "currentHp": 20,
      "isSunk": false
    }
  ],
  "visibleEnemyFleet": [
    {
      "id": "e-999",
      "x": 5, "y": 10,
      "orientation": "S",
      "currentHp": 15,
      "isSunk": false
    }
  ]
}
```

## Flujo de Seguridad
El [Auth Middleware](../domain/auth.md) inyecta la identidad del usuario en el socket. Por lo tanto, el cliente **nunca** debe enviar su `userId` en los eventos de combate; el servidor lo deriva automáticamente de la conexión segura para evitar suplantaciones de identidad.
