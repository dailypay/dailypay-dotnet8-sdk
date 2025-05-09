.PHONY: generate-sdk update-token

OAUTH_TOKEN := Bearer $(shell gh auth token)
export OAUTH_TOKEN

update-token:
	@echo "Updating GH auth token"
	@echo "Token is: $$OAUTH_TOKEN"
	
generate-sdk:
	@$(MAKE) update-token
	@echo "Generating .NET 8 SDK"
	@speakeasy run -t csharp-8