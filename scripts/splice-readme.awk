/<!-- BEGIN KATAS -->/ {
  print; print "";
  while ((getline line < tablefile) > 0) print line;
  close(tablefile);
  skip = 1; next
}
/<!-- END KATAS -->/ { print ""; skip = 0 }
skip { next }
{ print }
