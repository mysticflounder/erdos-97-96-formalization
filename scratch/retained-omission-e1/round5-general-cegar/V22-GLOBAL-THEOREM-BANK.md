# V22 global theorem-bank audit

Date: 2026-08-02

Live target:

`Problem97.ATailFrontierLiveClosure.false_of_retainedOmission_triApexAllLarge_core`

V22 artifact:

`v22-blocker-minimization-pilot.json`

This is the mandatory post-v22 source and theorem-bank audit. No Lean/Lake
command, solver production, or additional solver replay was run for this
audit.

## Verdict

- **Exact live-source hit, but it is the open target itself.**
  `false_of_retainedOmission_triApexAllLarge_core` is present in
  `FrontierLiveClosure.lean`; its body is `sorry`. Its compatibility wrapper
  constructs the normalized inputs and calls it, so the wrapper is not an
  independent closure.
- **No reusable theorem-bank hit.** The concise registries and all three
  exhaustive JSON inventories contain no declaration or normalized statement
  hit for retained omission, tri-apex context, `ApexRichClassStructure`,
  `CommonDeletionTwoCenterPacket`, or the rich-cap-slice one-hit interface.
- **No direct promotion of the 55-fix projection.** The projection is one
  authenticated exact-`n = 15` rich-profile leaf from one saved v19 terminal
  assignment. It neither covers all rich profiles nor supplies a general-`n`
  realization/classification theorem from the Lean inputs `R`, `Q`, and `G`.
- **The producer boundary is unchanged.** The existing U5 and U1 banks provide
  contradiction consumers after a finite incidence/row-slot packet has been
  produced. V22 supplies no such geometric producer.

## Trust boundary

The retained 55-fix suffix has SHA-256
`6236b55111ff75c45e6b7a2823bbd2ecf40cbbb03b19e6a64a6fd47cc09e9ac1`.
Both fresh parses of the authenticated raw formula (SHA-256
`bce451bab18921a6c0d0d29d5307c8aab59be1c1fc937d991c6b40a8d7ca2720`)
returned `unsat` after retaining the 55 fixes and setting all 26 trackers to
true. Each replay produced 199,168 post-preprocessing assertions.

This is exact external Z3 evidence for the encoded finite query. The
post-preprocessing audit still found 105 pseudo-Boolean nodes and classified
the formula `REJECTED` for the audited QF_LRA-only lane. There is no solver
certificate, Lean theorem, or kernel ingress. The 52-fix trial also cannot be
used: its primary check timed out while its independent replay returned
`unsat`, so the disagreement failed closed.

## What the 55 fixes say

The encoded carrier labels are `0,...,14`; the three apex labels are
`12, 13, 14`, with strict-cap interiors respectively
`{0,1,2,3}`, `{4,5,6,7}`, and `{8,9,10,11}`. The case is
`fresh_DDD_k0_d2_f1`: the intended normal-form arm is the fresh reverse-hit
arm, the three apex profiles are double-rich (`DDD`), and the finite labels
are kept `0`, deleted `2`, and fresh `1`.

Every retained fix is a `rich_*` membership bit:

| Encoded center | Radius class | Fixed bits | Fixed true support | Consequence inside the exact D profile |
|---|---:|---:|---|---|
| apex index 1, point 13 | 0 | 10 | `{6,7}` | Exact support has four points; exactly two additional points lie among the unfixed labels `{0,1,10,11,12}`. |
| apex index 1, point 13 | 1 | 15 | `{3,4,5,8}` | Full exact-four support. |
| apex index 2, point 14 | 0 | 15 | `{2,6,8,10}` | Full exact-four support. |
| apex index 2, point 14 | 1 | 15 | `{4,9,11,12}` | Full exact-four support. |

For a D profile, the encoder makes the two radii distinct, makes both selected
classes exact-four, makes their supports disjoint, and assigns exactly two
members of each class to that apex's strict-cap interior. Thus the table is a
semantic rich-class pattern, not merely a Boolean-name coincidence.

However, the retained suffix contains:

- no `rich_0_*` bits for apex point 12;
- no blocker-map bits;
- no critical-row or global-K4 bits; and
- no oriented/fresh common-deletion packet bits.

