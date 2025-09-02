# === Config ===
PROJECT_NAME := my-dev-env
DOCKER_COMPOSE := docker compose
ENV_FILE := .env

# === Phony targets ===
.PHONY: install setup health up down restart logs ps lint format shell test clean help

# === Installation ===
install:
	@echo ">>> Running install script..."
	@bash ./install.sh

setup:
	@echo ">>> Running project setup..."
	@bash ./scripts/setup.sh

health:
	@echo ">>> Running healthcheck..."
	@bash ./scripts/healthcheck.sh

# === Docker ===
up:
	@echo ">>> Starting containers..."
	@$(DOCKER_COMPOSE) --env-file $(ENV_FILE) up -d

down:
	@echo ">>> Stopping containers..."
	@$(DOCKER_COMPOSE) down

restart: down up

logs:
	@$(DOCKER_COMPOSE) logs -f

ps:
	@$(DOCKER_COMPOSE) ps

shell:
	@echo ">>> Opening shell in app container..."
	@$(DOCKER_COMPOSE) exec app bash || true

# === Lint & Format ===
lint:
	@echo ">>> Running lint checks..."
	@pre-commit run --all-files || true

format:
	@echo ">>> Formatting code..."
	@black . || true
	@flake8 . || true

# === Tests ===
test:
	@echo ">>> Running tests..."
	@pytest -v || true

# === Cleanup ===
clean:
	@echo ">>> Removing build artifacts..."
	@rm -rf __pycache__/ .pytest_cache/ dist/ build/ *.egg-info
	@docker system prune -f

db-migrate:
	@bash ./scripts/db.sh migrate

db-studio:
	@bash ./scripts/db.sh studio

db-reset:
	@bash ./scripts/db.sh reset

dev:
	@echo ">>> Starting Next.js in dev mode..."
	@npm run dev

build:
	@echo ">>> Building project..."
	@npm run build

start:
	@echo ">>> Starting project..."
	@npm run start

lint-js:
	@echo ">>> Running ESLint..."
	@eslint . --ext .js,.ts,.tsx

# === Help ===
help:
	@echo ""
	@echo "📌 Available commands:"
	@echo "  make install    - Run environment installer"
	@echo "  make setup      - Run project setup script"
	@echo "  make health     - Run healthcheck script"
	@echo "  make up         - Start docker containers"
	@echo "  make down       - Stop docker containers"
	@echo "  make restart    - Restart docker stack"
	@echo "  make logs       - Tail docker logs"
	@echo "  make ps         - Show docker containers"
	@echo "  make shell      - Open bash inside app container"
	@echo "  make lint       - Run pre-commit hooks"
	@echo "  make format     - Format Python code"
	@echo "  make test       - Run tests"
	@echo "  make clean      - Cleanup cache & docker"
	@echo ""
