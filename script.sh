#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

usage() {
  cat <<EOF
Usage: $(basename "$0") [-o output_file] [root]
  -o FILE    Write output to FILE (default: output.txt)
  root       Directory to scan (default: current directory)
EOF
  exit 1
}

OUTPUT_FILE=output.txt
PROJECT_ROOT=.

while getopts ":o:" opt; do
  case $opt in
    o) OUTPUT_FILE=$OPTARG ;;
    *) usage ;;
  esac
done
shift $((OPTIND-1))

[[ $# -gt 1 ]] && usage
[[ $# -eq 1 ]] && PROJECT_ROOT=$1

: > "$OUTPUT_FILE"
FIRST=true

find "$PROJECT_ROOT" -type f ! -path "$PROJECT_ROOT/$OUTPUT_FILE" -print | sort | while read -r RAW; do
  SRC=${RAW//\\//}

  if $FIRST; then
    FIRST=false
  else
    printf '\n\n' >> "$OUTPUT_FILE"
  fi

  printf 'File: %s\n\n' "${SRC#"$PROJECT_ROOT"/}" >> "$OUTPUT_FILE"
  cat "$SRC" >> "$OUTPUT_FILE"
done

printf '✅ Generated file: %s\n' "$OUTPUT_FILE"
