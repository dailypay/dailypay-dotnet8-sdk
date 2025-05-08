OPENAPI_REPO=https://github.com/dailypay/xapi.git
OPENAPI_BRANCH=main
OPENAPI_FILE=sdks.openapi.yaml
OPENAPI_PATH=api/api-docs/out
MARKDOWN_PATH=api/api-docs/markdown
GEN_CONFIG=.speakeasy.gen.yaml

.PHONY: all get-repo-info generate-sdk clean

all: get-repo-info generate-sdk clean

get-repo-info:
	@echo "Cloning Repo for API file"
	@if [ -d tmp-openapi ]; then \
		cd tmp-openapi && git pull origin $(OPENAPI_BRANCH); \
	else \
		git clone --branch $(OPENAPI_BRANCH) $(OPENAPI_REPO) tmp-openapi; \
	fi
	@echo "Copying file"
	mkdir -p source
	mkdir -p documentation
	cp tmp-openapi/$(OPENAPI_PATH)/$(OPENAPI_FILE) source/$(OPENAPI_FILE)
	cp -r tmp-openapi/$(MARKDOWN_PATH) documentation

generate-sdk:
	@echo "Generating .NET 8 SDK"
	speakeasy run -t csharp-8

clean:
	@echo "Cleaning Temp files"
	rm -rf tmp-openapi