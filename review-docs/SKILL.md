---
name: review-docs
description: Review repository documentation for audience fit, technical accuracy, readability, and maintenance, with evidence-based findings and a verdict. Use for documentation reviews and re-reviews; review only unless edits are explicitly requested.
---

# Review Docs

Judge whether documentation helps its intended readers accomplish its purpose. Review only by
default: do not edit files, commit, change task state, or start implementation work. Return the
report in the conversation unless another destination is requested; keep review reports outside
product documentation.

## Scope and authority

- Follow explicit user instructions and applicable project conventions before skill defaults.
  Read [personal conventions](references/personal-conventions.md) as separate owner preferences;
  do not attribute them to general technical-writing standards.
- Establish the requested paths or change range, audience, and purpose. If scope is not apparent,
  ask a focused question; do not silently turn a local review into a repository-wide audit.
- Read every document in the agreed scope and relevant canonical dependencies. For a diff review,
  read affected passages in context and follow links or inspect code/contracts only as needed to
  judge the change. Record exclusions and partial coverage rather than claiming a complete review.
- Form an independent view from the artifacts before relying on an author's summary. Treat prior
  reviews as hypotheses to verify, not proof that their recommendations apply now.
- Prefer Google's developer documentation style where instructions and project conventions are
  silent. Apply its principles with judgment, not as an exhaustive compliance checklist. Use
  Diátaxis to assess reader needs and purpose, without imposing its directory structure or forcing
  every document into one type. See [guidance sources](references/guidance-sources.md) when a
  specific question needs source guidance; rereading all guides is unnecessary.

## Judge reader usefulness

Apply the relevant criteria below, not a mandatory document template or list of required sections.
A style deviation is a finding only when it causes a concrete readability, accuracy, accessibility,
or maintenance problem, or violates an explicit project rule. Leave equally reasonable choices
alone. Do not invent findings to fill a report.

**Purpose and reading path.** Identify the reader's question and assumed knowledge. Tutorials need
an achievable learning path; task guides need usable actions; references need lookup completeness;
explanations need coherent reasoning. Decision records and research reports need their own context
and evidence. Check entry points, descriptive headings, terminology, and links. Mixed purposes can
work when readers can find the part they need.

**Accuracy and evidence.** Compare material claims with available code, contracts, results, and
authoritative sources. Distinguish accepted decisions, proposals, examples, documented capability,
observed behavior, and unrun tests. Preserve unknowns and qualifications. Keep dates and versions
scoped to what was actually checked; an edit date does not establish revalidation. Distinguish
source evidence dates, decision dates, and human decisions from agent recommendations.

**Ownership and repetition.** Identify the concrete reader question, canonical answer, and risk of
drift before recommending consolidation. Short orientation, local warnings, and self-contained
summaries may need repetition. Before recommending deletion or merger, name unique information to
preserve and its destination. Do not replace useful context with excessive navigation.

**Decisions and history.** Preserve decision context, status, significant alternatives, rationale,
trade-offs, consequences, and known authority/date. Mark superseded material and link the current
answer where subsection readers need it. Preserve verbatim owner statements and relevant historical
evidence; distinguish editorial framing from quotations. Improve navigation and presentation
without silently rewriting historical claims. Do not discard rationale as task chatter.

**Language and layout.** Check ambiguous references, unfamiliar terms, inconsistent requirement
words, incomplete sentences, and prose that hides distinct rules. Use ordered steps when order
matters and descriptive headings when they aid navigation. Preserve technical invariants,
concurrency constraints, privacy/licensing boundaries, and reproduction evidence when recommending
shorter or clearer text. Fewer words alone are not an improvement.

**Tables.** Keep tables that support comparison or lookup. Judge meaningful headers, cell density,
rendering, and scanning rather than imposing word, column, or character limits. Longer cells are
appropriate when they improve comparison. Move explanations or procedures to adjacent prose when
they impair scanning, retaining the comparison and necessary qualifications. Do not remove tables
wholesale. After a table/prose conversion, read the entire passage for sentence boundaries,
missing predicates, and distinctions formerly conveyed by column headers.

**Procedures and references.** Check relevant prerequisites, environment/working directory,
placeholders, ordered actions, expected outcomes, and recovery guidance. Distinguish runnable
commands from illustrative snippets. Check applicable inputs, outputs, defaults, units,
constraints, and errors. Do not execute destructive, paid, or credential-dependent examples merely
to review documentation, or initiate unrelated implementation and test work.

**Accessibility and maintenance.** Inspect source and representative rendered tables, links, and
code blocks when tooling is available. Check heading hierarchy, meaningful link text, table
headers, informative visual alternatives, narrow-width readability, and code copyability. Essential
meaning should not rely only on color or position. Distinguish source wrapping from forced rendered
breaks. Identify stale current instructions, ambiguous versions, and unanchored time-relative claims;
do not add ceremonial review dates to every page.

## Verify proportionately

Use available local evidence first. Target external checks to material claims affecting the verdict;
do not launch blanket vendor research or recheck facts solely to tidy metadata. If evidence or
rendering tools are unavailable, state the limitation and its effect on confidence. Formatting,
link, and automated checks supplement judgment; they cannot establish the verdict by themselves.
Report commands as run only if they were actually run. Do not infer rendered failures from source
width alone or present proposed validation as completed testing.

## Findings and verdict

Adapt presentation to the task; the report must contain:

- **Coverage:** paths/range reviewed, relevant dependencies, exclusions, and whether coverage was
  complete or sampled. Identify source inspection, rendering, executed commands, and external
  checks actually performed, including material verification limits.
- **Prioritized findings:** severity tied to reader impact, file and line evidence, the concrete
  problem, and the smallest actionable remedy. Group repeated issues while identifying affected
  locations. Use current line numbers; if a source has no stable lines, identify its section or
  anchor and explain the limitation instead of inventing line evidence.
- **Preservation constraints:** useful content and technical/evidence distinctions that a proposed
  remedy must retain. Separate optional personal preferences from required corrections.
- **Verdict:** a clear conclusion such as ready within reviewed scope, changes requested, or
  insufficient evidence. Explain material uncertainty; a limited review is not a complete pass.
  When no material findings exist, say so without manufacturing cosmetic work.

## Re-review

Verify corrections against the original reader problem and inspect the affected documents for
regressions and overcorrection. In particular, check lost invariants or evidence, removed useful
summaries/tables, altered quotations, fragmented prose, excessive navigation, and false claims of
fresh verification. Close resolved findings; do not reopen them over equally reasonable choices.
Report remaining or new material problems with fresh evidence and actual coverage limits.
