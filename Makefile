.PHONY: \
	help

## Default
help: ## List available make targets with descriptions.
	@printf "Available targets:\n"
	@grep -hE '.*##\s' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*##"} {printf "  %-16s %s\n", $$1, $$2}'

## Development targets
clean:
	bundle exec jekyll clean --verbose

serve:
	bundle exec jekyll serve --verbose

#--incremental
