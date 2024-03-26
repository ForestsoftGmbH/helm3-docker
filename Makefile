DOCKER_IMAGE = "forestsoft/helm3-docker"

build-docker:
	docker build -t $(DOCKER_IMAGE) .

bash:
	docker run -it --rm $(DOCKER_IMAGE) bash

.PHONY: build-docker