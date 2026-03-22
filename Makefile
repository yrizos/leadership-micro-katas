.PHONY: install-hooks uninstall-hooks dist readme

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

readme:
	@tmp=$$(mktemp); \
	awk ' \
	  FNR == 1 && n > 0 { titles[n] = title; fnames[n] = fname; in_fm = 0; fm_done = 0; title = "" } \
	  FNR == 1 { fname = FILENAME; sub(/.*\//, "", fname) } \
	  /^---$$/ && !fm_done { in_fm = !in_fm; if (!in_fm) fm_done = 1; next } \
	  in_fm && /^number:/ { sub(/^number:[[:space:]]*/, ""); n++; nums[n] = $$0 + 0; next } \
	  in_fm && /^behavior:/ { sub(/^behavior:[[:space:]]*/, ""); behaviors[n] = $$0; next } \
	  in_fm { next } \
	  !title && /^# / { sub(/^# /, ""); title = $$0 } \
	  END { \
	    titles[n] = title; fnames[n] = fname; \
	    kw = 4; bw = 8; \
	    for (i = 1; i <= n; i++) { \
	      links[i] = sprintf("[%s](katas/%s)", titles[i], fnames[i]); \
	      if (length(links[i]) > kw) kw = length(links[i]); \
	      if (length(behaviors[i]) > bw) bw = length(behaviors[i]); \
	    } \
	    hfmt = "| %-3s | %-" kw "s | %-" bw "s |\n"; \
	    rfmt = "| %03d | %-" kw "s | %-" bw "s |\n"; \
	    printf hfmt, "#", "Kata", "Behavior"; \
	    printf "| --- | "; for (i = 1; i <= kw; i++) printf "-"; printf " | "; for (i = 1; i <= bw; i++) printf "-"; printf " |\n"; \
	    for (i = 1; i <= n; i++) printf rfmt, nums[i], links[i], behaviors[i]; \
	  }' katas/[0-9][0-9][0-9]-*.md > "$$tmp"; \
	awk -v tablefile="$$tmp" ' \
	  /^\|/ && !replaced { \
	    while ((getline line < tablefile) > 0) print line; \
	    close(tablefile); \
	    replaced = 1; skip = 1; next \
	  } \
	  skip && /^\|/ { next } \
	  skip && !/^\|/ { skip = 0 } \
	  { print } \
	' README.md > README.md.tmp && mv README.md.tmp README.md; \
	rm -f "$$tmp"
