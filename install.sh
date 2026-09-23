#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"

skill_roots=()
if command -v claude >/dev/null 2>&1 || [ -d "$HOME/.claude" ]; then
  skill_roots+=("$HOME/.claude/skills")
fi
if command -v codex >/dev/null 2>&1 || [ -d "$HOME/.codex" ] ||
  [ -d /Applications/Codex.app ] || [ -d "$HOME/Applications/Codex.app" ]; then
  skill_roots+=("$HOME/.agents/skills")
fi

if [ ${#skill_roots[@]} -eq 0 ]; then
  echo "No Claude Code or Codex installation detected." >&2
  exit 1
fi

installed=0
skipped=0
conflicts=0
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

  for skills_dir in "${skill_roots[@]}"; do
    mkdir -p "$skills_dir"
    target="$skills_dir/$name"
    if [ -L "$target" ] && [ "$(readlink "$target")" = "$dir" ]; then
      skipped=$((skipped + 1))
    elif [ -e "$target" ] && [ ! -L "$target" ]; then
      echo "  conflict: $target already exists and is not a symlink" >&2
      conflicts=$((conflicts + 1))
    else
      ln -sfn "$dir" "$target"
      echo "  installed: $target"
      installed=$((installed + 1))
    fi
  done
done

echo ""
echo "done — $installed installed, $skipped already up to date, $conflicts conflicts"
[ "$conflicts" -eq 0 ]
