.PHONY: help check fix lint readme site pdf hooks-install hooks-uninstall

KATAS := katas/[0-9][0-9][0-9]-*.md

help:
	@awk 'BEGIN { FS = ": ## "; if (system("test -t 1") == 0) { c = "\033[36m"; r = "\033[0m" } } /^[a-z\\:-]+: ## / { name = $$1; gsub(/\\/, "", name); printf "%s%-15s%s %s\n", c, name, r, $$2 }' $(MAKEFILE_LIST)

# Validate the kata frontmatter contract that readme and downstream
# consumers rely on: number present and matching the filename prefix,
# behavior present and non-empty, first published date present and
# non-empty, exactly one H1, and one bold closing principle.
check: ## Validate kata metadata and format
	@awk -f scripts/check-katas.awk $(KATAS)

fix: readme ## Fix trailing whitespace and line endings, and regenerate the README kata table
	@status=0; \
	pre-commit run trailing-whitespace --all-files || status=1; \
	pre-commit run mixed-line-ending --all-files || status=1; \
	exit $$status

lint: ## Run all linters and report problems
	@status=0; \
	for h in check-merge-conflict check-yaml checkmake shellcheck actionlint; do pre-commit run $$h --all-files || status=1; done; \
	$(MAKE) -s check || status=1; \
	exit $$status

readme: ## Regenerate the README kata table
	@tmp=$$(mktemp); \
	awk -f scripts/kata-table.awk $(KATAS) > "$$tmp"; \
	awk -v tablefile="$$tmp" -f scripts/splice-readme.awk README.md > README.md.tmp && mv README.md.tmp README.md && \
	if [ -t 1 ]; then printf 'README.md  \033[32m✓\033[0m\n'; else printf 'README.md  ✓\n'; fi; \
	rm -f "$$tmp"

site: ## Run the Hugo site locally
	hugo server --source site

# Build the site, render the print page to a PDF next to it, and drop
# the print page so it is not published. Pass BASE_URL to override
# the baseURL in site/hugo.toml.
pdf: ## Build the site and its PDF
	hugo --source site --minify $(if $(BASE_URL),--baseURL "$(BASE_URL)")
	weasyprint --pdf-variant pdf/a-3a --custom-metadata site/public/print.html site/public/leadership-micro-katas.pdf
	rm site/public/print.html

# Install/remove the hooks defined in .pre-commit-config.yaml via
# pre-commit (https://pre-commit.com).
hooks-install: ## Install local Git hooks
	pre-commit install --hook-type pre-commit --hook-type commit-msg

hooks-uninstall: ## Remove local Git hooks
	pre-commit uninstall --hook-type pre-commit --hook-type commit-msg
