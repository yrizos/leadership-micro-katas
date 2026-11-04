# Builds the README kata table from the kata files passed as arguments.
# Run by `make readme`. Reads number and behavior from each frontmatter
# and the title from the first H1, then prints an aligned markdown table
# to stdout.
FNR == 1 && n > 0 { titles[n] = title; fnames[n] = fname; in_fm = 0; fm_done = 0; title = "" }
FNR == 1 { fname = FILENAME; sub(/.*\//, "", fname) }
/^---$/ && !fm_done { in_fm = !in_fm; if (!in_fm) fm_done = 1; next }
in_fm && /^number:/ { sub(/^number:[[:space:]]*/, ""); n++; nums[n] = $0 + 0; next }
in_fm && /^behavior:/ { sub(/^behavior:[[:space:]]*/, ""); behaviors[n] = $0; next }
in_fm { next }
!title && /^# / { sub(/^# /, ""); title = $0 }
END {
  titles[n] = title; fnames[n] = fname;
  kw = 4; bw = 8;
  for (i = 1; i <= n; i++) {
    links[i] = sprintf("[%s](katas/%s)", titles[i], fnames[i]);
    if (length(links[i]) > kw) kw = length(links[i]);
    if (length(behaviors[i]) > bw) bw = length(behaviors[i]);
  }
  hfmt = "| %-3s | %-" kw "s | %-" bw "s |\n";
  rfmt = "| %03d | %-" kw "s | %-" bw "s |\n";
  printf hfmt, "#", "Kata", "Behavior";
  printf "| --- | "; for (i = 1; i <= kw; i++) printf "-"; printf " | "; for (i = 1; i <= bw; i++) printf "-"; printf " |\n";
  for (i = 1; i <= n; i++) printf rfmt, nums[i], links[i], behaviors[i];
}
