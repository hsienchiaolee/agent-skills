---
name: write-technical-doc
description: Create or revise technical documents, including design proposals, investigations, decision records, architecture explanations, and operational guides. Use for substantive engineering documentation drafting and editing; review-only requests belong to review-docs.
---

# Write Technical Doc

Produce documentation that lets its intended reader understand a system, make a decision, or
complete a task. Ground material claims in available evidence and preserve the distinctions the
reader needs to act correctly.

## Establish the assignment

- Follow the user's requested scope, format, destination, and applicable project conventions.
  Infer audience and purpose from the request and existing documents where possible. Ask only when
  missing information would materially change the result; continue independent work meanwhile.
- For revisions, read the affected document in context and relevant canonical dependencies before
  editing. Preserve its useful structure and terminology unless restructuring serves the request.
  A local clarification does not authorize rewriting the whole documentation set.
- For new documents, identify the question the document must answer and the evidence available.
  Inspect relevant code, contracts, decisions, or supplied notes in proportion to the assignment.
  Do not expand a drafting task into an implementation project or broad research exercise.
- Honor an established document location. Otherwise return a draft in the conversation unless a
  file or other destination is requested. Drafting does not itself authorize publishing or sending
  to others. Use available format or publishing tools only when the requested deliverable needs
  them; this skill has no required external service or companion skill.

## Establish what can be claimed

Distinguish current behavior, proposed behavior, accepted decisions, examples, and unknowns. State
assumptions when they affect the recommendation or procedure. If sources disagree, resolve the
conflict using the applicable authority or expose the uncertainty; do not silently choose the
most convenient account.

- Trace material claims to inspected evidence. Include citations or code links where readers need
  to verify the claim, understand authority, or find details. Prefer descriptive links and stable
  symbols or anchors; use revision-specific locations when exact historical evidence matters.
- Preserve units, defaults, limits, ordering, atomicity, failure behavior, and other constraints
  that determine correctness. Do not simplify a requirement into a vague description of intent.
- Keep proposals and recommendations explicitly provisional. Do not invent approvals, owners,
  dates, measurements, motivations, or successful tests to fill a document structure.
- Identify material evidence gaps in the draft. A useful partial draft may state an open question;
  it must not present an unverified command or speculative capability as established fact.

## Shape the document around its reader

Choose the structure that answers the reader's question. Do not impose a fixed section template.
For purpose-specific decisions and examples, read [document patterns](references/document-patterns.md)
when the document's structure or level of detail needs calibration.

- **Lead with the useful answer.** In a proposal, surface the proposed behavior and decision needed;
  in an investigation, the supported result and uncertainty; in a guide, the task and prerequisites.
  Add a summary only when it improves orientation beyond the opening.
- **Explain behavior and reasons.** Architecture and design prose should explain responsibilities,
  interactions, constraints, and trade-offs. Include implementation details when they help the
  reader assess feasibility, understand an interface, reproduce a result, or perform the task.
- **Make detail easy to find.** Use descriptive headings, consistent terms, and focused paragraphs.
  Put supporting depth after the information it supports. Keep necessary context near the action
  or decision rather than making readers reconstruct it through chains of links.
- **Use precise, plain prose.** Prefer direct statements and familiar words. Explain unfamiliar
  terms for the audience. Keep requirement words consistent. Use complete sentences when fragments
  would obscure a condition or relationship; brevity alone does not justify removing meaning.
- **Choose the right presentation.** Use tables for comparison or lookup, ordered lists for actions
  whose order matters, and prose for reasoning. Use diagrams when they clarify specific relationships
  more effectively than text. Keep essential conditions visible in text, with meaningful labels and
  visual alternatives; do not rely solely on color or position. Avoid redundant formats.
- **Make examples usable.** Distinguish runnable commands from illustrative pseudocode. Supply
  relevant environment, working directory, prerequisites, placeholders, expected results, and
  failure/recovery guidance. Keep exact symbols and values where the reader needs to copy or debug
  them. Do not manufacture missing contract details to make an example look complete.

## Revise without losing meaning

Integrate corrections into the relevant passage of a maintained guide or system description.
Remove editing-process narration when it adds no lasting reader value. Preserve decision rationale,
material alternatives, evidence, and historical context in investigations and decision records.
Mark superseded decisions and link the current answer instead of silently rewriting the old decision
as if it had always been true. Keep quotations verbatim and distinguish them from editorial framing.

Before consolidating or deleting content, identify the unique information to retain and its
appropriate destination. Useful local warnings and short orientation summaries may warrant
repetition. After restructuring, check that conditions formerly conveyed by headings or table
columns are still explicit and that links still take readers to the right answer.

## Verify and deliver

Read the finished document from the intended reader's perspective. Check that its opening answers
the core question, material claims match the available evidence, and instructions contain the
information needed to follow them. Verify changed links and examples proportionately. Inspect
representative rendered tables, diagrams, and code blocks when rendering tools are available;
source wrapping alone does not establish a rendering defect.

Do not run destructive, paid, or credential-dependent examples merely to validate prose. Report
only checks actually performed. Keep verification limits and material unresolved questions clear;
an edit date does not mean the underlying facts were revalidated.

Deliver the requested draft or edited artifact. For file edits, briefly state what changed and any
material verification limits. Keep work reports outside the product document unless the document's
purpose calls for that information. A separate formal review is optional, not a mandatory second
workflow for every writing task.
