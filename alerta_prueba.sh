#!/bin/bash
cd "$(dirname "$0")"
source venv/bin/activate

echo "📤 Enviando alerta de prueba al Telegram..."

PYTHONPATH=. python3 -c "
from utils.alertas import enviar_alerta
try:
    enviar_alerta('✅ Alerta de prueba enviada correctamente desde el servidor.')
    print('✔️ Alerta enviada con éxito al Telegram.')
except Exception as e:
    print(f'❌ Error al enviar alerta: {e}')
"
