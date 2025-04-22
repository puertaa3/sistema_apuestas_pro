#!/bin/bash

echo "📦 Instalando entorno virtual y dependencias..."

sudo apt update
sudo apt install -y python3.11-venv unzip

cd ~
rm -rf bot-corners
unzip bot-corners-package.zip
cd bot-corners

python3 -m venv venv
source venv/bin/activate

pip install --break-system-packages -r requirements.txt

echo "✅ Instalación de dependencias completada."

echo "🛠️ Configurando servicio systemd..."

SERVICE_PATH="/etc/systemd/system/corners-bot.service"
sudo bash -c "cat > $SERVICE_PATH" << EOF
[Unit]
Description=Corners Bot Service
After=network.target

[Service]
User=$(whoami)
WorkingDirectory=/home/$(whoami)/bot-corners
ExecStart=/home/$(whoami)/bot-corners/venv/bin/python main.py
Restart=always

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl daemon-reexec
sudo systemctl daemon-reload
sudo systemctl enable corners-bot.service
sudo systemctl restart corners-bot.service

echo "🚀 Bot instalado y ejecutándose como servicio."