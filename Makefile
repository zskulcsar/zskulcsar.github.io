.PHONY: \
	help \
	build \
	clean \
	deploy \
	serve

## Default
help: ## List available make targets with descriptions.
	@printf "Available targets:\n"
	@grep -hE '.*##\s' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*##"} {printf "  %-16s %s\n", $$1, $$2}'

## Development targets
clean: ## Remove generated site output.
	rm -rf _site

build: ## Build the static site into ./site.
	bundle exec jekyll build

serve: ## Run the local development server.
	bundle exec jekyll serve

