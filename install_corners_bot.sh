#!/bin/bash

echo "🔧 Actualizando sistema e instalando dependencias necesarias..."
sudo apt update && sudo apt install -y python3 python3-pip unzip

echo "📦 Descomprimiendo el paquete..."
unzip corners_bot_package_final.zip -d corners_bot
cd corners_bot/corners_bot

echo "🐍 Instalando dependencias de Python..."
pip3 install -r requirements.txt

echo "🗂️ Creando carpeta de logs..."
mkdir -p logs

echo "⚙️ Instalando el servicio del bot..."
sudo mv corners-bot.service /etc/systemd/system/
sudo systemctl daemon-reexec
sudo systemctl daemon-reload
sudo systemctl enable corners-bot
sudo systemctl start corners-bot

echo "✅ Sistema iniciado. Verificando estado del servicio..."
sudo systemctl status corners-bot
