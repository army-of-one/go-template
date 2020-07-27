#!/bin/bash

cd -P -- "$(dirname -- "$0")" && pwd -P

alias swagger="docker run --rm -it -e GOPATH=$GOPATH:/go -v $HOME:$HOME -w $(pwd) quay.io/goswagger/swagger"; \
swagger version; \
swagger generate server -t ../ -f ../api/swagger.yml -a internal/operations -m pkg/model -s internal/server -A {{project_name}};
swagger generate client -t ../ -f ../api/swagger.yml -a internal/operations -m pkg/model -c pkg/client -A {{project_name}};