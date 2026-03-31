# Imagen base optimizada
FROM node:20-alpine

# Directorio de trabajo dentro del contenedor
WORKDIR /app

# Copiamos los archivos de dependencias usando el contexto del repo hermano
COPY package*.json ./

# Instalación limpia de módulos
RUN npm install

# Copiamos el código fuente del frontend
COPY . .

# Variables de entorno para que Vite sepa dónde está el Backend en la red de Docker
ENV VITE_API_URL=http://backend:3000

# Exponemos el puerto por defecto de Vite
EXPOSE 5173

# Arrancamos el servidor de desarrollo permitiendo conexiones externas (--host)
CMD ["npm", "run", "dev", "--", "--host"]