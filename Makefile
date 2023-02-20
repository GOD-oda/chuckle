.PHONY: build
build:
	docker compose build --no-cache

.PHONY: up
up:
	docker compose up -d web

.PHONY: down
down:
	docker compose down --remove-orphans