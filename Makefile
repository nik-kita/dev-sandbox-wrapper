ifneq (,$(wildcard .env))
    include .env
    export
endif

PROJECT_NAME ?= dev-sandbox
APP_CONTAINER_NAME ?= $(PROJECT_NAME)-app-1
ENVS = PROJECT_NAME=$(PROJECT_NAME) APP_CONTAINER_NAME=$(APP_CONTAINER_NAME)

build-no-cache:
		$(ENVS) docker compose -p $(PROJECT_NAME) build --no-cache

build:
		$(ENVS) docker compose -p $(PROJECT_NAME) build

up:
		$(ENVS) docker compose -p $(PROJECT_NAME) up -d

down:
		$(ENVS) docker compose -p $(PROJECT_NAME) down

fmt:
		deno fmt
		deno lint --fix

repl:
		docker exec -it $(APP_CONTAINER_NAME) bash
