# Replaces everything between the BEGIN KATAS and END KATAS markers in
# README.md with the contents of the file named by `tablefile`.
# Run by `make readme`, which writes the result back to README.md.
/<!-- BEGIN KATAS -->/ {
  print; print "";
  while ((getline line < tablefile) > 0) print line;
  close(tablefile);
  skip = 1; next
}
/<!-- END KATAS -->/ { print ""; skip = 0 }
skip { next }
{ print }
