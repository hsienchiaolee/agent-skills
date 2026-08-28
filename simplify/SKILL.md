---
name: simplify
description: Simplify code and tests changed by the current pull request, branch, commit range, or local working tree while preserving behavior. Use when the user invokes simplify, asks to clean up or refactor recent changes, reduce duplication or complexity, improve clarity and maintainability, or perform a focused simplification pass before review or commit.
---

# Simplify Changed Code

Refine the selected change set in place. Prefer the smallest clear design that
preserves observable behavior, project conventions, and useful test coverage.
Make edits when worthwhile; do not stop at a review report.

## Establish the scope

1. Read the repository instructions and identify its required checks.
2. Honor an explicit user-provided commit, range, branch, or path scope.
3. Otherwise determine the comparison base without fetching or mutating Git:
   - On a pull-request or non-default branch, prefer the PR base from available
     metadata. Fall back to the remote default branch, then local `main` or
     `master`. Include committed changes since the merge base.
   - On the default branch, include commits ahead of its upstream when an
     upstream exists. Do not revisit unrelated already-pushed history.
4. Add all staged, unstaged, and untracked changes to that committed scope.
5. If the scope is empty, report that there is nothing to simplify and stop.
6. State exactly which range and local changes are included. Treat the initial
   diff as the intended behavior and changed paths as the editing boundary.

Read the complete diff before editing. Inspect surrounding code, callers,
scenes, and tests only as needed to understand the changed behavior. Modify an
adjacent file only when the simplification cannot remain coherent without it;
call out that scope expansion.

## Confirm the baseline

Run the repository's required checks before editing. If the baseline is red,
stop and report the failure rather than refactoring on top of it.

## Look for meaningful simplifications

Evaluate production code and tests with three concerns in mind:

- **Reuse:** Prefer an existing project helper or idiom over new duplicate
  logic. Consolidate repeated concepts, not merely similar-looking syntax.
- **Clarity:** Reduce avoidable nesting, branches, state, indirection,
  boilerplate, stale comments, and misleading names. Keep responsibilities
  coherent and execution paths easy to trace.
- **Efficiency:** Remove demonstrably redundant work, allocations, or repeated
  lookups when the result is also at least as readable. Avoid speculative
  micro-optimization.

Prefer direct code:

- Do not create or preserve single-line pass-through functions. Update callers
  to invoke the underlying operation directly. If an external API or framework
  requires the callable, leave that boundary intact rather than adding another
  wrapper.
- Inline a function or variable used only once when it merely renames a simple
  operation or fragments the local flow. Keep a single-use helper only when its
  logic is complex enough that a precise name materially improves understanding.
- Keep code DRY, but extract shared logic only when it represents one stable
  concept. Do not trade small duplication for indirection or hidden coupling.

Apply project-specific standards from repository instructions and nearby code.
Do not launch parallel review subagents unless the user explicitly asks for
them; this is a focused editing workflow, not an independent code review.

## Preserve behavior

- Preserve public APIs, outputs, errors, ordering, timing-sensitive behavior,
  side effects, serialization formats, and saved-data compatibility.
- Treat string and data literals as behavior. Do not rewrite user-facing text,
  error messages, keys, paths, prompts, fixtures, or snapshots merely for style.
- For Godot changes, preserve node paths and names, exported properties,
  resources, signals, input mappings, scene-tree lifecycle, and process timing.
- Do not mix in new features, speculative architecture, or unrelated bug fixes.
  Report a discovered behavior issue separately instead of hiding it in cleanup.
- Prefer explicit readable control flow over dense expressions, nested
  conditionals, clever one-liners, or fewer lines for their own sake.
- Keep abstractions that communicate a useful boundary. Add or merge an
  abstraction only when it makes the affected callers easier to understand.
- Preserve comments that explain constraints or intent. Remove only comments
  that restate self-evident code or no longer match it.
- Avoid generated, vendored, and imported artifacts unless the repository
  explicitly treats them as source.
- Leave code unchanged when an alternative is merely different, not clearly
  simpler.

## Simplify tests carefully

- Preserve behavioral, boundary, negative-path, integration, and regression
  coverage.
- Keep tests DRY. Move repeated per-example setup and cleanup into framework
  lifecycle hooks such as GSpec `before_each`/`after_each` or
  `beforeEach`/`afterEach` when the shared lifecycle remains clear.
- Consolidate repeated assertions with a helper or data-driven case only when
  intent and failure diagnostics become clearer.
- Keep distinct behaviors independently diagnosable. Do not hide meaningful
  cases in opaque loops or oversized shared fixtures.
- Never weaken assertions, delete unique coverage, replace focused checks with
  broad snapshots, or make tests pass by changing expectations.
- Prefer readable test arrangement over minimizing test line count.

## Apply and verify

1. Apply only high-confidence simplifications with a clear readability,
   maintainability, or non-speculative efficiency benefit.
2. Review the resulting diff against the original scope and remove drive-by or
   behavior-changing edits.
3. Run all required formatting, linting, and test commands after editing.
4. If a check fails, fix or revert the simplification; do not weaken the check.
5. Report the reviewed scope, material simplifications, changed paths, and exact
   verification results. If no worthwhile edits exist, say so plainly.
