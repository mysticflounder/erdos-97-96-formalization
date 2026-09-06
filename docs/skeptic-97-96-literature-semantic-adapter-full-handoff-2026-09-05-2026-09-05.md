# Math Skeptic Audit: literature and semantic-adapter handoff

**Target:** `/tmp/97-96-literature-semantic-adapter-full-handoff-2026-09-05.md`

**Target SHA-256:** `bdcf9d5960482793a4edd26681ee382f13f3d59b2c9e797e3848e6fe3662595b`

**Date:** 2026-09-05, America/Los_Angeles

**Verdict:** NEEDS WORK — evidence portability and source navigation; no mathematical blocker found in the proposed adapter.

**Claims audited:** 15 mathematical groups below, plus provenance and status checks.

**Source audit pin:** `ba4b80edf3e9edb777771c1afbb877966e0eb2e0`.

This is a dated review of an external handoff. Current proof status belongs to
[the authoritative atomic proof](erdos-97-descent-prose-proof-atomic.md).
The target was left unchanged. This review performed no Lean build or kernel
axiom audit and did not implement the adapter.

## Summary

The narrow theorem is mathematically derivable from the current `Q` packet and
the cover. The packet retains completeness of both named rows; choosing
`thirdRow_named` transfers completeness to the stored third row. `exactRows`
supplies the blocker/apex distinctness needed for the two-point intersection
bound. No new `hnoFive`, disjoint-cover, far-pair, or survival premise is needed.

For a row surviving deletion of `z`, a different radius would force its four
points into traces of sizes at most one and two. Equal radius then gives a
subset of the complete third row, and equal cardinalities give support identity.
Lifting the same support after a second deletion proves the stated obstruction.
The handoff correctly leaves incompatible joint survival unestablished.

Independent source, finite-proof, and artifact reviews were used. The finite
review also checked the radial-shortening argument. Symbolic checks and the
embedded finite replay passed. The older archived trials could not be rerun
from the files found here.

## Findings

### F1: The older replay evidence is not portable with this handoff

- **Location:** target lines 550–556 and 594–618.
- **Quote:** “All three fresh JSON outputs were identical to the saved outputs, and all 28 manifest entries matched.”
- **Stated label:** EMPIRICALLY VERIFIED, explicitly attributed to handoff preparation.
- **Evidence present:** three archive hashes and a validation-JSON path; two embedded files.
- **Actual label:** EMPIRICALLY VERIFIED as a historical report; only the embedded semantic replay was independently reproduced in this review.
- **Verdict:** CLARIFY.
- **Reason:** None of the three named archives, their saved outputs, or
  `literature-adapter-handoff-work/validation.json` was found in the repository,
  `/private/tmp`, or `/Users/adam/Downloads`. This does not refute the reported
  runs. It prevents checking their manifest entries or reproducing their counts
  locally. Retain the original archives and receipt before presenting those
  historical checks as independently revalidated project evidence.

The suffixed weekly report and far-pair Markdown delivery were found in
Downloads. The latter matches its declared 8,564 bytes and SHA-256
`37bd9f58b9ab4d6cfad6d7da9e353dde04aa68e18fb532b62c10d22ff8732dd9`.
The separately delivered `semantic-cover-adapter-draft` has different bytes
and replay counts; it must not substitute for Appendix B. The two embedded
files do match the hashes printed in the handoff.

### F2: One source-map path is incorrect

- **Location:** target line 248, source-map table.
- **Quote:** “`P97/ATail/FrontierLiveClosure/SevenGoodSourceDistinctBlockerCommonDeletion.lean:347–369`”
- **Stated label:** current-source navigation at a historical pin.
- **Evidence present:** the named packet exists directly under `P97/ATail`.
- **Actual label:** verified source location, rather than a mathematical claim.
- **Verdict:** CLARIFY.
- **Reason:** The correct path is
  [SevenGoodSourceDistinctBlockerCommonDeletion.lean](../lean/Erdos9796Proof/P97/ATail/SevenGoodSourceDistinctBlockerCommonDeletion.lean),
  with the relevant packet at lines 349–374 in the audited source. The extra
  `FrontierLiveClosure/` component directs an implementing agent to a nonexistent file.

