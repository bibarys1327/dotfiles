# Использование окружения

1. Скопируй `.env.example` в `.env` и настрой значения
2. Установи зависимости:
```bash
make install
3. Запусти окружение:
make up
4. Подключись в контейнер:
docker exec -it ${PROJECT_NAME}_dev zsh



