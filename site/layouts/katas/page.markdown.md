{{ .RawContent | strings.TrimSpace | replaceRE `(?m)^# (.+)$` "# ${1}\n\n## Kata" }}
{{ with site.GetPage (printf "/examples/%s" .File.ContentBaseName) }}
{{ .RawContent | strings.TrimSpace | replaceRE `(?m)^(##+) ` "#${1} " | replaceRE `(?m)^# (.+)$` "## Example: ${1}" }}
{{ end -}}