### F3: The source-facing proof and its stopping point are accurately separated

- **Location:** target lines 165–227.
- **Quote:** “No new cardinality premise is needed at this interface.”
- **Stated label:** complete mathematical argument; implementation outstanding.
- **Evidence present:** current packet fields, equality kernel, finite counting proof.
- **Actual label:** PROVEN — pen-and-paper under the stated source hypotheses.
- **Verdict:** OK.
- **Reason:** `CardGeThirteenUncoveredStrictInterior.lean:158–177` stores both
  full-class equalities. `CardGeThirteenTerminalSplitV2.lean:41–71` retains
  `thirdRow_named` and the dependent exact-row packet.
  `ThreeCenterCommonDeletion.lean:51–63` supplies both required blocker/apex
  inequalities. `TwoInteriorSameBoundaryRadius.lean:361–370` has the stated
  equality kernel, with no blocker-boundary assumption. MEC boundary and
  center-support facts are available from the original carrier.

The required witness extraction already exists:
`ATailFrontierLiveClosure.exists_selectedFourClass_in_erase_of_deletion_survives`
at `FreshThirdCrossDeletionRows.lean:40–60` accepts arbitrary `A`, `center`,
and `deleted`. Instantiate `A := D.A.erase z` and `deleted := w` to extract
the row directly in the doubly erased carrier. Then lift that same support
to `D.A.erase z`. The handoff's lines 216–223 point to this helper but
understate its direct applicability; a new extraction wrapper is unnecessary
for this corollary. Import placement and the support-preserving lift still
need implementation. Neither requires a new mathematical hypothesis.

At this snapshot `CardGeThirteenExact13SemanticCanonicalization.lean` was absent.
Coordination message 16239 assigned implementation to `luna-swarm-slice-ingress`.
No compiled adapter or terminal follows from this review. Later message 16246
reports a further frontier incidence restriction, explicitly without a
terminal; this review does not certify that additional derivation.

## Mathematical claim inventory

“PROVEN” in this table means pen-and-paper, including the displayed hypotheses;
it makes no new Lean-formalization claim.

| Claim | Target location | Classification and check |
|---|---|---|
| Boundary-root shared-pair exclusion | §7.1 | PROVEN: separator argument and exact identity; the coincident-center case is discharged by zero distance. |
| Strict reflected-pair radius drop | §§3, 7.1 | PROVEN mathematically from the far-pair result: distinct points at equal distances from two distinct centers form a reflected pair; a radius at least `BP` would violate the far-pair conclusion. Historical Lean receipt was not rerun. |
| Same-row strict one-sidedness | §7.2 | PROVEN: containment, strict separation, positive coefficients, and the displayed identity; collinear companions violate convex independence. |
| Far-pair and whole-side conclusion | §7.3 | PROVEN: shortening preserves disk containment, strict side, and the original separator. It does not require adding projected points to the carrier. Empty arcs are allowed. |
| Cover bound and saturated traces | §6 | PROVEN: cover by the singleton and two bounded traces; saturation also excludes overlap within the queried row. |
| Canonicalization after erasing `z` | §4.3–4.4 | PROVEN from the audited packet fields and geometry. |
| Obstruction after erasing `z,w` | §4.5 | PROVEN by support-preserving lifting and membership contradiction. |
| Two complete fibers and arbitrary erasures | §6 | PROVEN with both named complete rows and distinct radii. Distinct radii supply disjointness; no independent disjointness premise is missing. |
| Trapezoid slack redundancy | §8, Schötz | PROVEN by the slack identity and the paper's Theorem 3.1, for an encoding containing both required inequalities. |
| Local power factors and affine positivity | §8, Hales–Song | PROVEN for the displayed positive parameters and separate zero stratum; not the authors' three-dimensional result. |
| Integer rounding | §8, Portal–Rubin | PROVEN by parity with `1 ≤ m ≤ M`; independent of the reported 5,050-case run. |
| Local bounded-monomial cone | §8, Baldi–Kummer | PROVEN: common scaling, small ratio, and saturated endpoint families give necessity; the displayed factorization gives sufficiency for real exponents. |
| Four-point arbitrary-enclosure control | §7.4 | EMPIRICALLY VERIFIED exactly here using rational distances and all strict hull-edge tests. |
| Eleven finite draft lemmas | Appendix B | PROVEN as finite-set arguments under their stated hypotheses; Lean elaboration remains unchecked. |
| Embedded finite regression suite | Appendix C | EMPIRICALLY VERIFIED for its explicit abstract set systems; counts and hashes below. |

