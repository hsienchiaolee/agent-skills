#!/usr/bin/env bash
set -euo pipefail

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

  # Check both locations even if the corresponding app was uninstalled.
  for skills_dir in "$HOME/.claude/skills" "$HOME/.agents/skills"; do
    target="$skills_dir/$name"
    if [ -L "$target" ] && [ "$(readlink "$target")" = "$dir" ]; then
      rm "$target"
      echo "  removed: $target"
      removed=$((removed + 1))
    fi
  done
done

echo ""
echo "done — $removed removed"
