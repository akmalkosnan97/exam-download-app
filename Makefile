.PHONY: help build up down logs clean restart ps shell

help:
	@echo "📚 Exam Download App - Docker Commands"
	@echo ""
	@echo "Usage: make [command]"
	@echo ""
	@echo "Commands:"
	@echo "  build           Build Docker images"
	@echo "  up              Start all containers"
	@echo "  down            Stop all containers"
	@echo "  ps              Show running containers"
	@echo "  logs            Show container logs"
	@echo "  logs-backend    Show backend logs"
	@echo "  logs-frontend   Show frontend logs"
	@echo "  logs-db         Show database logs"
	@echo "  clean           Remove all containers and volumes"
	@echo "  restart         Restart all containers"
	@echo "  shell-backend   Open shell in backend container"
	@echo "  shell-frontend  Open shell in frontend container"
	@echo "  shell-db        Open PostgreSQL shell"
	@echo "  db-reset        Reset database"
	@echo ""

build:
	docker-compose build

up:
	docker-compose up -d
	@echo ""
	@echo "✅ All services are running!"
	@echo ""
	@echo "🌐 Frontend: http://localhost:5173"
	@echo "📡 Backend API: http://localhost:5000/api"
	@echo "🗄️  Database: localhost:5432"
	@echo "📊 pgAdmin: http://localhost:5050"
	@echo ""

down:
	docker-compose down

ps:
	docker-compose ps

logs:
	docker-compose logs -f

logs-backend:
	docker-compose logs -f backend

logs-frontend:
	docker-compose logs -f frontend

logs-db:
	docker-compose logs -f postgres

clean:
	docker-compose down -v
	@echo "✅ All containers and volumes removed"

restart:
	docker-compose restart

shell-backend:
	docker-compose exec backend sh

shell-frontend:
	docker-compose exec frontend sh

shell-db:
	docker-compose exec postgres psql -U postgres -d exam_download_db

db-reset:
	docker-compose exec postgres psql -U postgres -d exam_download_db -f /docker-entrypoint-initdb.d/schema.sql
	@echo "✅ Database reset"

# Additional helpful commands
status:
	docker-compose ps

test-backend:
	docker-compose exec backend npm test

test-frontend:
	docker-compose exec frontend npm test
