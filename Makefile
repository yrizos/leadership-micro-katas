.PHONY: install-hooks uninstall-hooks check readme

# Point this repository at versioned hooks under .githooks/.
install-hooks:
	chmod +x .githooks/commit-msg .githooks/pre-commit
	git config core.hooksPath .githooks

uninstall-hooks:
	git config --unset core.hooksPath || true

# Validate the kata frontmatter contract that readme and downstream
# consumers rely on: number present and matching the filename prefix,
# behavior present and non-empty, exactly one H1, and one bold
# closing principle.
check:
	@awk ' \
	  BEGIN { \
	    if (system("test -t 1") == 0) { green = "\033[32m"; red = "\033[31m"; reset = "\033[0m" } \
	  } \
	  function record(msg) { errs[ec++] = msg } \
	  function finalize() { \
	    if (current == "") return; \
	    ec = 0; delete errs; \
	    if (!have_num) record("missing number"); \
	    else if (num != expected) record("number " num " does not match filename prefix " expected); \
	    if (!have_beh || beh == "") record("missing or empty behavior"); \
	    if (h1 != 1) record("expected 1 H1, found " h1); \
	    if (principle != 1) record("expected 1 bold closing principle, found " principle); \
	    if (have_num) { \
	      if (num in seen) record("duplicate number " num " (also in " seen[num] ")"); \
	      else seen[num] = current; \
	    } \
	    if (ec == 0) printf "%s  %s✓%s\n", current, green, reset; \
	    else { \
	      printf "%s  %s✗%s\n", current, red, reset; \
	      for (i = 0; i < ec; i++) printf "    - %s\n", errs[i]; \
	      status = 1; \
	    } \
	  } \
	  FNR == 1 { \
	    finalize(); \
	    current = FILENAME; \
	    fname = FILENAME; sub(/.*\//, "", fname); \
	    expected = fname + 0; \
	    in_fm = 0; fm_done = 0; have_num = 0; have_beh = 0; h1 = 0; principle = 0; num = ""; beh = ""; \
	  } \
	  /^---$$/ && !fm_done { in_fm = !in_fm; if (!in_fm) fm_done = 1; next } \
	  in_fm && /^number:/ { sub(/^number:[[:space:]]*/, ""); num = $$0 + 0; have_num = 1; next } \
	  in_fm && /^behavior:/ { sub(/^behavior:[[:space:]]*/, ""); beh = $$0; have_beh = 1; next } \
	  /^# / { h1++ } \
	  /^\*\*.*\*\*$$/ { principle++ } \
	  END { finalize(); exit status }' katas/[0-9][0-9][0-9]-*.md

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
	  /<!-- BEGIN KATAS -->/ { \
	    print; print ""; \
	    while ((getline line < tablefile) > 0) print line; \
	    close(tablefile); \
	    skip = 1; next \
	  } \
	  /<!-- END KATAS -->/ { print ""; skip = 0 } \
	  skip { next } \
	  { print } \
	' README.md > README.md.tmp && mv README.md.tmp README.md; \
	rm -f "$$tmp"
