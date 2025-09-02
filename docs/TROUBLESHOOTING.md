---

### `docs/TROUBLESHOOTING.md`
```markdown
# Решение проблем

## ❌ Контейнер не запускается
- Проверь Docker: `docker info`
- Удали старые контейнеры и тома: `docker-compose down -v`

## ❌ Ошибки с зависимостями
- Запусти `./scripts/setup.sh` внутри контейнера.

## ❌ Не работают dotfiles
- Убедись, что `install.sh` создал симлинки в `$HOME`.
