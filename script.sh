#!/usr/bin/env bash

set -euo pipefail

usage() {
  echo "Usage: $(basename "$0") [-o output_file] [root]"
  echo "  -o FILE    Output file (default: output.txt)"
  echo "  root       Directory to scan (default: current directory)"
  exit 1
}

OUTPUT_FILE=output.txt
PROJECT_ROOT=.

while getopts "o:" opt; do
  case $opt in
    o) OUTPUT_FILE=$OPTARG ;;
    *) usage ;;
  esac
done
shift $((OPTIND-1))

if [ $# -gt 1 ]; then usage; fi
if [ $# -eq 1 ]; then PROJECT_ROOT=$1; fi

> "$OUTPUT_FILE"

mapfile -t files < <(find "$PROJECT_ROOT" -type f ! -path "$PROJECT_ROOT/$OUTPUT_FILE" | sort)

for FILE_PATH in "${files[@]}"; do
  FILE_PATH=${FILE_PATH//\\//}
  RELATIVE_PATH=${FILE_PATH#"$PROJECT_ROOT"/}

  {
    echo "File: $RELATIVE_PATH"
    echo ""
    cat "$FILE_PATH"
    echo ""
  } >> "$OUTPUT_FILE"
done

echo "✅ Generated file: $OUTPUT_FILE"
