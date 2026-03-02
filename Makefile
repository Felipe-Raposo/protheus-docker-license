export DOCKER_BUILDKIT := 1

IMAGE_REPO := feliperaposo
NAME := $(IMAGE_REPO)/protheus-license
VERSION := 3
MINOR_VERSION := 3.7.0

.PHONY: build release release_latest

build:
	docker image build -t $(NAME):$(VERSION) -t $(NAME):$(MINOR_VERSION) -t $(NAME):latest .

release: build
	docker image push $(NAME):$(VERSION)
	docker image push $(NAME):$(MINOR_VERSION)

release_latest: release
	docker image push $(NAME):latest
