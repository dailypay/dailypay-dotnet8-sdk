XAPI_URL="https://github.com/dailypay/xapi/archive/refs/heads/main.zip"

.PHONY: generate-sdk update-token update-markdown-documentation

OAUTH_TOKEN := Bearer $(shell gh auth token)
export OAUTH_TOKEN

update-token:
	@echo "Updating GH auth token"
	@echo "Token is: $$OAUTH_TOKEN"

generate-sdk:
	@$(MAKE) update-token
	@echo "Generating .NET 8 SDK"
	@speakeasy run -t csharp-8

update-documentation:
	@echo "Downloading Zip..."
	curl -L "$(XAPI_URL)" -H "Authorization: $(OAUTH_TOKEN)" -o xapi.zip
	unzip xapi.zip -d tmp-xapi
	mkdir -p documentation
	cp -r tmp-xapi/xapi-main/api/api-docs/markdown/* documentation/
	rm -rf tmp-xapi xapi.zip