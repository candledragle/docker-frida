DOCKER = docker
IMAGE = sym/docker-frida
frida: Dockerfile
	$(DOCKER) build -t $(IMAGE) .
all: frida
.PHONY: all
