.PHONY: help check readme install-hooks uninstall-hooks

KATAS := katas/[0-9][0-9][0-9]-*.md

help:
	@awk 'BEGIN { FS = ":.*## "; if (system("test -t 1") == 0) { c = "\033[36m"; r = "\033[0m" } } /^[a-z-]+:.*## / { printf "%s%-15s%s %s\n", c, $$1, r, $$2 }' $(MAKEFILE_LIST)

# Validate the kata frontmatter contract that readme and downstream
# consumers rely on: number present and matching the filename prefix,
# behavior present and non-empty, exactly one H1, and one bold
# closing principle.
check: ## Validate kata metadata and format
	@awk -f scripts/check-katas.awk $(KATAS)

readme: ## Regenerate the README kata table
	@tmp=$$(mktemp); \
	awk -f scripts/kata-table.awk $(KATAS) > "$$tmp"; \
	awk -v tablefile="$$tmp" -f scripts/splice-readme.awk README.md > README.md.tmp && mv README.md.tmp README.md && \
	if [ -t 1 ]; then printf 'README.md  \033[32m✓\033[0m\n'; else printf 'README.md  ✓\n'; fi; \
	rm -f "$$tmp"

# Install/remove the hooks defined in .pre-commit-config.yaml via
# pre-commit (https://pre-commit.com).
install-hooks: ## Install local Git hooks
	pre-commit install --hook-type pre-commit --hook-type commit-msg

uninstall-hooks: ## Remove local Git hooks
	pre-commit uninstall --hook-type pre-commit --hook-type commit-msg
