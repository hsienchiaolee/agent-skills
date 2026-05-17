# Agent Skills

A collection of [Claude Code](https://docs.anthropic.com/en/docs/claude-code) skills — reusable agentic capabilities that extend what Claude can do in your terminal.

## Available Skills

<!-- Add skills here as they're created -->

| Skill | Description |
|-------|-------------|
| — | — |

## Installation

```bash
git clone git@github.com:hsienchiaolee/agent-skills.git
cd agent-skills
./install.sh
```

This symlinks each skill into `~/.claude/skills/`. Since they're symlinks, existing skills stay up to date automatically — just `git pull` to get the latest changes.

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

## Creating Skills

Skills are built with the `/skill-creator:skill-creator` slash command inside Claude Code. Each skill has:

- **`SKILL.md`** — The skill definition with a `name` and `description` in frontmatter, followed by instructions
- **`evals/`** — Optional test cases for measuring skill quality
- **`scripts/`** — Optional helper scripts the skill invokes
- **`references/`** — Optional reference docs, schemas, or templates

## License

MIT
