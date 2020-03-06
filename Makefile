# Default command to bootstrap (can run `make` command to set up project)
.DEFAULT_GOAL :=  bootstrap

# Initialize Project (should be run before the first run)
bootstrap:
	exec scripts/bootstrap.sh

# Go commands - run the go code directly
build:
	go build -o ../bin/main cmd/main.go

run:
	go run cmd/main.go

# Compile the go code
compile-linux-arm:
	GOOS=linux GOARCH=arm go build -o bin/main-linux-arm cmd/main.go

compile-linux-arm64:
	GOOS=linux GOARCH=arm64 go build -o bin/main-linux-arm64 cmd/main.go

compile-freebsd-386:
	GOOS=freebsd GOARCH=386 go build -o bin/main-freebsd-386 cmd/main.go

compile: compile-linux-arm compile-linux-arm64 compile-freebsd-386

# Container commands - run the docker container
dockerize: build-image

build-image:
	exec docker build

run-image:
	exec docker run

