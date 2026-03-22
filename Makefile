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
	      FNR == 1 { sub(/^# /, ""); title = $$0; next } \
	      { body = body (body != "" ? "\n" : "") $$0 } \
	      END { \
	        sub(/^\n+/, "", body); sub(/\n+$$/, "", body); \
	        gsub(/\\/, "\\\\", body); gsub(/"/, "\\\"", body); gsub(/\n/, "\\n", body); \
	        gsub(/\\/, "\\\\", title); gsub(/"/, "\\\"", title); \
	        n = FILENAME; sub(/.*\//, "", n); fname = n; \
	        sub(/-.*/, "", n); sub(/^0+/, "", n); \
	        printf "    {\n"; \
	        printf "      \"number\": %d,\n", n + 0; \
	        printf "      \"title\": \"%s\",\n", title; \
	        printf "      \"kata\": \"%s\",\n", body; \
	        printf "      \"url\": \"https://github.com/yrizos/leadership-micro-katas/blob/main/katas/%s\"\n", fname; \
	        printf "    }"; \
	      }' "$$f"; \
	  done; \
	  printf '\n  ]\n}\n'; \
	} > dist/katas.json