Those omitted variables remain existentially constrained by the full raw
formula. Consequently `raw formula + 55 fixes` being UNSAT does **not** turn
the 55 literals alone into a standalone contradiction theorem.

## Mapping to the live core

The live theorem consumes:

1. `R : FrontierCommonDeletionParentResidual F`;
2. `Q : RetainedOmissionAllLargeNormalForm P`; and
3. `G : TriApexAllLargeContext D S`.

The case name `fresh_DDD_k0_d2_f1` is intended to model
`Q.reverseHitFreshCommonDeletion`: kept, deleted, and fresh are distinct
first-cap labels, the reverse shell hits the kept point, and the fresh point
is outside that shell while carrying a two-center packet. But V22 fixes none
of the bits expressing those packet or critical-shell facts, and there is no
Lean theorem realizing an arbitrary `Q` as this label assignment.

`G` requires all of the following:

- every indexed cap has cardinality at least six;
- all three opposite vertices have `ApexRichClassStructure`;
- `D.A.card <= 4 * (notRobustCenters D).card`; and
- no positive-radius class centered at a carrier point contains all three
  triangle vertices.

The V22 suffix fixes parts of the rich profiles of only the second and third
apices. It does not itself prove any of the four `G` fields, and it gives no
general finite labeling of `D.A`. The full raw encoding contains finite
analogues of the surrounding constraints, but no checked equivalence theorem
connects those assertions to the Lean structures.

Therefore the exact mapping is:

```text
(R, Q, G)
  -- missing general-n realization and exhaustive case classifier -->
fresh_DDD_k0_d2_f1 plus a concrete 15-label semantic assignment
  -- one authenticated projection leaf only -->
55 rich-class fixes + full raw finite formula is externally UNSAT
```

Neither arrow currently exists as a Lean theorem, and the second arrow has no
kernel-checkable certificate.

## Registry audit

The required registries were checked before proposing any new local-pattern
consumer:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

The sibling `p97-rvol` census contains 96 class-level U5 global-incidence
incompatibility families, backed by 88 metric-point and 112 scalar-algebra
consumers. It also contains 18 unimported U1 row-slot contradiction consumers
and the single five-point
`U1LargeCapRouteBTailMetricResidualTarget.u1TwoLargeCapObstruction`.
None matches the retained-omission/tri-apex interfaces, and each relevant bank
still requires a live geometric incidence, placement, or completeness
producer. In particular, the five-point U1 obstruction is not a uniform
two-large-cap closure.

Exactly one agentic merged-Lean-corpus query was used, for the concrete live
target and its hypotheses. It did not return the exact declaration; only
nearby tri-apex/large-cap terminals appeared. Since the declaration is present
in the live source, that search result is an index miss or stale-corpus result,
not evidence that the theorem is absent. No second agentic query was run.

## Missing hypotheses and next bridge

The closest checked live consumer is already immediately above the open core:

`exists_criticalShell_center_with_otherRichCapSlice_card_le_one`.

It obtains, from `G`, a canonical critical shell whose intersection with every
other rich cap radius slice has cardinality at most one. A direct closure would
need the complementary **positive producer**: from `R`, one arm of `Q`, and
`G`, produce a critical shell, a distinct rich cap, and a radius slice with at
least two intersection points. The checked at-most-one theorem would then
yield `False` without a finite-cardinality reduction.

V22 suggests one exact-15 rich-support leaf on which to test that producer,
but it does not prove the lower bound. The next bridge should therefore be one
of these, in priority order:

1. prove the direct general-`n` cross-cap two-hit producer from `(R,Q,G)` and
   compose it with the existing at-most-one theorem; or
2. if a finite-bank route is necessary, prove a general-`n` realization and
   exhaustive classifier from `(R,Q,G)` into a finite family of incidence
   packets, with the V22 55-fix pattern as only one leaf, then give every leaf
   a kernel-checked contradiction consumer.

Importing a U5/U1 bank theorem before that producer exists would only move the
open assumption. Promoting the single V22 leaf would likewise not cover the
live theorem's universal scope.
