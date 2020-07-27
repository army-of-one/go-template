# Default command to bootstrap (can run `make` command to set up project)
.DEFAULT_GOAL :=  bootstrap

# Initialize Project (should be run before the first run)
bootstrap:
	exec sudo scripts/bootstrap.sh

# Go commands - run the go code directly
build:
	exec go build -o ../bin/main cmd/main.go

run:
	exec go run cmd/main.go

########################################################################################################################
# Compile the go code
########################################################################################################################

compile: compile-linux compile-darwin compile-windows

compile-linux: compile-linux-amd64 compile-linux-arm
compile-darwin: compile-darwin-amd64
compile-windows: compile-windows-amd64

compile-darwin-amd64:
	env CGO_ENABLED=0 GOOS=darwin GOARCH=amd64 go build -a -ldflags '-w' -o bin/{{executable_name}}-darwin-amd64 cmd/main.go

compile-linux-amd64:
	env CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -a -ldflags '-w' -o bin/{{executable_name}}-linux-amd64 cmd/main.go

compile-linux-arm:
	env CGO_ENABLED=0 GOOS=linux GOARCH=arm go build -a -ldflags '-w' -o bin/{{executable_name}}-linux-arm cmd/main.go

compile-windows-amd64:
	env CGO_ENABLED=0 GOOS=windows GOARCH=amd64 build -ldflags '-w' -o bin/{{executable_name}}-windows-amd64 cmd/main.go

# Swagger commands - generate swagger contracts and models

from-swagger: swagger-gen go-mod swagger-ui

swagger-gen:
	exec ./scripts/start.sh

# Line up the port with the application: https://goswagger.io/usage/serve_ui.html
swagger-ui:
	swagger serve api/swagger.yml -F swagger

redoc-ui:
	swagger serve api/swagger.yml

# Container commands - run the docker container
dockerize: build-image

build-image:
	exec docker build

run-image:
	exec docker run

go-mod:
	go mod vendor
	go mod tidy

