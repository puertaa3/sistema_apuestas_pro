import requests
from datetime import datetime
from collections import Counter

LIGAS_IMPORTANTES = [
    "LaLiga EA Sports",
    "Premier League",
    "Serie A",
    "Bundesliga",
    "Ligue 1 Uber Eats",
    "UEFA Champions League",
    "UEFA Europa League",
    "Copa del Rey",
    "FA Cup"
]

def obtener_partidos_en_vivo():
    url = "https://api.sofascore.com/api/v1/sport/football/events/live"
    try:
        response = requests.get(url)
        response.raise_for_status()
        return response.json().get("events", [])
    except Exception as e:
        print(f"[{datetime.now().strftime('%H:%M:%S')}] Error al obtener datos: {e}")
        return []

def main():
    eventos = obtener_partidos_en_vivo()

    # Mostrar resumen por liga detectada
    ligas_vivas = Counter()
    for evento in eventos:
        torneo = evento["tournament"]["name"]
        ligas_vivas[torneo] += 1

    print("\n--- LIGAS DETECTADAS EN VIVO ---")
    for liga, cantidad in ligas_vivas.items():
        print(f"{liga}: {cantidad} partidos")

    print("\n--- PARTIDOS EN LIGAS IMPORTANTES ---")
    encontrados = 0
    for evento in eventos:
        torneo = evento["tournament"]["name"]
        if torneo in LIGAS_IMPORTANTES:
            encontrados += 1
            equipo1 = evento["homeTeam"]["name"]
            equipo2 = evento["awayTeam"]["name"]
            minuto = evento["time"]["minute"] if evento.get("time") else "?"
            print(f"{equipo1} vs {equipo2} - {torneo} - Min {minuto}")

    if encontrados == 0:
        print("No hay partidos activos en ligas importantes.")

if __name__ == "__main__":
    main()
