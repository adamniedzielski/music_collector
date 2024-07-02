.PHONY: build install bash server test

build:
	docker-compose build

install:
	docker-compose run --rm web mix deps.get

bash:
	docker-compose run --rm web bash

server:
	docker-compose run --rm --service-ports web

test:
	docker-compose run --rm web mix test
