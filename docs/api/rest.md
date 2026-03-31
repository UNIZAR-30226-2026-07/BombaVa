# Especificación de API REST

BombaVa utiliza una arquitectura RESTful para la gestión persistente. El acceso requiere un token JWT en el encabezado `Authorization: Bearer <TOKEN>`.

## 1. Módulo de Autenticación (`/api/auth`)

| Método | Ruta | Descripción |
| :--- | :--- | :--- |
| `POST` | `/register` | Registro de nuevo Almirante. Inicia ELO en 1200. |
| `POST` | `/login` | Validación de credenciales y entrega de JWT. |
| `GET` | `/me` | Obtención de datos de perfil, ELO y fecha de alistamiento. |
| `PATCH` | `/me` | Actualización de `username` o `email`. |
| `GET` | `/ranking` | Ranking global de los 50 mejores jugadores por ELO. |

## 2. Módulo de Inventario y Puerto (`/api/inventory`)

### Gestión de Armamento
*   **`GET /weapons`**: Catálogo completo de armas disponibles (Cañones, Minas, Torpedos) con sus atributos de daño y coste.
*   **`PATCH /ships/:shipId/equip`**: Equipa un arma en un slot del barco.
    *   *Payload*: `{"weaponSlug": "torpedo-v1"}`
*   **`DELETE /ships/:shipId/weapons/:weaponSlug`**: Retira el arma especificada del arsenal del barco.

### Gestión de Unidades y Mazos
*   **`GET /ships`**: Lista todos los barcos en propiedad, incluyendo sus armas equipadas y nivel.
*   **`GET /decks`**: Lista todas las formaciones guardadas.
*   **`POST /decks`**: Crea una nueva formación táctica (Deck).
*   **`PATCH /decks/:id/activate`**: Establece el mazo principal para la siguiente batalla.

## 3. Módulo de Partidas (`/api/matches`)

| Método | Ruta | Descripción |
| :--- | :--- | :--- |
| `GET` | `/history` | Historial completo de victorias y derrotas del usuario. |

## 4. Estándar de Respuesta

Todas las peticiones devuelven objetos JSON. En caso de éxito, se utiliza el código `200` o `201`. En caso de error, el sistema responde con una estructura unificada definida en la [Gestión de Errores](../architecture/error-handling.md).