.PHONY: generate-sdk update-token

update-token:
	@echo "Updating GH auth token"
	export OAUTH_TOKEN="Bearer ${gh auth token}"    

generate-sdk:
	update-token
	@echo "Generating .NET 8 SDK"
	speakeasy run -t csharp-8