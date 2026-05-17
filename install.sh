#!/usr/bin/env bash
set -euo pipefail

SKILLS_DIR="$HOME/.claude/skills"
REPO_DIR="$(cd "$(dirname "$0")" && pwd)"

mkdir -p "$SKILLS_DIR"

installed=0
skipped=0
names=("$@")

for dir in "$REPO_DIR"/*/; do
  [ -f "$dir/SKILL.md" ] || continue
  name=$(basename "$dir")

  # If specific skills requested, skip others
  if [ ${#names[@]} -gt 0 ]; then
    match=false
    for n in "${names[@]}"; do
      [ "$n" = "$name" ] && match=true && break
    done
    $match || continue
  fi

  target="$SKILLS_DIR/$name"
  if [ -L "$target" ] && [ "$(readlink "$target")" = "$dir" ]; then
    skipped=$((skipped + 1))
  else
    ln -sfn "$dir" "$target"
    echo "  installed: $name"
    installed=$((installed + 1))
  fi
done

echo ""
echo "done — $installed installed, $skipped already up to date"
