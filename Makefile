NAME=inception

up:
	docker-compose -f srcs/docker-compose.yml --env-file srcs/.env up -d

build:
	docker-compose -f srcs/docker-compose.yml --env-file srcs/.env build

down:
	docker-compose -f srcs/docker-compose.yml --env-file srcs/.env down

clean:
	docker-compose -f srcs/docker-compose.yml --env-file srcs/.env down -v

re: clean build up