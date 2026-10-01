# Review examples

These examples assume the cited passages and supporting evidence were supplied. In a real review,
inspect the evidence and use current locations. Severity follows the effect on the reader's task.

## A procedure fails in the documented environment

**Evidence:** `docs/setup.md:12` tells a new user to run `widget init` immediately after installation.
The CLI contract requires `widget login` first; otherwise initialization exits with an
authentication error. The review inspected the contract but did not execute the CLI.

**Finding — high impact:** The setup guide omits required authentication before initialization.
Readers following the guide from a clean installation cannot complete setup. Add `widget login`
before `widget init`, and describe how to recognize successful authentication. Preserve the
existing initialization options. This finding is based on the CLI contract; runtime behavior was
not independently tested.

The remedy restores the missing prerequisite without expanding the review into CLI implementation.

## A proposal hides the decision behind implementation detail

**Evidence:** `docs/retry-proposal.md:3-24` describes helper calls and counter updates. The proposed
behavior appears only at line 25: retry transient failures at most three times; do not retry
permanent failures. The audience is engineers deciding whether to approve that behavior.

**Finding — medium impact:** The opening makes reviewers reconstruct the retry policy from helper
mechanics before learning what they are being asked to approve. Move the proposed behavior and
decision request to the opening; keep implementation detail below where it supports assessment.
Preserve the transient/permanent distinction and retry limit.

A suitable opening could be: “Propose retrying transient failures at most three times. Permanent
failures return immediately. Approval is requested for this retry policy.” This remains a proposal;
the review must not describe it as deployed behavior or invent a rationale absent from the evidence.

## An API example contradicts its contract

**Evidence:** `docs/api.md:42` describes `timeout` in milliseconds and shows `timeout=5000` for five
seconds. The supplied schema defines the field in seconds, with a default of 30 and a maximum of
300. No runtime execution was performed.

**Finding — high impact:** The documented units and example contradict the schema. A reader copying
the example supplies a value above the allowed maximum. Change the unit to seconds and the example
to `timeout=5`; retain the documented default and maximum with their units. Cite the schema as the
basis rather than claiming a runtime test.

Exact values and code are necessary here. Replacing them with a high-level explanation would make
the reference less useful.

## A short document already works

**Evidence:** A complete one-page decision record opens with the selected option, explains its
trade-off, identifies approval and status, and links supporting evidence. Its prose is clear and
its current claims agree with the supplied contract.

**Verdict:** Ready within the supplied scope; no material findings. A separate summary table or
architecture diagram would repeat information without improving the reader's decision.

State that coverage consisted of the supplied document and contract. Do not imply that repository
links, rendering, or runtime behavior were independently checked.
