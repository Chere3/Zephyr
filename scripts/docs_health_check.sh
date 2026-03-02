#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

required_dirs=(Daily Growth Feelings Projects Skills Systems Templates Archive)

for dir in "${required_dirs[@]}"; do
  if [[ ! -d "$dir" ]]; then
    echo "❌ Missing required directory: $dir"
    exit 1
  fi
done

shopt -s nullglob
for file in Daily/*.md; do
  base=$(basename "$file")
  if [[ ! "$base" =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}([_-].+)?\.md$ ]]; then
    echo "❌ Daily note does not match YYYY-MM-DD(-suffix).md: $file"
    exit 1
  fi
done

for required_file in README.md ROADMAP.md CONTRIBUTING.md INDEX.md; do
  [[ -f "$required_file" ]] || { echo "❌ Missing $required_file"; exit 1; }
done

echo "✅ Zephyr docs health check passed"
