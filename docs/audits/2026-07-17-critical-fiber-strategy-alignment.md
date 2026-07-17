# A-TAIL critical-fiber strategy alignment audit

Date: 2026-07-17

Status: **ROUTE CORRECTED; RETAINED-RADIUS SELECTOR AND TWO-CIRCLE GATE ARE
THE ACTIVE BOUNDARY; NO PRODUCTION `sorry` CLOSED.**

## Decision

Keep `false_of_twoLargeCaps_commonCriticalMap` as the final parent assembler,
called before LIVE-Q/C construction. Replace the anonymous row producer and
the arbitrary-fiber direct contradiction by the adaptive restriction of the
actual critical blocker map to the retained first-apex radius class:

```lean
nonempty_retainedRadiusBlockerOutcome
    (R : FrontierCommonDeletionParentResidual F) :
    Nonempty (RetainedRadiusBlockerOutcome R)
```

The outcome is exact finite logic on the actual blocker map: either two
retained sources have the same blocker, or the blocker restriction is
injective on the complete retained class. A retained collision contains a
complete `FrontierCommonDeletionCriticalFiber R`; the first apex is a genuine
second equidistant center for its two sources, and `btw_sep` forces the sources
to alternate across the first apex and common blocker on the convex boundary.
The injective arm retains the full source-to-blocker matching rather than a
selected-row marginal.

Production `ATail/FirstApexCriticalFiber.lean` now supplies exactly this
typed predecessor through `nonempty_frontierCommonDeletionCriticalFiber`.
Production `ATail/FirstApexCriticalFiberRow.lean` then supplies the exact
`BothOff`/`RowHit` split as `Outcome P`, indexed by that same predecessor.
Both source-critical facts therefore remain available on both branches. This
fixed-fiber split is diagnostic and nonterminal; it does not justify closure
for every preselected `P`.
Production `ATail/CriticalFiberClosingCore.lean` now defines the exact
existential contract and proves `false_of_criticalFiberClosingCore`; its four
axiom checks contain only `propext`, `Classical.choice`, and `Quot.sound`.
This contract is an immediate terminal library, not an established exhaustive
classifier of the retained collision and matching outcomes.

The same row module now proves the production two-circle gate

```lean
criticalShell_inter_frontierRadiusClass_card_le_two
```

for every actual critical row. It preserves any hypothetical three-point
intersection with the retained first-apex radius class into selected
four-subpackets, where the distinct-center two-circle theorem gives the
contradiction.

Production `ATail/CriticalFiberRetainedRadiusSelector.lean` now implements
`nonempty_retainedRadiusBlockerOutcome` and the collision alternation API.
Consequently the active open work starts after the selector: the two geometric
arm consumers, not construction of the dichotomy itself.

## Why the old target was rejected

The checked six-role Kalmanson theorem is mathematically valid, but its proof
uses only three selected-shell equalities.  It does not use that `C,K` are
distinct sources mapped to `A`, or that deletion of each source destroys K4
at `A`.  The arbitrary outside-pair extraction from the common `A`-shell also
works for every selected four-shell.  These are conditional consumers, not
evidence that the forced blocker-fiber collision advances the parent proof.

The source-faithful audits establish the corrected boundary:

- `scratch/atail-force/robust-orow-collision-hit/` proves an exact
  `bothOff ∨ rowHit` split.  A checked `Fin 12` regression realizes `bothOff`
  with the total fixed-point-free critical map, exact support locking,
  first-apex robustness, and row-closure minimality.  The hit arm still lacks
  the cross row and cyclic order.
- `scratch/atail-force/collision-outside-pair-blockers/` proves that the
  collision-faithful cap split yields only common-blocker pinning, an
  outside-cap cross-bisector, or mutual omission.  It does not produce a
  same-cap second center.