## Verification and literature attribution

The three test functions of the fully inspected embedded Python checker passed
in memory. The harness skipped its `__main__` block, so it neither read the
neighboring Lean file nor wrote `results.json`; both payload hashes were
checked separately from the embedded bytes. Its exact counts were 181,896 small
cover combinations; 108,312 covered; 86,046 with overlap; 58,832 admissible;
252 saturated; 1,093 nested-set pairs; 15 candidate partitions, 10 admissible;
and 81,920 arbitrary-erasure checks. These are abstract finite systems, not
Euclidean configurations or live exact-13 catalog entries.

The embedded Lean hash is
`0887a37292fa882cb225fd902997ce19aab6b04e2f8ccc13434d6207894f7f25`;
the Python hash is
`35da41bdb7d498c2b43684a21e92f1e22e3e01be66953080ef43e7f3badf06b1`.
Five displayed geometry identities were independently checked with SymPy
1.14.0. Exact rational checks also verified the four-point control and the
unit-circle support triangle's weighted-center identities.

All six titles, authors, and submission dates match their primary arXiv pages:
[Schötz](https://arxiv.org/abs/2609.02284),
[Hales–Song](https://arxiv.org/abs/2609.00997),
[Pastorek](https://arxiv.org/abs/2609.03478),
[Sra](https://arxiv.org/abs/2608.29595),
[Portal–Rubin](https://arxiv.org/abs/2609.02180), and
[Baldi–Kummer](https://arxiv.org/abs/2609.03934).

Schötz's Theorem 3.1 and Remark 3.2 support the conditional redundancy argument;
Appendix D restricts its Lean verification to the reduced algebraic lemma.
The handoff preserves that distinction.
[Primary text](https://arxiv.org/html/2609.02284v1).
The other papers' author code and complete proofs were not audited here.
Their project-specific trials remain subject to F1.

## Weasel words and scope

The prohibited proof-language forms occur at lines 322 (`iff`), 415
(`Equivalently`), and 436 (`logical equivalence`). State the two implications
and their hypotheses explicitly when integrating this prose. The reviewed
implications are justified; these wording issues reveal no additional gap.

The handoff correctly distinguishes an arbitrary containing disk from a
boundary-supported disk, selected subsets from complete radius classes,
single from double deletion, and finite regressions from global closure.
The reported original 13-point control and older far-pair campaign remain
historical empirical claims, not locally reproduced results of this audit.

## Lean sorry graph

No new transitive axiom or compiled import-closure audit was performed. The
embedded draft is explicitly uncompiled; absence of admission text would not
change that status. Historical geometry build and core-axiom reports remain
attributed to their original source snapshots. No live `sorry` is certified
removed by this review.

## Required before CERTIFIED

Correct the source-map path and make the archived trial evidence available,
or explicitly limit a distributed handoff's independently replayable evidence
to the embedded semantic checker. Preserve the uncompiled labels. Before
claiming a formalized adapter, its owner must supply the governed focused build,
source hashes, axiom audit, and independent source review. A terminal claim
additionally needs an actual source-derived contradiction and audited consumer
path; the adapter alone supplies neither.
