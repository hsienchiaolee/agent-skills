# Agent Skills

A collection of skills for Claude Code and Codex — reusable agentic capabilities for common workflows.

## Available Skills

<!-- Add skills here as they're created -->

| Skill | Description |
|-------|-------------|
| simplify | Simplify PR, branch, and local code changes while preserving behavior and test coverage |
| review-docs | Review repository documentation for accuracy, readability, and maintenance |
| write-technical-doc | Draft and revise engineering documentation with evidence and reader-focused structure |
| slide-deck | Build polished PowerPoint presentations from structured markdown with extracted design themes |

## Installation

```bash
git clone git@github.com:hsienchiaolee/agent-skills.git
cd agent-skills
./install.sh
```

The installer detects Claude Code and Codex and symlinks each skill into the locations for all detected tools:

- Claude Code: `~/.claude/skills/`
- Codex: `~/.agents/skills/`

Detection checks for the `claude` and `codex` commands on `PATH` or their respective `~/.claude` and `~/.codex` configuration directories. Codex is also detected through `Codex.app` in `/Applications` or `~/Applications` on macOS. If neither tool is detected, installation exits with an error.

Existing symlinks are updated; ordinary files and directories are preserved and reported as conflicts. Since skills are symlinked, existing skills stay up to date automatically — just `git pull` to get the latest changes. If Codex doesn't show a newly installed skill, restart it and invoke the skill with `$skill-name` (for example, `$review-docs`).

To pick up newly added skills after pulling:

```bash
git pull && ./install.sh
```

### Install a single skill

```bash
./install.sh <skill-name>
```

## Uninstall

```bash
./uninstall.sh            # remove all
./uninstall.sh <skill-name>  # remove one
```

Uninstallation checks both tools' skill locations and removes only symlinks pointing to this repository.

## Creating Skills

Skills are built with the `/skill-creator:skill-creator` slash command inside Claude Code. Each skill has:

- **`SKILL.md`** — The skill definition with a `name` and `description` in frontmatter, followed by instructions
- **`agents/openai.yaml`** — Optional Codex UI metadata for skill lists and default prompts
- **`evals/`** — Optional test cases for measuring skill quality
- **`scripts/`** — Optional helper scripts the skill invokes
- **`references/`** — Optional reference docs, schemas, or templates

## License

MIT
