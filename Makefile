build:
	docker compose build --no-cache

up:
	docker compose up -d web

down:
	docker compose down --remove-orphans