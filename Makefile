DOCKER_COMPOSE = docker-compose -f .docker/docker-compose.yml

up:
	$(DOCKER_COMPOSE) up -d --build

down:
	$(DOCKER_COMPOSE) down

restart:
	$(DOCKER_COMPOSE) down && $(DOCKER_COMPOSE) up -d --build

logs:
	$(DOCKER_COMPOSE) logs -f --tail=100

bash:
	$(DOCKER_COMPOSE) exec php bash

nginx:
	$(DOCKER_COMPOSE) exec nginx sh

mysql:
	$(DOCKER_COMPOSE) exec mysql bash

sf:
	$(DOCKER_COMPOSE) exec php php bin/console

migrate:
	$(DOCKER_COMPOSE) exec php php bin/console doctrine:migrations:migrate --no-interaction

fixtures:
	$(DOCKER_COMPOSE) exec php php bin/console doctrine:fixtures:load --no-interaction

composer:
	$(DOCKER_COMPOSE) run --rm php composer

symfony:
	$(DOCKER_COMPOSE) run --rm php composer create-project symfony/skeleton:"6.4.*" .

build:
	$(DOCKER_COMPOSE) build

prune:
	$(DOCKER_COMPOSE) down -v --remove-orphans

reset: prune up migrate fixtures

