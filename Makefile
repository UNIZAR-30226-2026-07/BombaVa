# Directorios de los módulos
BACKEND_DIR = ./BombaVa-Backend
WEB_DIR = ./BombaVa-FrontendWeb/bombava-frontend
VENV = .venv

.DEFAULT_GOAL := help

help: # Muestra los comandos disponibles para todo el ecosistema
	@grep -E '^[a-zA-Z_-]+:.*?# .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?# "}; {printf "\033[36m%-25s\033[0m %s\n", $$1, $$2}'

link-repos: # Descarga o actualiza los 3 repositorios necesarios en la carpeta raíz
	@chmod +x scripts/link_repos.sh
	./scripts/link_repos.sh

setup: # Instala las dependencias de todos los proyectos locales
	$(MAKE) docs-install
	cd $(BACKEND_DIR) && npm install
	cd $(WEB_DIR) && npm install

docker-up: # Levanta todo el sistema (BD + Backend + Web) usando Docker
	docker compose up -d

docker-down: # Apaga todos los servicios de Docker y limpia la red
	docker compose down

docker-logs: # Muestra los logs de todos los contenedores en tiempo real
	docker compose logs -f

run-back: # Lanza el servidor backend en modo desarrollo
	cd $(BACKEND_DIR) && make run

run-web: # Lanza el servidor web (Vite) en modo desarrollo
	cd $(WEB_DIR) && npm run dev

docs-install: # Configura el entorno virtual para la documentación
	python3 -m venv $(VENV)
	./$(VENV)/bin/pip install -r requirements.txt

docs-serve: # Lanza la previsualización de la documentación en local
	./$(VENV)/bin/mkdocs serve -a 127.0.0.1:8000

clean: # Borra archivos temporales y entornos virtuales
	rm -rf $(VENV) site BombaVa-Backend BombaVa-FrontendWeb BombaVa-FrontendMovil