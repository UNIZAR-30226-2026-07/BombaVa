#!/bin/bash

echo "Iniciando sincronización del ecosistema BombaVa en el directorio local..."

# Definimos los repositorios
REPOS=(
    "https://github.com/UNIZAR-30226-2026-07/BombaVa-FrontendMovil"
    "https://github.com/UNIZAR-30226-2026-07/BombaVa-FrontendWeb"
    "https://github.com/UNIZAR-30226-2026-07/BombaVa-Backend"
)

for repo in "${REPOS[@]}"
do
    dir_name=$(basename "$repo")
    
    if [ -d "$dir_name" ]; then
        echo "----------------------------------------"
        echo "Sincronizando $dir_name..."
        cd "$dir_name"
        
        git fetch --all
        git reset --hard origin/main
        git clean -fd
        
        cd ..
    else
        echo "----------------------------------------"
        echo "Clonando $dir_name..."
        git clone "$repo"
    fi
done

echo "----------------------------------------"
echo "Ecosistema sincronizado y visible en el directorio actual."
echo "----------------------------------------"