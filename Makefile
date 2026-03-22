.PHONY: install-hooks uninstall-hooks dist

# Point this repository at versioned hooks under .githooks/.
install-hooks:
	chmod +x .githooks/commit-msg .githooks/pre-commit
	git config core.hooksPath .githooks

uninstall-hooks:
	git config --unset core.hooksPath || true

dist:
	@mkdir -p dist
	@generated=$$(date -u +%Y-%m-%dT%H:%M:%SZ); \
	{ \
	  printf '{\n'; \
	  printf '  "license": "CC-BY-SA-4.0",\n'; \
	  printf '  "source": "https://github.com/yrizos/leadership-micro-katas",\n'; \
	  printf '  "generated_at": "%s",\n' "$$generated"; \
	  printf '  "katas": [\n'; \
	  first=true; \
	  for f in katas/[0-9][0-9][0-9]-*.md; do \
	    if [ "$$first" = true ]; then first=false; else printf ',\n'; fi; \
	    awk ' \
	      BEGIN { in_fm = 0; fm_done = 0 } \
	      /^---$$/ && !fm_done { in_fm = !in_fm; if (!in_fm) fm_done = 1; next } \
	      in_fm && /^number:/ { sub(/^number:[[:space:]]*/, ""); num = $$0 + 0; next } \
	      in_fm && /^behavior:/ { sub(/^behavior:[[:space:]]*/, ""); behavior = $$0; next } \
	      in_fm { next } \
	      !title && /^# / { sub(/^# /, ""); title = $$0; next } \
	      { body = body (body != "" ? "\n" : "") $$0 } \
	      END { \
	        sub(/^\n+/, "", body); sub(/\n+$$/, "", body); \
	        gsub(/\\/, "\\\\", body); gsub(/"/, "\\\"", body); gsub(/\n/, "\\n", body); \
	        gsub(/\\/, "\\\\", title); gsub(/"/, "\\\"", title); \
	        gsub(/\\/, "\\\\", behavior); gsub(/"/, "\\\"", behavior); \
	        fname = FILENAME; sub(/.*\//, "", fname); \
	        printf "    {\n"; \
	        printf "      \"number\": %d,\n", num; \
	        printf "      \"title\": \"%s\",\n", title; \
	        printf "      \"kata\": \"%s\",\n", body; \
	        printf "      \"behavior\": \"%s\",\n", behavior; \
	        printf "      \"url\": \"https://github.com/yrizos/leadership-micro-katas/blob/main/katas/%s\"\n", fname; \
	        printf "    }"; \
	      }' "$$f"; \
	  done; \
	  printf '\n  ]\n}\n'; \
	} > dist/katas.json
