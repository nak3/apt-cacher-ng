build:
	bash hack/build.sh
.PHONY: build
build-src:
	bash hack/build-src.sh
remove:
	bash hack/docker-remove.sh
run:
	bash hack/run.sh
