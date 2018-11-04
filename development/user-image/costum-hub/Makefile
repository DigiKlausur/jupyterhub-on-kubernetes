VERSION=1.0.0.beta.0
IMAGE=gcr.io/mas-datahub/costum-jupyterhub

release: VERSION=$(shell  git tag -l --points-at HEAD)

build:
	docker build -t $(IMAGE):$(VERSION) .

push:
	docker push $(IMAGE):$(VERSION)

release: build push

