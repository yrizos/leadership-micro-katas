.PHONY: help check readme install-hooks uninstall-hooks

KATAS := katas/[0-9][0-9][0-9]-*.md

help:
	@printf '%s\n' \
	  'check           Validate kata metadata and format' \
	  'readme          Regenerate the README kata table' \
	  'install-hooks   Install local Git hooks' \
	  'uninstall-hooks Remove local Git hooks'

# Install/remove the hooks defined in .pre-commit-config.yaml via
# pre-commit (https://pre-commit.com).
install-hooks:
	pre-commit install --hook-type pre-commit --hook-type commit-msg

uninstall-hooks:
	pre-commit uninstall --hook-type pre-commit --hook-type commit-msg

# Validate the kata frontmatter contract that readme and downstream
# consumers rely on: number present and matching the filename prefix,
# behavior present and non-empty, exactly one H1, and one bold
# closing principle.
check:
	@awk -f scripts/check-katas.awk $(KATAS)

readme:
	@tmp=$$(mktemp); \
	awk -f scripts/kata-table.awk $(KATAS) > "$$tmp"; \
	awk -v tablefile="$$tmp" -f scripts/splice-readme.awk README.md > README.md.tmp && mv README.md.tmp README.md; \
	rm -f "$$tmp"
