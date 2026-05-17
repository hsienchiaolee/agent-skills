# Skills Repository

A collection of Claude Code skills (agentic tools).

## Structure

Each skill lives in its own top-level directory:

```
<skill-name>/
  SKILL.md              # skill definition (required)
  evals/evals.json      # eval suite (optional)
  scripts/              # helper scripts (optional)
  references/           # reference docs, schemas, templates (optional)
```

## Conventions

- Skill directories are named with lowercase kebab-case
- Each skill must have a `SKILL.md` with valid frontmatter (`name`, `description`)
- Skills are created and managed via `/skill-creator:skill-creator`
- To install a skill, symlink its directory into `~/.claude/skills/`
