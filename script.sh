#!/usr/bin/env bash

set -euo pipefail

output_file="output.txt"
project_root="."
blacklist_file=""

while getopts "o:b:i:" flag; do
  case "${flag}" in
    o) output_file="${OPTARG}" ;;
    b) blacklist_file="${OPTARG}" ;;
    *) exit 1 ;;
  esac
done

shift $((OPTIND - 1))

if [ "$#" -gt 1 ]; then
  exit 1
elif [ "$#" -eq 1 ]; then
  project_root="$1"
fi

prune_expressions=()

if [ -n "$blacklist_file" ]; then
  mapfile -t ignore_patterns < <(sed -e 's/^[[:space:]]\+//; s/[[:space:]]\+$//' -e '/^#/d' -e '/^$/d' -e 's@/*$@@' "$blacklist_file")

  for pattern in "${ignore_patterns[@]}"; do
    pattern=${pattern#/}
    prune_expressions+=( -path "${project_root}/${pattern}" -prune -o )
  done
fi

: > "$output_file"

find_arguments=( "$project_root" "${prune_expressions[@]}" -type f ! -path "${project_root}/${output_file}" -print )

mapfile -t files < <(find "${find_arguments[@]}" | sort)

for filepath in "${files[@]}"; do
  filepath=${filepath//\\//}
  relative_path=${filepath#"${project_root}/"}

  {
    echo "File: $relative_path"
    echo
    cat "$filepath"
    echo
  } >> "$output_file"
done

echo "Generated file: $output_file"
