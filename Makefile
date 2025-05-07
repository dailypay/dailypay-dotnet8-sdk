OPENAPI_REPO=https://github.com/dailypay/xapi.git
OPENPI_BRANCH=main
OPENAPI_FILE=sdks.openapi.yaml
OPENAPI_PATH=api/api-docs/out
GEN_CONFIG=.speakeasy.gen.yaml

.PHONY: all get-openapi generate-sdk clean

all: get-openapi-spec generate-sdk

get-openapi-spec:
	@echo "Cloning Repo for API file"
	@if [ -d tmp-openapi ]; then \
		cd tmp-openapi && git pull origin $(OPENAPI_BRANCH); \
	else \
		git clone --branch $(OPENAPI_BRANCH) $(OPENAPI_REPO) tmp-openapi; \
	fi
	@echo "Copying file"
	mkdir -p source
	cp tmp-openapi/$(OPENAPI_FILE) source/$(OPENAPI_FILE)

generate-sdk:
	@echo "Generating .NET 8 SDK"
	speakeasy run -t csharp-8

clean:
	@echo "Cleaning Temp files"
	rm -rf tmp-openapi