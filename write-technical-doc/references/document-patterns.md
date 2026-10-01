# Document patterns

Use these patterns to choose useful content, not as mandatory headings or templates. Project
formats and the reader's actual question take precedence.

## Design proposal

Make the proposed behavior, decision needed, and relevant constraints apparent early. Explain why
that behavior is preferable to meaningful alternatives, including costs and unresolved questions.
Keep current and proposed behavior distinct. Name interfaces and show code when the decision turns
on their exact contract; otherwise explain the system at the level needed to assess the proposal.

**Example evidence:** Today, refresh failures return errors. A proposal would allow cached results
for up to 30 seconds after a refresh failure, then return errors. Approval is pending. No latency
measurements or rationale were supplied.

**Possible opening:** “Propose serving cached results for up to 30 seconds after a refresh failure;
subsequent requests return errors once that window expires. Today, refresh failures return errors
immediately. Approval is requested for the bounded stale-result policy.”

The opening preserves the bound and status. Do not add a claimed latency improvement or an accepted
freshness trade-off without supporting evidence. Surface the missing justification if the document
is meant to support approval.

## Investigation

Lead with what the evidence supports and what remains uncertain. Separate observations from causal
hypotheses. Include conditions, versions, reproduction steps, and measurements when they establish
the result. Include chronology when event order explains causality; omit a diary of the investigator's
work when it does not help the reader.

**Example evidence:** Logs show a timeout followed by a retry. A duplicate write was reported, but
there is no request identifier connecting it to this retry.

**Supported statement:** “The logs confirm a retry after a timeout. They do not establish whether
that retry caused the reported duplicate write; the events lack a shared request identifier.”

A coherent causal story is not a substitute for the missing link.

## Decision record

Identify the decision, its status, context, rationale, consequences, and significant alternatives
when known. Preserve the authority and date supplied by the evidence. For a superseded record, add
status and a pointer to its successor while keeping the original rationale intelligible. Do not
present an agent recommendation as an approved human decision.

## Architecture explanation

Start with the system's responsibility and the boundaries relevant to the reader. Explain how
components collaborate and which constraints govern their interactions. A sequence diagram can
clarify a handshake or failure path; a component diagram can clarify ownership or trust boundaries.
A diagram need not repeat every paragraph or implementation helper. Link deeper references where
readers can inspect details without losing the main explanation.

## Operational guide and technical reference

A guide should let the reader complete a task in the documented environment. A reference should
make exact inputs, outputs, units, defaults, limits, and failure behavior easy to look up. A short
page can serve both purposes when the reading paths remain clear.

**Example contract:** `router validate --file routes.yaml` prints `Valid` on success. Only then run
`router reload --file routes.yaml`, which prints `Rules activated`. Both commands expect the file
in the working directory. Validation and reload failures leave the previous rules active.

A useful guide retains the commands, working directory, success signals, sequence, and failure
behavior. “Validate and reload the routing configuration” alone loses information operators need.
Do not replace exact commands with conceptual prose merely to shorten the page.

## Narrow revision

If asked to clarify a parameter's units, update the relevant definition and affected examples;
check nearby statements for consistency. Preserve unrelated layout, explanations, and terminology.
If evidence exposes a separate material issue, report it or address it only within the authorized
scope. A small edit should not trigger a whole-document redesign.
