.PHONY: build install bash server

build:
	docker-compose build

install:
	docker-compose run --rm web mix deps.get

bash:
	docker-compose run --rm web bash

server:
	docker-compose run --rm --service-ports web
