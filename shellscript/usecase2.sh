#!/bin/bash
source parameter_env_uc2.ini
# Décryptage du fichier ZIP
openssl enc -aes-256-cbc -d -in "$FILE_PATH" -out "${FILE_PATH%.enc}" -k "$PASSWORD"
# Extraction du contenu du fichier ZIP
unzip "${FILE_PATH%.enc}"
# Vérifier si Docker est installé
if ! [ -x "$(command -v docker)" ]; then
  echo "Docker n'est pas installé. Téléchargement et installation..."
  curl -fsSL https://get.docker.com -o get-docker.sh
  sudo sh get-docker.sh
else
  echo "Docker est déjà installé"
fi
if ! docker info >/dev/null 2>&1; then
  echo "Docker Desktop n'est pas en cours d'exécution. Démarrage..."
  # Démarrer Docker Desktop
  open --background -a Docker
else
  echo "Docker Desktop est déjà en cours d'exécution"
fi
