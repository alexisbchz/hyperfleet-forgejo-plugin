.PHONY: all build test e2e tidy clean

all: build

build:
	go build -o bin/hyperfleet-forgejo-plugin .

test:
	go test ./...

# Run the end-to-end test against a live hyperfleet daemon. Set
# HYPERFLEET_API_URL / HYPERFLEET_API_KEY in your environment.
e2e: build
	HYPERFLEET_E2E=1 \
	HYPERFLEET_PLUGIN_BIN=$(CURDIR)/bin/hyperfleet-forgejo-plugin \
	go test -v -count=1 -run TestEndToEnd .

tidy:
	go mod tidy

clean:
	rm -rf bin/