- `scratch/atail-force/cross-row-mining-manifest/` rejects raw anonymous
  `O/A/X` mining.  Its corrected coverage object retains `C,K -> A`, both
  `no_qfree` facts, a critical source `J`, `X = centerAt J`, the actual exact
  `J`-shell, the cross incidence, and the cyclic order.  Pinned replay finds a
  source-indexed cross-row embedding in 75 of 101 witnesses and no accepted
  terminal shape in 26; this is not a coverage theorem.
- `scratch/atail-force/critical-fiber-consumer-match/` defines the exact
  existential `CriticalFiberClosingCore R` and kernel-checks the immediate
  contradiction for both allowed constructors.
- `scratch/atail-force/critical-fiber-both-off-cap-localization/` proves the
  full endpoint/interior cap localization of a fixed `BothOff P`; its strong
  shell counts still do not match an existing consumer.
- `scratch/atail-force/critical-fiber-minimal-deletion/` constructs literal
  singleton stutters at the old common blocker, including when the deletion
  universe is the full common shell.
- `scratch/atail-force/critical-fiber-closing-core-ordered/` proves that a
  collision row hit supplies orientation and the first-apex equality. The
  ordered terminal still needs exactly `K ∈ selectedAt J` and the cyclic
  subsequence `O,A,X,J,C,K`.
- `scratch/atail-force/critical-fiber-closing-core-samecap/` proves that the
  same-cap terminal is equivalent to a source-faithful second-center route
  through either the first apex or an actual `centerAt J`. Fixed-fiber
  `BothOff` localization does not supply that route.
- `scratch/atail-force/critical-fiber-closing-core-selector/` implements the
  retained collision/injective-matching split and a source-faithful adapter
  from collision to the existing terminal packet.
- `scratch/atail-force/critical-fiber-alternation-audit/` rejects the first
  Fin12 matching witness: two rows have a forbidden three-point retained-class
  intersection, and the same triple violates shared-pair alternation.

## Active next theorems

First close the retained collision arm. Its exact sound geometric producer is
already known: the actual collision sources alternate across the first apex
and their common blocker. The ordered closing-core route additionally needs
cross-deletion failure `K ∈ selectedAt J` and cyclic placement
`O,A,X,J,C,K`; the same-cap route additionally needs a source-faithful second
center in the same ordered cap. Prove one of those packets from the full
parent geometry, or prove the collision arm false directly.

Then close the injective matching arm. The original finite witness is invalid,
because it violates the production two-circle bound and cyclic separation.
A repaired Fin12 object, however, has a total fixed-point-free source-exact
support-locked map, robust card-five retained class, injective restriction,
row-closure minimality, every pairwise exact-class overlap at most two, and a
cyclic order satisfying every generated alternation. This is exact within the
finite abstraction, not Euclidean. Therefore overlap and bare separation are
exhausted: the next theorem must visibly consume cap/MEC, complete radius
filters, or no-`IsM44` geometry.

Only after both selector arms close should the proof assemble
`false_of_twoLargeCaps_commonCriticalMap`. `nonempty_criticalFiberClosingCore R`
remains a sufficient optional route into its checked consumer, but it is not
the active coverage conjecture.

Any further computation must encode the complete actual blocker restriction,
the production intersection bound, all generated boundary alternations, and
an immediate checked consumer. A new finite survivor or UNSAT claim is not
load-bearing unless its manifest shows exactly which cap/MEC/full-filter or
no-`IsM44` facts were added beyond the repaired regression.

The fixed-fiber residual audits are negative but load-bearing for scoping.
`BothOff` cap localization gives strong endpoint/interior shell counts with no
matching consumer. Global minimal deletion can stutter at the old common
blocker with either singleton collision source, even over the whole common
shell. These routes do not replace the retained-radius selector or its two
geometric arm consumers.

## Synchronized documents

This decision is reflected in:

- `docs/closure-plan-full-spec-2026-07-09.md`;
- `docs/closure-matrix-2026-07-09.md`;
- `docs/atail-force-producer-plan-2026-07-13.md`; and
- `docs/97-rvol-full-prose-proof-2026-07-13.md`.

Historical audits and external prompts remain historical artifacts and are
not rewritten as current plans.
