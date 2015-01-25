
container_name = "nginx-proxy"

all: stop build run

stop:
	docker kill $(container_name) && docker rm $(container_name);

build:
	docker build -t $(container_name) .

run:
	docker run -d -p 80:80 -v /var/run/docker.sock:/tmp/docker.sock --name $(container_name) -t $(container_name) && docker logs $(container_name);
