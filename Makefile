XAPI_URL="https://github.com/dailypay/xapi/archive/refs/heads/main.zip"
ROOT_DIR := `git rev-parse --show-toplevel`

.PHONY: generate-sdk update-token generate-sdk-local

GITHUB_ACCESS_TOKEN := Bearer $(shell gh auth token)
export GITHUB_ACCESS_TOKEN

update-token:
	@echo "Updating GH auth token"
	@echo "Token is: $$GITHUB_ACCESS_TOKEN"

generate-sdk:
	@$(MAKE) update-token
	@echo "Generating .NET 8 SDK using xapi file"
	@speakeasy run -t csharp
	@$(MAKE) update-documentation

generate-sdk-local:
	@echo "Generating .NET 8 SDK using Local File"
	@speakeasy run -t local-csharp
	@$(MAKE) update-documentation

update-documentation:
	@echo "Updating Documentation"
	rm -rf documentation
	mkdir -p documentation
	node $(ROOT_DIR)/helpers/merge-sdk-mds.js;