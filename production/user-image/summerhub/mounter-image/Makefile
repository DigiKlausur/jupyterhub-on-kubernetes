IMAGE=mas-datahub-mounter
VERSION=v5

build:
	docker build -t $(IMAGE):$(VERSION) .

push:
	docker push $(IMAGE):$(VERSION)

release: build push
