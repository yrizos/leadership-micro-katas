BEGIN {
  if (system("test -t 1") == 0) { green = "\033[32m"; red = "\033[31m"; reset = "\033[0m" }
}
function record(msg) { errs[ec++] = msg }
function finalize() {
  if (current == "") return;
  ec = 0; delete errs;
  if (!have_num) record("missing number");
  else if (num != expected) record("number " num " does not match filename prefix " expected);
  if (!have_beh || beh == "") record("missing or empty behavior");
  if (h1 != 1) record("expected 1 H1, found " h1);
  if (principle != 1) record("expected 1 bold closing principle, found " principle);
  if (have_num) {
    if (num in seen) record("duplicate number " num " (also in " seen[num] ")");
    else seen[num] = current;
  }
  if (ec == 0) printf "%s  %s✓%s\n", current, green, reset;
  else {
    printf "%s  %s✗%s\n", current, red, reset;
    for (i = 0; i < ec; i++) printf "    - %s\n", errs[i];
    status = 1;
  }
}
FNR == 1 {
  finalize();
  current = FILENAME;
  fname = FILENAME; sub(/.*\//, "", fname);
  expected = fname + 0;
  in_fm = 0; fm_done = 0; have_num = 0; have_beh = 0; h1 = 0; principle = 0; num = ""; beh = "";
}
/^---$/ && !fm_done { in_fm = !in_fm; if (!in_fm) fm_done = 1; next }
in_fm && /^number:/ { sub(/^number:[[:space:]]*/, ""); num = $0 + 0; have_num = 1; next }
in_fm && /^behavior:/ { sub(/^behavior:[[:space:]]*/, ""); beh = $0; have_beh = 1; next }
/^# / { h1++ }
/^\*\*.*\*\*$/ { principle++ }
END { finalize(); exit status }
