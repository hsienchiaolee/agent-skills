#!/usr/bin/env bash
set -euo pipefail

SKILLS_DIR="$HOME/.claude/skills"
REPO_DIR="$(cd "$(dirname "$0")" && pwd)"

removed=0
names=("$@")

for dir in "$REPO_DIR"/*/; do
  [ -f "$dir/SKILL.md" ] || continue
  name=$(basename "$dir")

  if [ ${#names[@]} -gt 0 ]; then
    match=false
    for n in "${names[@]}"; do
      [ "$n" = "$name" ] && match=true && break
    done
    $match || continue
  fi

  target="$SKILLS_DIR/$name"
  if [ -L "$target" ] && [ "$(readlink "$target")" = "$dir" ]; then
    rm "$target"
    echo "  removed: $name"
    removed=$((removed + 1))
  fi
done

echo ""
echo "done — $removed removed"
