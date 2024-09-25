all: build
image=registry.bizsaas.net/rocketmq:5.3.0
build:
	cp ../target/*.tar.gz ./ ;\
    docker build -t $(image) .;\
    rm -rf *.tar.gz;
push:
	cp ../target/*.tar.gz ./ ;\
    docker buildx build --pull --platform linux/amd64,linux/arm64 -t $(image) . --push;\
    rm -rf *.tar.gz;
inspect:
	docker buildx imagetools inspect $(image)