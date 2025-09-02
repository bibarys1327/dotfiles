# === Config ===
PROJECT_NAME := my-dev-env
DOCKER_COMPOSE := docker compose
ENV_FILE := .env

# === Phony targets ===
.PHONY: install setup health up down restart logs ps shell \
        lint format lint-js dev build start \
        test clean db-migrate db-studio db-reset \
        devcontainer devcontainer-build devcontainer-open \
        help

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
	@$(DOCKER_COMPOSE) exec app zsh || true

# === Lint & Format ===
lint:
	@echo ">>> Running lint checks..."
	@pre-commit run --all-files || true

format:
	@echo ">>> Formatting Python code..."
	@black . || true
	@flake8 . || true

lint-js:
	@echo ">>> Running ESLint..."
	@npx eslint . --ext .js,.ts,.tsx

# === Tests ===
test:
	@echo ">>> Running tests..."
	@pytest -v || true

# === Cleanup ===
clean:
	@echo ">>> Removing build artifacts..."
	@rm -rf __pycache__/ .pytest_cache/ dist/ build/ *.egg-info
	@docker system prune -f

# === Database (Prisma + Postgres) ===
db-migrate:
	@echo ">>> Running Prisma migrations..."
	@pnpm prisma migrate dev

db-studio:
	@echo ">>> Opening Prisma Studio..."
	@pnpm prisma studio

db-reset:
	@echo ">>> Resetting database..."
	@pnpm prisma migrate reset --force

# === JavaScript / Next.js ===
dev:
	@echo ">>> Starting Next.js in dev mode..."
	@pnpm dev

build:
	@echo ">>> Building Next.js project..."
	@pnpm build

start:
	@echo ">>> Starting Next.js project..."
	@pnpm start

# === Devcontainer ===
devcontainer:
	@echo ">>> Starting Devcontainer..."
	@devcontainer up --workspace-folder .

devcontainer-build:
	@echo ">>> Building Devcontainer image..."
	@devcontainer build --workspace-folder .

devcontainer-open:
	@echo ">>> Opening VS Code in Devcontainer..."
	@code --folder-uri "vscode-remote://dev-container+$(PROJECT_NAME)/home/dev/app"

# === Help ===
help:
	@echo ""
	@echo "📌 Available commands:"
	@echo "  make install            - Run environment installer"
	@echo "  make setup              - Run project setup script"
	@echo "  make health             - Run healthcheck script"
	@echo ""
	@echo "🐳 Docker:"
	@echo "  make up                 - Start docker containers"
	@echo "  make down               - Stop docker containers"
	@echo "  make restart            - Restart docker stack"
	@echo "  make logs               - Tail docker logs"
	@echo "  make ps                 - Show docker containers"
	@echo "  make shell              - Open zsh inside app container"
	@echo ""
	@echo "🧹 Lint & Format:"
	@echo "  make lint               - Run Python pre-commit hooks"
	@echo "  make format             - Format Python code (black, flake8)"
	@echo "  make lint-js            - Run ESLint for JS/TS"
	@echo ""
	@echo "🧪 Tests:"
	@echo "  make test               - Run tests"
	@echo ""
	@echo "🗄️ Database (Prisma + Postgres):"
	@echo "  make db-migrate         - Run Prisma migrations"
	@echo "  make db-studio          - Open Prisma Studio"
	@echo "  make db-reset           - Reset database"
	@echo ""
	@echo "⚡ Next.js / Node.js:"
	@echo "  make dev                - Start Next.js in dev mode"
	@echo "  make build              - Build Next.js project"
	@echo "  make start              - Start Next.js project"
	@echo ""
	@echo "🛠️ Devcontainer:"
	@echo "  make devcontainer       - Start Devcontainer"
	@echo "  make devcontainer-build - Build Devcontainer image"
	@echo "  make devcontainer-open  - Open project in VS Code Devcontainer"
	@echo ""
	@echo "🧹 Cleanup:"
	@echo "  make clean              - Cleanup cache & docker"
	@echo ""
