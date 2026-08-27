# Consolidation refactor: W3–W4 checkpoint delta (2026-08-26)

Status: append-only audit record. This file records the bounded consolidation
delta; it does not rewrite the historical audits or the canonical manuscript.

## Source and head anchor

The lane checkpoint is
`consolidation-w4-checkpoint-delta-20260826`. Its base and observed head are
`49850c7a2a7a15415bb638ed5736d9cd34331381`, the W4 decide-conversion receipt
seal. The W4 status packet deliberately retains registry source head
`f3063069939cfb6dc2a8a9b20d9a7ef660c86fdf`; that is a roster snapshot anchor,
not a claim that all working-tree files are clean. The explicit predecessor is
W3-0e-fix-2: receipt seal
`0b752f3a2e3ffdb1f25ad0e27a05e18432d8fbfa`, implementing commit
`b9578ed37b58bf1194b56a11d0876c977c0e6e17`.

## Changed packets

Commit pairs below are listed as implementation, then receipt seal.

| Packet | Implementation / seal | Bounded change |
| --- | --- | --- |
| W3 trust authority and factorization | `b9578ed37b58bf1194b56a11d0876c977c0e6e17` / `0b752f3a2e3ffdb1f25ad0e27a05e18432d8fbfa` | Recorded closure is authoritative in baseline and fresh registry paths; parser, factorization comparison, and trust metadata are fail-closed. |
| W4 CardEleven bank manifest | `ff5da5ac97188db15c52d2b544039ed49f5621f9` / `f9d505042c777db94c8c592683698352604bdf84` | Adds the central self-hashed publication-bank manifest and scoped manifest gate. |
| W4 status generation | `146b1efcd7672f27138ea4ad4a808c1bd61b36ef` / `0a8113e958d2a46f28f15dbfd75a7c8d07f3bdfe` | Makes the registry generator own the marker-delimited status block and checks generated surfaces against the live spine. |
| W4 decide conversion | `217ce92179b2d3eac0b6a84b7a860763cd201d79` / `49850c7a2a7a15415bb638ed5736d9cd34331381` | Replaces four bounded on-spine `native_decide` proofs with `decide`, preserving declaration statements and consumer edges. |

## Proof and obligation delta

No mathematical leaf was closed by this consolidation, and no countermodel is
claimed. The obligation roster has no additions or removals: 28 reachable
obligations and 6 off-spine obligations remain. The W3 factorization count and
the W4 status gate report 28/28 reachable leaves factorized as registry
metadata; this is not a mathematical closure result. The global target remains
open.

The implementation impact is local. W3 changes registry tooling, tests, and
trust metadata. The bank-manifest and status packets add publication/status
tooling, focused tests, generated status surfaces, and receipts; they do not
change a mathematical statement or Lean source. The decide packet changes four
Lean proof tactics only. Other native-reduction trust remains elsewhere, so
this record makes no target-wide native trust-removal claim.

## Validation record

The linked receipts record the following completed checks:

- W3 source review, direct probes, both test suites, detached end-to-end runs,
  staging/import lint, and the recorded factorization/trust checks all passed.
- W4 bank-manifest tests passed (`63 passed`); scoped manifest checking,
  canonical generation, live semantic/byte regeneration, Ruff, and diff checks
  passed. The historical strict promotion check intentionally exits 1 on later
  ExactFive/support drift and is outside this pilot gate.
- W4 status tests passed (`143 passed`); status checking and baseline checking
  report 28 reachable, 6 off-spine, 34/34 reviewed metadata, and 28/28
  factorized reachable leaves. The documented inherited Ruff findings are
  excluded by the receipt's narrow lint invocation.
- W4 decide-conversion module builds, four-declaration axiom checks, status
  checking, and patch checks passed. The spine command exits 1 because 28
  unrelated target obligations remain open; its receipt records the four
  changed declarations as locally closed and on-spine.

This documentation lane made no code or Lean source change. It did not rerun
builds, solver searches, or the deep registry gate. Its closeout reruns the
fast generated-status check, validates every new relative link and cited
receipt, checks the path-scoped diff, and applies the staged hygiene gate.

Receipts:

- [W3-0e-fix-2 gate receipt](../../../proof-status/receipts/w3-0e-fix-2-gate-receipt.json)
- [W4 bank-manifest gate receipt](../../../proof-status/receipts/w4-bank-manifest-pilot-gate-receipt.json)
- [W4 status-generation gate receipt](../../../proof-status/receipts/w4-status-generation-gate-receipt.json)
- [W4 decide-conversion gate receipt](../../../proof-status/receipts/w4-decide-conversion-gate-receipt.json)
- [W4 checkpoint-delta lane receipt](../../../proof-status/receipts/w4-checkpoint-delta-gate-receipt.json)

## Deferred debt and ROI exclusions

Deferred debt includes the global proof-blueprint reference inventory (36
stale and 1 never-mined), off-spine collision warnings, the deliberate
`f3063069939cfb6dc2a8a9b20d9a7ef660c86fdf` roster anchor, and the remaining
larger `native_decide` computations outside the bounded conversion. The
proof-blueprint generated-banner wording is a non-blocking upstream
documentation debt: its emitter lives outside this repository and is excluded
from this lane. The historical strict CardEleven promotion failure, broader
status appendices, global reference refresh, and onboarding of other bank
families are also excluded.

The multi-output promotion-writer recovery issue (`#7522`) and the
proof-blueprint newline theorem-name omission (`#7509`) remain separately
scoped follow-ups. Their expected maintenance value did not justify expanding
this documentation lane.

ROI is limited to auditability and local trust hygiene: a recorded closure
authority, one publication-bank manifest pilot, generated status drift checks,
and four local tactic substitutions. There is no claim of frontier reduction,
countermodel discovery, target-wide trust cleanup, or global proof closure.

## Completion qualification — 2026-08-26

The bounded W1–W4 packet is complete under the receipts above. The original
strict-refactor Phase 2 provenance-and-blocker criterion in the [consolidation audit](../../audits/2026-08-23-consolidation-refactor-audit.md#phase-2--provenance-and-blocker-api),
at approximately line 798, is **not met**. The strict cluster-isolation cut
still has the live implementation waivers
`TwoSourceCanonicalSurface → TriApexEndpointRetainedOmission` and
`FreshThirdPinnedFanPacket → TriApexEndpointRetainedOmission`.

A sound cut needs a neutral shared API for the blocker, provenance, and
joint-deletion data consumed across these clusters. Removing the imports without
that API would break the caller contracts or infer provenance from cardinality.
Extracting the API, adding compatibility adapters, and migrating the consumers
is medium-high/high scope, so it remains outside this bounded packet.

The 36 stale and 1 never-mined proof-blueprint references are deferred inherited
infrastructure debt, not a current implementation failure. This qualification
does not claim that either live edge is fixed or that the full strict refactor is
complete.
