BINARY_NAME=code-epicd
VESRION=git describe --tags


build:
	./cmd/epic-tools.sh -c darwin

run:
	./${BINARY_NAME}

build_and_run: build run

clean:
	go clean
	rm -rf sys/seguridad/private.rsa
	rm -rf sys/seguridad/public.rsa.pub
	rm -rf ${BINARY_NAME}
	rm -rf util/logs/*.log

test:
	go test ./...

test_coverage:
	go test ./... -coverprofile=coverage.out

dep:
	go mod download

