#!/bin/bash
echo "🔧 Instalando sistema profesional de apuestas..."
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
echo "✅ Sistema instalado. Ejecuta con: source venv/bin/activate && python3 main.py"
