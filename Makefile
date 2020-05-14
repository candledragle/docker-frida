DOCKER = docker
IMAGE = sym/docker-frida
TAG = 1.0.0
frida: Dockerfile
	$(DOCKER) build -t $(IMAGE):${TAG} .
all: frida
	docker run -v ${PWD}/frida_out:/frida_out ${IMAGE}:${TAG}

test: frida
	docker run -it -v ${PWD}/frida_out:/frida_out ${IMAGE}:${TAG} bash
.PHONY: all
