import asyncio
from telegram import Bot
from telegram.constants import ParseMode

TOKEN = '7774262639:AAErxrrj1-z7bfzCIdgtk0et9CtIbKufJ2I'
CHAT_ID = '6260982564'

async def main():
    bot = Bot(token=TOKEN)
    await bot.send_message(
        chat_id=CHAT_ID,
        text="✅ El bot de apuestas está *activo* y en modo REAL.",
        parse_mode=ParseMode.MARKDOWN
    )

if __name__ == '__main__':
    asyncio.run(main())
