XAPI_URL="https://github.com/dailypay/xapi/archive/refs/heads/main.zip"
ROOT_DIR := `git rev-parse --show-toplevel`
.PHONY: generate-sdk update-token generate-sdk-local
GITHUB_ACCESS_TOKEN := Bearer $(shell gh auth token)
export GITHUB_ACCESS_TOKEN

#Colors
YELLOW := \033[1;33m
CYAN := \033[1;36m
GREEN := \033[1;32m
NC := \033[0m

define print_banner
	@echo ""
	@echo "$(YELLOW)=========================================$(NC)"
	@echo "$(CYAN)>>> $1$(NC)"
	@echo "$(YELLOW)=========================================$(NC)"
	@echo ""
endef

define print_end_banner
	@echo ""
	@echo "$(YELLOW)=========================================$(NC)"
	@echo "$(GREEN)>>> $1$(NC)"
	@echo "$(YELLOW)=========================================$(NC)"
	@echo ""
endef

#This provides if the user has a connected Github Accound
update-token:
	@echo "$(GREEN)Token is: $$GITHUB_ACCESS_TOKEN$(NC)"

#This will generate the SDK based on source's sdks.openapi.yaml file
generate-sdk:
	$(call print_banner,"Generating .NET 8 SDK using source file")
	@$(MAKE) update-token
	@speakeasy run -t csharp
	@$(MAKE) update-documentation

#The will move the documentation to the root folder and create combined .MDs
update-documentation:
	$(call print_banner,"Updating Documentation")
	@rm -rf $(ROOT_DIR)/documentation
	@mkdir -p $(ROOT_DIR)/documentation
	@node $(ROOT_DIR)/helpers/merge-sdk-mds.js
	$(call print_end_banner,"Documentation built")